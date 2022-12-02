Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3778640BE0
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 18:15:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 698601883;
	Fri,  2 Dec 2022 18:15:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 698601883
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670001358;
	bh=owBJu+c7m5WHDZ7/hPIYK22caM4bWqN3gzO0AJizA3M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ds6hmhcepv9tZ1Tx4pvZn+VfHIMNRk23IbyFAEdv2gnEp2d42nJfXQ2+fndlgrgfv
	 ryLdFAaQMDOCp+ErDFi65kE4lM5VcWDaLAAo8m4aBbbdz+LydE8l0RHkiOK8A8XSVD
	 S0DgGSwuO9l+NU9vZCYOKXT+7WuDQMrO/j4mv2Gw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0FF3F80162;
	Fri,  2 Dec 2022 18:15:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0BA9F80310; Fri,  2 Dec 2022 18:15:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6376F80162
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 18:14:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6376F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="REs7QLBq"
Received: by mail-wr1-x430.google.com with SMTP id y16so8798765wrm.2
 for <alsa-devel@alsa-project.org>; Fri, 02 Dec 2022 09:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B8v9XTf3vXMWdEj7JPZSNyX2wl94/lt81sDZmVmnAZk=;
 b=REs7QLBqW5J5VrEbzEthHZE1wfZSrK3cW5zRoKBqN3bvl3pN/pCfDR+um1uJkzTC/4
 JP9Dm4H+19RXZnkU+om7Nn9lCfBSX27Iae2tITdSutf8C/usQe5SB7bN+p5H5mZePrz6
 xndHgU5Igr91sHK3NScswZ91dHpRQWOKaTVtWu0aVehvkf3z0jVrCHSTPeoDmyD1mXOg
 s5/jy3ze5ZJtuLi2dMj61QW6WtkG+PjeOLTtMjLv/dplZiuw7apog/3pgaruv+HnkuB5
 rJJJN7yYn/kiuaZsCf45/24G4dGrrZJpFF0sGgAGNUunAwBd4ZAEIwHyGUnNveDJTBoy
 k4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B8v9XTf3vXMWdEj7JPZSNyX2wl94/lt81sDZmVmnAZk=;
 b=iqXb9LUrCwX6PVHBLLLQvE3ktNZhYeaBxNcP8IFgjg0tZ/yPYk/WNzRzNrU3oSwezo
 jAF/6zOsPBC7vgbZCd6T/tJi5XqFjyNIdnwmjWvXTD/cywHPEtltM8I2ERt/d75p3RRs
 SrTQpMigRQ8EWFen56BOqtDkP/nITdpQ7JKyPM6shbOCpw9WTwdXwf3yzpSAjUe6QfrD
 jctYfiWaLx/YhaynbG5p4DxtO51CzEi7mjAJeYc9ipjtjbAc4QRXlAZFaSDSDEIV8ipl
 oLvEu3Tpa17LJRGnJGnGIYuoWLyBaYvcKKECvK+aE2NTMxUZTAkFOh+krT+CLWTOBd+S
 x3Zw==
X-Gm-Message-State: ANoB5pnXX5SkDJiZNAnR6GE6JoKXbPhzDrt7RgXu8am/rs+o96TSSfhy
 jgMs/pvPsInnPCQ/JggCvi8=
X-Google-Smtp-Source: AA0mqf7V00hqex6XhkoCKa3wTyxa3SNkDDr8CfdyWdN/p7w47wrcrprI66nTe6Gqv77wmWQs7pXSBA==
X-Received: by 2002:adf:f54d:0:b0:242:9e6:ea4d with SMTP id
 j13-20020adff54d000000b0024209e6ea4dmr20929160wrp.251.1670001292663; 
 Fri, 02 Dec 2022 09:14:52 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 k12-20020adfe8cc000000b00241b5af8697sm7651532wrn.85.2022.12.02.09.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Dec 2022 09:14:51 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Subject: [PATCH][next] ASoC: rt715: Make read-only arrays capture_reg_H and
 capture_reg_L static const
Date: Fri,  2 Dec 2022 17:14:50 +0000
Message-Id: <20221202171450.1815346-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

Don't populate the read-only arrays capture_reg_H and capture_reg_L
on the stack but instead make them static const. Also makes the
object code a little smaller.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/codecs/rt715.c | 48 ++++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c
index 917a04092da2..1a2036ccfbac 100644
--- a/sound/soc/codecs/rt715.c
+++ b/sound/soc/codecs/rt715.c
@@ -204,12 +204,12 @@ static int rt715_set_main_switch_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dapm_context *dapm =
 		snd_soc_component_get_dapm(component);
 	struct rt715_priv *rt715 = snd_soc_component_get_drvdata(component);
