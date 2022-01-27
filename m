Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2225149DF19
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jan 2022 11:21:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BE401B0F;
	Thu, 27 Jan 2022 11:20:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BE401B0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643278884;
	bh=s7H13QyMZFPu8CRmmMbW0fSjPwlnx6TfRPKsrcEnjXs=;
	h=Date:From:Subject:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NDp1CIAhxp5qHJ6Uc9M509Z7r+ybys4lu3H01kE1M8OLnXo6yEahGeSdyRP4oXQAq
	 MRzFyu1iVO18EUGFu+GDD0ZsO4mi5+HLQc7SX0QHb/GgHehikDZPQR7jX+Pt6cqUgp
	 /RsulQ3TaqdseG7zzpo4nOSpPA9o7TtIfHLYixQ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1BF6F8025A;
	Thu, 27 Jan 2022 11:20:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62222F80254; Thu, 27 Jan 2022 11:20:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48FDBF800C9
 for <alsa-devel@alsa-project.org>; Thu, 27 Jan 2022 11:20:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48FDBF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="iL159WM4"
Received: by mail-wm1-x336.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso5553927wma.1
 for <alsa-devel@alsa-project.org>; Thu, 27 Jan 2022 02:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:from:subject:to:cc
 :references:content-language:in-reply-to:content-transfer-encoding;
 bh=w2Rs4mwi45xUoHXB6ktckbxGR2wA8oiVCenicr727qo=;
 b=iL159WM4h3CR1WEMSHsJUyvk7IWX2583+J0PELCP291Ze1ImSMNxNNkgzdSJdyzpuT
 XcgsxUMOch2n94FVcVd3nZk2Y80VNyKiSvKcozkvk9oNWQSp27nhFTjTz46DxPfnx45m
 yq1nvQ7FzzDC84FIBqC4LOimGsXasAQJC3Rvptc7qWw1BMB+3sSsiQgwbLDFiA9iI6/i
 Ec8vAXn1JX/zTar62kTOidCeSS0Geizt0ov4pPbxR8R9dsHKBcHFo6ks965te525X0S+
 wAeX0jINYcMgvaV/qsqQweCQa8Dg+hVv+ARMsFSiTJjiaftIChIu8l0HUDa65ULUMN8W
 I2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from
 :subject:to:cc:references:content-language:in-reply-to
 :content-transfer-encoding;
 bh=w2Rs4mwi45xUoHXB6ktckbxGR2wA8oiVCenicr727qo=;
 b=MowxBkUsxCH9GFOtz9X6WlCJd/KIbFY5U5yAUWF6wOtCkHwpM3CvxoqADwDqVyPxZz
 hIBhVehYbMjQMy1/SMRB7Wgr+8s7Cl4PEuofiDyqvZlS9urY/aiiXx57EsJDALcV6h88
 7YWnYi2YcwWu3gRRmONnRpGfLc7c5p+QAk8UTIp/mdwFB/oT6AknL7w3XyO/mIFLqGoP
 BJWUwabNdDFzWLUsmy6y+KbU938sWFa10jfbBNUL9qm6M87RewOggyJLmBakOOE0Go3g
 0dzbqRaoeXBvOYiQ2hV6z6SOYT398D5o5tX3I89MB/m5zkYHnSBhis7/nz6QoyPH9cy6
 H+WQ==
X-Gm-Message-State: AOAM5313ruR9R6n3K2g39FQcRxqBWSy24CEqS5bdmIksHoAO3C9sKzYh
 vaBNvcpEhy5p+y9eJZD9i2HYLA==
X-Google-Smtp-Source: ABdhPJwuNpjWEYC4SRjTDUdeHq+XZFr5+laKEEgp44okKUufaFdh35+Rg2dn5kFHO5duH7bcs0mLUg==
X-Received: by 2002:a1c:7c05:: with SMTP id x5mr2631809wmc.71.1643278811266;
 Thu, 27 Jan 2022 02:20:11 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id g5sm2251211wri.108.2022.01.27.02.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 02:20:10 -0800 (PST)
Message-ID: <bd870824-c171-85df-23d9-537a0c6e7036@linaro.org>
Date: Thu, 27 Jan 2022 10:20:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 0/4] ASoC: qcom: fixes for Qualcomm codecs and q6apm
To: Mark Brown <broonie@kernel.org>
References: <20220126113549.8853-1-srinivas.kandagatla@linaro.org>
 <YfFMsvoqrJLbw28Q@sirena.org.uk>
Content-Language: en-US
In-Reply-To: <YfFMsvoqrJLbw28Q@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, quic_srivasam@quicinc.com
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

Thanks Mark,

On 26/01/2022 13:29, Mark Brown wrote:
> On Wed, Jan 26, 2022 at 11:35:45AM +0000, Srinivas Kandagatla wrote:
> 
>> Some recent testing found few issues with wcd938x and lpass-tx codec drivers.
>> WCD938x was accessing array out of boundaries resulting in corruption and
>> system crashes along with not handling kcontrol put return values correctly
>> and rx-macro had incorrect sidetone registers offsets. One final fix in q6apm
>> to add a check if graph started before stopping it.
> 
> You probably want to run the new mixer kselftest on these devices,

Yes, this is really good test indeed already found few issues with 
existing mixers. I will test this on all the Qualcomm boards and get 
back with some fixes.

I also made some improvements to the mixer test to not keep writing new 
values to controls that have returned -EPERM in cases like where put 
callback is NULL, In my case I have a Impedance value read only control 
whose value range is MAX_INT.

--srini

> including with the patch I posted the other day testing out of bounds
> writes.  It doesn't cover change notifications yet, you might want to
> set up some automation for that for whenever someone gets round to
> adding coverage.
