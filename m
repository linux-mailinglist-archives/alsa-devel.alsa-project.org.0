Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 812FF1884B4
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Mar 2020 14:06:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BD281826;
	Tue, 17 Mar 2020 14:05:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BD281826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584450374;
	bh=zLvVitW+XehcueCpYwMZdyIvzZ+eckaVxMleOJ55w2k=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dwhNbg0Vef7j5dBWSvNjIzAEXMTPYnvu9arGSU8mLefs7ugnOAo4+/jHjiTameMsE
	 pJGeNQvWDDT2NWTaVETAS7WKSP+uc+FRPmj6qRQHxGsw2yKzO3DftpL2LZyWJLvLsT
	 eEWIqEjXqMZVMIPrnv8OkEEGJ504b97MBuztIj3Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7364F80232;
	Tue, 17 Mar 2020 14:04:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF1B7F8022B; Tue, 17 Mar 2020 14:04:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38556F800C0
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 14:04:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38556F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="rs3av+te"
Received: by mail-wm1-x342.google.com with SMTP id n8so21351240wmc.4
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 06:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CBpRlvxbCNLYQBl3LHSl0nng0Xdghb8tGGZtN/n8eEA=;
 b=rs3av+teL5zRUCvHPgx0S8WLpLFXi/rQjT3qB12O1odsCNVyHCow3jyqCTVPz/axhJ
 eTsPQ2FFB3XvyuO18IXsMrg1ZOKShEWYZ2sfwrkKe1/rEBeGMZlvmRmzO00qhR4zj6Lt
 CxVsedfjrja6Vj3mpnk+WzAJqZuf8eCOW5m1bsFBkjmhqYzQ8zcyPdu/0ntu6Gny4Y3b
 vkOYP9nfl+GvFLhGlF6PcTf9LLl3ttKODvTDp0s0Tq2/RtxVr1iM/veBe4d3iehiiz+/
 j3x4gbNocMZa2mhfNmKBJA6UuF+j0Yfg5Udrl7kPcL90VORPO9nqpXNuC3dYaSeQHR3e
 NdUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CBpRlvxbCNLYQBl3LHSl0nng0Xdghb8tGGZtN/n8eEA=;
 b=N+vklE7f21LAn3/XarnksaKYnuvq3QmjXp8oVbQhxIoC+G/DQDz0Gu4NBB8FEPbTnl
 FIeBoSMrtgF2fZbwuPQvM17Cu48ZVqP2ouh+gU7YVYWwzEqpZmgbymmvo9d7vYcxFxUG
 qxh/BMCmDvpmV9Q51PwZ3bnyfaOjlCD7xUfjuZqEd6f0B4xOlZGEFk0yrydh4sIUosXg
 8eGNay4OrY+m4Nh8Ga61EN4y4bYFjUFPK1Utspmwr8yihstbuYoTdsl+MYOc7G9o3aEF
 DUuPrmpcl2QSnO7pbInhQXf9RMOZGaxYy3IvtZmqHpVfEgbs3fIBIx3vgc7xU4+0OZj5
 nfig==
X-Gm-Message-State: ANhLgQ2YQClS/w6L12yko8ntMJFzHuPFIgFEKBGt48Ng9FcVYlbvg/o4
 JgM6XlO4KRmeFvv+kI+65Txcxg==
X-Google-Smtp-Source: ADFU+vvoAkMzfYgPtp1cZbiMZaoUYcRqXKDAwxi7Sx36tQoZJ/ASy2GDlCOByqHGITcuN6yxlu3RcQ==
X-Received: by 2002:a1c:6a08:: with SMTP id f8mr5170207wmc.53.1584450264035;
 Tue, 17 Mar 2020 06:04:24 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id a13sm4566335wrh.80.2020.03.17.06.04.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Mar 2020 06:04:18 -0700 (PDT)
Subject: Re: [PATCH] soundwire: stream: only change state if needed
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200317105142.4998-1-pierre-louis.bossart@linux.intel.com>
 <6bc8412a-f6d9-64d1-2218-ca98cfdb31c0@linaro.org>
 <27a73cbd-9418-4488-5cb2-fb21f9fc9110@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <c1e5dc89-a069-a427-4912-89d90ecc0334@linaro.org>
Date: Tue, 17 Mar 2020 13:04:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <27a73cbd-9418-4488-5cb2-fb21f9fc9110@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
 jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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



On 17/03/2020 12:22, Pierre-Louis Bossart wrote:
> 
> The change below would be an error case for Intel, so it's probably 
> better if we go with your suggestion. You have a very specific state 
> handling due to your power amps and it's probably better to keep it 
> platform-specific.

Just trying to understand, why would it be error for Intel case?

IMO, If stream state is SDW_STREAM_ENABLED that also implicit that its 
prepared too. Similar thing with SDW_STREAM_DEPREPARED.
Isn't it?

--srini


