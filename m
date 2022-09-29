Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 182DC5EF70D
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 16:01:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7978D15DC;
	Thu, 29 Sep 2022 16:00:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7978D15DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664460091;
	bh=UYas/HFZc9X9P0FD6ANlgbZ7tIsLnH5YxQp7z30F0wk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SN5IamEk3zhc4bCGza3OYAWz5mX1y6b4gfTFQ/LQquA6/2/Frf8KZXePrbPeHgwvc
	 tD3W79M8+bZt/VJbC+RJ2bifDZytkQMpB91zPLY3JV2sdsKUyBFAx62VJTEFM9D7fa
	 cCXEHDk7uG6OqYTrOi5QAbo5fSr45/3KRJsD35Ws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2CACF803DD;
	Thu, 29 Sep 2022 16:00:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FBC4F8016D; Thu, 29 Sep 2022 16:00:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FD88F80109
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 16:00:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FD88F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="VjCYChWj"
Received: by mail-lj1-x22d.google.com with SMTP id b6so1635898ljr.10
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 07:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=X4udh+F/jTTPAawHj+leYFUcEjOK0Up2+V5M2hR8VXE=;
 b=VjCYChWjn6iy+G3yVQ6tZ5L5GrU7JMx6AFQ+ZIwJs9EqJdAQec1TweUcsCGbcL5zbN
 IcYXCI9pbWIaq3GI3J98z7m8bU6Eg24TmmlRaBm3jWe2XdtHETo1oLcp8UAHlG2Ff7jY
 0nNtDetj7dDIdFNbbL1Pu7gFgvUcjrHf5auaM7kzTnxn8WGUuCdjAUPu9CQEBbD5QQLl
 EC91SUJqW/acBbe94NQt+/gD5IiMV6nwTx1Q+Hrr0rHdVRS9waYT7ZMQsRfHsPZwE92B
 fq+roLKRMKkFs0p5Dp6D3rH9Pql0spk3ObhDvl+0pHJMAOKdEN2L63cgu49/aN6W/BR7
 iThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=X4udh+F/jTTPAawHj+leYFUcEjOK0Up2+V5M2hR8VXE=;
 b=roZjafTczCJtTGF2/Pw+xLbuU2JuP1BmfV+yXG53oaDSHRa/XTsHQVkr8G26PYsY/X
 E2hOjvAdFo9Kn9+83Zqy+G4E4H9feACMnwFecdBfr58mFN8p1L6nLpBv59a3+fGpL6K2
 odHTtvFeRnclFDGK3k3cXDFLRb2MuBUVIOrFO3U5p44Rq7ZYioX7ynD77/d4elD8a57y
 hTGgFWWQft2RwQzaG79BU+q/v0b/nVNfhQkwmuZGJZhUzzAmAoML9YqQhMXp/holOEIX
 aZwFiP2OYhFqotXOGMjlVyrVMeJGG0OIaQ1NGzRn05rSlYsEF/UJD0wwaDjiMJp+9ycT
 Cz/g==
X-Gm-Message-State: ACrzQf22sgor2Ip0hs2gk0oPWWXhF5qtueqbTDtny5C2SWZMii4YoMkT
 aMbuoj64VYU1rjvSLcPtoDG/Lg==
X-Google-Smtp-Source: AMsMyM7aoCdu9WHwG285Neg6d4thYouvRN6KfDb/QxWK+gc0PVmrUK/EJD+sPkftZalwKRWmRkCIdA==
X-Received: by 2002:a2e:9cf:0:b0:26c:3973:ec1f with SMTP id
 198-20020a2e09cf000000b0026c3973ec1fmr1321095ljj.322.1664460028783; 
 Thu, 29 Sep 2022 07:00:28 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 dt18-20020a0565122a9200b0049c86ca95bfsm794048lfb.52.2022.09.29.07.00.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 07:00:27 -0700 (PDT)
Message-ID: <88035bdd-3aeb-640e-c001-8823013e5929@linaro.org>
Date: Thu, 29 Sep 2022 16:00:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] ASoC: wcd-mbhc-v2: Revert "ASoC: wcd-mbhc-v2: use
 pm_runtime_resume_and_get()"
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220929131528.217502-1-krzysztof.kozlowski@linaro.org>
 <YzWgescSJMKzYTAo@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YzWgescSJMKzYTAo@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, stable@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

On 29/09/2022 15:41, Mark Brown wrote:
> On Thu, Sep 29, 2022 at 03:15:28PM +0200, Krzysztof Kozlowski wrote:
> 
>> Cc: <stable@vger.kernel.org>
>> Fixes: ddea4bbf287b ("ASoC: wcd-mbhc-v2: use pm_runtime_resume_and_get()")
> 
> That commit isn't in a released kernel.

Oh, indeed, thanks. I'll send a v2 without it.

Best regards,
Krzysztof

