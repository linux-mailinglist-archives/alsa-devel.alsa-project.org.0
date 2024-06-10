Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B96BD9025C5
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jun 2024 17:36:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15520847;
	Mon, 10 Jun 2024 17:36:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15520847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718033809;
	bh=Ah1Pc9Tx+SfASALqTWximD0HQRflB2G4Tq5TvplHIfo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HP6HGpB5xE7RoF9KsWbMKFPTD+WpUZbqol4AZrptX3LNIrACYN+L3FWXRLfE3AfjO
	 hjEvq982MQ0QmoQqvJDv2EJVtTbqQ1G0/u5mQduwEwzzBWwRyYO0gARA5hBIu6mRu1
	 mkXeZeESgBJoFQZUIRgq1nMLbQ1xY3OcsIOuEv8s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86956F805AF; Mon, 10 Jun 2024 17:36:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BCEECF805AE;
	Mon, 10 Jun 2024 17:36:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F11A2F8057A; Mon, 10 Jun 2024 17:36:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B04DF800D0
	for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2024 17:36:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B04DF800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=vHU7YOVl
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a6e349c0f2bso389818466b.2
        for <alsa-devel@alsa-project.org>;
 Mon, 10 Jun 2024 08:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718033766; x=1718638566;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/+E80Q5rdxeGOmqKds9oqdRbVVK3jiXABymm7gK6I9o=;
        b=vHU7YOVl84V6a8IWz2JY6uBBYhjLsnaOUVN2oe9P/nnbPs7kNOvtrTbxVddkdb3rs5
         ACNK31FH9UHpnzGkCB+4LCObXmeowRpMhahHKVIWEO0zkduvF9fC8/MwDTtkalBInOd/
         2UdrhhhWqXYaB2XrK06aVvxx3lC+E3Yn9vV9PrUeC1Mw6BhuOzdt5zaAgLT/jNHsQjOX
         PZ3nWTRRPi2aDopiMDTIV5bbBewkE4jZRJ+BoS8s2Lz2tCNRmSrOXoiZX4zLpM1YXFKm
         5Ziwi/MHloaaEh5ECoPR58SM5r3eQPUceWnZPAr5xCq84o8f2EjNu6xQbIQ1SRnLW40D
         J9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718033766; x=1718638566;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/+E80Q5rdxeGOmqKds9oqdRbVVK3jiXABymm7gK6I9o=;
        b=i7R3NNWQJBn7O3xzeSjbTJLICurFhz8ybc4x/znvhdX3o2GKetQ+CxnsJJTzsWlRvd
         C9VIXjbDX8O6kbEEHtHuinAqWVeYHrd/Ze087C2++hidS6c5tLjYUHGpFXD5Qmwws/TR
         GKZLoPp/xxYSGlMXzWlPKNhOSPCbofkm5IfCQ/wK6nfB6L35dPB0fmG28HnjSK3a3Td8
         fwoyITPhjO+gMe078yWygc2PyNMtHTqRweB7+uRa5F9fyCCLd8HAcW5QZnvETNZhPM7J
         65wx1k0E8rvou6VfXadQebdtLxFwvKWYNbNKTV2FXt6cknecEiCxtMgNQRZDIqaM3yA/
         f4Mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSVA5XLWSrM9brKHeqQqwi34YVYakNId8wJT07PLTozfqIxT19YfKK+UBTOntEuWzLjzqCMp+NoXWWfGBsfEtSKjQx95N7lEdgHXA=
X-Gm-Message-State: AOJu0YwZTX4DDUMcMRvYHI2oduelOr3FrBS/QYwgR7kuex15t9eB3KRx
	0O/9EkYCdET+bRfMTythoV055WxB7CGXnsPnsMrbrH0u3z7CqMOStYdllM6whKY=
X-Google-Smtp-Source: 
 AGHT+IGECHz6J6eLlLoS1mhmDrqUcykuz5pFaLMgXUzzL7Qbv358E5AMAFWML4yz8R0kd+585prxAQ==
