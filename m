Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E4478590F
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 15:20:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7F96839;
	Wed, 23 Aug 2023 15:19:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7F96839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692796828;
	bh=OvhIgHZmORNVFi07F01ZpcKqdw0vzuMy5UHAeo7OqEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MCe5ngaNb/u+5dDLXWXHq3rsyCdixwCMPz9lMXGQ2WWh4Wm0TBT2zNwjqBXGwJ+mq
	 mgksU3dZLxuHFOnx0Pdo8t8ZUwM02pnzfIrbVRN/YEfvbEiBwITwT51kUq/1e7p3er
	 lmnSOtDI2tV+fZDQzGGJ94aDsmOeOmDFVjmby8/M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 588B2F800F5; Wed, 23 Aug 2023 15:19:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC77DF800F5;
	Wed, 23 Aug 2023 15:19:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8253F80158; Wed, 23 Aug 2023 15:19:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56334F800BF
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 15:19:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56334F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GsNnBmyh
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 905666628A;
	Wed, 23 Aug 2023 13:19:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FAB1C433CA;
	Wed, 23 Aug 2023 13:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692796744;
	bh=OvhIgHZmORNVFi07F01ZpcKqdw0vzuMy5UHAeo7OqEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GsNnBmyhVMn7ydJeXv+04oBIi8+t+UBbIV1WfVTVptD1nJGHfYr5Zb1JCWSoLTZun
	 pdJCuhTO8fLiV7ryRY2DJJCE8XNocPVCyfiWJSo4MTLUgBVsGk4kKr8UTdfmDROFtq
	 Ad4yZioJ3vs4ML6CxK4dtneFlUC6a/qURrhtnNf4NeuG609O00yvuG37MKh75rL58k
	 KbAIwsppMgv+fdnDzyHkAGgbDdGjeCwyz8wvevFjPdpYQV6KDSR8JmaBL2hy5xQ2Jx
	 xZ9vTxcCmoCQDiijUHghe1pK+GvF2ByAsGsrFxqh+g4H/LVF9L9oHtV3pSV4XIzWTK
	 f3tvm6XhHO1fQ==
Received: (nullmailer pid 2200303 invoked by uid 1000);
	Wed, 23 Aug 2023 13:19:01 -0000
Date: Wed, 23 Aug 2023 08:19:01 -0500
From: Rob Herring <robh@kernel.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 Walker Chen <walker.chen@starfivetech.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Claudiu Beznea <Claudiu.Beznea@microchip.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v2 4/5] riscv: dts: starfive: pinfunc: Fix the pins name
 of I2STX1
Message-ID: <169279674097.2200246.2480753930062149907.robh@kernel.org>
References: <20230821144151.207339-1-xingyu.wu@starfivetech.com>
 <20230821144151.207339-5-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230821144151.207339-5-xingyu.wu@starfivetech.com>
Message-ID-Hash: KRA7DIOH7D6W4324RNBGS7WQ6FFHKQU6
X-Message-ID-Hash: KRA7DIOH7D6W4324RNBGS7WQ6FFHKQU6
X-MailFrom: SRS0=yzNC=EI=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KRA7DIOH7D6W4324RNBGS7WQ6FFHKQU6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon, 21 Aug 2023 22:41:50 +0800, Xingyu Wu wrote:
> These pins are actually I2STX1 clock input, not I2STX0,
> so their names should be changed.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110-pinfunc.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

