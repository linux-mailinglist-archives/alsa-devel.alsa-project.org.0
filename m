Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F9569F721
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 15:51:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C227E82;
	Wed, 22 Feb 2023 15:50:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C227E82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677077490;
	bh=XvtkjapvB5aMHULzEH4NQsRU8lRUmpJHM4AhDlzj2ko=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ejuRX5alizC/rqtuoZLhWRkndmbpr2Ue8x2nA4U3+dvA3xpyGuWEbRrFx5eX4Psb8
	 L/+u51dVXtwx6sWwbK6/rNobHUsgpCnkmzN8rqhlYVis5eTT0x9tFXkDWoFOaz3vDZ
	 n8p75e01kIv9m89mDgaywyp5u6jPVWnySB6af2p4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BFB10F80083;
	Wed, 22 Feb 2023 15:50:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8692FF80266; Wed, 22 Feb 2023 15:50:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8494FF80083
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 15:50:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8494FF80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=VrX7QMEX
Received: by mail-wr1-x435.google.com with SMTP id t13so7929468wrv.13
        for <alsa-devel@alsa-project.org>;
 Wed, 22 Feb 2023 06:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2m0OKl4nW18kj3TpHqbzbDOvreek3tUnpMdCqgRNLUY=;
        b=VrX7QMEXYkklpuE/QmGcyM+XfZWgdCI6waWCn1IxTVFKfbrjRmBANQ6aupUg2Inyq4
         DlzPZFUgUjfOeGCdWQhU8oaKucowRbPPfxMzVCEW2YDoMmcRWcURQT7sorS486CJG5Nn
         SJl+dQ7BXA53fSPdTpidQwoPr8vs8AcGbbKOGVuv7+62H/sCfca9i3zL4X/ajs2AycfT
         ehEhAosIfas8y4KltM6h0mLijHcYZWvpSedP06ponR1T0mlE8fmMakodzEun3mrtbsPS
         TAB+Ol3GbEM5nEQSSPwwkp0gYNZIlusPrU0JnWtizWLjlZH89iutosstOCVCJbJChqHd
         wM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2m0OKl4nW18kj3TpHqbzbDOvreek3tUnpMdCqgRNLUY=;
        b=L+C1Ue0esX0sXgtXm7FCRxP2sm+eyAHwvlQ7crsqQfQqvrSxYr4xmkwnovOSJ7E+S2
         oAuzZvrsUL07TuBwiBZ2nwMEbxTYj/GsQ04LVTOhOrzBpwVj8Hl35b6cmIH8zhYGbpLl
         moTLLL8qGc6cojfvEVGmDF0e4Syy5Fhhxaq3evzdIaaOTwA+WhcFFS6HRFAT0BrERYoY
         6My89OY2eqxu8wyxfnqc3OdiKj38Iw1YmNE2WWKg+pBvGUSmaMQJCo5RthSBUalSwmEf
         VEQ09b/S+8y/vMjKXdNnx38CQVyF95szlxHPjpZe/VI+1JWz2oi0lONeNpv+JsxjeHB5
         K2/g==
X-Gm-Message-State: AO0yUKWeVHMye2zuZBHUjLvID3vcNv2EBolIO+UKda0htXmyULJYVyjF
	fSWAnL5YdBARLvsrRQ5+WHCsTA==
X-Google-Smtp-Source: 
 AK7set8Xepbg4AmGPsxdF+FrCpHM2/HH2gMe8NzmWtaFsw7m9Ami5hXizGd4NMJ464FvfP8WDb+HnA==
X-Received: by 2002:a05:6000:3c8:b0:2c5:540b:886c with SMTP id
 b8-20020a05600003c800b002c5540b886cmr7004009wrg.31.1677077431804;
        Wed, 22 Feb 2023 06:50:31 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 o1-20020a5d58c1000000b002c53f5b13f9sm8483402wrf.0.2023.02.22.06.50.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 06:50:31 -0800 (PST)
Message-ID: <80339c7f-1cea-3c97-7dc4-5efb4597cb69@linaro.org>
Date: Wed, 22 Feb 2023 15:50:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] soundwire: qcom: gracefully handle too many ports in
 DT
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20230222144412.237832-1-krzysztof.kozlowski@linaro.org>
 <20230222144412.237832-2-krzysztof.kozlowski@linaro.org>
 <dc544641-b9f1-96b4-95a1-30fafc0712e5@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <dc544641-b9f1-96b4-95a1-30fafc0712e5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: WGZY6X7MF5F2YKAVL3C2KSGBHLFK5RVW
X-Message-ID-Hash: WGZY6X7MF5F2YKAVL3C2KSGBHLFK5RVW
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WGZY6X7MF5F2YKAVL3C2KSGBHLFK5RVW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 22/02/2023 15:47, Konrad Dybcio wrote:
> 
> 
> On 22.02.2023 15:44, Krzysztof Kozlowski wrote:
>> There are two issues related to the number of ports coming from
>> Devicetree when exceeding in total QCOM_SDW_MAX_PORTS.  Both lead to
>> incorrect memory accesses:
>> 1. With DTS having too big value of input or output ports, the driver,
>>    when copying port parameters from local/stack arrays into 'pconfig'
>>    array in 'struct qcom_swrm_ctrl', will iterate over their sizes.
>>
>> 2. If DTS also has too many parameters for these ports (e.g.
>>    qcom,ports-sinterval-low), the driver will overflow buffers on the
>>    stack when reading these properties from DTS.
>>
>> Add a sanity check so incorrect DTS will not cause kernel memory
>> corruption.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
> Fixes: 02efb49aa805 ("soundwire: qcom: add support for SoundWire controller")

Can be... but is it really a bug of the kernel? Issue is visible with
incorrect DTS and it's not the kernel's job to fix it. If DTS has
incorrect values (e.g. IO addresses) system won't work anyway and that's
the same type of bug.

Best regards,
Krzysztof

