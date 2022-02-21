Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB704BDA8C
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Feb 2022 16:28:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36EA01758;
	Mon, 21 Feb 2022 16:27:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36EA01758
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645457312;
	bh=S3gmdmnkOj2svdWbWJkJoKx0GOAWkh26sywhS0BQFDg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DmXEHRgG8v3CWaR1x7WWERVNGUVBUGhzSb0w9d0z7ommcenn5/QHxD2B4aIcmBS2i
	 OqhfZSzWZgdpSh4y6UUfytc0rsSr7CpF64GWHWS9ZJE5AxMr8Bjun8AwBCtYImiHgY
	 H9ntj+Q2n3ZGLfVSkP+NbbG7tYPix57hI8cKWQVU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B25DBF80149;
	Mon, 21 Feb 2022 16:27:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6112BF8013D; Mon, 21 Feb 2022 16:27:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29A6BF80118
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 16:27:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29A6BF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="SzS1kQVd"
Received: by mail-wr1-x42f.google.com with SMTP id m27so15934318wrb.4
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 07:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nv0eH0e7g8WkSmFjX1RSL2aoVO4qfLGoWioqkn/s04Q=;
 b=SzS1kQVd6eOQ9thb7s9wnyOfj+bo8Cb2YS9H0qwQdPX3eig4P5HbhTJXadTFfDrSnc
 rIw83tT/y9NpvKfF8HkB6sK4JmCyfx6o7kATb07icgBJgg5YnzJXcwD+R2LSG9BSTWfw
 Zup8VT41n/kkT1p7TjAEb+/S1tmSbCThdsixos3JQzV1o+gGpTOTU3SVQ2HEkvp7aPGa
 VkOtxTLPiPu0eZwVigSaHuBWUkOyXTIByg8gzvyROYxOBSlWeQvSSMYXJQwIGTuzcd3M
 M35d6FXlR7GyaX+0JM2VsQ5PQ5f9wvWoba5QIwADbVBlknqbjKYeL+v/xn81WxQDorWc
 6dAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nv0eH0e7g8WkSmFjX1RSL2aoVO4qfLGoWioqkn/s04Q=;
 b=pPbzO4QbdHTmZmUUnYMV3hla6SfuslmQfLq2m7t1b3RnM4MVhAtwc2PqeIDT+1FhAK
 IQkImkZfCFItXsE9W1bM+oDEBaI5S+rCavNMPfS232oGRrlM5snmcMrMAZSKgdB54cBw
 jDDK/HdebHvELoyDaki14Oqi35EbgmZ/vTrkMPWX3Ff7WSzg7Tj64IigTQTO93+mxxi+
 JqRLu1RoE4fOsYxqifwFPtTJKNZPgUhdzbsLJkiZqohDzOuCjms5Cd7D+I/WLc4JvfH5
 H5kkLtwB8YDwRqxdbMqqLEjmTfJ6JTNNW0+/mWR61WgB9uzlJ5j075ExbxsDVKkF9cTB
 1VlQ==
X-Gm-Message-State: AOAM530MTmEbMPmU5XyhptttA5gB/ubU/ZSDdlvK8SchdsaHdmfxYFcr
 lI5hDcC9rKbxrSD4eqavhnBFSg==
X-Google-Smtp-Source: ABdhPJwmIdJCjnM9fEqF+TMGGejDU8cw2ZcMVWpRXEWassnpvKyeS//y4XQ3Oo4skLwgTVH/2L/vTg==
X-Received: by 2002:a05:6000:1b04:b0:1e7:3a09:6468 with SMTP id
 f4-20020a0560001b0400b001e73a096468mr15812862wrz.383.1645457241137; 
 Mon, 21 Feb 2022 07:27:21 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id m8sm8545039wms.4.2022.02.21.07.27.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 07:27:20 -0800 (PST)
Message-ID: <d1d55fd2-68a8-9271-00c5-b395b085b50c@linaro.org>
Date: Mon, 21 Feb 2022 15:27:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 01/10] ASoC: codecs: va-macro: add runtime pm support
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220221131037.8809-1-srinivas.kandagatla@linaro.org>
 <20220221131037.8809-2-srinivas.kandagatla@linaro.org>
 <YhOuvdsKu6zOg2p/@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <YhOuvdsKu6zOg2p/@sirena.org.uk>
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

On 21/02/2022 15:24, Mark Brown wrote:
> On Mon, Feb 21, 2022 at 01:10:28PM +0000, Srinivas Kandagatla wrote:
> 
>> +static int __maybe_unused va_macro_runtime_resume(struct device *dev)
>> +{
>> +	struct va_macro *va = dev_get_drvdata(dev);
>> +
>> +	clk_prepare_enable(va->clks[2].clk);
> 
> This magic number stuff is going to be excessively fragile, and the fact

I agree, will try to clean this up properly in next spin.

> that this is sometimes managed via the bulk APIs and sometimes not isn't
> going to help either.  Either all the clocks should be managed here or
> this should be pulled out of the array.
> 
> Also consider error checking.
will do,

--srin
