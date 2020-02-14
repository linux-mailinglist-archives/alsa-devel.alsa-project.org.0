Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2B715D8B8
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 14:49:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D15121672;
	Fri, 14 Feb 2020 14:48:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D15121672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581688144;
	bh=ARk292a5deByNfrjSTFqBdscwH1XsrrK034QsAZAPbk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QVEUTF/TC0mLQ1rMfE+L60B96MOELrWVVqS39hziPbhBmI9/4dP6i4KfTRASa4HtW
	 bqc37bpcvJt6JVJzWE+U8wfg8cCa4vkVJFUHgGY3GBaIXRiJa7r3/qei6iK1SYBJ+J
	 BKyWZqlV7s2+Zzr0PF9bdefwuMCqQOUIio1dGcvM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9A58F80157;
	Fri, 14 Feb 2020 14:47:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82249F8014F; Fri, 14 Feb 2020 14:47:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F2A9F80138
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 14:47:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F2A9F80138
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="w3o4ZhHS"
Received: by mail-wr1-x441.google.com with SMTP id n10so9030941wrm.1
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 05:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yy4ilqVvhrLATx+0bmuWhKxlR9fkmOJTJ4xxA2l5XEc=;
 b=w3o4ZhHSe+S9GbxnicHhG7v2B4byeFaiG8qzWZR8jY1reW8h2VWxZiQCjC3gyhDEKC
 wujXg/FXhgNxc6CSPRB0F3dBX5nSkBndE9V5RLoXGGiGYdfNr9LIXsJP5O0l4A6JqDYV
 WhfQdgqzmEZKHoIUbwtS+dIcm4BFtSVJ/I944JFkT0mROjQlYqZwavz0gkevpkZ3TMOU
 Lo7W17uCAVFSjuyFn56t9vrZejtKIl0Z17lfHZ7uZ20CnnjMbqbO7d8qtoIf6IybXnT9
 GRFo4OnK/BVj7HTRbnLVn3K7fQRJgJhp6FFUfcKe+44NW9LIR07Xbo/ogQuR0z54cx1i
 ja1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yy4ilqVvhrLATx+0bmuWhKxlR9fkmOJTJ4xxA2l5XEc=;
 b=uKHpUKnUIWphAs7DQOqwRfEytDEzNa42rllAB9eQ5ev63y3rZNM1Rf9W36PiL7Fl+2
 2rfR1VONJmpSkZm/6OGV4ao/jn+qTgB1krDsfPvyXADTGRpXvJ9CxPCfvq5RLZSwKDLQ
 NFR5jivAJIrO7ajkiyOEqXYahm2LWrOFSpq+rmfZqjiqW+q7gQbBcCmsI4FXhFILJWcL
 FNFmHGxX9Is1t13CS3gK3UUCaN8aCt50+I7jNUBrQ1M6C4UcjRCiKS43TK2sxps/OTM6
 EwACrqA8n0qTdOZ4Sikk39m23czEvH15ui/WyIe2qHX5foURykk609NHE1R8wQaC85g1
 wUrQ==
X-Gm-Message-State: APjAAAWmraZBZmDgmCurIMywmzAjVvBgEXbD773vyAgH0RWH5MhCMnKM
 qWkR2Qg258rR/wLk5MPsmHxwJA==
X-Google-Smtp-Source: APXvYqxSrnmmkWxl7FjTG6YfB4kuBeJrO7YMKoS/fI/OjITSVCPGMdawDS0oXNepNvV/XESe/FhCVw==
X-Received: by 2002:adf:ea48:: with SMTP id j8mr4359656wrn.363.1581688035426; 
 Fri, 14 Feb 2020 05:47:15 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id h13sm8286238wrw.54.2020.02.14.05.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 05:47:14 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Fri, 14 Feb 2020 14:47:04 +0100
Message-Id: <20200214134704.342501-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH RFC] ASoC: core: ensure component names are
	unique
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Make sure each ASoC component is registered with a unique name.
The component is derived from the device name. If a device registers more
than one component, the component names will be the same.

This usually brings up a warning about the debugfs directory creation of
the component since directory already exists.

In such case, start numbering the component of the device so the names
don't collide anymore.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

* Here is an example of /sys/kernel/debug/asoc/components before the change:
hdmi-audio-codec.3.auto
c1105400.audio-controller
c1105400.audio-controller
c1105400.audio-controller
c8832000.audio-controller
analog-amplifier
snd-soc-dummy
snd-soc-dummy

* and after:
hdmi-audio-codec.3.auto
c1105400.audio-controller-2
c1105400.audio-controller-1
c1105400.audio-controller
c8832000.audio-controller
analog-amplifier
snd-soc-dummy-1
snd-soc-dummy

I wanted to keep the name as they were for the devices registering
only one component but we could also start the numbering from the first
component instead of the second.

 sound/soc/soc-core.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 03b87427faa7..6a58a8f6e3c4 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2446,6 +2446,33 @@ static int snd_soc_register_dais(struct snd_soc_component *component,
 	return ret;
 }
 
+static char *snd_soc_component_unique_name(struct device *dev,
+					   struct snd_soc_component *component)
+{
+	struct snd_soc_component *pos;
+	int count = 0;
+	char *name, *unique;
+
+	name = fmt_single_name(dev, &component->id);
+	if (!name)
+		return name;
+
+	/* Count the number of components registred by the device */
+	for_each_component(pos) {
+		if (dev == pos->dev)
+			count++;
+	}
+
+	/* Keep naming as it is for the 1st component */
+	if (!count)
+		return name;
+
+	unique = devm_kasprintf(dev, GFP_KERNEL, "%s-%d", name, count);
+	devm_kfree(dev, name);
+
+	return unique;
+}
+
 static int snd_soc_component_initialize(struct snd_soc_component *component,
 	const struct snd_soc_component_driver *driver, struct device *dev)
 {
@@ -2454,7 +2481,7 @@ static int snd_soc_component_initialize(struct snd_soc_component *component,
 	INIT_LIST_HEAD(&component->card_list);
 	mutex_init(&component->io_mutex);
 
-	component->name = fmt_single_name(dev, &component->id);
+	component->name = snd_soc_component_unique_name(dev, component);
 	if (!component->name) {
 		dev_err(dev, "ASoC: Failed to allocate name\n");
 		return -ENOMEM;
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
