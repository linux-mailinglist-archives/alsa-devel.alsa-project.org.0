Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEF5785872
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 15:00:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7321383E;
	Wed, 23 Aug 2023 14:59:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7321383E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692795617;
	bh=F91n1DPn24bjV9MAo7MD0EXAfdliZqVQJAhmLsbo/i0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G3gj46W+b7FCeJ3lkBn5R1WpscDRXMXVBkZYhsQxoLXquZv0+N6AKCWzWVzBo/tzk
	 EY+8CpcbLS3eMPK5b26u9Df4pOuW/m1qjCghQVSbaSFgFJ3St1PqlMM4R1uSzZsnOz
	 abK3I1yKXmwoLuKXfhz3VfF6J3nIHtvyUmvGlsbc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1D46F804F3; Wed, 23 Aug 2023 14:59:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7A37F800F5;
	Wed, 23 Aug 2023 14:59:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CE1DF80158; Wed, 23 Aug 2023 14:59:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C13AF800BF
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 14:59:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C13AF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IEzNxaWX
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 503B261C11;
	Wed, 23 Aug 2023 12:59:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B65CC433C8;
	Wed, 23 Aug 2023 12:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692795551;
	bh=F91n1DPn24bjV9MAo7MD0EXAfdliZqVQJAhmLsbo/i0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IEzNxaWXC9HS994DnUcnEsFmqtPs1CYCrNBx+UB2lTXrBA2KqA5E1PYSe/FgjC0Vc
	 XZtcZmEHSOm+Or62q6hUlcqG3gUiKmryEO9MiZmaw8gajx4ES4T8XcYoByrfP5hS69
	 EczqZPwUq/iOsisvwrRxcKdQpGkCk/UF2tEvLbR3Esc6Ib8Un4o5sZSue9xkSRr7dc
	 xbp5UFV69cUrSygOupl+XdJQgiMAHrJlITHbqJtvG2+iy28E0Bp4h64aGII0HjZLpc
	 9F3wW7DE9waQzuyCVv+zmqigodkFtE1trKtqyRRsr7idMWHp6E0nv1gd5EGkqLhUOg
	 rCsJ/4/1so/Nw==
Received: (nullmailer pid 2051073 invoked by uid 1000);
	Wed, 23 Aug 2023 12:59:08 -0000
Date: Wed, 23 Aug 2023 07:59:08 -0500
From: Rob Herring <robh@kernel.org>
To: Seven Lee <wtli@nuvoton.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 conor+dt@kernel.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
 CTLIN0@nuvoton.com, SJLIN0@nuvoton.com, scott6986@gmail.com,
 supercraig0719@gmail.com, dardar923@gmail.com
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: nau8821: Add single-ended input
 feature
Message-ID: <20230823125908.GA2048264-robh@kernel.org>
References: <20230823071244.1861487-1-wtli@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230823071244.1861487-1-wtli@nuvoton.com>
Message-ID-Hash: 57TTYTMU5DB5ZDVP5KLGWGJYANBR7VSF
X-Message-ID-Hash: 57TTYTMU5DB5ZDVP5KLGWGJYANBR7VSF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/57TTYTMU5DB5ZDVP5KLGWGJYANBR7VSF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Aug 23, 2023 at 03:12:43PM +0800, Seven Lee wrote:
> Add input with single-ended control.
> 
> Signed-off-by: Seven Lee <wtli@nuvoton.com>
> ---
>  .../devicetree/bindings/sound/nuvoton,nau8821.yaml         | 7 +++++++
>  1 file changed, 7 insertions(+)

This is the second v1 I've gotten. Is there some change? Please version 
your patches.

I acked the last one which you should add when sending a new version.

Acked-by: Rob Herring <robh@kernel.org>

Rob
