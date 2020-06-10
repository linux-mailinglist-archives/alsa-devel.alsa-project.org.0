Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4371F528E
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jun 2020 12:42:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7203166D;
	Wed, 10 Jun 2020 12:41:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7203166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591785719;
	bh=itxX8mvpNN2QzKsoQfJzLWIk7gx6Ufv6d9OayD20giY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vp154l/p3to49mL3NFINXpb6NUkXnRoutywHX1wNwxpkT+pvSnLkbuepwh7Zh4eZc
	 2v3Dv8as+9Rh0HzFFfQwoLcI9fUzoAps5eqFaPmdL+dhBiEvLp22qVI7kC2pgppvqQ
	 zQXRrscDkrFMfUO/5i23xKJjL7KLCeQFd+hiCTFE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1C09F8021C;
	Wed, 10 Jun 2020 12:40:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9681EF8021C; Wed, 10 Jun 2020 12:40:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08BC1F80088
 for <alsa-devel@alsa-project.org>; Wed, 10 Jun 2020 12:40:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08BC1F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="RXIiKLoj"
Received: by mail-wr1-x441.google.com with SMTP id e1so1688406wrt.5
 for <alsa-devel@alsa-project.org>; Wed, 10 Jun 2020 03:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qLlLk3V5ioxa5pJGyX00HwHM24UNk9AnRXpgPCWgkA8=;
 b=RXIiKLojET+GmBfIBlY18PfL9PfblafAEJZFIj0V/UCtrbXGvAIeAWG75PsJ8XUeLK
 4hlKNrP/u/8Ze+Ve8R39WNmgTuzD85NMze4bdw4Rg6KkUbDas1CYGfVBFgcqtcjNKRXP
 O7hrA170mwgCTnHULnrgD0mUNuRr1SDX7Y6rg3r52SiAxXcMeQqP927XgVhMupaZkU5V
 XLMxYsIrCLCZpQnkYemssLNbmZLtkWdQWZqwBKkVzcvEcP8l/1Vy+W+tau7NG6ZpWZ7U
 DdaA3MV/w0oKcFFwCah93KF8MWJlzHmJ0KBANYSGdeL8mTy2xAIFyJzBR55FDRiq4CuD
 v51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qLlLk3V5ioxa5pJGyX00HwHM24UNk9AnRXpgPCWgkA8=;
 b=oTfR7IlC4xD2ZML96H5GGJgcQgUx99H37UDbAgyOQfymT8eoUC/NyUwNuvTRq6/CRq
 4FxzklpoQn76wKBmHN/MONtf9MEnSuyUK19zngZVMvx9B9VDssAG4lb61DkOiqKyilxH
 NCGOR5IYmfW8am7xza8mxtvx6+wh0e8cYbiwL2rN8pSTLJTT37sD7eB75YYNTskDLDIO
 FdimftpX07ANCnNMe2EbxxlvsvoiUaCp67KgnlHda0bAKkTN310zIZg7ln9YtCWBPRV7
 2IcydXba3MfhVCTIqPiAqXuRbKx36gIepscGaXiReNm+/o0uYekTI7mV/HJ9qP1cgw6U
 jaeA==
X-Gm-Message-State: AOAM531RlTVYRmtNrCvl/46x8FWAnTTv4vs00vd9yBdGLEJj5eyiu3Vm
 IBNOFEbqhxcIrFMkkzZMUAzoVQ==
X-Google-Smtp-Source: ABdhPJxMnh6Q+iHJ/ITsv+IujCAUdhqJPGacWEISNqEsOna4LjK7wdSM4T9bxHxEfageYkx5/m3ygA==
X-Received: by 2002:a5d:6085:: with SMTP id w5mr2919542wrt.322.1591785611772; 
 Wed, 10 Jun 2020 03:40:11 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id q4sm6201705wma.47.2020.06.10.03.40.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jun 2020 03:40:11 -0700 (PDT)
Subject: Re: [PATCH 3/5] soundwire: qcom: add v1.5.1 compatible
To: Jonathan Marek <jonathan@marek.ca>, Vinod Koul <vkoul@kernel.org>
References: <20200608204347.19685-1-jonathan@marek.ca>
 <20200608204347.19685-4-jonathan@marek.ca>
 <20200609052619.GB1084979@vkoul-mobl>
 <53817047-f916-b042-70b7-66aa875a9ade@marek.ca>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <a8fddf74-9f95-9bc8-6e4f-5fb654c6a43c@linaro.org>
Date: Wed, 10 Jun 2020 11:40:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <53817047-f916-b042-70b7-66aa875a9ade@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 open list <linux-kernel@vger.kernel.org>
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



On 09/06/2020 12:17, Jonathan Marek wrote:
> On 6/9/20 1:26 AM, Vinod Koul wrote:
>> On 08-06-20, 16:43, Jonathan Marek wrote:
>>> Add a compatible string for HW version v1.5.1 on sm8250 SoCs.
>>
>> Please document this new compatible
>>
> 
> Does it really need to be documented? The documentation already says the 
> compatible should be "qcom,soundwire-v<MAJOR>.<MINOR>.<STEP>". It gives 
> "qcom,soundwire-v1.5.0" as an example, which is not actually a supported 
> compatible, so my understanding is we don't need to update the list of 
> examples with every possible compatible.

checkpatch should have reported about this, and in future once we 
convert to yaml and list the compatible strings then dt_binding_check 
would fail too. So there is no harm in adding an additional compatible 
string for this new entry.


--srini
