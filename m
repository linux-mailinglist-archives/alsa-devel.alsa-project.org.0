Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00950123B9C
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 01:32:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7654D84F;
	Wed, 18 Dec 2019 01:31:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7654D84F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576629147;
	bh=tEw83fyYMA+LqR1dH42/uHGRwqCSJe1r1sYSEML8ckI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jyxvmybQCysrFm5FauxXeZY0lkaG//+5aU04mHgGdRHzGDZ/EYHnIr4Gyl/dCnsCR
	 ZLkHRy6zdv3i6XG9v1s93ooyXwKRHuOOuUG2mi+dj6thUFVjlbAQsIKu2BNcYk9VGN
	 +sEtMpxAPUW2ftZmLkpZeMkpzeB7A5lge7srwjqQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF9A8F802A2;
	Wed, 18 Dec 2019 01:27:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D243EF8020B; Wed, 18 Dec 2019 01:27:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E8FEF80256
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 01:26:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E8FEF80256
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 16:26:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,327,1571727600"; d="scan'208";a="217974237"
Received: from dshoemak-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.3.243])
 by orsmga003.jf.intel.com with ESMTP; 17 Dec 2019 16:26:33 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 17 Dec 2019 18:26:13 -0600
Message-Id: <20191218002616.7652-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191218002616.7652-1-pierre-louis.bossart@linux.intel.com>
References: <20191218002616.7652-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 5/8] ASoC: SOF: Intel: drop HDA codec upon
	probe failure
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

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

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
