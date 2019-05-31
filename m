Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E4A31065
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2019 16:40:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D35221612;
	Fri, 31 May 2019 16:39:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D35221612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559313611;
	bh=tT9PXGps/zpFVHJNl8C6R9/bQe+Hg1HzPWbPogTKDK8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=i7qVGj3hMv7NoFlm+t58QMVEU3i3YKO+oXxYNjuTiCQ8jbkjEeqNvvzq4CB8Fror2
	 /AwmwksB5g1qlKiwSSCzDkiEFc4OHmzFIp6Fnol/TUCYtl2oTll0FLS3PNTDqKOFW4
	 atwKLIre6bVmtyXYlJTVzq/3/k4tG2PTyJxX3yfg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D702F896E5;
	Fri, 31 May 2019 16:38:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07CEAF896E5; Fri, 31 May 2019 16:38:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E4A7F8072E
 for <alsa-devel@alsa-project.org>; Fri, 31 May 2019 16:38:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E4A7F8072E
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 863ECAFA9;
 Fri, 31 May 2019 14:38:21 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Date: Fri, 31 May 2019 16:38:20 +0200
Message-Id: <20190531143820.10142-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [alsa-devel] [PATCH] ASoC: hdac_hda: Fix unbalanced bus link
	refcount at probe error
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The error paths in hdac_hda_codec_probe() don't take care of the bus
link refcount properly, which leave the refcount still high.
This patch addresses them.

Fixes: 6bae5ea94989 ("ASoC: hdac_hda: add asoc extension for legacy HDA codec drivers")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

A bug I found while digging for another problem :)

 sound/soc/codecs/hdac_hda.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
index 7d4940256914..b55deaeb1ebf 100644
--- a/sound/soc/codecs/hdac_hda.c
+++ b/sound/soc/codecs/hdac_hda.c
@@ -475,8 +475,10 @@ static int hdac_hda_dev_probe(struct hdac_device *hdev)
 	snd_hdac_ext_bus_link_get(hdev->bus, hlink);
 
 	hda_pvt = hdac_to_hda_priv(hdev);
-	if (!hda_pvt)
-		return -ENOMEM;
+	if (!hda_pvt) {
+		ret = -ENOMEM;
+		goto error;
+	}
 
 	/* ASoC specific initialization */
 	ret = devm_snd_soc_register_component(&hdev->dev,
@@ -484,12 +486,13 @@ static int hdac_hda_dev_probe(struct hdac_device *hdev)
 					 ARRAY_SIZE(hdac_hda_dais));
 	if (ret < 0) {
 		dev_err(&hdev->dev, "failed to register HDA codec %d\n", ret);
-		return ret;
+		goto error;
 	}
 
 	dev_set_drvdata(&hdev->dev, hda_pvt);
-	snd_hdac_ext_bus_link_put(hdev->bus, hlink);
 
+ error:
+	snd_hdac_ext_bus_link_put(hdev->bus, hlink);
 	return ret;
 }
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
