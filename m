Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 268A3737F47
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 12:06:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3EED836;
	Wed, 21 Jun 2023 12:05:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3EED836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687341997;
	bh=Z4b2Y6thjsX7kjMMcSvC6DU9oqsyixav8Q7XWvuy5M4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rRFFmZW1AWVI78lGTTe1XjC1E94uuzyTiPVdLrHz2q0dSPUi7IM/zTEWd8O53fVg1
	 q60I3wFg82ubyqOstr9c0CZI9G00GWZxK6WbkMiyarAy5zN5WIzcE51pRR4yJK16QY
	 4igl0YDkNgHTqzvBFxUs90vQ1Gd33lZkK/XKnWL4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20100F80552; Wed, 21 Jun 2023 12:05:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB71CF80544;
	Wed, 21 Jun 2023 12:05:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3978F80549; Wed, 21 Jun 2023 12:05:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EB934F80141
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 12:05:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB934F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QiPR2XJU
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C9357614F0;
	Wed, 21 Jun 2023 10:05:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56D75C433C0;
	Wed, 21 Jun 2023 10:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687341914;
	bh=Z4b2Y6thjsX7kjMMcSvC6DU9oqsyixav8Q7XWvuy5M4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QiPR2XJUtni1XlTuMTEPeIoyXebmRom/8j4/eiD7Q/zPvFMdsF6+zy2ps4fPUdVeV
	 tHXUbnvzGRSoJ/vUiZEe46ldWCbTbvDQo0oLbyH5YeC8ucJJDHBEbH+xT92umavO+t
	 /Q4AQvIWTW0d2V2NPm0OhChlnN92tyBrjtYF0w0ETNP8Wrj5v1ixYXZBJdEwsRI8+F
	 ljXQ0YVM1XeNOFNBCCSLMzIK6Q8JKXTPnazq/ldAGlqv47qJmh2rqO+SQalPewXII3
	 I65xB/fXw31PPAKivO5qr6qnxpIN2LXw4mkbA9TEcWbZlJTAqqYV/bOuYPFU3b/+BI
	 pTjxyHwtsoPig==
Message-ID: <bf380ae8-6d88-150a-9482-1fd89f500186@kernel.org>
Date: Wed, 21 Jun 2023 12:05:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 14/14] ASoC: dt-bindings: renesas,rsnd.yaml: enable multi
 ports for multi Component support
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
References: <87r0q5blta.wl-kuninori.morimoto.gx@renesas.com>
 <877crxblq4.wl-kuninori.morimoto.gx@renesas.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <877crxblq4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: CR5SCNEMBOECBGRTRWOHNNPZZAM7CWJ3
X-Message-ID-Hash: CR5SCNEMBOECBGRTRWOHNNPZZAM7CWJ3
X-MailFrom: krzk@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CR5SCNEMBOECBGRTRWOHNNPZZAM7CWJ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 21/06/2023 04:19, Kuninori Morimoto wrote:
> To enable multi Component support, "multi ports" is needed for Audio Graph
> Card/Card2, and "multi rcar_sound,dai" is needed for Simple Audio Card.
> This patch enable these.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

You missed at least DT list (maybe more), so this won't be tested by our
tools. Performing review on untested code might be a waste of time, thus
I will skip this patch entirely till you follow the process allowing the
patch to be tested.

Please kindly resend and include all necessary To/Cc entries.

Best regards,
Krzysztof

