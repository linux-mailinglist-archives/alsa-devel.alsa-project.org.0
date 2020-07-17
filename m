Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D90223925
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 12:22:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A01515E5;
	Fri, 17 Jul 2020 12:21:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A01515E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594981355;
	bh=Jt9xPmQro5xIT/ucjZEq9ztBAAX56MoqIiDNrdigRpc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V82V8ja7BUdJ9XCMJsvK9u5MJBgPCBbdLqFoMBDGnm4Upg96OQkV/IiwySr5m3qFC
	 U/dyqF7JvZ/ZnkY3SB+Vu+SbhBwCZiqRiH09kXNNw99ijSzXhlHAme9PwLts6CCE9g
	 JChLKqNZpYIbq/TFRIRbEmDnORtGdmMdEqU2nL7E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DF84F800E4;
	Fri, 17 Jul 2020 12:20:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64C7DF8021D; Fri, 17 Jul 2020 12:20:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F2E4F800E4
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 12:20:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F2E4F800E4
IronPort-SDR: SGK9EW5jTxahYP1TKYzjSvqgFX6d5hNWorbvUxQ77ot4GQBzXCjVEQ0mpBeeYE5yd2hlfZ7Vmn
 ScDib/LFpgfw==
X-IronPort-AV: E=McAfee;i="6000,8403,9684"; a="129129555"
X-IronPort-AV: E=Sophos;i="5.75,362,1589266800"; d="scan'208";a="129129555"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2020 03:20:40 -0700
IronPort-SDR: guEa5P4i0JQpACPiF4HPg18lv67qvg5r1epRNuJJmOJ2DwBsfUGVG0Rn5qxRjxtYTFyawcPIAJ
 fL40UV+g3REA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,362,1589266800"; d="scan'208";a="282744397"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga003.jf.intel.com with ESMTP; 17 Jul 2020 03:20:39 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 1/3] ASoC: hdac_hda: call patch_ops.free() on probe error
Date: Fri, 17 Jul 2020 13:19:48 +0300
Message-Id: <20200717101950.3885187-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

Add error handling for patch_ops in hdac_hda_codec_probe().

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/codecs/hdac_hda.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
index 473efe9ef998..72bd779bf942 100644
--- a/sound/soc/codecs/hdac_hda.c
+++ b/sound/soc/codecs/hdac_hda.c
@@ -467,7 +467,7 @@ static int hdac_hda_codec_probe(struct snd_soc_component *component)
 	ret = snd_hda_codec_parse_pcms(hcodec);
 	if (ret < 0) {
 		dev_err(&hdev->dev, "unable to map pcms to dai %d\n", ret);
-		goto error_regmap;
+		goto error_patch;
 	}
 
 	/* HDMI controls need to be created in machine drivers */
@@ -476,7 +476,7 @@ static int hdac_hda_codec_probe(struct snd_soc_component *component)
 		if (ret < 0) {
 			dev_err(&hdev->dev, "unable to create controls %d\n",
 				ret);
-			goto error_regmap;
+			goto error_patch;
 		}
 	}
 
@@ -496,6 +496,9 @@ static int hdac_hda_codec_probe(struct snd_soc_component *component)
 
 	return 0;
 
+error_patch:
+	if (hcodec->patch_ops.free)
+		hcodec->patch_ops.free(hcodec);
 error_regmap:
 	snd_hdac_regmap_exit(hdev);
 error_pm:
-- 
2.27.0

