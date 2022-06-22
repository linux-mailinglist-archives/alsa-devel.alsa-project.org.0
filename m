Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A54B6554297
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 08:19:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 389201F6D;
	Wed, 22 Jun 2022 08:18:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 389201F6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655878775;
	bh=xPySHrAeHUQrlpxCBjMK191/KLWyiGMeccywaVGF1i8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XSb/dBR5THKBrVjIzKuQmKZ6X9E1oDq5wwXzxOJhCttdxCsUnP5u+dxiS208dLNfl
	 CBp3qeFPX1AGhk3JbbQxClaupp77geORffcRHK1+9Yr6f32Fkc17CmSnOOp+D3LJj9
	 SO7rH64IDTS9o5s3VZFu0c3SMJjs2CuZcHFaLpXE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12DF5F804AB;
	Wed, 22 Jun 2022 08:18:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA082F80482; Wed, 22 Jun 2022 08:18:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76D1EF8032D
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 08:18:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76D1EF8032D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qHQLTuz+"
Received: by mail-ed1-x52e.google.com with SMTP id e2so11467975edv.3
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 23:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Exzm/TXSqD/Huvr9EUdQ5bsQgg0FbL+KozVE0rZYqD4=;
 b=qHQLTuz+Hgm1AtobLz/J6k/+zw6PveTJjpiZGYiyr9Q4LXqwdCH/Z3iNOnVExvRHuS
 xfwh6As67tnPwKJ1GQhbPDCe4WFletfstvuemoc3gqz9ODfu35fmeOBo288nmSfu+e23
 WJHRw8yNGl2UrjQ2s0V6wOkvdSnLKGMqmJ/delTBuFsRYASRTC91MjLTAXmZ8MQWo0Hu
 +CuAbzHl7IrDaNNs+QanH6V0RQA7o+WXdoMgsVD5dVR+CLnjY990wT6uuO/J+SsjJUjW
 /QmqrIGdY6iQoy3C6opnhwh5jSzUIj+Ekc12s0go0icKPg9FpZjHoAUD+k9imenW2hyP
 mL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Exzm/TXSqD/Huvr9EUdQ5bsQgg0FbL+KozVE0rZYqD4=;
 b=GSDpRpBXD3yyXGHYTuDB/9fNlxvZZ6XE7AByY3+bEjzOw/BvLHC6vay3VY74JK6F7y
 yrYk/QvQ72F3U83GMtnumE/O4K9eWBP4jyqE/aZbRiX9MXLoL7KN0xrUHStngfo+sX7A
 VLvyvExVBe7wf7mi4YY4nJwx+PEYEKh5klJXfJgEfDdfGtHoEvaaqiCQisbO5cjgh2VF
 sf4lGSGEys6pP1BeWbJdhVBx4+JVf7nnUpJApAObYVH9lYF1QHBwQpon0Hl1uOz5pFbc
 Dr1cTbpNBhh31Zehp2pqKhemCnm0e+OZgmVRDYoNauudbL1fAaMJLVcpQyqx38XY7HTC
 YQ8A==
X-Gm-Message-State: AJIora8EErHdw4YrrBeiDMuhznz5Zgf+knNZUbHrCGy3hWkKDw7Vh/pk
 pM1sVI2xc7yBrXyyUnIySU89Os9oEuK2j7jf
X-Google-Smtp-Source: AGRyM1vMxIQS7+qafURtjJ3iealGus6Mn+sXlXnmUGfOw9hfIOoMLNCdsAYlRN3FBWTR5pbMjflLsg==
X-Received: by 2002:a05:6402:4390:b0:42e:b7e:e9ac with SMTP id
 o16-20020a056402439000b0042e0b7ee9acmr2215633edc.97.1655878693636; 
 Tue, 21 Jun 2022 23:18:13 -0700 (PDT)
Received: from localhost.localdomain ([185.107.95.225])
 by smtp.gmail.com with ESMTPSA id
 x16-20020aa7cd90000000b0042fb3badd48sm14040764edv.9.2022.06.21.23.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 23:18:13 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: wcd9335: Use int array instead of bitmask for TX mixers
Date: Wed, 22 Jun 2022 10:17:45 +0400
Message-Id: <20220622061745.35399-1-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Yassine Oudjana <yassine.oudjana@gmail.com>, linux-kernel@vger.kernel.org
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Currently slim_tx_mixer_get reports all TX mixers as enabled when
at least one is, due to it reading the entire tx_port_value bitmask
without testing the specific bit corresponding to a TX port.
Furthermore, using the same bitmask for all capture DAIs makes
setting one mixer affect them all. To prevent this, and since
the SLIM TX muxes effectively only connect to one of the mixers
at a time, turn tx_port_value into an int array storing the DAI
index each of the ports is connected to.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 sound/soc/codecs/wcd9335.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 7d40a61b03b0..a4d92f7aef9e 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -342,7 +342,7 @@ struct wcd9335_codec {
 	struct regulator_bulk_data supplies[WCD9335_MAX_SUPPLY];
 
 	unsigned int rx_port_value[WCD9335_RX_MAX];
-	unsigned int tx_port_value;
+	unsigned int tx_port_value[WCD9335_TX_MAX];
 	int hph_l_gain;
 	int hph_r_gain;
 	u32 rx_bias_count;
@@ -1334,8 +1334,13 @@ static int slim_tx_mixer_get(struct snd_kcontrol *kc,
 
 	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kc);
 	struct wcd9335_codec *wcd = dev_get_drvdata(dapm->dev);
+	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kc);
+	struct soc_mixer_control *mixer =
+			(struct soc_mixer_control *)kc->private_value;
+	int dai_id = widget->shift;
+	int port_id = mixer->shift;
 
-	ucontrol->value.integer.value[0] = wcd->tx_port_value;
+	ucontrol->value.integer.value[0] = wcd->tx_port_value[port_id] == dai_id;
 
 	return 0;
 }
@@ -1358,12 +1363,12 @@ static int slim_tx_mixer_put(struct snd_kcontrol *kc,
 	case AIF2_CAP:
 	case AIF3_CAP:
 		/* only add to the list if value not set */
-		if (enable && !(wcd->tx_port_value & BIT(port_id))) {
-			wcd->tx_port_value |= BIT(port_id);
+		if (enable && wcd->tx_port_value[port_id] != dai_id) {
+			wcd->tx_port_value[port_id] = dai_id;
 			list_add_tail(&wcd->tx_chs[port_id].list,
 					&wcd->dai[dai_id].slim_ch_list);
-		} else if (!enable && (wcd->tx_port_value & BIT(port_id))) {
-			wcd->tx_port_value &= ~BIT(port_id);
+		} else if (!enable && wcd->tx_port_value[port_id] == dai_id) {
+			wcd->tx_port_value[port_id] = -1;
 			list_del_init(&wcd->tx_chs[port_id].list);
 		}
 		break;
-- 
2.36.1

