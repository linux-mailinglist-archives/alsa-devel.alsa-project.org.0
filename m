Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDA44560CB
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 17:42:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8EA218CD;
	Thu, 18 Nov 2021 17:41:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8EA218CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637253731;
	bh=CIntIpBUIbzQw6LZwrF6mXoI//YSlzn93Rhjac1ZEwg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vZit9SEPpQdXOXhWwMgdCK+QkLGw7LTHWi59eoZNTgdJaaBFd/+dXEn2Xgy99dge0
	 9orepswZXEWMr/NkWQ6gRnp+GTRXYVnEFd2gcThTDlhdJkM0nrmYFkDld00kWVHofQ
	 Eah6ejYmF1Nkb1XtlFGrPYpxVY7wYqkAPXX1F9VE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 681B9F805AA;
	Thu, 18 Nov 2021 17:33:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52B41F80272; Thu, 18 Nov 2021 17:30:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94159F80115
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 17:30:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94159F80115
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 16300FF80A;
 Thu, 18 Nov 2021 16:30:38 +0000 (UTC)
From: Kory Maincent <kory.maincent@bootlin.com>
To: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sound: soc-core: add the driver component name to the
 component struc
Date: Thu, 18 Nov 2021 17:30:38 +0100
Message-Id: <20211118163038.52236-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 18 Nov 2021 17:33:03 +0100
Cc: alexandre.belloni@bootlin.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 thomas.petazzoni@bootlin.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The function fmt_single_name is using to sanitize namings, and it return
the name set to component->name.
This function is returning either the "device_name" or the
"device_name.driver_name" for i2c devices. There is no use of the component
driver name.
If a non i2c driver register two components the function will return the
same "device_name" for both components. This could cause unexpected issue,
in my case it is a debugfs error which tries to create two directory with
the same component name.

I have fixed it by prefixing the component name with the driver component
name.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 sound/soc/soc-core.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index dcf6be4c4aaa..21ff77b231b8 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2342,10 +2342,10 @@ EXPORT_SYMBOL_GPL(snd_soc_unregister_card);
  * Simplify DAI link configuration by removing ".-1" from device names
  * and sanitizing names.
  */
-static char *fmt_single_name(struct device *dev, int *id)
+static char *fmt_single_name(struct device *dev, const char *snd_drv_name, int *id)
 {
 	const char *devname = dev_name(dev);
-	char *found, *name;
+	char *found, *name, *tmp;
 	unsigned int id1, id2;
 
 	if (devname == NULL)
@@ -2380,6 +2380,14 @@ static char *fmt_single_name(struct device *dev, int *id)
 		*id = 0;
 	}
 
+	if (snd_drv_name != NULL) {
+		/* Add driver component name if present */
+		tmp = devm_kasprintf(dev, GFP_KERNEL, "%s.%s", snd_drv_name, name);
+		devm_kfree(dev, name);
+		name = devm_kstrdup(dev, tmp, GFP_KERNEL);
+		devm_kfree(dev, tmp);
+	}
+
 	return name;
 }
 
@@ -2444,7 +2452,7 @@ struct snd_soc_dai *snd_soc_register_dai(struct snd_soc_component *component,
 	 */
 	if (legacy_dai_naming &&
 	    (dai_drv->id == 0 || dai_drv->name == NULL)) {
-		dai->name = fmt_single_name(dev, &dai->id);
+		dai->name = fmt_single_name(dev, dai_drv->name, &dai->id);
 	} else {
 		dai->name = fmt_multiple_name(dev, dai_drv);
 		if (dai_drv->id)
@@ -2578,7 +2586,7 @@ int snd_soc_component_initialize(struct snd_soc_component *component,
 	INIT_LIST_HEAD(&component->list);
 	mutex_init(&component->io_mutex);
 
-	component->name = fmt_single_name(dev, &component->id);
+	component->name = fmt_single_name(dev, driver->name, &component->id);
 	if (!component->name) {
 		dev_err(dev, "ASoC: Failed to allocate name\n");
 		return -ENOMEM;
-- 
2.25.1

