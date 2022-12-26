Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32683656293
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Dec 2022 13:29:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9335E6038;
	Mon, 26 Dec 2022 13:28:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9335E6038
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672057774;
	bh=k/rTNjA4h1zilOkfKIJ30N4Cd8KTHgFNcT0W1vl9YFs=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pitIVkh/QW/d1hTOuYv4BYCqX1ClF6TzTxOUBEFl2l1Li1ScKUROUKg6T9g/u/Ua1
	 NnPeAFGA/2ojTB8mF4WPumqkEDFNr/jjiDcozDE1BfR6/n7r0PSBsGWpEC2UkdSa5j
	 3QP8k/2LXxSlJhAU3S5Difx5kEvLZKvUjtAWdiKQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E8CBF80310;
	Mon, 26 Dec 2022 13:28:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15C96F802A0; Mon, 26 Dec 2022 13:28:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B521CF800F0
 for <alsa-devel@alsa-project.org>; Mon, 26 Dec 2022 13:28:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B521CF800F0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=EGt0tVqC
Received: by mail-lf1-x12f.google.com with SMTP id p36so15743248lfa.12
 for <alsa-devel@alsa-project.org>; Mon, 26 Dec 2022 04:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o9VsUfbXpnBl5i0jqV0GHVfHb2fzN94uWi/WF4L80bQ=;
 b=EGt0tVqCcxNMIPHFjFmmSJmtfepupOLGU6WfTr20N1cfbTWvjad6h6ZyUMyzbXS0dO
 JwBOXpGJdV3w+qcgu5Rtn5uwfbndTK2SGADbeGhlzTuVf7uZXZEx8VcwS+kZjHfqtDIP
 0tWkhL8h3pGUklT9nVvyHj4zjSRCy5xxV+pU7mEF8fHn8n2Pzbx/vNAJUk9eKyE4MOv6
 /ROyOZvwmpzEkhxUOBbEQKal3v1MhUJFVTJoQnI2Ek26xL8C3MZk9lT2MbSWWw3qhtGc
 hcLQCFFEXXWcAowwQGVoYha+nXJpA+xlunoGYxSaFci2gOGQuDyynfLOtalsc1HLCyM3
 GllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o9VsUfbXpnBl5i0jqV0GHVfHb2fzN94uWi/WF4L80bQ=;
 b=Cf4KdHhSUpUNQ8DX1tMZ9ZbAyIXbGlCCZh+rzJ3MVJ4K+FWtjLImvAzdoPQmJ6bPPv
 nwYM5ITKut7xA61cw5SPhC2fpHuDIAde3D7oOm5vozUqYw92NTUgb4ygMGMpoKGE2Mxp
 dWAAbFPmwmxouED9c5bdENGUeGcxxSKOfPu/AgG2iGRYa86ZfU+cCQ+B3GEkdzFHUjHR
 d8tXyIgBHOq5krEcm8uh6DlTkGRqGYfcxC1pO5u2XxWQA6X3wgG/3ED6pwt44C7AyraD
 l3Rh7VYClOQzMyOavgwfYO/blyrw3qW+MkTRtXfif4S2Pr+3vPPMceM38ERXKRD17AGE
 gmdQ==
X-Gm-Message-State: AFqh2kobgNxjXbmYFEdROW+Cp6ENh0TBl1M8ZVlx4OiwbjkGlQrpZfE1
 302YrVJnwZV5wCn1VwEPfOm8Dg==
X-Google-Smtp-Source: AMrXdXt+SG75PQYPAqAyfLTtW57mlbWYpcItg3HmguNy4OAxCp6Z8zw35YRYWDPCc637ckI/5JBHRQ==
X-Received: by 2002:a05:6512:6d0:b0:4b5:d:efb2 with SMTP id
 u16-20020a05651206d000b004b5000defb2mr5311841lff.14.1672057708771; 
 Mon, 26 Dec 2022 04:28:28 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 a11-20020ac25e6b000000b004cafd013f54sm1174058lfr.118.2022.12.26.04.28.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Dec 2022 04:28:28 -0800 (PST)
Message-ID: <9e93a28b-c735-5250-34d0-9b41c0f488b5@linaro.org>
Date: Mon, 26 Dec 2022 13:28:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 08/14] usb: dwc3: Add DT parameter to specify maximum
 number of interrupters
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-9-quic_wcheng@quicinc.com>
 <CAA8EJppsK=L69AaBgj=MzWp-ess3NSn=gPYf8-3QtJVqEVqGzw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAA8EJppsK=L69AaBgj=MzWp-ess3NSn=gPYf8-3QtJVqEVqGzw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-usb@vger.kernel.org, bgoswami@quicinc.com,
 mathias.nyman@intel.com, gregkh@linuxfoundation.org, andersson@kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, agross@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Thinh.Nguyen@synopsys.com,
 quic_plai@quicinc.com, linux-kernel@vger.kernel.org, quic_jackp@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 24/12/2022 12:13, Dmitry Baryshkov wrote:
>> @@ -1468,6 +1469,9 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>>          */
>>         tx_fifo_resize_max_num = 6;
>>
>> +       /* default to a single XHCI interrupter */
>> +       num_hc_interrupters = 1;
>> +
>>         dwc->maximum_speed = usb_get_maximum_speed(dev);
>>         dwc->max_ssp_rate = usb_get_maximum_ssp_rate(dev);
>>         dwc->dr_mode = usb_get_dr_mode(dev);
>> @@ -1511,6 +1515,12 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>>                                 &tx_thr_num_pkt_prd);
>>         device_property_read_u8(dev, "snps,tx-max-burst-prd",
>>                                 &tx_max_burst_prd);
>> +       device_property_read_u8(dev, "snps,num-hc-interrupters",
>> +                               &num_hc_interrupters);
> 
> bindings change?

Undocumented bindings change :(

Best regards,
Krzysztof

