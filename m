Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA75211278
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 20:19:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA8AC16B4;
	Wed,  1 Jul 2020 20:18:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA8AC16B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593627584;
	bh=K+8lnCkQEm2LLRhbR6kOyFLibOfsqhYzvTA5WAf9ePk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YCxHy44eo6TZ6mdQtvQACToe0fAVz84rMSsQKcEtRyaK/mK4oXUZByDvCDtmvlTBp
	 4FmSebTM0SrpINziy1teRe0SvBD8EaXvT8dSKAcie3SQynsfD9VCdZYDqfW6ot8sMi
	 zWQ0gRI/P7bamVCanC7piBx3lTYhDMEKzquMAHCw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98375F802F7;
	Wed,  1 Jul 2020 20:14:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF536F802BE; Wed,  1 Jul 2020 20:14:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B09D3F802A9
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 20:14:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B09D3F802A9
IronPort-SDR: kjE8uM9vMvTH08kcMXmQoS2ni/A2R6iXV1mDP+IklbsX7UaHpVEKmsB0bNIlK/x/vZNAU58nkl
 fGkGfZOi5LEg==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="145753295"
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="145753295"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 11:13:58 -0700
IronPort-SDR: 9124I9w6YLT/w9p27DAKq8CmyxnEIU3bl/ayEzjzu9V/jK6qH9zMJZN/Zv+WEE0xhWvOkm0CrL
 us4WZJt4TH4Q==
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="481686409"
Received: from srnatla-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.76.199])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 11:13:57 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 7/7] ASoC: codecs: wm8400: add _maybe_unused as needed
Date: Wed,  1 Jul 2020 13:13:20 -0500
Message-Id: <20200701181320.80848-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200701181320.80848-1-pierre-louis.bossart@linux.intel.com>
References: <20200701181320.80848-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Fix W=1 warning by adding __maybe_unused. Maintainers for this file
may want to double-check if those definitions are necessary.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/wm8400.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wm8400.c b/sound/soc/codecs/wm8400.c
index 2551eb0f1868..1e5671d345da 100644
--- a/sound/soc/codecs/wm8400.c
+++ b/sound/soc/codecs/wm8400.c
@@ -67,7 +67,7 @@ static void wm8400_component_reset(struct snd_soc_component *component)
 	wm8400_reset_codec_reg_cache(wm8400->wm8400);
 }
 
-static const DECLARE_TLV_DB_SCALE(rec_mix_tlv, -1500, 600, 0);
+static __maybe_unused const DECLARE_TLV_DB_SCALE(rec_mix_tlv, -1500, 600, 0);
 
 static const DECLARE_TLV_DB_SCALE(in_pga_tlv, -1650, 3000, 0);
 
@@ -75,7 +75,7 @@ static const DECLARE_TLV_DB_SCALE(out_mix_tlv, -2100, 0, 0);
 
 static const DECLARE_TLV_DB_SCALE(out_pga_tlv, -7300, 600, 0);
 
-static const DECLARE_TLV_DB_SCALE(out_omix_tlv, -600, 0, 0);
+static __maybe_unused const DECLARE_TLV_DB_SCALE(out_omix_tlv, -600, 0, 0);
 
 static const DECLARE_TLV_DB_SCALE(out_dac_tlv, -7163, 0, 0);
 
@@ -440,7 +440,7 @@ static const struct snd_kcontrol_new wm8400_dapm_ainrmux_controls =
 SOC_DAPM_ENUM("Route", wm8400_ainrmux_enum);
 
 /* RXVOICE */
-static const struct snd_kcontrol_new wm8400_dapm_rxvoice_controls[] = {
+static __maybe_unused const struct snd_kcontrol_new wm8400_dapm_rxvoice_controls[] = {
 SOC_DAPM_SINGLE_TLV("LIN4/RXN", WM8400_INPUT_MIXER5, WM8400_LR4BVOL_SHIFT,
 			WM8400_LR4BVOL_MASK, 0, in_mix_tlv),
 SOC_DAPM_SINGLE_TLV("RIN4/RXP", WM8400_INPUT_MIXER6, WM8400_RL4BVOL_SHIFT,
-- 
2.25.1

