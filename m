Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C626E9B1D
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 19:52:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 726CCEAC;
	Thu, 20 Apr 2023 19:51:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 726CCEAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682013154;
	bh=xlGO1V9kqLhALk0dBfG3DCCBH+snM5AdhdHSRXhEsLQ=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nKCD/4wuJlpaKurkeY2ynAY/LogL3F1/VpcPFY3QWvwjQaWPFXm/VJEPWuX4V1Rl7
	 EBPS38dAQdh9y6iz+VJEeZ8onRFfcWBB5xo/1zCGgBkC2CAU4MG4Ufsphqh9ulM/ZN
	 d6szoEDYF+ZrtA29R1IOLwH1I4L6u2fxSHJ2LNl0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D328EF80149;
	Thu, 20 Apr 2023 19:51:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B03CF80155; Thu, 20 Apr 2023 19:51:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 40046F800AC
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 19:51:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40046F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=JKBU1FqU
Received: by mail-ej1-x62a.google.com with SMTP id c9so8317627ejz.1
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Apr 2023 10:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682013089; x=1684605089;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RsvcKdpTTSQt3CBjI9jdoU//lRtwKP24jIO2BHiLPgg=;
        b=JKBU1FqU+5DnsS9Xyo9UClySwykWt0bSYLl+ZdusaY6eLCtFI7YK/vpxIZAWFZ7qZU
         UESpMayo5PdTbkwYIaP3n51WvCTUO4cErDJ4jy8e1G5FBGCydk5rQU0rLWgCMrVTs0DB
         dd0MexdGfzE80IQ/ctc6gfueZx4+0/WycIjBgRY8+x74+hB0/8QGrF7/7uDEqugPOAmZ
         CQQYdRwfEsL9qXDrkdOeRWEsp4bLyKaOLipm98vESEnKBnrQ5JfVJipiUDLEhfkVQiyj
         Hka8y504A89sbn+Kbi8rz09meJ+PEbp0OHiwiouXXMlEOyeoE1YLDaT0ocuHj43oUsLa
         MYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682013089; x=1684605089;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RsvcKdpTTSQt3CBjI9jdoU//lRtwKP24jIO2BHiLPgg=;
        b=aGtmMYgpfPZ3tZjDPfWO3gS0Gz/VrO6atp5e9yq5pEYgtl0XzazmLV0i3kJhUTgEuU
         02oP2zhFRm08R1SZSfTE1ZUwE5xyUU/oeu9jAuMJ3ZDKh67gYj+1RvQVwC4zU1bMXrEU
         rFGMpK+U3/Mwh9ndV1Tg9Ct9kREyg1GCNVlvpCAJw8RigOTygz9Igw1XJbbSdlsw83Uv
         iVeErrx+DtBxv1braC3N6pKLsxllmG0R1PoRyw8MOGnBn8tjrPTIrNPhld1cndFWqaR+
         x/xBXKUQcfVcWHiSD3rMuyihupukOYu20umLexiyrsmq8Fse/vVyLP2g4b9QIp3m99sR
         DgAw==
X-Gm-Message-State: AAQBX9fW8sVyWoLM6FQ/8z02EswVIwN1IAF0rJIIjCo+jypIrlbLOISb
	OhdE5Zd5OvmBLlegzINy/rsf/w==
X-Google-Smtp-Source: 
 AKy350bNdPXwDoc/0mMYA84/aQ76NYrnBevJSqgEx481vVvN7fe5BzSTRNvzQDtmsl/Q4NmeqIGVKg==
X-Received: by 2002:a17:906:d79a:b0:8e1:12b6:a8fc with SMTP id
 pj26-20020a170906d79a00b008e112b6a8fcmr2379364ejb.4.1682013089158;
        Thu, 20 Apr 2023 10:51:29 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bcb8:77e6:8f45:4771?
 ([2a02:810d:15c0:828:bcb8:77e6:8f45:4771])
        by smtp.gmail.com with ESMTPSA id
 lc21-20020a170906dff500b0094ef10eceb3sm945513ejc.185.2023.04.20.10.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 10:51:28 -0700 (PDT)
Message-ID: <94bbd608-a90b-605d-a61c-6d6769b60445@linaro.org>
Date: Thu, 20 Apr 2023 19:51:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/6] ASoC: wcd938x: switch to using gpiod API
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20230420101617.142225-1-krzysztof.kozlowski@linaro.org>
 <20230420101617.142225-2-krzysztof.kozlowski@linaro.org>
 <6b355201-a957-4fca-a513-d5fa0742fb40@sirena.org.uk>
 <fe6202ee-2552-8b5c-c2d5-f2f7042b901d@linaro.org>
 <d746ee5f-283d-44ce-b72c-18c8955d38b1@sirena.org.uk>
 <3eb0cbb4-f6d9-db8a-031e-92627e70f41e@linaro.org>
 <9942c3a9-51d1-4161-8871-f6ec696cb4db@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9942c3a9-51d1-4161-8871-f6ec696cb4db@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: BKBNAZPXQ7WG7NVBRL5YGUUQNXTK4XSY
X-Message-ID-Hash: BKBNAZPXQ7WG7NVBRL5YGUUQNXTK4XSY
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Patrick Lai <quic_plai@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BKBNAZPXQ7WG7NVBRL5YGUUQNXTK4XSY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 20/04/2023 18:28, Mark Brown wrote:
> On Thu, Apr 20, 2023 at 04:16:59PM +0200, Krzysztof Kozlowski wrote:
>> On 20/04/2023 15:00, Mark Brown wrote:
> 
>>> That's just upstream, what about any downstream users?
> 
>> Life of downstream. We all know the drill: merge your DTS or suffer. The
> 
> No, the DT is supposed to be an ABI.  

No, the DT bindings are the ABI. We are supposed not to break
user-space, but out-of-tree users of drivers are not ABI by itself.
Bindings are. If out-of-tree users make mistakes in their DTS and do not
want to upstream it, it's their choice but it does not come for free.

> The point in having a domain
> specific language with a compiler is to allow device trees to be
> distributed independently of the kernel.

When it is written incorrectly - wrong flag used for GPIO - there is no
requirement to support it.

>> I could rework this patch to provide backwards compatible solution like
>> I did for WSA:
>> https://lore.kernel.org/all/20230102114152.297305-4-krzysztof.kozlowski@linaro.org/
> 
> There we go...
> 
>>> We could handle inversions through an explicit property if that were
>>> needed, that would be a less problematic transition and clearer in the
>>> consumer code.
> 
>> I am not sure if it is worth. The DTS is supposed to describe hardware,
>> so even if reset pin flag was not effective, it is a mistake to describe
>> it as ACTIVE_HIGH. Do we care about keeping broken code happy? If yes,
>> then property is the way to go. If partially, then I can add
>> backwards-compatible approach like I mentioned above.
> 
> It's not just this individual transition, it's the whole thing with
> encoding the polarity of the signal at all - it's a layer of abstraction
> that feels like it introduces at least as many problems as it solves,
> and requiring configuration on every single system integration doesn't
> feel like the right choice in general.

Choosing appropriate flag for GPIO in DTS is not difficult. It was
skipped because we rarely cared in the drivers, but it should have been
chosen correctly. The same about interrupt flags. We had many DTS for
many times marking all possible interrupts as IRQ_TYPE_NONE. Did it
matter for many drivers and setups? No, was perfectly "fine". Is it
correct from DTS point of view. Also no.

Best regards,
Krzysztof

