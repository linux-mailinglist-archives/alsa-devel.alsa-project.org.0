Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 114AC75C0A0
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:00:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75A461FA;
	Fri, 21 Jul 2023 09:59:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75A461FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689926419;
	bh=N2PEMeZJ9b5SlVCWEYVt1aINdwFqkHLWjucVt4NofwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ldVkoMV8IX779aYEG7TQTe/NOWLi5xoWAcQm7eFyqbBYTu9Da7lIbzVOwn871diko
	 D3DGr9FwM+l9U0CtojikY0vDvvprBtl/E6KZZvX6woUSxcvdSz+uXOVL+0FNieNuWR
	 JBYdma38sIS0dm366WfGG8fW48LrNJz75cX6paeU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F9C4F80520; Fri, 21 Jul 2023 09:59:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FE2AF8032D;
	Fri, 21 Jul 2023 09:59:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2246EF8047D; Fri, 21 Jul 2023 09:59:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D025AF8007E
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 09:59:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D025AF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PsQ7i225
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 97C2561642;
	Fri, 21 Jul 2023 07:59:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82059C433C7;
	Fri, 21 Jul 2023 07:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689926340;
	bh=N2PEMeZJ9b5SlVCWEYVt1aINdwFqkHLWjucVt4NofwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PsQ7i225uLYOP+wwcVtk4oiybbfHVs8yBptuTohptP2nr9RTaHWGUDvySJjvNfwK/
	 Vew/Jl5uhEchZqZnyEOgC2nCbdK0Kvwg+tzh0W6/6MVXa1SDcW+ERv6E8FgAuUsSO8
	 T2EKulha+honeEia9gL2/os3UYzzbl1/rZszf0zFZvbfdhVfJzPNFAu0A3c7wu9IPA
	 uUBrhzS53wKSUNZ7hlNwZGalLl2R+LBsZOHq8viAPa0i1i0TBkB+uupnbuJrVAIf9u
	 Yt2lZklJQ98YM/9mIVdDX2LL4K9xmuQ9I5uEjyoR0hlhw1Q0EHXlUBOW738Ww8la5g
	 25PMraWhMxb4w==
Date: Fri, 21 Jul 2023 08:58:54 +0100
From: Lee Jones <lee@kernel.org>
To: broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	linus.walleij@linaro.org, vkoul@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: robh+dt@kernel.org, conor+dt@kernel.org, lgirdwood@gmail.com,
	yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
	pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v5 0/6] Add cs42l43 PC focused SoundWire CODEC
Message-ID: <20230721075854.GA1908841@google.com>
References: <20230619095623.1987742-1-ckeepax@opensource.cirrus.com>
 <168992615492.1924396.13464534208592126033.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <168992615492.1924396.13464534208592126033.b4-ty@kernel.org>
Message-ID-Hash: 7Q4W733BZFRGC7QUUS6YLXH6LPCYB5MP
X-Message-ID-Hash: 7Q4W733BZFRGC7QUUS6YLXH6LPCYB5MP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7Q4W733BZFRGC7QUUS6YLXH6LPCYB5MP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 21 Jul 2023, Lee Jones wrote:

> On Mon, 19 Jun 2023 10:56:17 +0100, Charles Keepax wrote:
> > This patch chain adds support for the Cirrus Logic cs42l43 PC focused
> > SoundWire CODEC. The chain is currently based of Lee's for-mfd-next
> > branch.
> > 
> > Thanks,
> > Charles
> > 
> > [...]
> 
> Applied, thanks!
> 
> [2/6] dt-bindings: mfd: cirrus,cs42l43: Add initial DT binding
>       commit: e62ba8443b11f12b45c61444249458a2f8c2f4ef
> [3/6] mfd: cs42l43: Add support for cs42l43 core driver
>       commit: 843079209e1506c94fde797fc0ff914e2c9e6645
> [4/6] pinctrl: cs42l43: Add support for the cs42l43
>       commit: 85f034dd7ff0a66aded653cc91dbc406fba7cf1a

Pull-request to follow.

-- 
Lee Jones [李琼斯]
