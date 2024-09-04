Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FA896C1C4
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2024 17:08:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12D38DFA;
	Wed,  4 Sep 2024 17:07:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12D38DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725462481;
	bh=tORFVMwcIg00iudga/PE27wgMqLVRP07F1UvBKluATo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fErMAt3PxU88SQXblEIQ7qjpykWWs/1ReDEV1aAv5J+nUwJtgVNlbkFyKCn1uVIbP
	 5i2l1OzMg93azUGVGEV/xZqtBtQrnFGwYy7L5K25Tq+aC6dREIMaHfKcIzDfwPoHBE
	 qEGpVb2C/gJ2dP60wjLICNlqP/TAZ+uz+aK2eTjA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6804F805A1; Wed,  4 Sep 2024 17:07:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54B10F805B2;
	Wed,  4 Sep 2024 17:07:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 706DEF80199; Wed,  4 Sep 2024 17:07:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9C3A8F80027
	for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2024 17:07:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C3A8F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MlUXSwtR
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 48B73A44405;
	Wed,  4 Sep 2024 15:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC0E3C4CEC2;
	Wed,  4 Sep 2024 15:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725462441;
	bh=tORFVMwcIg00iudga/PE27wgMqLVRP07F1UvBKluATo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MlUXSwtRBr1UUgTUUtu429ZkGjdhdcsJ/+QFfcxI1BzjZ9IVctLIKNGct4I+Oo3GS
	 oXFrqjtFHvPrAZdwbSB+/xjh7Jxy4JXV7DaYgTiu1dZp9HmPJdOIQN0DUxhRU3yip5
	 Fg0HSp8ooH0OCEFSRxksMM/zML0o3awp0qkG55Od6Bug6Mog5JRDW9/iNemqmWW5th
	 JeSScqgWPRpyfTRXAHqMH48qsUAWB24aw2tpCoLfCHx9rvfz2iwXs/lcwaXxYfRpqe
	 YRQUnpFeHodyTafVNBA6IMkPIXJQD+aacP+36XJtFoOSuz1rrSDbQfBwHnW5ufNcDj
	 i7YtWC+SY282Q==
Date: Wed, 4 Sep 2024 10:07:20 -0500
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Linux-ALSA <alsa-devel@alsa-project.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: renesas,rsnd: add post-init-providers
 property
Message-ID: <20240904150720.GA2578755-robh@kernel.org>
References: <87cylj7ul2.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cylj7ul2.wl-kuninori.morimoto.gx@renesas.com>
Message-ID-Hash: 3HZ7J4J2UK4UH2GXCY2BDNP6IYTJCI5X
X-Message-ID-Hash: 3HZ7J4J2UK4UH2GXCY2BDNP6IYTJCI5X
X-MailFrom: robh@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3HZ7J4J2UK4UH2GXCY2BDNP6IYTJCI5X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Sep 04, 2024 at 07:21:14AM +0000, Kuninori Morimoto wrote:
> sometimes, fwnode dependency cycles can be broken, and in such case,
> rsnd driver will never be probed. To avoid such case, we would like to
> use post-init-providers to avoid it.
> Enable post-init-providers property on rsnd.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> index 07ec6247d9def..cb44478d9e420 100644
> --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> @@ -112,6 +112,10 @@ properties:
>      description: List of necessary clock names.
>      # details are defined below
>  
> +  post-init-providers:
> +    description: ignore fw_devlink dependency cycles and avoid driver probe dead-lock

Drop. Don't need to describe (again) what a common property is. If you 
want to say what your dependency cycle is, that would be good.

> +    $ref: /schemas/types.yaml#/definitions/phandle-array

Already has a type, don't define one again.

What you need, if you know, is how many entries (maxItems).

Rob
