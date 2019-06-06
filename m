Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A04A36C2A
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 08:24:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 006F7169E;
	Thu,  6 Jun 2019 08:23:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 006F7169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559802278;
	bh=rA8cu9+6VNEZbYDDKMZb4OGbaLeC7nfgLf324VjwqgI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Hp2n4dGb7av1EBPCH94nwqddtJVRQ4or3lQlWA8jMg2wPTIFYC39wsr8YPhmmlodW
	 hsdLIcMMeclLSlAzmi41OKUf0C8N7rwOudl37Y4JhHk75efIiSw05YTo9OnEq1hNe5
	 oFy+9whAhhMgL/2oDHajNF4uG/ZrTHpYPmC3FvQc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96B66F896FE;
	Thu,  6 Jun 2019 08:22:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08568F896F7; Thu,  6 Jun 2019 08:22:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15758F896CE
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 08:22:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15758F896CE
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x566MbIP025789,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtitcasv02.realtek.com.tw[172.21.6.19])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x566MbIP025789
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 6 Jun 2019 14:22:37 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTITCASV02.realtek.com.tw (172.21.6.19) with Microsoft SMTP Server id
 14.3.439.0; Thu, 6 Jun 2019 14:22:36 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Thu, 6 Jun 2019 14:22:32 +0800
Message-ID: <20190606062232.3753-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Originating-IP: [172.22.102.1]
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, cychiang@google.com, derek.fang@realtek.com,
 Shuming Fan <shumingf@realtek.com>, mingjane_hsieh@realtek.com,
 flove@realtek.com, hychao@google.com
Subject: [alsa-devel] [PATCH] ASoC: rt1011: fix warning reported by kbuild
	test robot and minor issue
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

From: Shuming Fan <shumingf@realtek.com>

This patch fixes following issues:
- warning: this decimal constant is unsigned only in ISO C90
- sparse: incorrect type in assignment
- check if value.integer.value is zero for "R0 Load Mode" control

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt1011.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index 349d6db7ecd4..5605b660f4bf 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -1145,8 +1145,8 @@ static int rt1011_bq_drc_coeff_get(struct snd_kcontrol *kcontrol,
 	bq_drc_info = rt1011->bq_drc_params[mode_idx];
 
 	for (i = 0; i < RT1011_BQ_DRC_NUM; i++) {
-		params[i].reg = cpu_to_le16(bq_drc_info[i].reg);
-		params[i].val = cpu_to_le16(bq_drc_info[i].val);
+		params[i].reg = bq_drc_info[i].reg;
+		params[i].val = bq_drc_info[i].val;
 	}
 
 	return 0;
@@ -1187,8 +1187,8 @@ static int rt1011_bq_drc_coeff_put(struct snd_kcontrol *kcontrol,
 	pr_info("%s, id.name=%s, mode_idx=%d\n", __func__,
 		ucontrol->id.name, mode_idx);
 	for (i = 0; i < RT1011_BQ_DRC_NUM; i++) {
-		bq_drc_info[i].reg =	le16_to_cpu(params[i].reg);
-		bq_drc_info[i].val =	le16_to_cpu(params[i].val);
+		bq_drc_info[i].reg = params[i].reg;
+		bq_drc_info[i].val = params[i].val;
 	}
 
 	for (i = 0; i < RT1011_BQ_DRC_NUM; i++) {
@@ -1284,11 +1284,14 @@ static int rt1011_r0_load_mode_put(struct snd_kcontrol *kcontrol,
 	if (!component->card->instantiated)
 		return 0;
 
+	if (ucontrol->value.integer.value[0] == 0)
+		return -EINVAL;
+
 	dev = regmap_get_device(rt1011->regmap);
 	if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
 		rt1011->r0_reg = ucontrol->value.integer.value[0];
 
-		format = 2147483648; /* 2^24 * 128 */
+		format = 2147483648U; /* 2^24 * 128 */
 		r0_integer = format / rt1011->r0_reg / 128;
 		r0_factor = ((format / rt1011->r0_reg * 100) / 128)
 						- (r0_integer * 100);
@@ -2120,7 +2123,7 @@ static int rt1011_calibrate(struct rt1011_priv *rt1011, unsigned char cali_flag)
 			dev_err(dev,	"Calibrate R0 Failure\n");
 			ret = -EAGAIN;
 		} else {
-			format = 2147483648; /* 2^24 * 128 */
+			format = 2147483648U; /* 2^24 * 128 */
 			r0_integer = format / r0[0] / 128;
 			r0_factor = ((format / r0[0] * 100) / 128)
 							- (r0_integer * 100);
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