-	unsigned int capture_reg_H[] = {RT715_SET_GAIN_MIC_ADC_H,
-		RT715_SET_GAIN_LINE_ADC_H, RT715_SET_GAIN_MIX_ADC_H,
-		RT715_SET_GAIN_MIX_ADC2_H};
-	unsigned int capture_reg_L[] = {RT715_SET_GAIN_MIC_ADC_L,
-		RT715_SET_GAIN_LINE_ADC_L, RT715_SET_GAIN_MIX_ADC_L,
-		RT715_SET_GAIN_MIX_ADC2_L};
+	static const unsigned int capture_reg_H[] = {
+		RT715_SET_GAIN_MIC_ADC_H, RT715_SET_GAIN_LINE_ADC_H,
+		RT715_SET_GAIN_MIX_ADC_H, RT715_SET_GAIN_MIX_ADC2_H };
+	static const unsigned int capture_reg_L[] = {
+		RT715_SET_GAIN_MIC_ADC_L, RT715_SET_GAIN_LINE_ADC_L,
+		RT715_SET_GAIN_MIX_ADC_L, RT715_SET_GAIN_MIX_ADC2_L };
 	unsigned int addr_h, addr_l, val_h = 0x0, val_ll, val_lr;
 	unsigned int k_shift = RT715_DIR_IN_SFT, k_changed = 0;
 	unsigned int read_ll, read_rl, i, j, loop_cnt = 4;
@@ -284,12 +284,12 @@ static int rt715_set_main_switch_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rt715_priv *rt715 = snd_soc_component_get_drvdata(component);
-	unsigned int capture_reg_H[] = {RT715_SET_GAIN_MIC_ADC_H,
-		RT715_SET_GAIN_LINE_ADC_H, RT715_SET_GAIN_MIX_ADC_H,
-		RT715_SET_GAIN_MIX_ADC2_H};
-	unsigned int capture_reg_L[] = {RT715_SET_GAIN_MIC_ADC_L,
-		RT715_SET_GAIN_LINE_ADC_L, RT715_SET_GAIN_MIX_ADC_L,
-		RT715_SET_GAIN_MIX_ADC2_L};
+	static const unsigned int capture_reg_H[] = {
+		RT715_SET_GAIN_MIC_ADC_H, RT715_SET_GAIN_LINE_ADC_H,
+		RT715_SET_GAIN_MIX_ADC_H, RT715_SET_GAIN_MIX_ADC2_H };
+	static const unsigned int capture_reg_L[] = {
+		RT715_SET_GAIN_MIC_ADC_L, RT715_SET_GAIN_LINE_ADC_L,
+		RT715_SET_GAIN_MIX_ADC_L, RT715_SET_GAIN_MIX_ADC2_L };
 	unsigned int addr_h, addr_l, val_h = 0x0, i, loop_cnt = 4;
 	unsigned int read_ll, read_rl;
 
@@ -312,12 +312,12 @@ static int rt715_set_main_vol_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dapm_context *dapm =
 		snd_soc_component_get_dapm(component);
 	struct rt715_priv *rt715 = snd_soc_component_get_drvdata(component);
-	unsigned int capture_reg_H[] = {RT715_SET_GAIN_MIC_ADC_H,
-		RT715_SET_GAIN_LINE_ADC_H, RT715_SET_GAIN_MIX_ADC_H,
-		RT715_SET_GAIN_MIX_ADC2_H};
-	unsigned int capture_reg_L[] = {RT715_SET_GAIN_MIC_ADC_L,
-		RT715_SET_GAIN_LINE_ADC_L, RT715_SET_GAIN_MIX_ADC_L,
-		RT715_SET_GAIN_MIX_ADC2_L};
+	static const unsigned int capture_reg_H[] = {
+		RT715_SET_GAIN_MIC_ADC_H, RT715_SET_GAIN_LINE_ADC_H,
+		RT715_SET_GAIN_MIX_ADC_H, RT715_SET_GAIN_MIX_ADC2_H };
+	static const unsigned int capture_reg_L[] = {
+		RT715_SET_GAIN_MIC_ADC_L, RT715_SET_GAIN_LINE_ADC_L,
+		RT715_SET_GAIN_MIX_ADC_L, RT715_SET_GAIN_MIX_ADC2_L};
 	unsigned int addr_h, addr_l, val_h = 0x0, val_ll, val_lr;
 	unsigned int read_ll, read_rl, i, j, loop_cnt = 4, k_changed = 0;
 	unsigned int k_shift = RT715_DIR_IN_SFT, k_max = 0x3f;
@@ -393,12 +393,12 @@ static int rt715_set_main_vol_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rt715_priv *rt715 = snd_soc_component_get_drvdata(component);
-	unsigned int capture_reg_H[] = {RT715_SET_GAIN_MIC_ADC_H,
-		RT715_SET_GAIN_LINE_ADC_H, RT715_SET_GAIN_MIX_ADC_H,
-		RT715_SET_GAIN_MIX_ADC2_H};
-	unsigned int capture_reg_L[] = {RT715_SET_GAIN_MIC_ADC_L,
-		RT715_SET_GAIN_LINE_ADC_L, RT715_SET_GAIN_MIX_ADC_L,
-		RT715_SET_GAIN_MIX_ADC2_L};
+	static const unsigned int capture_reg_H[] = {
+		RT715_SET_GAIN_MIC_ADC_H, RT715_SET_GAIN_LINE_ADC_H,
+		RT715_SET_GAIN_MIX_ADC_H, RT715_SET_GAIN_MIX_ADC2_H };
+	static const unsigned int capture_reg_L[] = {
+		RT715_SET_GAIN_MIC_ADC_L, RT715_SET_GAIN_LINE_ADC_L,
+		RT715_SET_GAIN_MIX_ADC_L, RT715_SET_GAIN_MIX_ADC2_L };
 	unsigned int addr_h, addr_l, val_h = 0x0, i, loop_cnt = 4;
 	unsigned int read_ll, read_rl;
 
-- 
2.38.1

