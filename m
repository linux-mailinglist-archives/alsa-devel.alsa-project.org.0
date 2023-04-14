Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF586E2500
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Apr 2023 16:01:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEB9FE7A;
	Fri, 14 Apr 2023 16:00:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEB9FE7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681480876;
	bh=S7i6Gs+JAk/qaPFszrWhJXcNeFk0TTSrSOIADSNofYs=;
	h=Date:Subject:From:To:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bQq93TE5IadjJ1i9l4LSae+Mp7J5KozrMabfW+S1Q8iXy2TNknBVhfvbFXlx8VrmB
	 NEzPSzq7C340JOF7E5VUd8a3qGV7TxzzN5OCbA41R0Ai7HSaKkS60bfN0YeMuHAm5D
	 ewgBnE9NeA3EABCZj3m76vtq6SmI1651zcsLKZ0s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 682C5F8025E;
	Fri, 14 Apr 2023 16:00:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D372F8032B; Fri, 14 Apr 2023 16:00:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 420BCF80149
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 16:00:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 420BCF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qFB4hUdW
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5E7346484F;
	Fri, 14 Apr 2023 14:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28C82C4339B;
	Fri, 14 Apr 2023 14:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681480818;
	bh=S7i6Gs+JAk/qaPFszrWhJXcNeFk0TTSrSOIADSNofYs=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=qFB4hUdWJsX2MLLbMJeTYhJ2rjoYP1+G1O/kolG4DK2dZrdSfwpDcYwyLvqWvPDeT
	 31PIa0Y7SAd5rsfeuv2ywgGj16THvlirSBHyp4Uq9/8tync9ERhBKAcgHP2ig9Pcqk
	 N/5ScrlAIgDANW+c/bbShTXz6t6PyusczgN9xdkXQwvrB2RWy275ukHq8rh3B6kjMC
	 avfZZZyvUWElASXCSOlRYW5dpl8MfNU04oswmbm2AmtYhtWlQuICA4pI0RY5I0TSc3
	 KWPJELyCNF1zsZH1DRqh6DH7VH3HYVxuhkKTKgNwSr6diY/JEidTpcbSObO0dz3wUT
	 KEI9u/fJOgMEA==
Message-ID: <bbbd3e4a-4d46-ee7e-cf90-f8626eb6e447@kernel.org>
Date: Fri, 14 Apr 2023 16:00:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: nau8825: Add delay control for
 input path
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mark Brown <broonie@kernel.org>
References: <20230414103941.39566-1-CTLIN0@nuvoton.com>
 <7826c2f8-3e8d-7786-4742-4b885b840cae@kernel.org>
 <4f854448-c643-4ce0-be3b-770e0f7c7814@sirena.org.uk>
 <82b74a2f-edab-908f-bc7a-2cac572cf3a9@kernel.org>
In-Reply-To: <82b74a2f-edab-908f-bc7a-2cac572cf3a9@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: RW667OPHJCVE2X2ULFYNQWZK65LQNLLE
X-Message-ID-Hash: RW667OPHJCVE2X2ULFYNQWZK65LQNLLE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RW667OPHJCVE2X2ULFYNQWZK65LQNLLE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 14/04/2023 15:58, Krzysztof Kozlowski wrote:
> On 14/04/2023 15:46, Mark Brown wrote:
>> On Fri, Apr 14, 2023 at 02:34:19PM +0200, Krzysztof Kozlowski wrote:
>>> On 14/04/2023 12:39, David Lin wrote:
>>
>>>> +  - nuvoton,adc-delay-ms: Delay (in ms) to make input path stable and avoid pop noise. The
>>>> +      default value is 125 and range between 125 to 500 ms.
>>
>>> Convert the binding to DT Schema first.
>>
>> That seems disproportionate for such a trivial change.
> 
> What is the difference between:
> 1. Adding 2 or 3 new properties to TXT file without converting the file
> to DT Schema,
> 
> 2. Adding 1 property in 2022 Sep. Then adding one more property now.
> Then adding another property in 3 months.
> 
> I don't see.
> 
> Every time the excuse is the same - it is just one property, so let's
> add it. Since this is second property, after we started enforcing DT
> schema, I don't think my request is disproportionate.
> 

BTW, the change from September was also sent to mailing lists ignoring
Devicetree entirely. This does not help here, because now it looks like
a pattern.

Best regards,
Krzysztof

