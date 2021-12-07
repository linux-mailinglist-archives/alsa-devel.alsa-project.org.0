Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7EA46BD45
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 15:08:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3B7E2408;
	Tue,  7 Dec 2021 15:08:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3B7E2408
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638886130;
	bh=FhHnBUorGI3UlWv6ghrIOPWqekPCm4U3aWF5L56gpN4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QZVewnol2gK+2Urnrkf2Q7Yl39UHIyYOygZr9Mba47XCDy1i3ZCCx2swIo53JI8Bp
	 gz9zyHiGO691j5R+RJC/eM5wzojtGMVAgV0Y3ADNQ81qqvizGMoJVLeFcpW8WCbIIB
	 MV6AIffk8jcRuJ06FxZcmiKu0NsU4v41DaMA5GkM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21681F8032B;
	Tue,  7 Dec 2021 15:07:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDF51F8028D; Tue,  7 Dec 2021 15:07:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B2B5F80217
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 15:07:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B2B5F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="X7Mow1MF"
Received: by mail-lj1-x233.google.com with SMTP id i63so27662426lji.3
 for <alsa-devel@alsa-project.org>; Tue, 07 Dec 2021 06:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lJQIRwsjkZEXbwzLzd39gaDLY4c1jN1Jzr2fT+gRzoo=;
 b=X7Mow1MF701sh2MYATVC08oUkjkjDSSqzKXJkkm6TbgcqHm3IbYo9egi0QSjkeMpfN
 pCGLJqoULwaYTH0LVdkY5GIJYwwTdEnTi/7JOJNem+J7g4iNfXlukqVnniIsbaOi6KKY
 uUD5DZlhYDmILqLOGiTfKTxSj9HECq+cjSg2rWKNUr73r4MDU7zPPhJp50/r9hHpDRUQ
 fYnYgtnlVj8vfox/oql6GQppDOR13j0OQotbXt2r3lyXLMvdza/PcQ00AV4gKoqV2y8V
 zP7p0KPUrHQ8PlFJOnBxI+ArYzc23zLgo/hl9ecHbz4oeJ1cEMVnpR6p/nSpDqnDjhhB
 cX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lJQIRwsjkZEXbwzLzd39gaDLY4c1jN1Jzr2fT+gRzoo=;
 b=ahTZGx/xr++aALMx4pXNteQNLgGd6/P9ZA1BNitLtpVmkagPBUXUjWaf86ku54p3rP
 1Y+Sj5WL9kFPRmG2oYtE83n/N1ZwZ5u/Mm5RaSCEMjSngWuWooe2TU8wEOvGF5oeOtFG
 nGnbtfKpv2YsAQohjecRza6TAySH/0W2PXX00cGizEoNhFIXnU9gBj07klIbRdIlS6Ne
 ZP3yEv7vs1ydhYwoPKgb2L31goFsxiglVUOyZ+wqtneOu6HJTg3+u+e9waPN0D6nc0KY
 FihlRl6+7rp4AM+oN7lqQq7yEpq0BwFRaXt6vSVVdNVJUPiZtIkYjjQCth2/FMsEQV88
 mAMg==
X-Gm-Message-State: AOAM5336OzaRMxPgKb1QGkB8v6IGZ5aqt5a7dOG/zQZgvh3MUljwqTkn
 aKqmCIuwYm0z3cwuGeBoR/k=
X-Google-Smtp-Source: ABdhPJwzhtGd5aUdaqo36sCrgV4k2hE+7JskRwIN6JedpeQyMg15GdGn3ThfyMrWgn9Gl+WryPjQ5A==
X-Received: by 2002:a2e:9bd4:: with SMTP id w20mr42417463ljj.69.1638886047429; 
 Tue, 07 Dec 2021 06:07:27 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id a7sm1697292lfi.149.2021.12.07.06.07.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 06:07:26 -0800 (PST)
Subject: Re: [PATCH 1/3] ALSA: hda/tegra: Skip reset on BPMP devices
To: Sameer Pujar <spujar@nvidia.com>, tiwai@suse.com, broonie@kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, thierry.reding@gmail.com,
 perex@perex.cz
References: <1638858770-22594-1-git-send-email-spujar@nvidia.com>
 <1638858770-22594-2-git-send-email-spujar@nvidia.com>
 <7742adae-cdbe-a9ea-2cef-f63363298d73@gmail.com>
 <8fd704d9-43ce-e34a-a3c0-b48381ef0cd8@nvidia.com>
 <56bb43b6-8d72-b1de-4402-a2cb31707bd9@gmail.com>
 <4855e9c4-e4c2-528b-c9ad-2be7209dc62a@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5d441571-c1c2-5433-729f-86d6396c2853@gmail.com>
Date: Tue, 7 Dec 2021 17:07:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <4855e9c4-e4c2-528b-c9ad-2be7209dc62a@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org, Mohan Kumar <mkumard@nvidia.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

07.12.2021 15:40, Sameer Pujar пишет:
> 
> 
> On 12/7/2021 5:35 PM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 07.12.2021 15:00, Sameer Pujar пишет:
>>>
>>> On 12/7/2021 3:52 PM, Dmitry Osipenko wrote:
>>>> 07.12.2021 09:32, Sameer Pujar пишет:
>>>>> HDA regression is recently reported on Tegra194 based platforms.
>>>>> This happens because "hda2codec_2x" reset does not really exist
>>>>> in Tegra194 and it causes probe failure. All the HDA based audio
>>>>> tests fail at the moment. This underlying issue is exposed by
>>>>> commit c045ceb5a145 ("reset: tegra-bpmp: Handle errors in BPMP
>>>>> response") which now checks return code of BPMP command response.
>>>>>
>>>>> The failure can be fixed by avoiding above reset in the driver,
>>>>> but the explicit reset is not necessary for Tegra devices which
>>>>> depend on BPMP. On such devices, BPMP ensures reset application
>>>>> during unpowergate calls. Hence skip reset on these devices
>>>>> which is applicable for Tegra186 and later.
>>>> The power domain is shared with the display, AFAICS. The point of reset
>>>> is to bring h/w into predictable state. It doesn't make sense to me to
>>>> skip the reset.
>>> Yes the power-domain is shared with display. As mentioned above,
>>> explicit reset in driver is not really necessary since BPMP is already
>>> doing it during unpowergate stage. So the h/w is already ensured to be
>>> in a good state.
>> If you'll reload the driver module, then h/w won't be reset.
> 
> How the reload case would be different? Can you please specify more
> details if you are referring to a particular scenario?

You have a shared power domain. Since power domain can be turned off
only when nobody keeps domain turned on, you now making reset of HDA
controller dependent on the state of display driver. Do you want to have
inconsistent h/w reset behaviour depending on the runtime state of
display driver?
