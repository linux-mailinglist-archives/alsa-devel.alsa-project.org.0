Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD777A77B7
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Sep 2023 11:37:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 620EEA4E;
	Wed, 20 Sep 2023 11:37:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 620EEA4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695202675;
	bh=QvrfuDunGeVeEzTT0m7V7qM30d5sUcAJp/nuSRoA/Kw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D3Usok5ADc3VvG5p3IJqxRnI62Ts8ZFKJe4395L4ozfAKQ6W0rFs22FwpOO53+J2o
	 4beeuKxg5e4/elGDHTCDKtV1AeTIJrBpOC/odZ/c1nnWXxZo6f/Is7Iseimr1oEvCS
	 /QHsuRT7RaQDOa2uaDrk50EmX1T1oyJPlQnR2Yyo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93CBBF8025A; Wed, 20 Sep 2023 11:36:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE63FF800F4;
	Wed, 20 Sep 2023 11:36:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D106F8047D; Wed, 20 Sep 2023 11:36:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D8032F800F4
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 11:36:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8032F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QdA1dIKg
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 19324CE1AAA;
	Wed, 20 Sep 2023 09:36:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29C12C433C7;
	Wed, 20 Sep 2023 09:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695202604;
	bh=QvrfuDunGeVeEzTT0m7V7qM30d5sUcAJp/nuSRoA/Kw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QdA1dIKg00oVg/Tj4DG0pqitCVasDs/Wfzz1pmVVUrFxCqOFNFq+rrzIkZnS4JT4w
	 abqTNCAEkvI3Fmv0kF4DI3Qvh5Qbk/TZBx2spbFLJ1EANyqTsg4//fkpwtCVed1V+S
	 eWKWmdU98GAMfD8baYyoe7RMo5Q5oPdaIL8fXrI5FXZWeVuTVa4KJC1jvrrWjROGF4
	 3p8qz7ZVv0Ru6+0F7F/3bnxtEGw7avECx9YrNwNEhcVWav0ubrGOJAT0i9boUZTCkG
	 m7ynqHyfLU6eBbPJMIj+S45/BYpZhRhW/ksj8/qq0iHH9IIHsN1DG+imqr2y1WjNTB
	 PLnMvIH0FWn/w==
From: Lee Jones <lee@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Alex Bee <knaerzche@gmail.com>
Cc: Elaine Zhang <zhangqing@rock-chips.com>,
 Johan Jonker <jbx6244@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 alsa-devel@alsa-project.org, linux-clk@vger.kernel.org,
 linux-phy@lists.infradead.org
In-Reply-To: <20230829171647.187787-2-knaerzche@gmail.com>
References: <20230829171647.187787-1-knaerzche@gmail.com>
 <20230829171647.187787-2-knaerzche@gmail.com>
Subject: Re: (subset) [PATCH 01/31] dt-bindings: mfd: syscon: Add
 rockchip,rk3128-qos compatible
Message-Id: <169520259990.3354839.11054139849766032688.b4-ty@kernel.org>
Date: Wed, 20 Sep 2023 10:36:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
Message-ID-Hash: O3CJQ5VQ4RD7YAWPXMMA72Y6Y2QLF45G
X-Message-ID-Hash: O3CJQ5VQ4RD7YAWPXMMA72Y6Y2QLF45G
X-MailFrom: lee@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O3CJQ5VQ4RD7YAWPXMMA72Y6Y2QLF45G/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 29 Aug 2023 19:16:17 +0200, Alex Bee wrote:
> Document Rockchip RK3128 SoC compatible for qos registers.
> 
> 

Applied, thanks!

[01/31] dt-bindings: mfd: syscon: Add rockchip,rk3128-qos compatible
        commit: 4c57b25b09932acf81ead78bd32019fc5d0ea913

--
Lee Jones [李琼斯]

