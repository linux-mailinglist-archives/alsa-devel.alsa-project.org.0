Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAE53E112A
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Aug 2021 11:18:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 259F81694;
	Thu,  5 Aug 2021 11:17:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 259F81694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628155124;
	bh=k8N80QFyyI9KeHEpn1E1FUidZYjfmgg3xpkIV9O1OJE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cY4u3FT+pw33Jlclr8RCVgDO7O2OvXGQNk1fW8cOlrzAOwLEloXR22UYZaeVrumNk
	 BQFW1Qq/Vj/NNnhoQuVAp5awxueSr4HL+tp4s2yC060iR25LycBtbWYmSIipgkPq4T
	 Qs7fDN0nKavkjoTwl9oKaRGZk+gFPRzN6CDx/qJs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01371F804E2;
	Thu,  5 Aug 2021 11:17:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DE85F804CB; Thu,  5 Aug 2021 11:17:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8A17F8032D
 for <alsa-devel@alsa-project.org>; Thu,  5 Aug 2021 11:16:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8A17F8032D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="xJYDjQds"
Received: by mail-wr1-x434.google.com with SMTP id b13so5595596wrs.3
 for <alsa-devel@alsa-project.org>; Thu, 05 Aug 2021 02:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pv3tP3GZi/wce83FBWxIWUs/8RDEJ0SBulI8HwcDx/k=;
 b=xJYDjQds0fS7Wxs5/ZoAD2lw1YIxEFMBxc6tB9qIkFQboBSTXxlPlKcxmZdHCulE/P
 Zb0ltWJ5JXYPMfPRiJ2aZ3CUN+nlfEmJxLwJ6rc18OYO6hrmAp3gInmHvwOoeMgZa0gG
 QULrO0q7Jaos1otSft5JD1Mp76NBSOG/BFqclIzy8kp/nqonzNdAX4R01CW89xhZOiKn
 vJPwbHH+97OdbCFX+x2gjR8LoqpH2mveo7+3ifPG1kPEJG8uDq1aXPgvDpg0b+sH0XxH
 sJUUhC64UaTfkUlhESBfGvrKLIyq7sQuZyQEWcezrpH6ly6sb+ZulABoj89KYixA4AVC
 O8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pv3tP3GZi/wce83FBWxIWUs/8RDEJ0SBulI8HwcDx/k=;
 b=K4s7IgGPSoFCExEm51IURlzGe5C/F9O3aQjirPRSQXVaxp972AxG5FjklMG6+ZFkQ6
 nJ0St64TYatVXJWZ0Uae9AgGMk0WI99oy10ye8mtmSyIH/8M4k6pWhrRXvAq4GVA06Cp
 0gSj/vkEMt2vIQXUbuSfLPFFswFGoFUk4vXJgauMIq7hWz+ih0yJciazFM/MwFsoe70S
 peP9i5AwQu3wAcrvOEeJ8mDCzLPdgeHobBIXTOSBrpiPvOk6O92cQ8E40s7CLoMpl2Sc
 IvJsVYvg85VyVRPIkQzmuhUwELeifEk5rpQcu1i6oY/cAtiVFAAulRoJj0llyVcjhix/
 GdLA==
X-Gm-Message-State: AOAM5328yReFZLgcXuB46yoricII0H/KKldcCOQ3XAf0GOTyV8ZR8Wza
 Y0SRONYOeekAarqd4rLtq2nCyg==
X-Google-Smtp-Source: ABdhPJxOHpcM5gAkN/pr7OMfFGQah1QAAE+SrK8QzR5zZm3zZyOGo0WpoRvOdAuIdkD+cSaEjAZmlA==
X-Received: by 2002:adf:ee0c:: with SMTP id y12mr4020218wrn.394.1628155019503; 
 Thu, 05 Aug 2021 02:16:59 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id l5sm6236728wrc.90.2021.08.05.02.16.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 02:16:59 -0700 (PDT)
Subject: Re: [PATCH v3 11/20] ASoC: dt-bindings: q6dsp: add q6apm-bedai
 compatible
To: Mark Brown <broonie@kernel.org>
References: <20210803125411.28066-1-srinivas.kandagatla@linaro.org>
 <20210803125411.28066-12-srinivas.kandagatla@linaro.org>
 <20210804180143.GG26252@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <4f2fd6d8-1c42-1d41-733b-9b32b07d7d7d@linaro.org>
Date: Thu, 5 Aug 2021 10:16:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804180143.GG26252@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 devicetree@vger.kernel.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com, bjorn.andersson@linaro.org
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

On 04/08/2021 19:01, Mark Brown wrote:
> On Tue, Aug 03, 2021 at 01:54:02PM +0100, Srinivas Kandagatla wrote:
> 
>> +    enum:
>> +      - qcom,q6afe-dais
>> +      - qcom,q6apm-bedais
> 
> What do these compatibles mean?  The bedais is sounding suspicously like
> putting DPCM into DT bindings...


Old Elite QDSP framework has service called "Audio Front Ends" aka q6afe 
which is responsible for managing the LPASS Audio Ports and Post 
Processing. We endup with "qcom,q6afe-dais" in the past to represent the 
LPASS audio ports.

With New AudioReach framework this functionality is managed by "Audio 
Process Manager" aka q6apm.

I will rename "qcom,q6apm-bedais" to "qcom,q6apm-lpaif"

to be more explicit about the hardware LPAIF(Low Power Audio Interface 
Modules) IP.

--srini


> 
