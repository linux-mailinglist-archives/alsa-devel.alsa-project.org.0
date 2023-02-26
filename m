Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E62B6A2F7B
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Feb 2023 13:51:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F7EF86F;
	Sun, 26 Feb 2023 13:50:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F7EF86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677415872;
	bh=CRp8GhZU+qN7HRXYjIwtnt541hE7kwal9bWY145FMw8=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eYyDIiYmI39IxSEduv8sOpTp08UGmkbvzipflpF6MvgpjKUrvwfdzVSbmYIot5zfF
	 k9iYqwC33Io62xIdT9HiAms35dseJ+CvNvpkEkEqAjJzIlXI4nX1yzQWyeGjnj6/6s
	 VaDrs4sT2iYyfV+36iBF9RrC8QVV+m3IqBFz4Qes=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D181F80520;
	Sun, 26 Feb 2023 13:50:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C177F8049C; Sun, 26 Feb 2023 13:50:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8D72F800DF
	for <alsa-devel@alsa-project.org>; Sun, 26 Feb 2023 13:50:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8D72F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lWYIoGWV
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DCEC160C1B;
	Sun, 26 Feb 2023 12:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 938BAC4339C;
	Sun, 26 Feb 2023 12:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677415814;
	bh=CRp8GhZU+qN7HRXYjIwtnt541hE7kwal9bWY145FMw8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lWYIoGWVDxH+6USa5/bfTvaC1qRD4dafIFrFw6eOoO8rAmaQ5Gs6PI2THoXiMKqTl
	 6p2uPsvNjfvTWZsDS7bNNHiX2C2EXyHWyVdzhScsfaUvOSHQruEtH1PpMwW5xjrKew
	 PsAzqwr39cjVD5u0AGYE4R988atKERwyFccz/VhLGp0cTBP4ucoVxirfwReI5BFTrO
	 mek0kBnMJpgL7Saf/pY2RgJA3lIvQyOYGIU1ZeYcUxA8SK8+/GiC6xD8rnjTkoIHul
	 7XkkZ/qnX0LXYVph+X0coglMVASXBxgq3o1aujPLbuzwhBsor7de6ucq3Jnv/IA4SI
	 R9ZgKw3Nv4uqQ==
From: Mark Brown <broonie@kernel.org>
Date: Sun, 26 Feb 2023 12:49:56 +0000
Subject: [PATCH 1/2] ASoC: mt8183: Remove spammy logging from I2S DAI
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230224-asoc-mt8183-quick-fixes-v1-1-041f29419ed5@kernel.org>
References: <20230224-asoc-mt8183-quick-fixes-v1-0-041f29419ed5@kernel.org>
In-Reply-To: <20230224-asoc-mt8183-quick-fixes-v1-0-041f29419ed5@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
X-Mailer: b4 0.13-dev-ada30
X-Developer-Signature: v=1; a=openpgp-sha256; l=2207; i=broonie@kernel.org;
 h=from:subject:message-id; bh=CRp8GhZU+qN7HRXYjIwtnt541hE7kwal9bWY145FMw8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBj+1V/5RImjDJMcZfKi1j7muuEZi+2C+oXbbNVerB3
 0ZhEk+qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY/tVfwAKCRAk1otyXVSH0OCPB/
 4g20IqYn32wt3p14KSSEUa5B9865bw3M89JBtDJEGfRlX4d2TFqAWR5+OcKyejvPYuSOOPqByf/mbA
 jkNob2/JuWayTDNZgy/kPtUagVyH3Q1LCDxqpeapZ8Wsb1mN0qDYKziKN/9KW5J6De1FXXs3ccqpf6
 MJ24rpgiT/FSNtKoFJx6DSdS/dHSH6diNbq6k4M7GPp2a1cLk0pySm6LS0Q5K+GsKTELcMnii0A7ym
 aUqcjqaAKkfmM8HMpk2gIXR5Qd79+Bvbcf+KU1pqcJorGtQpLqjrtvD7Snfr4sJ7YIKzFN80eRQDaO
 8SSYx15jEK09yTybkOzw4h/fkcHem6
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: HPWDRPJQQTAIHPZZCQFJTJYIXM4FC467
X-Message-ID-Hash: HPWDRPJQQTAIHPZZCQFJTJYIXM4FC467
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HPWDRPJQQTAIHPZZCQFJTJYIXM4FC467/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is a lot of dev_info() logging in normal operation in the I2S DAI
driver, remove it to avoid spamming the console.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/mediatek/mt8183/mt8183-dai-i2s.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c b/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
index 6a9ace4180d3..38f7fa38ee95 100644
--- a/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
+++ b/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
@@ -148,9 +148,6 @@ static int mt8183_i2s_hd_set(struct snd_kcontrol *kcontrol,
 
 	hd_en = ucontrol->value.integer.value[0];
 
-	dev_info(afe->dev, "%s(), kcontrol name %s, hd_en %d\n",
-		 __func__, kcontrol->id.name, hd_en);
-
 	i2s_priv = get_i2s_priv_by_name(afe, kcontrol->id.name);
 
 	if (!i2s_priv) {
@@ -276,9 +273,6 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 
-	dev_info(cmpnt->dev, "%s(), name %s, event 0x%x\n",
-		 __func__, w->name, event);
-
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		if (strcmp(w->name, APLL1_W_NAME) == 0)
@@ -307,9 +301,6 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mtk_afe_i2s_priv *i2s_priv;
 
-	dev_info(cmpnt->dev, "%s(), name %s, event 0x%x\n",
-		 __func__, w->name, event);
-
 	i2s_priv = get_i2s_priv_by_name(afe, w->name);
 
 	if (!i2s_priv) {
@@ -715,11 +706,6 @@ static int mtk_dai_i2s_config(struct mtk_base_afe *afe,
 	unsigned int i2s_con = 0, fmt_con = I2S_FMT_I2S << I2S_FMT_SFT;
 	int ret = 0;
 
-	dev_info(afe->dev, "%s(), id %d, rate %d, format %d\n",
-		 __func__,
-		 i2s_id,
-		 rate, format);
-
 	if (i2s_priv) {
 		i2s_priv->rate = rate;
 
@@ -810,8 +796,6 @@ static int mtk_dai_i2s_set_sysclk(struct snd_soc_dai *dai,
 		return -EINVAL;
 	}
 
-	dev_info(afe->dev, "%s(), freq %d\n", __func__, freq);
-
 	apll = mt8183_get_apll_by_rate(afe, freq);
 	apll_rate = mt8183_get_apll_rate(afe, apll);
 

-- 
2.30.2

