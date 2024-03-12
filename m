Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92376878BD6
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Mar 2024 01:16:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0469B70;
	Tue, 12 Mar 2024 01:15:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0469B70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710202559;
	bh=rITI8OESR753/vefQ3L3VFR8tWQjBHYPqjT7mS4NSjQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BSVA1gneFnj7bnVydntPQgPyShvRMpK0ciBgdn09RCxidEOAX/5ae+Nf5KG3gTdWT
	 w2WH8BbkesU8oiqR3xlT0jm4iL24FMxxM9Wp8PRLcDNkqA465ipumiUYXloG8GwqSg
	 QnT2bNto+Dr1G/WLMP8tpE+sE3IRG/LuJu8Yck4A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48AC4F805AC; Tue, 12 Mar 2024 01:15:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C56D7F805A0;
	Tue, 12 Mar 2024 01:15:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AAB01F8028D; Tue, 12 Mar 2024 01:15:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 55851F800E4
	for <alsa-devel@alsa-project.org>; Tue, 12 Mar 2024 01:15:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55851F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=WSiAS7eF
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-513a6416058so2308339e87.1
        for <alsa-devel@alsa-project.org>;
 Mon, 11 Mar 2024 17:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710202516; x=1710807316;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Qkp8yJOuOQf9llDA8dXhEpB/c4pbLigp+bR+rYBnmE=;
        b=WSiAS7eF7ydkbbaPF+nrjXnHaOtlRwPViHP2LMOhFLFsp91LUoQPeguTyiPX3rE1wm
         oreCeMs52Nek+TXN+7EsKC/gWxwRa1drMx0JR0GEjaj69g+diqsxj2To1PcGLW0psj+V
         3ZUvEOMCWJuarhEO9c9lbIh9bvhHTOuvYRln4Flo3karUfXXO5Pf9PAbuKQ0ucsaFqnw
         w0mTlvwmYNR8IJd2TNbLUJK645lEUzZTysgzScct8s4R6ua+pbHQgCGUwtl7q2ItJHVR
         Nx4GI1zWB0B9b6voZg7DfxjgmIFLzJ//VACtMkOS18R9jL8PfnCVNPzLO/VcjSG8Ixi2
         fIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710202516; x=1710807316;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Qkp8yJOuOQf9llDA8dXhEpB/c4pbLigp+bR+rYBnmE=;
        b=o2pVjeYIRSTs4wmWEFGgFkZ55be26hIpMNit3ARINAFjn+Oor4hRoH7Fe8u8YhHrdP
         215BkHElyFEEqeLhbAYoAV5mfz1B8sypeXA6PTvan0IFFYDxtG5PtIfONjcH4wF29D51
         SpG9Mqtmud6635Lgg+dI0lmXSwBMWuk4bkpRCDzQt6P/+URAZsSFmZZk4etCrws/Fehv
         Yab6YakcE71wHuZ7+OzuftlbvonRN2ecQ+LR5+hn7sOI/ORqHeFQV9YqEgDVhtU4469A
         6ww693IVCpj+nuZFr2FfTthEXt+v/auxYYgRTooMfOCokdq9sqqm/spY7rmns7JndpgI
         zwtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMcIQWPlCHAqEySKU+Npih3XomqW6S8QJsljKs4euMIbZVU34IZCW3bR7vCV/1jbjZOLwqSKO0mnB0bl2/CUcRa7+4aIoEzJ7Sy5s=
X-Gm-Message-State: AOJu0Yxdjmr1gUjTTL2Wd5pd7zK1J/0x8oG1i+ANHGxvW42S3SZk4fKi
	GjBys6vld3OruLpXjoPV4X0XHSFHf4X2HUtfqKxxQFO8xd3i8b29+wejW2gIO2I=
X-Google-Smtp-Source: 
 AGHT+IEomKQ5UiV5kQrHnD4DnrPNCZy0DNRdIj4/L9aS6kAWvKFL4YQPwyqHTl77dD2YfiSgXyy0jA==
X-Received: by 2002:a05:6512:3456:b0:512:da79:91a with SMTP id
 j22-20020a056512345600b00512da79091amr4367597lfr.46.1710202515734;
        Mon, 11 Mar 2024 17:15:15 -0700 (PDT)
Received: from [172.30.205.61] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id
 t22-20020a195f16000000b00513a7962930sm807970lfb.89.2024.03.11.17.15.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 17:15:15 -0700 (PDT)
Message-ID: <6efba698-b9b7-41bf-84e3-849da99db45f@linaro.org>
Date: Tue, 12 Mar 2024 01:15:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] slimbus: qcom-ngd-ctrl: Reduce auto suspend delay
Content-Language: en-US
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>, andersson@kernel.org,
 srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc: quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
 quic_anupkulk@quicinc.com, quic_cchiluve@quicinc.com
References: <20240308124129.7833-1-quic_vdadhani@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240308124129.7833-1-quic_vdadhani@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LCKQISM5CPSGRDFJZVODZWBCCYRJQOSJ
X-Message-ID-Hash: LCKQISM5CPSGRDFJZVODZWBCCYRJQOSJ
X-MailFrom: konrad.dybcio@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LCKQISM5CPSGRDFJZVODZWBCCYRJQOSJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/8/24 13:41, Viken Dadhaniya wrote:
> Currently we have auto suspend delay of 1s which is
> very high and it takes long time to driver for runtime
> suspend after use case is done.
> 
> Hence to optimize runtime PM ops, reduce auto suspend
> delay to 100ms.
> 
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
