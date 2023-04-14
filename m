Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAB76E2362
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Apr 2023 14:35:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CE65E75;
	Fri, 14 Apr 2023 14:34:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CE65E75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681475729;
	bh=vHEVEDvIJaj9ivRgrpz3wpEe468eRB8a5RGAhKWzQmo=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J4Og0ZwuIT6hMbRtRxxLkhofKzf/bDrC4MmMQjomvICvTrmgeF2uwGudy4q5SkqLY
	 Yi2p5sd9OldAFhnjIeFaVeWh6Gt27RJ8dhMemn1Sx/kObSzsMgMdT90rraVfq8i4/H
	 CSN7eU6/nSpvZStyCbZDAsNMY5SDYTgPw5xyZ3Cc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A85CDF8025E;
	Fri, 14 Apr 2023 14:34:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1AF1AF8032B; Fri, 14 Apr 2023 14:34:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 937F4F80100
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 14:34:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 937F4F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=e4wQmiJE
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 53CBD631D2;
	Fri, 14 Apr 2023 12:34:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8733FC433D2;
	Fri, 14 Apr 2023 12:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681475664;
	bh=vHEVEDvIJaj9ivRgrpz3wpEe468eRB8a5RGAhKWzQmo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e4wQmiJE40U99DWRyq1A4JqsP9r634rmzWarJQxDmvqCOUCnNsPn6OW2Vmn31I0os
	 tyJypPXJhq146Q77KaAceVS4JjXBHQLEawIiusABBhhwqEtOOGhzVqQ/r2aUDZ5Kk5
	 Up/i0hQT4UoqLCl6ufKPVJHEJBTyWy3U9X7lmxGUr6s0CNK+Gk/0JeDSOtK4Htuxm5
	 3IRHK9yyT60kxFsAn//XW7zQNY+r/nwuCAy5nkYzyqb6XTzKRYpL2kvycH8DIJf6Rj
	 xDy+gk1BSFRDJn70UkHoTLn/uXRBJOldwYR5QHKepB7MaMp7PyUdfte0oFsPjeKW9i
	 tHXmbiEf/U9zA==
Message-ID: <7826c2f8-3e8d-7786-4742-4b885b840cae@kernel.org>
Date: Fri, 14 Apr 2023 14:34:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: nau8825: Add delay control for
 input path
Content-Language: en-US
To: David Lin <CTLIN0@nuvoton.com>, broonie@kernel.org
References: <20230414103941.39566-1-CTLIN0@nuvoton.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230414103941.39566-1-CTLIN0@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: WSDACED2VT3GVGQPUNKKJ6VYNEGSEBTC
X-Message-ID-Hash: WSDACED2VT3GVGQPUNKKJ6VYNEGSEBTC
X-MailFrom: krzk@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, alsa-devel@alsa-project.org, YHCHuang@nuvoton.com,
 KCHSU0@nuvoton.com, SJLIN0@nuvoton.com, WTLI@nuvoton.com,
 ctlin0.linux@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WSDACED2VT3GVGQPUNKKJ6VYNEGSEBTC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 14/04/2023 12:39, David Lin wrote:
> Change the original fixed delay to the assignment from property. It will make
> more flexible to different platforms for avoiding pop noise at the beginning
> of recording.

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

> 
> Signed-off-by: David Lin <CTLIN0@nuvoton.com>
> ---
>  Documentation/devicetree/bindings/sound/nau8825.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/nau8825.txt b/Documentation/devicetree/bindings/sound/nau8825.txt
> index cb861aca8d40..a9c34526f4cb 100644
> --- a/Documentation/devicetree/bindings/sound/nau8825.txt
> +++ b/Documentation/devicetree/bindings/sound/nau8825.txt
> @@ -74,6 +74,9 @@ Optional properties:
>    - nuvoton,adcout-drive-strong: make the drive strength of ADCOUT IO PIN strong if set.
>        Otherwise, the drive keeps normal strength.
>  
> +  - nuvoton,adc-delay-ms: Delay (in ms) to make input path stable and avoid pop noise. The
> +      default value is 125 and range between 125 to 500 ms.
> +

Convert the binding to DT Schema first.


Best regards,
Krzysztof

