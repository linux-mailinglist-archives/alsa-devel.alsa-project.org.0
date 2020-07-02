Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0744F2129D5
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 18:38:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C44A16D2;
	Thu,  2 Jul 2020 18:37:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C44A16D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593707927;
	bh=Q2RBQ3US4S+XtMQsdrT0JZHck6UPZcuMar8ecgUbGPw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RHWseRWRtGzcBR60yHNxdtGtgRkpLXgVDHmYBlu8vgDsMk8z28a45v3v0nbeTTsoj
	 a6KLZAFaaYwLtOtJvR0XP2yNqWy4Y9bE6T333gQNdzZVI8ING4jGrxcRD4pUD+Y47r
	 aobWfZXe5/c+oc2pSObV6SuZcpcQoH3xD/gsqVE0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94833F800C1;
	Thu,  2 Jul 2020 18:37:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 091F7F8022D; Thu,  2 Jul 2020 18:37:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1EE01F800ED
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 18:36:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EE01F800ED
IronPort-SDR: QmZjcp4Ot3PoBy4MzVrqb5ou0g93uWrqc0nH2x3heOCOFWuTsaPqk7GeI944j2jbSuR2k42TxT
 dIkytdqGTUbA==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="134419784"
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="134419784"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 09:36:52 -0700
IronPort-SDR: 7SG9avuyXbU1aokEqyQnDY6qPOHZ0Jgkuggn2X2wVU/mhoPKVQx4YuUSL36KrQtY81NlKUA9CM
 8Aq/eklqnvAg==
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="482064516"
Received: from nzbastur-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.231.182])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 09:36:51 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: codecs: wm8400: remove unused variables
Date: Thu,  2 Jul 2020 11:36:33 -0500
Message-Id: <20200702163633.162508-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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

Fix W=1 warning by removing unused variables

Suggested-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/wm8400.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/sound/soc/codecs/wm8400.c b/sound/soc/codecs/wm8400.c
index 2551eb0f1868..35ffa7765c85 100644
--- a/sound/soc/codecs/wm8400.c
+++ b/sound/soc/codecs/wm8400.c
@@ -67,16 +67,12 @@ static void wm8400_component_reset(struct snd_soc_component *component)
 	wm8400_reset_codec_reg_cache(wm8400->wm8400);
 }
 
-static const DECLARE_TLV_DB_SCALE(rec_mix_tlv, -1500, 600, 0);
-
 static const DECLARE_TLV_DB_SCALE(in_pga_tlv, -1650, 3000, 0);
 
 static const DECLARE_TLV_DB_SCALE(out_mix_tlv, -2100, 0, 0);
 
 static const DECLARE_TLV_DB_SCALE(out_pga_tlv, -7300, 600, 0);
 
-static const DECLARE_TLV_DB_SCALE(out_omix_tlv, -600, 0, 0);
-
 static const DECLARE_TLV_DB_SCALE(out_dac_tlv, -7163, 0, 0);
 
 static const DECLARE_TLV_DB_SCALE(in_adc_tlv, -7163, 1763, 0);
@@ -439,14 +435,6 @@ static SOC_ENUM_SINGLE_DECL(wm8400_ainrmux_enum,
 static const struct snd_kcontrol_new wm8400_dapm_ainrmux_controls =
 SOC_DAPM_ENUM("Route", wm8400_ainrmux_enum);
 
-/* RXVOICE */
-static const struct snd_kcontrol_new wm8400_dapm_rxvoice_controls[] = {
-SOC_DAPM_SINGLE_TLV("LIN4/RXN", WM8400_INPUT_MIXER5, WM8400_LR4BVOL_SHIFT,
-			WM8400_LR4BVOL_MASK, 0, in_mix_tlv),
-SOC_DAPM_SINGLE_TLV("RIN4/RXP", WM8400_INPUT_MIXER6, WM8400_RL4BVOL_SHIFT,
-			WM8400_RL4BVOL_MASK, 0, in_mix_tlv),
-};
-
 /* LOMIX */
 static const struct snd_kcontrol_new wm8400_dapm_lomix_controls[] = {
 SOC_DAPM_SINGLE("LOMIX Right ADC Bypass Switch", WM8400_OUTPUT_MIXER1,
-- 
2.25.1