X-Received: by 2002:a17:907:76d4:b0:a6f:23a:9151 with SMTP id
 a640c23a62f3a-a6f023a9299mr421078866b.55.1718033766498;
        Mon, 10 Jun 2024 08:36:06 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a6e00b47420sm486088366b.42.2024.06.10.08.36.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 08:36:05 -0700 (PDT)
Message-ID: <ab5c2a6d-6819-48eb-a3c5-178fa37204bb@linaro.org>
Date: Mon, 10 Jun 2024 16:36:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] ASoC: qcom: display port changes
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: broonie@kernel.org, perex@perex.cz, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, krzk+dt@kernel.org
References: <20240606104922.114229-1-srinivas.kandagatla@linaro.org>
 <i6jwqycgywrq42u4km6pjppgvvhsbvuh7m6mzyqy2qcge32ihy@n3lrowkyouv2>
 <3ea05a12-27a8-46df-9fb3-28501404a399@linaro.org>
 <CAA8EJpqMk9vujHAmF+xSKBDzR1LM9w-M7a8vxcCkXey9VpHBhA@mail.gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: 
 <CAA8EJpqMk9vujHAmF+xSKBDzR1LM9w-M7a8vxcCkXey9VpHBhA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ETM3KCB7SRDW66FLQEQEUL72P27TUKNI
X-Message-ID-Hash: ETM3KCB7SRDW66FLQEQEUL72P27TUKNI
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ETM3KCB7SRDW66FLQEQEUL72P27TUKNI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 08/06/2024 15:56, Dmitry Baryshkov wrote:
> On Sat, 8 Jun 2024 at 12:12, Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
>>
>> Thanks Dmitry for testing this out.
>>
>> On 08/06/2024 03:23, Dmitry Baryshkov wrote:
>>> On Thu, Jun 06, 2024 at 11:49:18AM +0100, srinivas.kandagatla@linaro.org wrote:
>>>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>>>
>>>> This patchset adds support for.
>>>>       1. parse Display Port module tokens from ASoC topology
>>>>       2. add support to DP/HDMI Jack events.
>>>>       3. fixes a typo in function name in sm8250
>>>>
>>>> Verified these patches on X13s along with changes to tplg in
>>>> https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/tree/topic/x13s-dp?ref_type=heads
>>>> and ucm changes from https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/topic/x13s-dp
>>>>
>>>> x1e80100 is verified by Krzysztof with his changes in tplg
>>>>
>>>> https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/merge_requests/7/commits
>>>>
>>>> Thanks,
>>>> Srini
>>>>
>>>
>>> I have been testing this patchset on X13s, switching between speakers,
>>> connected and disconnected DP output.
>>>
>>
>> This series changed the Jack event names by removing HDMI string from it
>> as suggested, did you update the UCM to reflect this?
> 
> Yes, I did. The pipewire properly reports 'unconnected' state, but
> nothing stops user from selecting the unconnected device / verb.

No, the jack events should prevent that from happening. You should not 
see them in output devices in settings->Sound.


> 
>> I have pushed changes required to
>> https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/topic/x13s-dp
>>
...

>> kernel:
>> https://git.codelinaro.org/srinivas.kandagatla/linux/-/tree/dp/sc8280xp-6.10-rc1?ref_type=heads
>> ucm: https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/topic/x13s-dp
>> tplg:
>> https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/tree/topic/x13s-dp?ref_type=heads
>>
>>
>> with the above on my x13s, I can properly do switching between dp0,dp1
>> and speakers with no issues.
> 
> Have you tried switching to the unconnected sink? Starting the
> pipewire when the previously selected sink is now disconnected?
> 
>>
>> Can you try them?
> 
> Is the changing of the JACK names the only change in the UCM? compared
> to your previous version?

Yes.

> 
> I've used the following topology, fom the topology repo / x13s-dp branch
> 
> 5206af2e1915b8dba52da2e59fb5ebff audioreach-tplg.bin
> 
> 
> 
> 
