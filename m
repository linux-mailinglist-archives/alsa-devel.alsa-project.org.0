Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8461F341358
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Mar 2021 04:05:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A95B16A0;
	Fri, 19 Mar 2021 04:04:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A95B16A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616123148;
	bh=p09m9mao52BQFeyQL4tbIH7WZA5fzkiV0wTB2GnED7Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TWDHu6RQVpf8NbpuT9+t1Zo61ygEzRYkcmiFmd36ijORlEC5y4uHVBBKXpRbdW23T
	 LSqsl8hDD3eeX73hoblX7DGdPcHbAFFpnkm3asMjLh2aV9Vq5fa+XcDWcp/kli3DF+
	 5k0wO6+6ELLFnnapgBJVs4qoiupXEUzXUzCR6UUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAF72F80257;
	Fri, 19 Mar 2021 04:04:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D7A1F8023C; Fri, 19 Mar 2021 04:04:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F789F800E0
 for <alsa-devel@alsa-project.org>; Fri, 19 Mar 2021 04:03:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F789F800E0
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 12J33oKbA013734,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmbs01.realtek.com.tw[172.21.6.94])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 12J33oKbA013734
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 19 Mar 2021 11:03:50 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 19 Mar 2021 11:03:50 +0800
From: Jack Yu <jack.yu@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 2/2] ASoC: rt715: modification for code simplification
Date: Fri, 19 Mar 2021 11:03:37 +0800
Message-ID: <20210319030337.16213-2-jack.yu@realtek.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210319030337.16213-1-jack.yu@realtek.com>
References: <20210319030337.16213-1-jack.yu@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXMBS01.realtek.com.tw (172.21.6.94) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
Cc: oder_chiou@realtek.com, Jack Yu <jack.yu@realtek.com>,
 alsa-devel@alsa-project.org, lars@metafoo.de, derek.fang@realtek.com,
 shumingf@realtek.com, flove@realtek.com
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

Modification for code simplification.

Signed-off-by: Jack Yu <jack.yu@realtek.com>
---
 sound/soc/codecs/rt715.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c
index c461a4c23fd3..a9e4741269ba 100644
--- a/sound/soc/codecs/rt715.c
+++ b/sound/soc/codecs/rt715.c
@@ -57,14 +57,14 @@ static void rt715_get_gain(struct rt715_priv *rt715, unsigned int addr_h,
 {
 	int ret;
 	/* R Channel */
-	*r_val = (val_h << 8);
+	*r_val = val_h << 8;
 	ret = regmap_read(rt715->regmap, addr_l, r_val);
 	if (ret < 0)
 		pr_err("Failed to get R channel gain.\n");
 
 	/* L Channel */
 	val_h |= 0x20;
-	*l_val = (val_h << 8);
+	*l_val = val_h << 8;
 	ret = regmap_read(rt715->regmap, addr_h, l_val);
 	if (ret < 0)
 		pr_err("Failed to get L channel gain.\n");
@@ -205,8 +205,8 @@ static int rt715_set_amp_gain_get(struct snd_kcontrol *kcontrol,
 
 	if (mc->invert) {
 		/* for mute status */
-		read_ll = !((read_ll & 0x80) >> RT715_MUTE_SFT);
-		read_rl = !((read_rl & 0x80) >> RT715_MUTE_SFT);
+		read_ll = !(read_ll & 0x80);
+		read_rl = !(read_rl & 0x80);
 	} else {
 		/* for gain */
 		read_ll = read_ll & 0x7f;
-- 
2.29.0

