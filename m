Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4068D6E24EA
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Apr 2023 15:59:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70214E7A;
	Fri, 14 Apr 2023 15:58:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70214E7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681480750;
	bh=h3KypwXOyLS5KJ882rDfDAkHgvBLHO71dtQUJqvamHI=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dNrO32QpvVEe6FudSlxKCx2WoA+xLECDnaYSz+D1i/roFBPry4Aetv9N/NlT/XH4z
	 NT14jfm2AKtBlLMzvp+yN5c/cP91qkTSt0AbiBvyi6InNs6KyhW90+TOY90qs/VT6T
	 6d0867FOPf/xPTL95HlhQdpDQMjDJ08nfumlLNC4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D737F8025E;
	Fri, 14 Apr 2023 15:58:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B39E7F8032B; Fri, 14 Apr 2023 15:58:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D63CBF80149
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 15:58:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D63CBF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZGJ4bm0Z
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4841664821;
	Fri, 14 Apr 2023 13:58:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 848F6C433D2;
	Fri, 14 Apr 2023 13:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681480691;
	bh=h3KypwXOyLS5KJ882rDfDAkHgvBLHO71dtQUJqvamHI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZGJ4bm0Zd4LXqoCvtr0aLT+XjvvZ3sZ/FYEtzl6vvpTRuP72pyZi9QrYe21fQQZmJ
	 ko9AyAQFmdRML5HcAkwDH7NM8SC8ycaCK/3pMjZooeIqXu1JF6n0xTJp3hRGCtLb+S
	 Owvo1ivNHL9xXP+sFySTFIw66PPsfccgdCwZW0cZyMQWsQS9ieW1Pj8xjr5fl4rO+y
	 KbVHMLZXAMRAvl4bbbZUWSyx/OZ0vYNyNtGc+1MARg15O9jA74bKjqEtSrp2TJWTZL
	 CmBXIh+Qet9COq6y6nP19JAxiorfDdYu2cHz3RuE9pGRYhuEcJpij4VztpyXM03bFT
	 +Mc0Fj5pUQ5Qg==
Message-ID: <82b74a2f-edab-908f-bc7a-2cac572cf3a9@kernel.org>
Date: Fri, 14 Apr 2023 15:58:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: nau8825: Add delay control for
 input path
To: Mark Brown <broonie@kernel.org>
References: <20230414103941.39566-1-CTLIN0@nuvoton.com>
 <7826c2f8-3e8d-7786-4742-4b885b840cae@kernel.org>
 <4f854448-c643-4ce0-be3b-770e0f7c7814@sirena.org.uk>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <4f854448-c643-4ce0-be3b-770e0f7c7814@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: EBMHO2GV4CM5UQASGWHBIGIV6HSQLH43
X-Message-ID-Hash: EBMHO2GV4CM5UQASGWHBIGIV6HSQLH43
X-MailFrom: krzk@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: David Lin <CTLIN0@nuvoton.com>, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
 SJLIN0@nuvoton.com, WTLI@nuvoton.com, ctlin0.linux@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EBMHO2GV4CM5UQASGWHBIGIV6HSQLH43/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 14/04/2023 15:46, Mark Brown wrote:
> On Fri, Apr 14, 2023 at 02:34:19PM +0200, Krzysztof Kozlowski wrote:
>> On 14/04/2023 12:39, David Lin wrote:
> 
>>> +  - nuvoton,adc-delay-ms: Delay (in ms) to make input path stable and avoid pop noise. The
>>> +      default value is 125 and range between 125 to 500 ms.
> 
>> Convert the binding to DT Schema first.
> 
> That seems disproportionate for such a trivial change.

What is the difference between:
1. Adding 2 or 3 new properties to TXT file without converting the file
to DT Schema,

2. Adding 1 property in 2022 Sep. Then adding one more property now.
Then adding another property in 3 months.

I don't see.

Every time the excuse is the same - it is just one property, so let's
add it. Since this is second property, after we started enforcing DT
schema, I don't think my request is disproportionate.

I think my request is reasonable.

Best regards,
Krzysztof

