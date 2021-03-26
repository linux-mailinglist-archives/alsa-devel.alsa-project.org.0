Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3474634B216
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 23:19:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B730D167A;
	Fri, 26 Mar 2021 23:18:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B730D167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616797142;
	bh=9znrCpHYvcAZ0Q8lxXrr+Re7wwYQtI/uzwXxOESeDRc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DHuhRCxeiNT6FSuG6t+CmfK2tD8HCgxs9zGWkvVX0vgjYLu3rE1qrQmif+rc5xlhD
	 e8oW9gRW9f2DFz9zdexKIWS2/wv9b9uTG5g6OwY0KJXItXbGJ0DZ4eg3BaEKxbWkrz
	 jsIdlFX0fchziGiigK3FzEpxDpghC1gMIni3zm3s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97E1BF8032B;
	Fri, 26 Mar 2021 23:16:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02848F80104; Fri, 26 Mar 2021 23:16:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B22FF80104
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 23:16:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B22FF80104
IronPort-SDR: H3YVT2KGH7INj4ekvAAOpG5HWV1nELi++rO1CRY3TKIAviFAcWEkavka4cZZ79UK1/+BTGX4YR
 emwgvx07WvHw==
X-IronPort-AV: E=McAfee;i="6000,8403,9935"; a="276373857"
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="276373857"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 15:16:36 -0700
IronPort-SDR: rf9cWzdhKcHZl+TH/NnOt6tMUAnK5pJuQGwApQffEOoS0HKLrOjwcHsf/iv2gmxopmX/gqE7in
 BcroMX2D9dMw==
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="416713352"
Received: from schine-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.213.191.61])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 15:16:35 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 2/2] ASoC: da732x: simplify code
Date: Fri, 26 Mar 2021 17:16:19 -0500
Message-Id: <20210326221619.949961-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326221619.949961-1-pierre-louis.bossart@linux.intel.com>
References: <20210326221619.949961-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Support Opensource <support.opensource@diasemi.com>, tiwai@suse.de,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, broonie@kernel.org
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

cppcheck reports a false positive:

sound/soc/codecs/da732x.c:1161:25: warning: Either the condition
'indiv<0' is redundant or there is division by zero at line
1161. [zerodivcond]
 fref = (da732x->sysclk / indiv);
                        ^
sound/soc/codecs/da732x.c:1158:12: note: Assuming that condition
'indiv<0' is not redundant
 if (indiv < 0)
           ^
sound/soc/codecs/da732x.c:1161:25: note: Division by zero
 fref = (da732x->sysclk / indiv);
                        ^

The code is awfully convoluted/confusing and can be simplified with a
single variable and the BIT macro.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/da732x.c | 17 ++++++-----------
 sound/soc/codecs/da732x.h | 12 ++++--------
 2 files changed, 10 insertions(+), 19 deletions(-)

diff --git a/sound/soc/codecs/da732x.c b/sound/soc/codecs/da732x.c
index d43ee7159ae0..42d6a3fc3af5 100644
--- a/sound/soc/codecs/da732x.c
+++ b/sound/soc/codecs/da732x.c
@@ -168,30 +168,25 @@ static const struct reg_default da732x_reg_cache[] = {
 static inline int da732x_get_input_div(struct snd_soc_component *component, int sysclk)
 {
 	int val;
-	int ret;
 
 	if (sysclk < DA732X_MCLK_10MHZ) {
-		val = DA732X_MCLK_RET_0_10MHZ;
-		ret = DA732X_MCLK_VAL_0_10MHZ;
+		val = DA732X_MCLK_VAL_0_10MHZ;
 	} else if ((sysclk >= DA732X_MCLK_10MHZ) &&
 	    (sysclk < DA732X_MCLK_20MHZ)) {
-		val = DA732X_MCLK_RET_10_20MHZ;
-		ret = DA732X_MCLK_VAL_10_20MHZ;
+		val = DA732X_MCLK_VAL_10_20MHZ;
 	} else if ((sysclk >= DA732X_MCLK_20MHZ) &&
 	    (sysclk < DA732X_MCLK_40MHZ)) {
-		val = DA732X_MCLK_RET_20_40MHZ;
-		ret = DA732X_MCLK_VAL_20_40MHZ;
+		val = DA732X_MCLK_VAL_20_40MHZ;
 	} else if ((sysclk >= DA732X_MCLK_40MHZ) &&
 	    (sysclk <= DA732X_MCLK_54MHZ)) {
-		val = DA732X_MCLK_RET_40_54MHZ;
-		ret = DA732X_MCLK_VAL_40_54MHZ;
+		val = DA732X_MCLK_VAL_40_54MHZ;
 	} else {
 		return -EINVAL;
 	}
 
 	snd_soc_component_write(component, DA732X_REG_PLL_CTRL, val);
 
-	return ret;
+	return val;
 }
 
 static void da732x_set_charge_pump(struct snd_soc_component *component, int state)
@@ -1158,7 +1153,7 @@ static int da732x_set_dai_pll(struct snd_soc_component *component, int pll_id,
 	if (indiv < 0)
 		return indiv;
 
-	fref = (da732x->sysclk / indiv);
+	fref = da732x->sysclk / BIT(indiv);
 	div_hi = freq_out / fref;
 	frac_div = (u64)(freq_out % fref) * 8192ULL;
 	do_div(frac_div, fref);
diff --git a/sound/soc/codecs/da732x.h b/sound/soc/codecs/da732x.h
index c5af17ee1516..c2f784c3f359 100644
--- a/sound/soc/codecs/da732x.h
+++ b/sound/soc/codecs/da732x.h
@@ -48,14 +48,10 @@
 #define	DA732X_MCLK_20MHZ		20000000
 #define	DA732X_MCLK_40MHZ		40000000
 #define	DA732X_MCLK_54MHZ		54000000
-#define	DA732X_MCLK_RET_0_10MHZ		0
-#define	DA732X_MCLK_VAL_0_10MHZ		1
-#define	DA732X_MCLK_RET_10_20MHZ	1
-#define	DA732X_MCLK_VAL_10_20MHZ	2
-#define	DA732X_MCLK_RET_20_40MHZ	2
-#define	DA732X_MCLK_VAL_20_40MHZ	4
-#define	DA732X_MCLK_RET_40_54MHZ	3
-#define	DA732X_MCLK_VAL_40_54MHZ	8
+#define	DA732X_MCLK_VAL_0_10MHZ		0
+#define	DA732X_MCLK_VAL_10_20MHZ	1
+#define	DA732X_MCLK_VAL_20_40MHZ	2
+#define	DA732X_MCLK_VAL_40_54MHZ	3
 #define	DA732X_DAI_ID1			0
 #define	DA732X_DAI_ID2			1
 #define	DA732X_SRCCLK_PLL		0
-- 
2.25.1

