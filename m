Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA6B823498
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jan 2024 19:36:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6291EEB9;
	Wed,  3 Jan 2024 19:36:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6291EEB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704307002;
	bh=B8zEDu24iYdp1D2IrkF5R6n4WctFQW7jsiGp+pgfOHU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dk3s/TYbywYhWuwyWfIuf7Ha/muvXT9iqPPsy5RIViZ2wfx8SvBhi8bY+0ympvIA4
	 WU1Nrxbd2i6kE5yEcm7vauMaYtbd1RDC4tjSyshEf452aNjS7adi9+mSxJIqfP5rc/
	 6G9Ex2zeUIPEMaFvGXQqKp1zkYuiPBKuYbOpxQCc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77E10F805C3; Wed,  3 Jan 2024 19:36:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3C85F805C6;
	Wed,  3 Jan 2024 19:35:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21CF6F80549; Wed,  3 Jan 2024 19:34:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B61FBF80535
	for <alsa-devel@alsa-project.org>; Wed,  3 Jan 2024 19:34:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B61FBF80535
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ScqQ1wbJ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3EE98CE17CE;
	Wed,  3 Jan 2024 18:34:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F4AC433C9;
	Wed,  3 Jan 2024 18:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704306862;
	bh=B8zEDu24iYdp1D2IrkF5R6n4WctFQW7jsiGp+pgfOHU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ScqQ1wbJ3FvcTR5o42OpxWXCzjmH8WNSCarXDvdJtHKsM2z3W0Meg+6j2KZYv2hm7
	 qAaKXIZWc9I3+xeQidVnuVuUdmjFvmFlh9f/IRVmdK9wcnFnW0ArT1ugku+A7UHYg/
	 Z6RWW87M/tqjkXVmHT6P3O6YHsMElKIIv8/A6yPjZ11VKFQ3MBkpLkr5jTXCkwmDiw
	 mX+B/iy/Vkr2QNaMzBTq3e1gD5e867Wj/OmEz6hsZ0ufvDNxw51t4IF+70S48yOeEW
	 WZHqFKWCp2CRYCdO89AEo4U1SRSzD2Nig4kDQr1SYxDUor7lNrkV6K6k0ySy+v+01J
	 vX9kPK2uDnVPw==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 03 Jan 2024 18:34:01 +0000
Subject: [PATCH 1/4] ASoC: meson: g12a-toacodec: Validate written enum
 values
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240103-meson-enum-val-v1-1-424af7a8fb91@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1061; i=broonie@kernel.org;
 h=from:subject:message-id; bh=B8zEDu24iYdp1D2IrkF5R6n4WctFQW7jsiGp+pgfOHU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBllailRF53dP8BdcNiiucMBNUWe0Bfoinwza+iA
 k98eb/reiGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZZWopQAKCRAk1otyXVSH
 0J+sB/95RlpkPTF9f6yzkpbHjBnF6rgqjyIkO2/GedEUoAPrGm0/781noJTYbc7sQG5WpiIxj9e
 E4B+MYv4ymaHspYZAVcllMJNkQlWoxVjlbYiiqGjmxRUffo6ZgnpFx4HJN4U9tSlE1sqZRQzvve
 V51inkIIr+SN/3fenEt3m+oll5VDH1teYdTpVvOtQtqDg6XGaVjnsuddjVf7ftLTzJUq0jO6Ylt
 xCHAz8NV8eA2+bgm2opWls1lXCerybpxAVwIPme9Pgl5NIs6uQBsb9b4+Jm3U6HDi4yUVLwPMKG
 EaK4IcbPFDe02qyInmnJPfvPRqJUsRbmTh6cfiDHXxNe90Ng
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: I4OUVWHJZYGTNALNYMXUV4AXVHCYUP4U
X-Message-ID-Hash: I4OUVWHJZYGTNALNYMXUV4AXVHCYUP4U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I4OUVWHJZYGTNALNYMXUV4AXVHCYUP4U/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When writing to an enum we need to verify that the value written is valid
for the enumeration, the helper function snd_soc_item_enum_to_val() doesn't
do it since it needs to return an unsigned (and in any case we'd need to
check the return value).

Fixes: af2618a2eee8 ("ASoC: meson: g12a: add internal DAC glue driver")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/g12a-toacodec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
index 6c4503766fdc..dd7f07de2685 100644
--- a/sound/soc/meson/g12a-toacodec.c
+++ b/sound/soc/meson/g12a-toacodec.c
@@ -71,6 +71,9 @@ static int g12a_toacodec_mux_put_enum(struct snd_kcontrol *kcontrol,
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int mux, reg;
 
+	if (ucontrol->value.enumerated.item[0] >= e->items)
+		return -EINVAL;
+
 	mux = snd_soc_enum_item_to_val(e, ucontrol->value.enumerated.item[0]);
 	regmap_field_read(priv->field_dat_sel, &reg);
 

-- 
2.39.2

