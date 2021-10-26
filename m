Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E1A43B0A2
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 12:57:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AC2716F8;
	Tue, 26 Oct 2021 12:56:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AC2716F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635245827;
	bh=APv868JcvKlCnSwT2xeGnaXjAmO6NZIseWzAoAuP0qc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SuIz2Wt3DpPLTCihEioeM/vhZPb4eVd+DIBYGq1Ptf6HzIuWUDc1mlqnBYd9RQyOY
	 +lCHrsM6Ga4oD/zR+bGWtnKUiNl7pSrDV9e3hiQ7G0QctEodFYljkIrBVZLbJZAPyI
	 DNleCR+sA14X+eNiB6D/hcyunckddgt/hlUoGynI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82FEFF8014D;
	Tue, 26 Oct 2021 12:55:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90166F802C8; Tue, 26 Oct 2021 12:55:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23F08F80105
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 12:55:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23F08F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="zmqlwtwU"
Received: by mail-wm1-x32b.google.com with SMTP id 5so3961113wmb.1
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 03:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4zwayCeQaGY3/Vlu1KR78uxOxCGc7pFw6NOHmQrUIu8=;
 b=zmqlwtwULyD1Sq5+Rae7KSjxVnTtu+2ZGr4rAPBMFsokGGf05miWh+d1PJSbL8YNEb
 GmucNm7bEE1r2Q9Wg3Crmb2gO29FXBWcjwcP3vqQLcW0NPYQxaA5BmEHXfmaWnK7I61l
 daQlDkir9Ea8FP01IiklBa4E3AGZV9wVxj5qqw1aCfdWtk68HRy1BN3RBEXrNm+V+QYX
 BtQUuTV3+NofWfmWZF2t9tx1Yc64LPD7sTWx5PwRCcuxzk2/6fqw68opS9GrCoUksGLC
 nee21SDYfQTWOdyn5GBO8dQjnxZ87rsbq8TxeLDNJ7nwkpDzZGvY8Z4l74o5lXr1uEHe
 r1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4zwayCeQaGY3/Vlu1KR78uxOxCGc7pFw6NOHmQrUIu8=;
 b=U7bHDl88SA/rkIGssy8VYCNnNz1Na6KRkn0rsVfloJ9X4AY/Txv5hD0fABxBc9fDdZ
 Zri2H+srONS9SyTF5ZCOKU0/5iFFoMOkZtWG9j7W6hPZhot3yRyBDnxW1vDzoSQXAni5
 l4ftpfRtA/JNP1gd0Ve3BET1L5vGkvzfFbKqePdYtF6oXmd5/REs+avAVQNttylXEb8O
 yWgTwX0EngKLlvsQQDWoI8fgevijpImS0VQpzgUhFdJr/F1p2fstk3gIxgDd4hzEVbvT
 MCwslgAIzWobMoOZUEpydRHC892vUGDaCHDfK2ry2oiuzkhAXRQdOinIK8Cuy2uX8F3T
 mbwA==
X-Gm-Message-State: AOAM533W1UTN0P4FxmXxT/e6HtDbaAO4G/c19K9Mi4KdTp6Kpl2UTYWP
 SSYWVsQMF8Sh50/zvk7XXWr+BQ==
X-Google-Smtp-Source: ABdhPJzNt48HKI6CfdX8MGvKP8b4W29YNrqbAcvXYwT4FBR8/KQBvQhdf9eXRXpKAGl0XAMXVBiCsQ==
X-Received: by 2002:a7b:c010:: with SMTP id c16mr26998498wmb.141.1635245739291; 
 Tue, 26 Oct 2021 03:55:39 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id y23sm251346wmi.43.2021.10.26.03.55.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 03:55:38 -0700 (PDT)
Subject: Re: [RESEND PATCH v10 00/17] ASoC: qcom: Add AudioReach support
To: Mark Brown <broonie@kernel.org>
References: <20211026103815.19468-1-srinivas.kandagatla@linaro.org>
 <YXfc18+fqBNajHX8@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <ef6377b1-5cd4-dde2-b2ec-a7c0ccc17dd0@linaro.org>
Date: Tue, 26 Oct 2021 11:55:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YXfc18+fqBNajHX8@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 devicetree@vger.kernel.org, tiwai@suse.de, lgirdwood@gmail.com,
 plai@codeaurora.org, pierre-louis.bossart@linux.intel.com,
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



On 26/10/2021 11:47, Mark Brown wrote:
> On Tue, Oct 26, 2021 at 11:37:58AM +0100, Srinivas Kandagatla wrote:
> 
>> Am resending this series as I ended up sending incorrect patches for v10.
> 
> If you're sending something different it's not just a new version!
No, this is not different to v10 which I send out Yesterday, v10 is 
meant to address the arm64 build error that you reported.

For some reasons yesterday's patches did not reflect the changes that I 
wanted, so I RESEND v10 again.

--srini


> 
