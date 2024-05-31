Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 068D18D5AAC
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2024 08:45:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0ED67F4;
	Fri, 31 May 2024 08:45:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0ED67F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717137944;
	bh=BCGsz3iZV2DrmSa/WUkiRfpcRISW7pinFjp8ivjl398=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MeXlWa3dQf8DWMc71ZnMRIGiv9vdEqcxB5KOfDr7F4WODAKwMEzFOiomuN2R+qrJW
	 NDWRz7oaX0L50zEHkuF6z0veUzkGvhySGwwSnhQ1d/aaaW413nJuJ30CVjUOd9WTu3
	 H0PESesKW/uruNCM/5DfMI3Nfu8SKASmg+byiWLo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54890F805C0; Fri, 31 May 2024 08:45:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED1F9F805BB;
	Fri, 31 May 2024 08:45:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55DEEF80149; Fri, 31 May 2024 08:44:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2655EF8003A
	for <alsa-devel@alsa-project.org>; Fri, 31 May 2024 08:44:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2655EF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=f5oK9S94
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-62a0849f8e5so15872367b3.2
        for <alsa-devel@alsa-project.org>;
 Thu, 30 May 2024 23:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717137886; x=1717742686;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rHvbYiipVOuDjYGCfTtKSuc1awi5eLZfdGsz5nVF2ZQ=;
        b=f5oK9S94n1qh9z51Z0J9RctoMn3VyTi4YImQ5XsD4tFpPoKY3TOf5rvKRUXES2ySKd
         1530XrV/MYVOIzR7lTzWrJBPhZQDkpVwmOuXrPoxgneh/tsznWB8b9tUSBo03DmhnmFS
         +vd2cIhsd8NnhzOJtB75KMBRu/gZ44hxhpQ5/TbEVR01DBiBb+6nK55AGm2yynte7eaR
         SuYuspTonnkTu2ivdykZU+TAgATIn+aRkE5etm+nrlVPfoN0nHU+tHFWde4smOURvJ6V
         xlgpZrdcuPTDxeOFJ0t7VHVIYFgr+TFTF/+IBdfx8pPBKuWWdJbyUb08hc5WIGWlg1E2
         VSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717137886; x=1717742686;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rHvbYiipVOuDjYGCfTtKSuc1awi5eLZfdGsz5nVF2ZQ=;
        b=LR2c7Jh9PfGeKOm7wckxRZA0FryZINESYt2Wl+5IvSiHq0Dh1aEBUHqOhxY2kza9U6
         TaoZabZPdrMo4cK/vKHIXrNiU/PYLWni5dZd2KeVU6T9IqdhzDQHpNHNSV4m1MNIiXWf
         MxT1DLSoD1x5lOw/U+kLV+yv/fUX3kwNriy7IRTVF3BO5geZ0xaMKVD4cU64NfStCya5
         PjfNZc89elR5oN3MCy/H7Oi3iwteksiUZ+X/lsc5dXFIfdda0Jq5E2sJdlgedoK/wt9g
         QP8jNgvi3VE2fbxTc8A1I/P4NYFceqgJBpG30SEuJY4VH/mnzF6VpLvNMwZDjYZAMLfo
         ls4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVH+L9va1ZKdMGcurYoDn/Pfazys/trp4TlnH57rqYnlwJfuu57h2fziQ1TtMH6G5SjsIrrdYSUE9jGXfcWfI7z9gDR17fBOv8f1cI=
X-Gm-Message-State: AOJu0YyCt18kMz62vhpDHn+x9N6AQ5Ln1ldOkxhRzBHSS+/JNnbTcFjE
	1rwMkFK11owdPvriJZfbxkRnMC9YecqBpOrENbFjCgZPjOowICQbt1rg8CoEDrg=
X-Google-Smtp-Source: 
 AGHT+IEbplcJjnkF9ceT4BZITDuJNgu2aEsuEwyLLAkBCdRRYbtUcF8wWEdP4XOrGo4ERPlrSMTPQw==
X-Received: by 2002:a81:ed0d:0:b0:609:ff2d:1814 with SMTP id
 00721157ae682-62c797fd91emr8919517b3.37.1717137885591;
        Thu, 30 May 2024 23:44:45 -0700 (PDT)
Received: from [192.168.86.191] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 af79cd13be357-794f2f042dasm39390285a.22.2024.05.30.23.44.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 23:44:45 -0700 (PDT)
Message-ID: <87e109a7-2088-42f7-b8c1-fb549fe3e377@linaro.org>
Date: Fri, 31 May 2024 07:44:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] ASoC: qcom: common: add Display port Jack function
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, broonie@kernel.org, perex@perex.cz,
 tiwai@suse.com, lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20240422134354.89291-1-srinivas.kandagatla@linaro.org>
 <20240422134354.89291-3-srinivas.kandagatla@linaro.org>
 <ZiejT5yddioQ8upR@hovoldconsulting.com>
 <b9d0e2fd-069c-439c-a85f-1e99bf9018c3@linaro.org>
 <Zi-0kSU6TMcev05r@hovoldconsulting.com>
 <a980d7a5-0d80-4ff1-93e1-b5f5806980c3@linaro.org>
 <Zlj_4IuZqnC3gESL@eriador.lumag.spb.ru>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <Zlj_4IuZqnC3gESL@eriador.lumag.spb.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: OY7TFAGIHCORUKYV5344AR7TN7ZKHYD7
X-Message-ID-Hash: OY7TFAGIHCORUKYV5344AR7TN7ZKHYD7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OY7TFAGIHCORUKYV5344AR7TN7ZKHYD7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 30/05/2024 23:38, Dmitry Baryshkov wrote:
>>> It will always be DP out of the machine even if an adapter can convert
>>> to HDMI internally.
>>>
>>> The DRM ports are called "DP-1" and "DP-2" so it seems we should match
>>> that.
>>>
>>>> This is the most common naming for the USB-C DP/HDMI jack events.
>>> It looks like some Intel machines use names like "HDMI/DP, pcm=%d Jack"
>>> (with a pcm device number), but we also have "DP Jack". Not sure which
>>> are are used with USB-C, though. (Or if the former actually support HDMI
>>> altmode.)
>> I checked this on my machine which has usb-c and I can confirm using HDMI/DP
>> naming for these jack.
>>
>> Either way I don't mind having any names, but my point here is to be more
>> consistent across.
> I fear it is till not consistent. On the Intel laptop I see following
> jacks:
> 
> numid=18,iface=CARD,name='HDMI/DP,pcm=3 Jack'
> numid=24,iface=CARD,name='HDMI/DP,pcm=7 Jack'
> numid=30,iface=CARD,name='HDMI/DP,pcm=8 Jack'
> 
> On the other hand Mediatek and RockChip use just 'DP Jack'.
> 
> I'd suggest settling on the latter option. We are closer to MTK and
> RockChip rather than Intel.
that is fine with me.

> 
> BTW: a platform can easily have 4 (x1e8100) or even 8 (sc8280xp) DP
> outputs. Could you please point out why there are just 3 jacks?
The CRD platform that I have access to has 3 ports which is why I 
started with 3 ports, but we can add more ports as and when we can 
really test them.

--srini
