Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C050225D722
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 13:25:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49A101B06;
	Fri,  4 Sep 2020 13:25:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49A101B06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599218757;
	bh=XOLMJ4rJ43jcNcEqikbDbdoLCN97UYx/ptBgdPSYeLw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bPeBqXHBTrsIVm5P0IUvnv9S/4UIs5ZuYCgcnPhQJ3K9EKgz8Y0esdO41OvXOlUA5
	 uFaVQqc2Zg5ExCpEaw/ry1BBKxsHpWhIcXuQK18MgXNIbv466xxN3B+bIn/YMk/QKT
	 hk5b75oBFhnskZexnqP6Uf1kP+SwcDTqKV7QC8Ys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E750F80257;
	Fri,  4 Sep 2020 13:24:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECB7AF8024A; Fri,  4 Sep 2020 13:24:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0E7AF800F0
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 13:24:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0E7AF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="vHJpiwhq"
Received: by mail-wm1-x341.google.com with SMTP id e11so7321169wme.0
 for <alsa-devel@alsa-project.org>; Fri, 04 Sep 2020 04:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8xEgg3o+gLGeESFHktGDRTpfevC+XglUUg4G3rHJx3I=;
 b=vHJpiwhqX32vEN3zWtbXmY0ePGjmUa5Gzfg+sZKNvZv4hI2s8k2vIpGGM4s7zrwM2s
 jzbK/FnKxl0PFFSZFeUybLHJBPyZ0oQFAtOhBfFBPwGTsThaPfNFEMz8DD8LWQtDFBhi
 qvgVFDlw5kPPpWyvWBkwmP1bARRgi7L7CHtoRlDF24c4Jg/hCBgby3aVV8bZ2GogBnEB
 Dy0rtNsF3LdNzB/rowH6JxMOmHt4+vf4ulr7kJGWT/KdbWTGoNqpgNLpmkcRrRlFgXGz
 ROSroRFf1uZJnc5DlU+/S8d49BHzXztyHEZ2zrYq5BR45hPZwEwcq+D1xcPT6exLf14J
 mtdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8xEgg3o+gLGeESFHktGDRTpfevC+XglUUg4G3rHJx3I=;
 b=Br1t857EcwZ84IX4VC/61wjOfpII7xewQUHp0A0ze2GNarD59MhB/AjV0u5Hxe+HBd
 6+3NxzdWUI88q2FUzFDqRh5uZuKBBSFwoDH1gX1KupHCFKwKCosOSuJXV8sklbq8qVz3
 d2bNiUDGGNXsTctLi2qt9vEGWEYOtdnDJkGpOfK1e3sxLjXVikmZIebQPooMdCi+mDJo
 n74oSynHgZg6lofIsuTbVb+c7wtX8Da+pV9y+CV/a5kwNlaTZAJdMueuhkN+7grYCJkK
 BKZxo8Sp4GS9BaSzC9rjSHwaB3FY/dulRlnk8M+bPY74sz3VSblxC3DuiX3moykAf6be
 LPYA==
X-Gm-Message-State: AOAM533ltp9utdgHmdlzAKNgEEegTd5BOgfiOvteLkAw4l7LO0dRZpep
 RvJQN5MoJlRl7/6RoZTVUiTkXA==
X-Google-Smtp-Source: ABdhPJyFCbGhweiu1wpz6oEb3pkbD1zvGYUpQ+bW5YR2Ya6HcJTdQVy88XJFyHuu6THd5DeOCRXbHg==
X-Received: by 2002:a1c:4c05:: with SMTP id z5mr6687314wmf.47.1599218642188;
 Fri, 04 Sep 2020 04:24:02 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id h8sm10573821wrw.68.2020.09.04.04.24.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 04 Sep 2020 04:24:01 -0700 (PDT)
Subject: Re: [PATCH v3 3/5] ASoC: qcom: Add support for lpass hdmi driver
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1598855964-1042-1-git-send-email-srivasam@codeaurora.org>
 <1598855964-1042-4-git-send-email-srivasam@codeaurora.org>
 <ac1f0b9a-8e07-464c-b0df-6b8e5665a632@linaro.org>
 <0101017458d94c82-96bbcff0-018e-4f5d-8273-7869c3599d32-000000@us-west-2.amazonses.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <b18ed556-09f5-1d2a-b8fc-56a52429addc@linaro.org>
Date: Fri, 4 Sep 2020 12:24:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0101017458d94c82-96bbcff0-018e-4f5d-8273-7869c3599d32-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
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



On 04/09/2020 12:21, Srinivasa Rao Mandadapu wrote:
>>
>> Before going into detail review, I see real issue in the overall 
>> approach here to add new interface to exiting lpass!!
>>
>> Intention of struct lpass_variant is to address differences between 
>> SoCs or different lpass versions. But you should not duplicate this 
>> and use it for addressing differences between each lpass interfaces!
>> All the dai related register offsets should still go in to this 
>> structure and driver should be able to know which dai its talking to 
>> based on snd_soc_dai_driver id and select correct register offset.
>>
> Do You suggest to use separate structure like struct 
> lpass_hdmi_interface in lpass_data?

No, you should just put every thing lpass_variant as you did but no "id" 
thing in that.

--srini
