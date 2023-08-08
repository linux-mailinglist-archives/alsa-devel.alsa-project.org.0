Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC917739BF
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 12:43:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4633E9A;
	Tue,  8 Aug 2023 12:42:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4633E9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691491398;
	bh=pwk12Y2B92/p4aZYIv+pc5hmbFEsaTvt7e0yWIKQ/90=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iOBZr8rIRk1ANFePrOAnIBlo0OyXm7mrfUgLcZH/gPbDODrv58DLOAlxncqsAIRF3
	 1i5zsCG8R2m40iaenrTEr5Rs99Uo5fsGlg8U91syT92dLF8qm/a2hHKIyLY42P6J0A
	 EF+4v12VjKpBAOT6a1DsF3NM0fuMPaFlNk87iwF8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFEE3F806A9; Tue,  8 Aug 2023 12:36:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EAB85F8069E;
	Tue,  8 Aug 2023 12:36:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8F42F8016D; Tue,  8 Aug 2023 09:49:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 87BABF80087
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 09:49:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87BABF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=daynix-com.20221208.gappssmtp.com
 header.i=@daynix-com.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=RWFHIcHa
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1bc8a2f71eeso589965ad.0
        for <alsa-devel@alsa-project.org>;
 Tue, 08 Aug 2023 00:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1691480946;
 x=1692085746;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oqa2rz3uz/mytEi+k5RXx0Vu4GvvDI70ZcmBN+bwj7w=;
        b=RWFHIcHal00Ac7i9KkPraExSAHQvEplHXsew8CgzLH+QGnAatdYUNgaH9xydAdaFoB
         NjAfzBe4LkSY0U/XpXVT6rV/IlBVOLs7Rj34PtnF7HhQ87zVcakrW5LprPGmBF/VLY4J
         OoPlozAaik+xdul5DPQCQtQ5/3cPUdkI2Y8Ku2tNXUltgNdbxlL/WLwmkX8mQeEfjCcv
         yQ4lrCGRi1a+L/YZmSNgQqhD9sUy9RquQb3cPHhr8wZwUfOWHExKXIfkr0RhxINAQPVU
         zDm2ZfyJvd3cxE/BhzVopJeeVwrzWhSIb3FhatoxCPTOnePRK+y392n9JT/6wtsNilZs
         oBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691480946; x=1692085746;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oqa2rz3uz/mytEi+k5RXx0Vu4GvvDI70ZcmBN+bwj7w=;
        b=BMmNXZmNG+rCASSYeEXxaie5z9viV9Nhz6/YTKkhHobCTy/cTWUdJMsQJxWcKLaH0V
         TYgm48slgTBTwP0wZK0YqP9FTLTOTFtpjsMH3flg9DTPYfFlYgKh7cewHzdWFZSnHeyO
         H4xcH3a6fv97GBebsI9nC4qgzmEuCNiTtu3Wl7fe0wMApJEKizYwq8+y3BJpYzawP1UT
         GFL9+cemSETUCqR1TsmU3RES6ardP8/UOdKBFFzI2T4Vyu3ThWtu5KvfU2hURl2jfjOg
         xUB4iMwGLniRj/PPx+aBoPyB2RwGjOtw+G8GuuH7wGtH4B9NRI86qzxMRlSgLpbWzkEK
         JK3g==
X-Gm-Message-State: AOJu0YxmGe4JwbFCo6OlgnnWvWGgC2KGsrmJ69QPjrCGgsH0JTF6CmLb
	z6jJ81htTldRE8bM4U4Srz4H2A==
X-Google-Smtp-Source: 
 AGHT+IFufKLdffur63lJtwd7othy2JUIo3PkP6vkkFnMc+2X7aJvW+HRXR91TsU1UPsl6ar7TJziyA==
X-Received: by 2002:a17:902:d48c:b0:1bc:1df2:4c07 with SMTP id
 c12-20020a170902d48c00b001bc1df24c07mr12074543plg.63.1691480946230;
        Tue, 08 Aug 2023 00:49:06 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id
 a7-20020a170902ecc700b001bba7aab822sm8261067plh.5.2023.08.08.00.49.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 00:49:06 -0700 (PDT)
Message-ID: <4a0827fd-5e22-4ecb-a451-ec9aa6476649@daynix.com>
Date: Tue, 8 Aug 2023 16:49:02 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/27] ASoC: amd: acp3x-rt5682-max9836: Map missing jack
 kcontrols
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>, alsa-devel@alsa-project.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>
References: <20230802175737.263412-1-alpernebiyasak@gmail.com>
 <20230802175737.263412-5-alpernebiyasak@gmail.com>
 <1add0731-8e3b-438a-88b0-3334d8b35dee@daynix.com>
In-Reply-To: <1add0731-8e3b-438a-88b0-3334d8b35dee@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: akihiko.odaki@daynix.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ENQJLME63VYYSG6QXZBJEB7NGCIOY3IJ
X-Message-ID-Hash: ENQJLME63VYYSG6QXZBJEB7NGCIOY3IJ
X-Mailman-Approved-At: Tue, 08 Aug 2023 10:36:35 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ENQJLME63VYYSG6QXZBJEB7NGCIOY3IJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023/08/08 16:47, Akihiko Odaki wrote:
> On 2023/08/03 2:57, Alper Nebi Yasak wrote:
>> This driver does not properly map jack pins to kcontrols that PulseAudio
>> and PipeWire need to handle jack detection events. The RT5682, RT1015
>> and RT1015p codecs used here can detect Headphone and Headset Mic
>> connections. Expose the former two to userspace as kcontrols.
>>
>> Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
> 
> Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
