Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A303913BE9
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Jun 2024 17:02:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C17C7DE5;
	Sun, 23 Jun 2024 17:02:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C17C7DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719154978;
	bh=ISrxbHoDsgdg8jZ5QeZIYDTqqYNzfT5aOQ66p+EPqGo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SaV1+JNInM4Rp4ys45yd+IIa8yU3W1O7Z7Shc5jU6r0aPwz5gDM1YFQmb5MfclErn
	 jI4l9sFFdHQ8m22cnkvfKs4uyGLDBDryiAdlXHvF/InXyTEkrQeiCRQZtuGzJRltQg
	 z404xhuRxb2bOY4Pb+HlT6Z7GgLCU6CVRZS2/gXc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBFACF805BD; Sun, 23 Jun 2024 17:02:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38A24F805B6;
	Sun, 23 Jun 2024 17:02:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9FCCF80495; Sun, 23 Jun 2024 17:02:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93CEEF80154
	for <alsa-devel@alsa-project.org>; Sun, 23 Jun 2024 17:02:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93CEEF80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AUTDTxB0
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BA6FECE0EB9;
	Sun, 23 Jun 2024 15:02:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4865CC2BD10;
	Sun, 23 Jun 2024 15:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719154928;
	bh=ISrxbHoDsgdg8jZ5QeZIYDTqqYNzfT5aOQ66p+EPqGo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AUTDTxB066M0zP5PMnojHiP1J9VHW5O8wI8HefXUNgg6ViyiR7lynsdfZGq264K6U
	 IW4Ea5yErWl4FfQyuG8vIAehENxpLg5icImCG8oxz/qLBjTQb4Bk6kpJANxvEJ5wYD
	 PrjphOlKGgCzYIfmAOr+12xKh6tN5iTDr5+UcorXUOpyjdZwJ3AwiULMN4GHkAJqDb
	 eUWjQBZsXWE03LxzzGgbyxGgKNRMqdXdlwAfGxljoGFPOlFJDE3iYqcLDS3uBRj4JN
	 efREL+yQKPQTMEGlMmIqSlWt+v2fJnjLEdxB1bweeVrR9fdjtANEtfQWZVXgb08OJ2
	 Qy6wWz68wH1GA==
Date: Sun, 23 Jun 2024 16:01:57 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Fabrice Gasnier
 <fabrice.gasnier@foss.st.com>, <alsa-devel@alsa-project.org>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/8] dt-bindings: iio: dfsdm: move to backend framework
Message-ID: <20240623160157.2bed9ff9@jic23-huawei>
In-Reply-To: <20240618160836.945242-5-olivier.moysan@foss.st.com>
References: <20240618160836.945242-1-olivier.moysan@foss.st.com>
	<20240618160836.945242-5-olivier.moysan@foss.st.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ZW2ODENQSDQWMO7PHMUQI3ZKKR3K7SZX
X-Message-ID-Hash: ZW2ODENQSDQWMO7PHMUQI3ZKKR3K7SZX
X-MailFrom: jic23@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZW2ODENQSDQWMO7PHMUQI3ZKKR3K7SZX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 18 Jun 2024 18:08:30 +0200
Olivier Moysan <olivier.moysan@foss.st.com> wrote:

> Change the DFSDM binding to use the new IIO backend framework,
> along with the adoption of IIO generic channels.
> This binding change allows to add scaling support to the DFSDM.
> 
> Keep the legacy binding as deprecated for backward compatibility.
> 
> The io-backends property is supported only in generic IIO channel
> binding.
> 
> - Channel description with the generic binding (Audio and Analog):
> 
>   Properties supersed by generic properties:
superseded

>     st,adc-channels: becomes "reg" property in channel node
>     st,adc-channel-names: becomes "label" property in channel node
>   Properties moved to channel child node:
>     st,adc-channel-types, st,adc-channel-clk-src, st,adc-alt-channel
> 
> - Analog binding:
> 
>   DFSDM filter channel is configured as an IIO backend consumer.
>   Add io-backends property in channel child nodes.
> 
>   DFSDM is no more configured as a channel consumer from SD modulator.
>   Use of io-channels in DFSDM node is deprecated.
> 
> - Audio binding:
> 
>   DFSDM audio DAI is configured as a channel consumer from DFSDM filter.
>   No change compare to legacy.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
