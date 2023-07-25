Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D34761CEB
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 17:08:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E8813E7;
	Tue, 25 Jul 2023 17:07:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E8813E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690297691;
	bh=sUGaRQn5xNJpl3dZktBMpO6/PA+14CYJb7CJBGNJ1uM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V09WnruKxsyyZ7exDXP1Biex3f5bp2wVI8x2ZoVPpFieZpup5OpQLKWsqPckbMDKq
	 yobrRb95uPNgYynfO9jiwwBcmBcAu/cmpn3jfPkf78joXaZPKwROXkLQfHsjtaDBzv
	 19Bl5Ucp3g7xMoZqh+6+nF1pQfjxYh8yVgU+1wi0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C16B3F80535; Tue, 25 Jul 2023 17:07:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5272DF80163;
	Tue, 25 Jul 2023 17:07:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82BDFF8019B; Tue, 25 Jul 2023 17:07:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8FF7AF80153
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 17:07:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FF7AF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=jfFSsQiN
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-51d95aed33aso8051877a12.3
        for <alsa-devel@alsa-project.org>;
 Tue, 25 Jul 2023 08:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690297625; x=1690902425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZUa3uDyejgNax81C3rf+wIL3cUgqBQKB2P7I+aBclw=;
        b=jfFSsQiNnzJ+lyJWWV6a2xy21nmU2zy74dzTnquz3sf8lMDZiZ9HEOqsbPVSh5k8S6
         l4KQGoPMa9r1DogsMfb9a1iS56IqXEy9PMUfxQniUC01fWf+WLtOrqnG87kPM49VRvid
         JP3aRRXncxD8r5ERwGf1Hu0Rh8va5Ut7MqBjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690297625; x=1690902425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZUa3uDyejgNax81C3rf+wIL3cUgqBQKB2P7I+aBclw=;
        b=blKlYcWRHgaEFWXq2EwgWIMaJbdB+sj9pdD4XZANtnmtSz4F9B5a6Djdo1m755AzA2
         xNWzfvDENxcBWIt75X8PqeUuv5hqkjkgNpE9WL2G+qyt1jKEfZZSuvFJY3ylE05M7fE9
         daV9GsRMjBMGN5SpsnrOnO0t94u5svuzkS3L5Otb3m7fjSbxrK808EvGB7yQYrsIz65H
         StSRKeRxVyCENuyU9Y8/VJj0QiPBp0b2/QHww5bNlw+l4ptAvc4qr7Q+WIPYZXtxnOWU
         Z/PlFosp3ExgxfFoEMNxT6hF4dMCWWdvLzdojvhIC/DSOWPiaorTLqfGZqgyJedcBQnr
         lqiw==
X-Gm-Message-State: ABy/qLZEhaPQfEYlplJqR1PKZ/qUJ1FCGOtQhpDRelLVfKLTV7tMSEoG
	aKVHKLaMlu6cTkPGtsRmc728IVlBdBaSByBuL/LBunS1
X-Google-Smtp-Source: 
 APBJJlGM2G2snT4pFo9ivxcSFvIrdNWiYqqpvDBY6lgN4ckJGR/sXtTgOTrflgbiDT+Kjm+mr+g/Vw==
X-Received: by 2002:a17:906:7485:b0:989:21e4:6c6e with SMTP id
 e5-20020a170906748500b0098921e46c6emr12920909ejl.53.1690297625003;
        Tue, 25 Jul 2023 08:07:05 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com.
 [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id
 m6-20020a17090607c600b0099293cdbc98sm8418725ejc.145.2023.07.25.08.07.04
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 08:07:04 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-51e24210395so13757a12.0
        for <alsa-devel@alsa-project.org>;
 Tue, 25 Jul 2023 08:07:04 -0700 (PDT)
X-Received: by 2002:a50:d55c:0:b0:51e:16c5:2004 with SMTP id
 f28-20020a50d55c000000b0051e16c52004mr113153edj.6.1690297603084; Tue, 25 Jul
 2023 08:06:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230627-topic-more_bindings-v1-0-6b4b6cd081e5@linaro.org>
 <20230627-topic-more_bindings-v1-1-6b4b6cd081e5@linaro.org>
In-Reply-To: <20230627-topic-more_bindings-v1-1-6b4b6cd081e5@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 25 Jul 2023 08:06:25 -0700
X-Gmail-Original-Message-ID: 
 <CAD=FV=WsWyTWk8W23PEgw7vXWpLDCih1kGZHkqYCNHLFOPrkGw@mail.gmail.com>
Message-ID: 
 <CAD=FV=WsWyTWk8W23PEgw7vXWpLDCih1kGZHkqYCNHLFOPrkGw@mail.gmail.com>
Subject: Re: [PATCH 01/11] arm64: dts: qcom: sc7180: Fix DSI0_PHY reg-names
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Benjamin Li <benl@squareup.com>,
	James Willcox <jwillcox@squareup.com>, Joseph Gates <jgates@squareup.com>,
	Stephan Gerhold <stephan@gerhold.net>, Zac Crosby <zac@squareup.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
	Jun Nie <jun.nie@linaro.org>, Max Chen <mchen@squareup.com>,
	Shawn Guo <shawn.guo@linaro.org>, Vivek Gautam <vivek.gautam@codeaurora.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vincent Knecht <vincent.knecht@mailoo.org>,
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>, alsa-devel@alsa-project.org,
 iommu@lists.linux.dev,
	linux-usb@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Leo Yan <leo.yan@linaro.org>,
	Rob Herring <robh@kernel.org>, Andy Gross <andy.gross@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: CY65V37GG4BKAS3H4JGZ63HMSZAOYUX4
X-Message-ID-Hash: CY65V37GG4BKAS3H4JGZ63HMSZAOYUX4
X-MailFrom: dianders@chromium.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CY65V37GG4BKAS3H4JGZ63HMSZAOYUX4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Tue, Jun 27, 2023 at 9:24=E2=80=AFAM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
> Commit 2b616f86d51b ("arm64: dts: qcom: sc7180: rename labels for DSI
> nodes") broke reg-names, possibly with search-and-replace. Fix it.
>
> Fixes: 2b616f86d51b ("arm64: dts: qcom: sc7180: rename labels for DSI nod=
es")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/q=
com/sc7180.dtsi
> index 34eff97f8630..b9640574e73b 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -3120,8 +3120,8 @@ mdss_dsi0_phy: phy@ae94400 {
>                                 reg =3D <0 0x0ae94400 0 0x200>,
>                                       <0 0x0ae94600 0 0x280>,
>                                       <0 0x0ae94a00 0 0x1e0>;
> -                               reg-names =3D "dsi0_phy",
> -                                           "dsi0_phy_lane",
> +                               reg-names =3D "dsi_phy",
> +                                           "dsi_phy_lane",

I noticed that this patch got applied [1], but I think it got put into
a branch targeting 6.6 instead of 6.5. Specifically I see it in
"arm64-for-6.6" but not "arm64-fixes-for-6.5". Any chance it could be
landed in a "Fixes" tree and get sent out sooner rather than later?
v6.5 will be pretty broken without it and it would be nice to see it
in Linus's tree sooner rather than later.

[1] https://lore.kernel.org/r/168896565982.1376307.13166434967387866925.b4-=
ty@kernel.org

Thanks!

-Doug
