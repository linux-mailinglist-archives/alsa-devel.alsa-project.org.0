Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3351C33CC
	for <lists+alsa-devel@lfdr.de>; Mon,  4 May 2020 09:42:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 880FA16EA;
	Mon,  4 May 2020 09:41:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 880FA16EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588578158;
	bh=ukqHfgZgD1u8lq2KMo8VRzlvOj0EGTZq4iXPZdG850w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kSE4sVAiyOVasqWODWN6WuytiQUJqSzVv3BbQEJBiELyhQ2Te/uSKcXz/OCAjZ0lv
	 7lcPsZDM5v8jJ1w9NyUPqzTUraR6X4LXrO8yC2eOOI8INyYU/alkvZS1BjpbJcrxbG
	 yIi2WkGyI6ucuQYQdh/pEeYIrDdCk3Fz7SmsyH2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DCA3F80259;
	Mon,  4 May 2020 09:40:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C537DF80258; Mon,  4 May 2020 09:40:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47233F80234
 for <alsa-devel@alsa-project.org>; Mon,  4 May 2020 09:40:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47233F80234
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 0447efL23010035,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 0447efL23010035
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 4 May 2020 15:40:41 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Mon, 4 May 2020 15:40:41 +0800
Received: from localhost.localdomain (172.22.102.1) by RTEXMB01.realtek.com.tw
 (172.21.6.94) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Mon, 4 May 2020
 15:40:40 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 2/2] ASoC: rl6231: Add the K bypass for the PLL parameters
Date: Mon, 4 May 2020 15:40:07 +0800
Message-ID: <20200504074007.13002-2-oder_chiou@realtek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200504074007.13002-1-oder_chiou@realtek.com>
References: <20200504074007.13002-1-oder_chiou@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXMB05.realtek.com.tw (172.21.6.98) To
 RTEXMB01.realtek.com.tw (172.21.6.94)
Cc: Oder Chiou <oder_chiou@realtek.com>, jack.yu@realtek.com,
 alsa-devel@alsa-project.org, derek.fang@realtek.com, shumingf@realtek.com,
 flove@realtek.com
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

The patch adds the K bypass for the PLL parameters.

Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
---
 sound/soc/codecs/rl6231.c | 29 +++++++++++++++++++----------
 sound/soc/codecs/rl6231.h |  1 +
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/rl6231.c b/sound/soc/codecs/rl6231.c
index d181c217d835..2586d1cafc0c 100644
--- a/sound/soc/codecs/rl6231.c
+++ b/sound/soc/codecs/rl6231.c
@@ -97,12 +97,13 @@ struct pll_calc_map {
 	int n;
 	int m;
 	bool m_bp;
+	bool k_bp;
 };
 
 static const struct pll_calc_map pll_preset_table[] = {
-	{19200000,  4096000,  23, 14, 1, false},
-	{19200000,  24576000,  3, 30, 3, false},
-	{3840000,   24576000,  3, 30, 0, true},
+	{19200000,  4096000,  23, 14, 1, false, false},
+	{19200000,  24576000,  3, 30, 3, false, false},
+	{3840000,   24576000,  3, 30, 0, true, false},
 };
 
 static unsigned int find_best_div(unsigned int in,
@@ -128,7 +129,7 @@ static unsigned int find_best_div(unsigned int in,
  * rl6231_pll_calc - Calcualte PLL M/N/K code.
  * @freq_in: external clock provided to codec.
  * @freq_out: target clock which codec works on.
- * @pll_code: Pointer to structure with M, N, K and bypass flag.
+ * @pll_code: Pointer to structure with M, N, K, m_bypass and k_bypass flag.
  *
  * Calcualte M/N/K code to configure PLL for codec.
  *
@@ -143,7 +144,7 @@ int rl6231_pll_calc(const unsigned int freq_in,
 	unsigned int red, pll_out, in_t, out_t, div, div_t;
 	unsigned int red_t = abs(freq_out - freq_in);
 	unsigned int f_in, f_out, f_max;
-	bool bypass = false;
+	bool m_bypass = false, k_bypass = false;
 
 	if (RL6231_PLL_INP_MAX < freq_in || RL6231_PLL_INP_MIN > freq_in)
 		return -EINVAL;
@@ -154,7 +155,8 @@ int rl6231_pll_calc(const unsigned int freq_in,
 			k = pll_preset_table[i].k;
 			m = pll_preset_table[i].m;
 			n = pll_preset_table[i].n;
-			bypass = pll_preset_table[i].m_bp;
+			m_bypass = pll_preset_table[i].m_bp;
+			k_bypass = pll_preset_table[i].k_bp;
 			pr_debug("Use preset PLL parameter table\n");
 			goto code_find;
 		}
@@ -172,12 +174,14 @@ int rl6231_pll_calc(const unsigned int freq_in,
 	f_in = freq_in / div;
 	f_out = freq_out / div;
 	k = min_k;
+	if (min_k < -1)
+		min_k = -1;
 	for (k_t = min_k; k_t <= max_k; k_t++) {
 		for (n_t = 0; n_t <= max_n; n_t++) {
 			in_t = f_in * (n_t + 2);
 			pll_out = f_out * (k_t + 2);
 			if (in_t == pll_out) {
-				bypass = true;
+				m_bypass = true;
 				n = n_t;
 				k = k_t;
 				goto code_find;
@@ -185,7 +189,7 @@ int rl6231_pll_calc(const unsigned int freq_in,
 			out_t = in_t / (k_t + 2);
 			red = abs(f_out - out_t);
 			if (red < red_t) {
-				bypass = true;
+				m_bypass = true;
 				n = n_t;
 				m = 0;
 				k = k_t;
@@ -197,7 +201,7 @@ int rl6231_pll_calc(const unsigned int freq_in,
 				out_t = in_t / ((m_t + 2) * (k_t + 2));
 				red = abs(f_out - out_t);
 				if (red < red_t) {
-					bypass = false;
+					m_bypass = false;
 					n = n_t;
 					m = m_t;
 					k = k_t;
@@ -211,8 +215,13 @@ int rl6231_pll_calc(const unsigned int freq_in,
 	pr_debug("Only get approximation about PLL\n");
 
 code_find:
+	if (k == -1) {
+		k_bypass = true;
+		k = 0;
+	}
 
-	pll_code->m_bp = bypass;
+	pll_code->m_bp = m_bypass;
+	pll_code->k_bp = k_bypass;
 	pll_code->m_code = m;
 	pll_code->n_code = n;
 	pll_code->k_code = k;
diff --git a/sound/soc/codecs/rl6231.h b/sound/soc/codecs/rl6231.h
index 6d8ed0377296..928082750860 100644
--- a/sound/soc/codecs/rl6231.h
+++ b/sound/soc/codecs/rl6231.h
@@ -18,6 +18,7 @@
 
 struct rl6231_pll_code {
 	bool m_bp; /* Indicates bypass m code or not. */
+	bool k_bp; /* Indicates bypass k code or not. */
 	int m_code;
 	int n_code;
 	int k_code;
-- 
2.25.1

