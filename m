Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6149668E484
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 00:42:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CB1020C;
	Wed,  8 Feb 2023 00:41:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CB1020C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675813344;
	bh=Ju9beePp7bAYEhek0mXetGx1R+Zbuu/Si/5uQYOpoYQ=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V0dQfTqrx4flvpJVD9XfK4HjZ6SmnMg6/aBfpNmRfATo3uUFIUT7f3w4bhRTgcjFr
	 hJwVHiueUFG8hRVZyiff6W7gy3Cny8b/KuiHinzBUNJSMmLlw9luaYgHhjixI13awr
	 +j2hkzCS/TjHBkPhnyLcpmgV7m4uXnh15ItVDcrI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78D42F8010B;
	Wed,  8 Feb 2023 00:41:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80D50F8012B; Wed,  8 Feb 2023 00:41:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7A75F800E2
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 00:41:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7A75F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=edQKC4NE
Received: from [192.168.86.246]
 (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net [82.11.51.62])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: tanureal)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 37CA1660208D;
	Tue,  7 Feb 2023 16:34:44 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675787684;
	bh=Ju9beePp7bAYEhek0mXetGx1R+Zbuu/Si/5uQYOpoYQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=edQKC4NEPBgk6xe98pLs1bQKH/mVHP9YXgIKmxRpaFkpenX2o/OQ+p83JRoc98JIu
	 s5vkVGN/Q3Tj2Or/cTy3yxAjr10QlhINvyc333vtYnB+y3Z03j7M4sXTRDKyRSzUVv
	 aDl6VlVamlv+1h1kaKIG3iQ6WuDLUB+HFyMuKki0rCv1/uYtizueGxxXRamCI1/6gO
	 hP+dQq9wfMXVMCXavKYoqjuNhUlyqAMuQunVAjhnIBanTd/hpxLc0jIYcElCHEHib8
	 ZWl2KyMZDKnwX/WX6495BOgPIhDt+1fAtjnQVrZNkwwaRB81ApYUv/r14QG5jwblfb
	 6qDOxL8gzupbw==
Message-ID: <4efe9796-6d3e-09d1-d5f7-cfb25a439061@collabora.com>
Date: Tue, 7 Feb 2023 16:34:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] Documentation: cs35l41: Shared boost properties
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 David Rhodes <david.rhodes@cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20230207104021.2842-1-lucas.tanure@collabora.com>
 <20230207104021.2842-3-lucas.tanure@collabora.com>
 <44faeca1-94c9-4423-d87a-03d80e286812@linaro.org>
 <e7257f9a-86c5-74e8-c538-6f6d2ba13274@collabora.com>
 <44c7274f-8a5e-0235-413a-6c3260018601@linaro.org>
From: Lucas Tanure <lucas.tanure@collabora.com>
In-Reply-To: <44c7274f-8a5e-0235-413a-6c3260018601@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: G56O462CGFYHRZ3LWZQ5OJCGDVGJFVBQ
X-Message-ID-Hash: G56O462CGFYHRZ3LWZQ5OJCGDVGJFVBQ
X-MailFrom: lucas.tanure@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G56O462CGFYHRZ3LWZQ5OJCGDVGJFVBQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 07-02-2023 16:13, Krzysztof Kozlowski wrote:
> On 07/02/2023 16:46, Lucas Tanure wrote:
>>>> +      Shared boost allows two amplifiers to share a single boost circuit by
>>>> +      communicating on the MDSYNC bus. The passive amplifier does not control
>>>> +      the boost and receives data from the active amplifier. GPIO1 should be
>>>> +      configured for Sync when shared boost is used. Shared boost is not
>>>> +      compatible with External boost. Active amplifier requires
>>>> +      boost-peak-milliamp, boost-ind-nanohenry and boost-cap-microfarad.
>>>>          0 = Internal Boost
>>>>          1 = External Boost
>>>> +      2 = Reserved
>>>
>>> How binding can be reserved? For what and why? Drop. 2 is shared active,
>>> 3 is shared passive.
>> 2 Is shared boost without VSPK switch, a mode not supported for new
>> system designs. But there is laptops using it, so we need to keep
>> supporting in the driver.
> 
> That's not the answer. 2 is nothing here, so it cannot be reserved.
> Aren't you mixing now some register value with bindings?
> 
> Best regards,
> Krzysztof
> 
> 
I have added a new patch with propper documentation.
And I would like to use 3 and 4 for shared boost as 
CS35L41_EXT_BOOST_NO_VSPK_SWITCH already exist as 2 and is used in the 
current driver.
The laptop that uses CS35L41_EXT_BOOST_NO_VSPK_SWITCH doesn't have the 
property "cirrus,boost-type", but to make everything consistent I would 
prefer to use 3 and 4 for the new boost types.
Is that ok with you?

Thanks
Lucas
