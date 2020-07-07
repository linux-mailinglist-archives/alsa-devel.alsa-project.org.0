Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 937182177A7
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 21:12:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 396AA15F2;
	Tue,  7 Jul 2020 21:11:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 396AA15F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594149145;
	bh=rfdzzSr5xuktEWb/XWKpYPoRNCyYNutTUgTQsSVoXLg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qpco0XjHx8tTyjRBy3n9UYIOGbrEQCyFcYBFNfY1fXHeSjwyeJ2OZMDdOzTq+krpr
	 zizABnFlUCKnT0ia+la3K1l0qi006rD4vcwxScZHSiG8k59dzrrrvKvTeUT263Tt2f
	 FXMiyz+OtK4qZwhvMXr60h4n0MieEKu6iLakO3ZI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77145F80308;
	Tue,  7 Jul 2020 21:07:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 816AEF802FD; Tue,  7 Jul 2020 21:06:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC9D3F8025A
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 21:06:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC9D3F8025A
IronPort-SDR: 0HbAXMM0UDiBKVsc6/PjVOjQKOvH5CPHCxxkEE+8tXddxMcbYY//IhU3GcHNsxcGwt526mJ7Uw
 nWDClMs0c3Sg==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="149202919"
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="149202919"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:06:45 -0700
IronPort-SDR: 2y+pYrxM/e/H+2o4edmVGd/hhRXYdc5rf0sVQQ/GsKmTOKHMydmjidsdUFarjne3MQGFaFQrU7
 1ZrP5pX5Va3w==
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="268278611"
Received: from mrtorger-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.77.62])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:06:43 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 08/13] ASoC: codecs: jz4770: Remove defined but never used
 variable 'mic_boost_tlv'
Date: Tue,  7 Jul 2020 14:06:07 -0500
Message-Id: <20200707190612.97799-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707190612.97799-1-pierre-louis.bossart@linux.intel.com>
References: <20200707190612.97799-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 broonie@kernel.org, ter Huurne <maarten@treewalker.org>,
 Lee Jones <lee.jones@linaro.org>
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

From: Lee Jones <lee.jones@linaro.org>

Fixes the following W=1 kernel build warning(s):

 In file included from include/sound/tlv.h:10,
 from sound/soc/codecs/jz4770.c:19:
 sound/soc/codecs/jz4770.c:306:35: warning: ‘mic_boost_tlv’ defined but not used [-Wunused-const-variable=]
 306 | static const DECLARE_TLV_DB_SCALE(mic_boost_tlv, 0, 400, 0);
 | ^~~~~~~~~~~~~
 include/uapi/sound/tlv.h:64:15: note: in definition of macro ‘SNDRV_CTL_TLVD_DECLARE_DB_SCALE’
 64 | unsigned int name[] = { | ^~~~
 sound/soc/codecs/jz4770.c:306:14: note: in expansion of macro ‘DECLARE_TLV_DB_SCALE’
 306 | static const DECLARE_TLV_DB_SCALE(mic_boost_tlv, 0, 400, 0);
 | ^~~~~~~~~~~~~~~~~~~~

Cc: ter Huurne <maarten@treewalker.org>
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/jz4770.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/jz4770.c b/sound/soc/codecs/jz4770.c
index 34775aa62402..4dee585761c2 100644
--- a/sound/soc/codecs/jz4770.c
+++ b/sound/soc/codecs/jz4770.c
@@ -303,7 +303,6 @@ static int jz4770_codec_digital_mute(struct snd_soc_dai *dai, int mute)
 static const DECLARE_TLV_DB_MINMAX_MUTE(dac_tlv, -3100, 0);
 static const DECLARE_TLV_DB_SCALE(adc_tlv, 0, 100, 0);
 static const DECLARE_TLV_DB_MINMAX(out_tlv, -2500, 600);
-static const DECLARE_TLV_DB_SCALE(mic_boost_tlv, 0, 400, 0);
 static const DECLARE_TLV_DB_SCALE(linein_tlv, -2500, 100, 0);
 
 /* Unconditional controls. */
-- 
2.25.1

