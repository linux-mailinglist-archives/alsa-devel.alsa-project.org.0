Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0FB62D813
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Nov 2022 11:33:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 843CE16B9;
	Thu, 17 Nov 2022 11:32:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 843CE16B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668681209;
	bh=CpdbmDBh5RulsmM2sjgVaOibIHHXUwZtdOLMVaFIP3s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tMHw4GK/Wbu7w0zB5ru3KBfM73qAkimE0sF6tFR+UiyrovHuekbOmGilT68R6EPOU
	 E2aEY26sFCzJlA8lw9CpHYW6Z5rxeEvjOmeRTSq0sQ3rnuY+fNdxEoxU1k9cukGp9s
	 rnRXIx7WBt4jVJzkqEJHaYqhhMhszsgtilwpjeXk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F72FF804BD;
	Thu, 17 Nov 2022 11:32:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BD69F8025A; Thu, 17 Nov 2022 11:32:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 187E7F800B8;
 Thu, 17 Nov 2022 11:32:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 187E7F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="WIdr9+EW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668681146; x=1700217146;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CpdbmDBh5RulsmM2sjgVaOibIHHXUwZtdOLMVaFIP3s=;
 b=WIdr9+EWzxjRONM0rCUOR3wfreR4mV21dHkkQ5Gmu3Y1VU5+/i7xJezh
 OiAm/eoz+JV9wMHnTibKnEf4l1BFKROe3k8OYJBe67FpobBgS3iKWsn/B
 Qi4I3hmhl3w9KWwyXirIieYhT3ewV/J8N9D2x9Dfr9wRXtK2dpP05ADB1
 HQGJPVQ2SLXi5Bgapq241sdH/gGcgggQQPjLqtjvHnZ7nWSk+5RRZZzlR
 s3TakklFvcPbIZpoPX9IKgYx+ErqVKj2SInjm7geV1szt4dTndY89OmYj
 XgdS6dBtA+yKDHmdebw9q/MforUX1x0aFUI7ERSJIxfn5hg8jpvAiBDYE g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="339642370"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="339642370"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 02:32:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="764711982"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="764711982"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga004.jf.intel.com with ESMTP; 17 Nov 2022 02:32:01 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id E866810E; Thu, 17 Nov 2022 12:32:25 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Jyri Sarha <jyri.sarha@intel.com>, sound-open-firmware@alsa-project.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] ASoC: SOF: probes: Check ops before memory allocation
Date: Thu, 17 Nov 2022 12:32:23 +0200
Message-Id: <20221117103223.74425-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>
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

We may check ops before spending resources on memory allocation.
While at it, utilize dev_get_platdata() helper.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/sof/sof-client-probes.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
index d08395182b1a..fff126808bc0 100644
--- a/sound/soc/sof/sof-client-probes.c
+++ b/sound/soc/sof/sof-client-probes.c
@@ -399,23 +399,21 @@ static int sof_probes_client_probe(struct auxiliary_device *auxdev,
 	if (!sof_probes_enabled)
 		return -ENXIO;
 
-	if (!dev->platform_data) {
+	ops = dev_get_platdata(dev);
+	if (!ops) {
 		dev_err(dev, "missing platform data\n");
 		return -ENODEV;
 	}
-
-	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	ops = dev->platform_data;
-
 	if (!ops->startup || !ops->shutdown || !ops->set_params || !ops->trigger ||
 	    !ops->pointer) {
 		dev_err(dev, "missing platform callback(s)\n");
 		return -ENODEV;
 	}
 
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
 	priv->host_ops = ops;
 
 	switch (sof_client_get_ipc_type(cdev)) {
-- 
2.35.1

