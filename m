Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 797138C67EB
	for <lists+alsa-devel@lfdr.de>; Wed, 15 May 2024 15:56:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA4F4EF2;
	Wed, 15 May 2024 15:56:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA4F4EF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715781408;
	bh=flOK/mIX2ug/W1AOqc8WLSXvihx1G+ShXPADnB+aoSo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WAHgXrAbJEdBm9bGzhRO0EWDrfaEHWGMD7Oy4D72JTF9ZhOZaEpvL8GpgYchmo0Q3
	 FYyc/48B6o6vrUQ9kh1nKWATthOvOWscQ4jSEmg9qjQwJLvz/YuS5aBj93Wl3Ujh9Z
	 4dof0GCdlQJQwn0p1KycAX+1k/IgCidQw01EhnfY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB77AF8068A; Wed, 15 May 2024 15:54:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CC40F8068E;
	Wed, 15 May 2024 15:54:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06550F805D4; Wed, 15 May 2024 15:54:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 134E8F800E9
	for <alsa-devel@alsa-project.org>; Wed, 15 May 2024 15:54:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 134E8F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=fJkFTw5B
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id F3F189C590C;
	Wed, 15 May 2024 09:54:32 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 2UiyIvBMNgrA; Wed, 15 May 2024 09:54:32 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 5F45D9C590B;
	Wed, 15 May 2024 09:54:32 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 5F45D9C590B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1715781272; bh=Xtwy2ynslADVxZSdln7Ic8Ltb0fWhr99ZizRjpr0t/o=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=fJkFTw5Br7OXuzDrYCSOg0K/DinSW+fNOG8bT3aOggtbxcfxYDdPU/gfZgCQ1L10N
	 FQaWo5frDouTl4YKYATDmgI+DnWJHqpwdWjVbOpN4v2eH2DfmUxSYZHV48LdEI+BaX
	 aGXhNNJTWjhUkbWdGV7VWkSbw60CgVo63ugrWWSeg+8xFSoQFmUa56JX1a+pZQN76F
	 q8zbEWydlvWisFxpYQPiQpQZBV0UVgyZ8/EaEGkbGq0FwT4GsWduIrNNV7JHV6qQnY
	 HEkhHt0bzLy5ohJIpz5uWR3CQ/FVsZGXWvQMyB1c9jDwSJ+9EYwxTvKR+Vlg1+Ujsf
	 j5eRmaBJB/ucQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id jZ1o3eTYvlGQ; Wed, 15 May 2024 09:54:32 -0400 (EDT)
Received: from gerard.rennes.sfl
 (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 633169C58F8;
	Wed, 15 May 2024 09:54:30 -0400 (EDT)
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
Subject: [PATCHv4 6/9] ASoC: fsl-asoc-card: add use of devicetree TDM slot
 properties
Date: Wed, 15 May 2024 15:54:08 +0200
Message-Id: <20240515135411.343333-7-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: YOH6EX6RELPCTPHH4VMPJFRWLLVKPTZ4
X-Message-ID-Hash: YOH6EX6RELPCTPHH4VMPJFRWLLVKPTZ4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YOH6EX6RELPCTPHH4VMPJFRWLLVKPTZ4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add use of optional TDM slot properties "dai-tdm-slot-num" and
"dai-tdm-slot-width" through snd_soc_of_parse_tdm_slot().
They allow setting a custom TDM slot width in bits and number of slots
for the CPU DAI when using the generic codec.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 82ed7f4e81a1..9aca8ad15372 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -751,6 +751,9 @@ static int fsl_asoc_card_probe(struct platform_device *=
pdev)
 		priv->dai_link[0].num_codecs =3D 2;
 		priv->dai_link[2].num_codecs =3D 2;
 		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBP_CFP;
+		snd_soc_of_parse_tdm_slot(np, NULL, NULL,
+						&priv->cpu_priv.slot_num,
+						&priv->cpu_priv.slot_width);
 	} else {
 		dev_err(&pdev->dev, "unknown Device Tree compatible\n");
 		ret =3D -EINVAL;
--=20
2.34.1

