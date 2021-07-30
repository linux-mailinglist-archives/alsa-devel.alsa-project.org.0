Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B56AB3DB79D
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jul 2021 13:08:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AE041939;
	Fri, 30 Jul 2021 13:07:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AE041939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627643304;
	bh=3+is6jQgrYnGpvKEQAykwQub24LD1KngHinBeYLmUD8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gUXSziOx+XGB16y751iS5pf03c05/FuJb2d5yZSyv2A1zTyMj0wNsJwzIq2Y5mbjD
	 sooPoApvhTsM3NEvx1PxH7Zo9ZKU0bItgFXlUimsf+FmiBpOPaJEG56Yb/Pr1vGVm8
	 HTV3tuLP/n1ySH7zjagX1lh1jvPRGwP9eIZxOGpU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 851DCF800ED;
	Fri, 30 Jul 2021 13:06:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACECDF80253; Fri, 30 Jul 2021 13:06:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3ADBDF8019B
 for <alsa-devel@alsa-project.org>; Fri, 30 Jul 2021 13:06:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3ADBDF8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="EIE2baSC"
Received: by mail-wr1-x431.google.com with SMTP id q3so10880194wrx.0
 for <alsa-devel@alsa-project.org>; Fri, 30 Jul 2021 04:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7cN7mCAd1PgSaOiwUYeJf080GlnYfimOBZ14rsMi0+0=;
 b=EIE2baSCXqVT4dVgY1Gguj0uDW2UV88MV3gEfeX1XFWqHh0DznHHGFa58B4wRUEMYh
 deqJ+oTinvP62Ow2Dv3/AVHnn5K535NV4oBCy9AvGSjg8XETNasDy2r8iaHpxePS0OHF
 KFp/upiTubTFSIlYPo9o7BY87UbFZDzUjPEHaeDm6edcyDvnCj2sGZL261EonUmJ4i2Y
 tdCy21VeTSDuf/9Z1GK/8MRairCaptF1pzQnn4obYRll0xYstlM0FcXL65gDBQx3Um5a
 FxikgGBu3MQ0aD+ykNY/WF55YtUFHzLsNHv9xfmStoEld6AgNt16sfeHnzOfySGjWBMt
 /TrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7cN7mCAd1PgSaOiwUYeJf080GlnYfimOBZ14rsMi0+0=;
 b=tKlEq/H1LJeVBRsRW/C3veb5yvcc021TtCdKMcnSEXIevrjnsNuize2PBAjwnj0TKi
 +zaGzI2W6aHc2LbicJ5zy2tr2L0hGJzc2zqZ78x5t+Ywamz1FXdwSwYvPrA45502mmUz
 Lth8sI4n2DiSVMmhqQ4k8xfX+WvzppZXgPyZleYyuWCyZnRYhRWXsrnTyYWIw5p/Ljz2
 cFoQtFeFoTdjFdcPglFpfCB/LN1vhVsB1ZRHP6KpqMlNy42D7VOIXDiWaFDMzaLYVJ2f
 JBb7hEK39b8ialiDPEqnh4op+lkmSfbTMILg2DrqTNYgeq66t1b4UhHFVH431QKjPmMK
 i6DA==
X-Gm-Message-State: AOAM530ikLIVl3fVltFpvuia8+GOeUT1s76AcROn8g2Lj21kFsZ8h7xc
 ECv7OIIIpqwrharg9sP//kBCBA==
X-Google-Smtp-Source: ABdhPJwJg9Ja1mRbrDoc3k6Xo2NEMjyjUAiTl4lgkbRru8uTrdydvtGvqnfvahOos5jVuAw9eXwYqQ==
X-Received: by 2002:a05:6000:1d0:: with SMTP id
 t16mr2382907wrx.213.1627643207487; 
 Fri, 30 Jul 2021 04:06:47 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id 6sm1486139wmi.3.2021.07.30.04.06.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 04:06:46 -0700 (PDT)
Subject: Re: [PATCH v2 04/16] ASoC: qcom: dt-bindings: add bindings Audio
 Processing manager
To: Mark Brown <broonie@kernel.org>
References: <20210714153039.28373-1-srinivas.kandagatla@linaro.org>
 <20210714153039.28373-5-srinivas.kandagatla@linaro.org>
 <20210728173649.GA1290628@robh.at.kernel.org>
 <092018be-50ae-6dda-73cd-6c7eb002dc19@linaro.org>
 <20210729111338.GJ4670@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <a03beb7c-ee4c-fbe0-49bf-1d9b6fa17b94@linaro.org>
Date: Fri, 30 Jul 2021 12:06:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111338.GJ4670@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, devicetree@vger.kernel.org, tiwai@suse.de,
 lgirdwood@gmail.com, plai@codeaurora.org, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org
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

Thanks Mark for the review,

On 29/07/2021 12:13, Mark Brown wrote:
>>> This all looks fairly similar to the prior Qcom audio binding(s). It
>>> would be nice to not see this all re-invented.
>> AudioReach is a new DSP signal processing framework Which is different to
>> its previous DSP firmware(aka Elite).
>> It makes use of ASoC Topology to load audio graphs on to the DSP which is
>> then managed by APM (Audio Processing Manager) service.
>> So internals are not exactly same.
>>  From device tree side we might end up with similar layout, but there are
>> some subtle differences like clocks are managed by q6prm service instead of
>> q6afe service in old firmware, front-end pcm dais definitions come from ASoC
>> topology.

> The software we're running on the hardware shouldn't impact how the
> hardware is described, it should be posible to switch DSP frameworks on
> the same hardware - look at what Intel have done with SoF.

I totally agree with you.

There are two parts to the software running on the hardware, first is 
the hardware itself and second is the services that are running which 
control parts of hardware.

Hardware device tree description across these new and old DSP framework 
are exactly same, However association between hardware and DSP service 
would change as per DSP framework services it exposes.

Ex: clock controller would be associated with PRM(proxy resource 
manager) in AudioReach vs AFE (Audio Frontend Manager) in Elite, but the 
clocks and other hardware properties remain same across these.

As exiting DT-bindings had both services and hardware description in 
same document which Is why I could not reuse it.

I will try to split up the hardware parts and DSP services parts in the 
existing bindings so that we could reuse the hardware bindings across 
multiple dsp frameworks. It should also be possible to reuse some old 
code too in this process.

--srini
> 
>> Are you suggesting that we should reuse the old bindings (q6afe, q6asm) by
>> add new compatible strings along with differences ?
