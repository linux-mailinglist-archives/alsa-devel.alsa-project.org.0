Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 487F28C67EE
	for <lists+alsa-devel@lfdr.de>; Wed, 15 May 2024 15:57:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7ED183E8;
	Wed, 15 May 2024 15:56:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7ED183E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715781427;
	bh=bhWRrMUlx2a8en7Ipe0p+UfOzImcfrvx71Td5O1XZsc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tfNa544tJgc91PEm68LrILmhP8JiJi2mtU0/0xdEHdro2z0FKRmJ++kceyNs9vhuw
	 7kHReX03sIYjjgvmiycY6cP364kK5gbBpQXp2FykyuUUiLCjkmaEX90S4UjYyrQAN8
	 heqM5WLth92DILGlHiNrzVV1S4BK0hLVKI95/xBg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0268CF806BE; Wed, 15 May 2024 15:55:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D14D2F806BB;
	Wed, 15 May 2024 15:54:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B2B7F805C6; Wed, 15 May 2024 15:54:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4AE21F801F5
	for <alsa-devel@alsa-project.org>; Wed, 15 May 2024 15:54:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AE21F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=vMUehRHq
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 11B5E9C58F8;
	Wed, 15 May 2024 09:54:35 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id m0WPzNXEVoGy; Wed, 15 May 2024 09:54:34 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 7355B9C590D;
	Wed, 15 May 2024 09:54:34 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 7355B9C590D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1715781274; bh=nu7o1F7oIEou/u3jOCXnPY2pTDR7854IaHJOM1bAKP4=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=vMUehRHqDDVo2kj6Ju1ueqGjelf7gRGlQjYT41d1N5scjrS/yPZncD7lJpd0rskuZ
	 aKA2TboPx3OhWky3irxzrgBJaVT0AhZ1ayReBG+MTLcdC78rKeXljQkpOsZZOqLLTe
	 5XNdlIn4DM92AuShphnCosh5Fppeeq+KM1l86nYSAnR4q4L+c3hgTlXg29X3yZva9o
	 V7H38tcxbD+bXEUEINMgjRFwJPtmIgjft3RikVE9R3kpNdZ8O2G6daWBOCLp1xN2qx
	 TR0+85Y8BP+vYEKlW2GYvYHs6z5e32G+EQFhDEpmfbAULRrxm++rfkBLbJ9gElic12
	 +gEiYF8UrfjQQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id DnxX3Sr4PIu7; Wed, 15 May 2024 09:54:34 -0400 (EDT)
Received: from gerard.rennes.sfl
 (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 78EC19C58F8;
	Wed, 15 May 2024 09:54:32 -0400 (EDT)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Subject: [PATCHv4 7/9] ASoC: fsl-asoc-card: add DT clock "cpu_sysclk" with
 generic codec
Date: Wed, 15 May 2024 15:54:09 +0200
Message-Id: <20240515135411.343333-8-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: HHDNMI2PQN2277TGC3EP6AZI232KXOOC
X-Message-ID-Hash: HHDNMI2PQN2277TGC3EP6AZI232KXOOC
X-MailFrom: elinor.montmasson@savoirfairelinux.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HHDNMI2PQN2277TGC3EP6AZI232KXOOC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add an optional DT clock "cpu_sysclk" to get the CPU DAI system-clock
frequency when using the generic codec.
It is set for both Tx and Rx.
The way the frequency value is used is up to the CPU DAI driver
implementation.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 9aca8ad15372..c7fc9c16f761 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -754,6 +754,12 @@ static int fsl_asoc_card_probe(struct platform_device =
*pdev)
 		snd_soc_of_parse_tdm_slot(np, NULL, NULL,
 						&priv->cpu_priv.slot_num,
 						&priv->cpu_priv.slot_width);
+		struct clk *cpu_sysclk =3D clk_get(&pdev->dev, "cpu_sysclk");
+		if (!IS_ERR(cpu_sysclk)) {
+			priv->cpu_priv.sysclk_freq[TX] =3D clk_get_rate(cpu_sysclk);
+			priv->cpu_priv.sysclk_freq[RX] =3D priv->cpu_priv.sysclk_freq[TX];
+			clk_put(cpu_sysclk);
+		}
 	} else {
 		dev_err(&pdev->dev, "unknown Device Tree compatible\n");
 		ret =3D -EINVAL;
--=20
2.34.1

