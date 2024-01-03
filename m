Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53765823499
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jan 2024 19:36:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCCC6EA1;
	Wed,  3 Jan 2024 19:36:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCCC6EA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704307015;
	bh=ht4f2L9VNRd0Mc59eoD5YHto4h+iXotwSN2zcCeCmUg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Twa6B5+8KhHO9bOM2ESBTrAbT3+QavxOg09xUw5uyNS5Hn8AGwcheZB3yVcYV2ZLY
	 ydyahaD2g3gQxo1gapuTb2r3/4Qz/km2qVJ83E42IaP+dMjY/BoSqoC3A5ucxZULBE
	 PXh5NkR8Zxh+bipG5G9JlqLHhAvyW3qcKTqVLg6c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B07DFF805CA; Wed,  3 Jan 2024 19:36:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 887EAF805EF;
	Wed,  3 Jan 2024 19:36:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3CDEF80551; Wed,  3 Jan 2024 19:34:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07728F80086
	for <alsa-devel@alsa-project.org>; Wed,  3 Jan 2024 19:34:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07728F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gbzXcl7B
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 7B5F0B8149C;
	Wed,  3 Jan 2024 18:34:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B1D6C433C7;
	Wed,  3 Jan 2024 18:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704306866;
	bh=ht4f2L9VNRd0Mc59eoD5YHto4h+iXotwSN2zcCeCmUg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gbzXcl7BbbxtSm8Gi1Qyxsl/niVlUDQwNiiEc5sY9rVMtZrwQt5V+HfUcHTM0wYTG
	 k1x+KtfvTL73UBFGoc7AL2u3mwNEoOfZyLrjEL1QqlK93Rad0S9Rh2WfszzNejvDDl
	 5ne7Eztu0D6MMIbo9CJnVEfXV37s0HjDsHd0tJUoMAcR4x4s/1qzP/1BlmFe9QeRry
	 8xDSYJviEHcCfjvIzT+kWLc065GmGQmtQTRD+Z853G+MljPQdC57+2ihRrqy7O2Y27
	 BLLdtcNI1tQ7/iyjvNm9Bjpi/xVZPPoN1OVXSHPu4MX47rPbyJQSH0Vc+lAHIhz9JC
	 rEkCyZZhEb/jQ==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 03 Jan 2024 18:34:02 +0000
Subject: [PATCH 2/4] ASoC: meson: g12a-tohdmitx: Validate written enum
 values
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240103-meson-enum-val-v1-2-424af7a8fb91@kernel.org>
References: <20240103-meson-enum-val-v1-0-424af7a8fb91@kernel.org>
In-Reply-To: <20240103-meson-enum-val-v1-0-424af7a8fb91@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1548; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ht4f2L9VNRd0Mc59eoD5YHto4h+iXotwSN2zcCeCmUg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBllaimMWacGtC/oM+FCVutaQUzoegKMoiH8Pk8W
 Wbk4bW3T96JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZZWopgAKCRAk1otyXVSH
 0DSyB/9+01n+37YTh84CduFEZq2Oj/ZWKuKbVubO9Xv9hSbfjLZ6hv+BbHfmTJbr5Hna2XehzGw
 kfhV5m5JcRciYD7N8OTUgKgV36fi+AdE9buDprljnRf7DsyHosNHxmxVRXwZtwMToJmj/V2DV5z
 bmCkAUJD7HZ/r7KOYAWncYQk6YEjFBGAO37eagiVkwBEpcsD4QKdnkcfPUEU7rjXL7JcLJKRMsi
 VGDdgmOlqjnHOJzJkkzupjsFvYhWjZPWXjR3NOxFDwQ5MGLIWmnNy++naYdz687laZc20LzB7EL
 KRlifhoDqlOaXFnwTsGK5ULqE59CrKOJM8v4OQe3GaSuqost
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: N6CVNG7NHQJCEYMVOOQXXFXQIHEFHNSO
X-Message-ID-Hash: N6CVNG7NHQJCEYMVOOQXXFXQIHEFHNSO
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N6CVNG7NHQJCEYMVOOQXXFXQIHEFHNSO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When writing to an enum we need to verify that the value written is valid
for the enumeration, the helper function snd_soc_item_enum_to_val() doesn't
do it since it needs to return an unsigned (and in any case we'd need to
check the return value).

Fixes: c8609f3870f7 ("ASoC: meson: add g12a tohdmitx control")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/g12a-tohdmitx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/meson/g12a-tohdmitx.c b/sound/soc/meson/g12a-tohdmitx.c
index f7ef9aa1eed8..51b7703e1834 100644
--- a/sound/soc/meson/g12a-tohdmitx.c
+++ b/sound/soc/meson/g12a-tohdmitx.c
@@ -45,6 +45,9 @@ static int g12a_tohdmitx_i2s_mux_put_enum(struct snd_kcontrol *kcontrol,
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int mux, changed;
 
+	if (ucontrol->value.enumerated.item[0] >= e->items)
+		return -EINVAL;
+
 	mux = snd_soc_enum_item_to_val(e, ucontrol->value.enumerated.item[0]);
 	changed = snd_soc_component_test_bits(component, e->reg,
 					      CTRL0_I2S_DAT_SEL,
@@ -93,6 +96,9 @@ static int g12a_tohdmitx_spdif_mux_put_enum(struct snd_kcontrol *kcontrol,
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int mux, changed;
 
+	if (ucontrol->value.enumerated.item[0] >= e->items)
+		return -EINVAL;
+
 	mux = snd_soc_enum_item_to_val(e, ucontrol->value.enumerated.item[0]);
 	changed = snd_soc_component_test_bits(component, TOHDMITX_CTRL0,
 					      CTRL0_SPDIF_SEL,

-- 
2.39.2

