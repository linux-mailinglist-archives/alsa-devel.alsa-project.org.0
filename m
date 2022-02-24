Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A843B4C3115
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 17:14:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15D9D1ADD;
	Thu, 24 Feb 2022 17:13:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15D9D1ADD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645719288;
	bh=WRIxzY4IIJI8DbiZxM/tgWRuUrVG3yPzGrNNtqrk0rs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ohK2u0Ol+YMceyG8QX6e9TcRauMvWQurqpW9O21aAnj/uRtDVbL8LgP0GdsTHsYbt
	 oaeh7ioPd1MN68DLe0VBpRSdursucxP0kvvxi4ZeaMoi8trMNOxUxuyUJvtdFvrLol
	 qrtJ24tLHoa0DjP6E1CAPBGNF4b5YMPQtMqmKwpU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABCE9F80430;
	Thu, 24 Feb 2022 17:13:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66714F80118; Thu, 24 Feb 2022 17:13:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C91BF80118
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 17:13:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C91BF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Hro208Z3"
Received: by mail-wm1-x32e.google.com with SMTP id y5so181233wmi.0
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 08:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=W/wmNqvkNRKH1gO1S389jk2HIm35cz9EGXNpcHB0DIw=;
 b=Hro208Z3aTFu4uq3IemoXRfv9uG8o6r64rEL3skqs/rcSF7CEzlLjJ73MPe3jm5Z50
 WPw3iBw2EDggDxPD1+HcOMFYvXrpTBTOXFh5AshPxXQYW+6qzmn9lshNUaGxbLuT3VYf
 Z4N+L2buLPNjKsnIig87LGN+SJdmrVkuB1/PcrudJpmemlt4rHgWXTRpKa6bEqLNnvi7
 DxuPgAbNT7dUTLmclbXQyjP2tergdmgMTtCauV2Mewm/SsdWCW0ddGKlB93sQUBeiAfb
 DY3hVaI69u5wRZWAkT0zP78dJ6bCmhyvFU8mdkvXqGs25Umps1y0iIX6Y3jBVYQ+Hkuq
 gkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=W/wmNqvkNRKH1gO1S389jk2HIm35cz9EGXNpcHB0DIw=;
 b=j04388SuoyZ/1gjOGCbgfUI3g5yxLrEqfZMCFknDuAggDP8hxUOkInDClVntDPwed5
 62xfmljqFCvdJYTvrLOarXt4G/6/aayiiksLkrB9ySxPDdmvsvLElSoiJuJFFSq1dmZw
 erxqn/R4eZrZy/rQE5eVM9iCKZ/ukRaFWIkYuJD2vF+kTQgd5krIv+MxKjPH2WBSSpED
 xZTFfLJp8qy52f6UUhLASQNPeHKzHUWyUR5I/hYCSpGfA7kvJjRI/XaEe0pvIwDw3qkJ
 GiA8Fku2HUN+gXwUxuUhPAt6PfctICtOeDkXHhO/11fRD+77hk8jFQOGHvpMMWZFFshn
 MsGw==
X-Gm-Message-State: AOAM531W0C7alGkHpJxdo0L7TTn0gHAttpx8IQlOphC/ltS/61VSb0q+
 BEYKBWeaTgTR8gPgVsfEeHN6hQ==
X-Google-Smtp-Source: ABdhPJycgDD4wf4+Jat3ytqdbVZMHMqtnqYtKyvBtzcPa4Jss3218ejv9wuDW+5LgxXrwkLvLHPi9w==
X-Received: by 2002:a05:600c:35d1:b0:37c:d45c:af57 with SMTP id
 r17-20020a05600c35d100b0037cd45caf57mr12201121wmq.149.1645719231791; 
 Thu, 24 Feb 2022 08:13:51 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 az21sm3051490wrb.111.2022.02.24.08.13.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 08:13:51 -0800 (PST)
Message-ID: <86253ac7-ef06-974e-9b2d-6575ad5b7195@linaro.org>
Date: Thu, 24 Feb 2022 16:13:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 14/16] ASoC: codecs: wsa881x: add runtime pm support
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
References: <20220224111718.6264-1-srinivas.kandagatla@linaro.org>
 <20220224111718.6264-15-srinivas.kandagatla@linaro.org>
 <522ab282-ecc2-4186-2d77-f6241e255109@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <522ab282-ecc2-4186-2d77-f6241e255109@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, quic_srivasam@quicinc.com
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



On 24/02/2022 15:29, Pierre-Louis Bossart wrote:
> 
> 
> On 2/24/22 05:17, Srinivas Kandagatla wrote:
>> WSA881x codecs can not cope up with clk stop and requires a full reset after suspend.
>> WSA SoundWire Controller connected to this instances do a full soft reset on suspend.
> 
> is it the manager or peripheral that cannot cope with clock stop?
> 
>> @@ -1124,6 +1136,7 @@ static int wsa881x_probe(struct sdw_slave *pdev,
>>   	pdev->prop.sink_ports = GENMASK(WSA881X_MAX_SWR_PORTS, 0);
>>   	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;
>>   	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
>> +	pdev->prop.simple_clk_stop_capable = true;
> 
> here it's pretty clear the peripheral is capable of supporting clock
> stop, no?
> 
> Something's not clear between the commit message and the code.
True, This should be removed along with attempting to call clock stop 
functions from WSA SoundWire controller suspend that does not support 
clock stop.

--srini
