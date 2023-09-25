Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 925F87ADD5C
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Sep 2023 18:45:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B70F4AE8;
	Mon, 25 Sep 2023 18:44:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B70F4AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695660319;
	bh=OSniNe/SEUwj5JtrJjV3mo40KgZweC+EN5DVdS+32V8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=odN1/12WTHhNpAnUhmofcPRfcV+SOU/IHrFJ8gSq+Koy8dCdzDtuY68YQOjaSNL5f
	 uKoUNXQYn/G84zm5Je+4+5g/6M5DsqpfvZ6+7aIVHhE/6JwxrqPedZwIBYcHBw/ZXK
	 WeG/A0alktJGfKebfJjEYsCQ32jmcdbiTCTyDfcY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3744DF8016A; Mon, 25 Sep 2023 18:44:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C052AF800AE;
	Mon, 25 Sep 2023 18:44:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFEE1F8016A; Mon, 25 Sep 2023 18:44:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 50BA5F800AE
	for <alsa-devel@alsa-project.org>; Mon, 25 Sep 2023 18:44:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50BA5F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Tx2vsX3+
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 62B72B80DE9;
	Mon, 25 Sep 2023 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2D5BC433C8;
	Mon, 25 Sep 2023 16:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695660257;
	bh=OSniNe/SEUwj5JtrJjV3mo40KgZweC+EN5DVdS+32V8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tx2vsX3+bmbaJmQavOlsuRE97YZs+Tfad0mvFjzqoghAnsr99IgCTELCcGsFXK/tF
	 5SE21DNJRy/kCAsDACFgx5S5YPFRSvwdvNRNtSPv0drdZxHy4/z8B+wcJThmOYDwvq
	 4rpGU+KzSew2sBj8H99H3HB+rQc2ivg1u6rthJ5IVb1gXPPkWvjIICH/G3Dax1HDCq
	 7FXAcBWCH/dTXk7+tAUHt4m3Kck/EuSkhoDjFapTm4y+m3KqzuypPEIL84djKjXKyw
	 zd9nVFjM/sJFifaVSxjPYfA2Ttw4b77Lv4H/60eUCIWEk3/s7qu2EmtRUwxTZOqOpa
	 4U7CojDULiHwg==
Received: (nullmailer pid 1490675 invoked by uid 1000);
	Mon, 25 Sep 2023 16:44:15 -0000
Date: Mon, 25 Sep 2023 11:44:15 -0500
From: Rob Herring <robh@kernel.org>
To: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 lgirdwood@gmail.com, broonie@kernel.org, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, perex@perex.cz, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: Re: [v1 1/2] ASoC: dt-bindings: mediatek,mt8188-mt6359: add RT5682S
 support
Message-ID: <169566025430.1490621.9358539140957587506.robh@kernel.org>
References: 
 <20230925083847.1496-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20230925083847.1496-2-xiazhengqiao@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <20230925083847.1496-2-xiazhengqiao@huaqin.corp-partner.google.com>
Message-ID-Hash: OZ5XNDMXY3427M5YIYKALBNQJC4ONSBC
X-Message-ID-Hash: OZ5XNDMXY3427M5YIYKALBNQJC4ONSBC
X-MailFrom: SRS0=JOOG=FJ=robh_at_kernel.org=rob@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OZ5XNDMXY3427M5YIYKALBNQJC4ONSBC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon, 25 Sep 2023 16:38:46 +0800, xiazhengqiao wrote:
> Add compatible string "mediatek,mt8188-rt5682" to support new board
> with rt5682s codec.
> ---
>  .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml        | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

