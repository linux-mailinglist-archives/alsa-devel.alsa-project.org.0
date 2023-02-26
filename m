Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7116A2F7C
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Feb 2023 13:51:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8CB283E;
	Sun, 26 Feb 2023 13:50:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8CB283E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677415882;
	bh=JEDiIUtaX6g3tzXr94u0tVLuH331wW8Kksrsq52VVaw=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sVSIob2VUHOc1SeeCl/2AIpc6ckvesCbhH3IKEDkJk5p/n2jkWn063txnFLNGkA9q
	 ZP7yLWrgwq5fl9D2kkROdI8GzycOLEGlQgQSi2NUaLsKf1imgb8c5FFIpKCLX/gkZX
	 eJq2Yd0w9yVW+mFjIkUSnzp8tMHHRTo1KUBYMttA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6B08F8052E;
	Sun, 26 Feb 2023 13:50:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C024F80527; Sun, 26 Feb 2023 13:50:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75D8EF800DF
	for <alsa-devel@alsa-project.org>; Sun, 26 Feb 2023 13:50:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75D8EF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KJDl+HGr
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B4837B80159;
	Sun, 26 Feb 2023 12:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB669C4339E;
	Sun, 26 Feb 2023 12:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677415816;
	bh=JEDiIUtaX6g3tzXr94u0tVLuH331wW8Kksrsq52VVaw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KJDl+HGre8yXeUx2qaDrDi2wZvNZ2dIYmMUG1rcPYUNvYuSzehbaEh/fOnI5/IWNt
	 qd1XCLGO/mvCyeWMu1+YPB2h/n2SjS7KNu0prq0VQ2EGUQies2if/laQpoMK/VkfKL
	 4als1i4T3HaS4Bea6b8FXV9R2FwynDxiowMh3L6MB3lPDDKvAAvuzCDb3nGvQg2wSj
	 9GGiOKXHVtZs8jFhn9qG5MEyLb16B5OpWUmpd7vSCZBIIqzR/A/rraz2ujnZt2DyfU
	 nVcL9+iBGAPKuELGEKic7vJlBeqQU2b1VqRtpsyU3xHkJwgyI8FGVG9n/xJiCtBtUp
	 XY3gaYU+0A8TQ==
From: Mark Brown <broonie@kernel.org>
Date: Sun, 26 Feb 2023 12:49:57 +0000
Subject: [PATCH 2/2] ASoC: mt8183: Fix event generation for I2S DAI
 operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230224-asoc-mt8183-quick-fixes-v1-2-041f29419ed5@kernel.org>
References: <20230224-asoc-mt8183-quick-fixes-v1-0-041f29419ed5@kernel.org>
In-Reply-To: <20230224-asoc-mt8183-quick-fixes-v1-0-041f29419ed5@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
X-Mailer: b4 0.13-dev-ada30
X-Developer-Signature: v=1; a=openpgp-sha256; l=1295; i=broonie@kernel.org;
 h=from:subject:message-id; bh=JEDiIUtaX6g3tzXr94u0tVLuH331wW8Kksrsq52VVaw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBj+1WAnugavWTX+9Hg/IvfRmt51ua6j+yicn0pEbPH
 asQEgkeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY/tVgAAKCRAk1otyXVSH0CYYB/
 0YSxCulCFXlrJOmzm6bM8diam+8P0CaA2QdRk+4WzbchuF3GPtZYVkpLATCYcFkge0COsUx4/f25Ng
 DEm6IaKvDx3uPBKT6F2o2utQBxHYPzaotQ0l6AzJ/CakQC+7h0FKRcwjK5yEWYGT0Y4LoVeZStSKfu
 rvLgBlDdRsXMEDGzXAhDzzpuU9y22LBshUeP/DQZnhpzYxFtUOlvCA+Xzavgn7FpA9Wxeut5Ztpq3f
 xsAVW6NAEr6b4xUwsgMfUazDH6Hh2dwnDuj9DzhaVKP+QLRrMZeKKBNHRjjCE/RTJRSODi+FkaI/nE
 4tr+kl9q1aYhrH7pGqFNzIEqt7tVnq
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: 3NU7B44NBXSF6EEVNZFKQQG5A6RXAWAU
X-Message-ID-Hash: 3NU7B44NBXSF6EEVNZFKQQG5A6RXAWAU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3NU7B44NBXSF6EEVNZFKQQG5A6RXAWAU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA control put() operations should return 0 if the value changed so that
events can be generated appropriately for userspace but the custom control
in the MT8183 I2S DAI driver doesn't do that, fix it.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/mediatek/mt8183/mt8183-dai-i2s.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c b/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
index 38f7fa38ee95..8645ab686970 100644
--- a/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
+++ b/sound/soc/mediatek/mt8183/mt8183-dai-i2s.c
@@ -141,7 +141,7 @@ static int mt8183_i2s_hd_set(struct snd_kcontrol *kcontrol,
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mtk_afe_i2s_priv *i2s_priv;
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
-	int hd_en;
+	int hd_en, change;
 
 	if (ucontrol->value.enumerated.item[0] >= e->items)
 		return -EINVAL;
@@ -155,9 +155,10 @@ static int mt8183_i2s_hd_set(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 	}
 
+	change = i2s_priv->low_jitter_en != hd_en;
 	i2s_priv->low_jitter_en = hd_en;
 
-	return 0;
+	return change;
 }
 
 static const struct snd_kcontrol_new mtk_dai_i2s_controls[] = {

-- 
2.30.2

