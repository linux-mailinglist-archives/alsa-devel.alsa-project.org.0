Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C455A1252F7
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 21:15:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5941C843;
	Wed, 18 Dec 2019 21:14:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5941C843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576700121;
	bh=XQcRQYH6O6aN9kpEY+DDn+C6nE6WYexmn+hfyb7H+vI=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=U/oYHtVo4lbwm9TRH8o+kTsC4DcmLK/AJXm9lsr1lGIcZ+VFqjHMueEt/AL+dy//I
	 w0BoCsR7nCJhYFqhtLQMQD5aBEeM0VlAayhUpXZI83DIxq/qtHaX6sugECpfqq27qz
	 UaB35nDB1KY8+ILgrc2zu7fQT61ycHpHQRaFxA6A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 695ABF80329;
	Wed, 18 Dec 2019 21:06:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86C32F80303; Wed, 18 Dec 2019 21:06:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 78A7FF802EC
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 21:05:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78A7FF802EC
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDBF711FB;
 Wed, 18 Dec 2019 12:05:57 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C2053F67D;
 Wed, 18 Dec 2019 12:05:57 -0800 (PST)
Date: Wed, 18 Dec 2019 20:05:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20191218002616.7652-6-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20191218002616.7652-6-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: drop HDA codec upon probe
	failure" to the asoc tree
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

The patch

   ASoC: SOF: Intel: drop HDA codec upon probe failure

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 91dce767cd0b08be9f1c87bb2de8e63391a72692 Mon Sep 17 00:00:00 2001
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Date: Tue, 17 Dec 2019 18:26:13 -0600
Subject: [PATCH] ASoC: SOF: Intel: drop HDA codec upon probe failure

In case a HDA codec probe fails, do not raise error immediately,
but instead remove the codec from bus->codec_mask and continue
probe for other codecs.

This allows for more robust behaviour in cases where one codec
in the system is faulty. SOF driver load can still proceed with
the codecs that can be probed successfully. Probe may still
fail if suitable machine driver is not found, but in many
cases the generic HDA machine driver can operate with a subset
of codecs.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191218002616.7652-6-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-codec.c | 12 +++++-------
 sound/soc/sof/intel/hda.h       |  4 ++--
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index 65761e095184..d7855b1f8e2e 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -140,8 +140,8 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
 }
 
 /* Codec initialization */
-int hda_codec_probe_bus(struct snd_sof_dev *sdev,
-			bool hda_codec_use_common_hdmi)
+void hda_codec_probe_bus(struct snd_sof_dev *sdev,
+			 bool hda_codec_use_common_hdmi)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	int i, ret;
@@ -154,13 +154,11 @@ int hda_codec_probe_bus(struct snd_sof_dev *sdev,
 
 		ret = hda_codec_probe(sdev, i, hda_codec_use_common_hdmi);
 		if (ret < 0) {
-			dev_err(bus->dev, "error: codec #%d probe error, ret: %d\n",
-				i, ret);
-			return ret;
+			dev_warn(bus->dev, "codec #%d probe error, ret: %d\n",
+				 i, ret);
+			bus->codec_mask &= ~BIT(i);
 		}
 	}
-
-	return 0;
 }
 EXPORT_SYMBOL(hda_codec_probe_bus);
 
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 01529c7058f3..47408ec0de40 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -575,8 +575,8 @@ void sof_hda_bus_init(struct hdac_bus *bus, struct device *dev);
 /*
  * HDA Codec operations.
  */
-int hda_codec_probe_bus(struct snd_sof_dev *sdev,
-			bool hda_codec_use_common_hdmi);
+void hda_codec_probe_bus(struct snd_sof_dev *sdev,
+			 bool hda_codec_use_common_hdmi);
 void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev);
 void hda_codec_jack_check(struct snd_sof_dev *sdev);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
