Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B96751888A0
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Mar 2020 16:09:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D93117B0;
	Tue, 17 Mar 2020 16:08:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D93117B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584457774;
	bh=2WL8OoN4C3g2zlZr6ku9W48Pufg8Zd12O/oZotU3DAw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QYi/NP2CJnF7OKkOfgGrUoeWnzHtUY+GQ502YmValuYl74Ic0nVe7WirSBnQrQqXc
	 kJgQxpO2+1kt+lql/Pa/8N2+yRqnzb6a+1y7t5pSoDsF0U4rozTVMPTrtYeAkybci+
	 5b9bti2VIpDlFAqHshdFr3rz7Bb3PdopATxoJPkA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20DB8F80232;
	Tue, 17 Mar 2020 16:07:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B341F8022B; Tue, 17 Mar 2020 16:07:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79444F80058
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 16:07:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79444F80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="JPKL1gYj"
Received: by mail-wr1-x441.google.com with SMTP id y2so10656446wrn.11
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 08:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=O/cKdMrh8CF0c9lFRCImzxWLQxTgyiXXMxt/wni+pXA=;
 b=JPKL1gYjTfAuY7MB5hUGe4i3gimVdV2GkaTjXnrkkF1es/88j/ZXniHeAzW+0Y5eaI
 4tK6RL9Yj7UMUJYzwB7NmavhmvMMtCPxtDiCLyjjWbLZ8QCVVpUsUkXf899tAqWkNEFB
 IDaH1MbS2/8dk3R78Rbngvpm64ii5mJVsIdJmwksWlu2rZ+RmTXlJEnn4COiAramqJhR
 o+EoK++lVYQsjeoz7aNjcCNgs+p1i9lXHUNF6+xzz0oo5H4vMDIXwP2qBSjeVDTiY20J
 rkcoGW1tSK6J4pDS5hZMMxQK5G8HKIkB2SaWtihSgAbhZF0G4ooE8brh5rEj/fNshZ93
 Rtuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O/cKdMrh8CF0c9lFRCImzxWLQxTgyiXXMxt/wni+pXA=;
 b=jOc9j0E/R39esu9sNEWfJ/u5PeqoanbWsxP/Rh+kP0zjOSiBOcuwwC7ggMeqkDW+O6
 imZlcQjpF3l8aCn9dJsHfzd66+5fT0pu0el5ekzrRq8h4OQ3tSflmCmDmnpghSzDLKAH
 VdEaKcrXFQK46l4by+xvw5MctowPBTeFYsH4B2Tzb822fgs2rSbhvYilo1aH7TKgR5jU
 rMceHn5qbHXT0dMxWf0K9satTyx5zi6u+MT+0whzXHdVx2Ya4Wzk36CryS6rTbT64YaP
 vKlBlTjExXGDbY+Aaqwndqh95AO/ld60VuxD1RmlD1MuY2IElihaWgqkj9PeB9wqW71h
 mD3A==
X-Gm-Message-State: ANhLgQ0Dfqg144xIRA/NsA0UvVYt2X2Nuuvjw50a04Q0grYKEBX9Wvpt
 /t/vVdEAgRsihgtoNC57c7wEmw==
X-Google-Smtp-Source: ADFU+vuFeaz2+vfk1K1dxjErqoYuK1xEoaXyKVMQcHXo6oKqvAUbO1wR9RDBY+Sd6RT8WD4MgUGVYA==
X-Received: by 2002:adf:ef0b:: with SMTP id e11mr6855972wro.115.1584457667404; 
 Tue, 17 Mar 2020 08:07:47 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id n1sm4983796wrj.77.2020.03.17.08.07.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Mar 2020 08:07:46 -0700 (PDT)
Subject: Re: [PATCH] soundwire: stream: only change state if needed
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200317105142.4998-1-pierre-louis.bossart@linux.intel.com>
 <6bc8412a-f6d9-64d1-2218-ca98cfdb31c0@linaro.org>
 <27a73cbd-9418-4488-5cb2-fb21f9fc9110@linux.intel.com>
 <c1e5dc89-a069-a427-4912-89d90ecc0334@linaro.org>
 <6dde3b32-a29a-3ac9-d95d-283f5b05e64a@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <7c7b334d-ae5c-35f6-9cf3-04700677211f@linaro.org>
Date: Tue, 17 Mar 2020 15:07:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6dde3b32-a29a-3ac9-d95d-283f5b05e64a@linux.intel.com>
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



On 17/03/2020 13:19, Pierre-Louis Bossart wrote:
> 
> 
> On 3/17/20 8:04 AM, Srinivas Kandagatla wrote:
>>
>>
>> On 17/03/2020 12:22, Pierre-Louis Bossart wrote:
>>>
>>> The change below would be an error case for Intel, so it's probably 
>>> better if we go with your suggestion. You have a very specific state 
>>> handling due to your power amps and it's probably better to keep it 
>>> platform-specific.
>>
>> Just trying to understand, why would it be error for Intel case?
>>
>> IMO, If stream state is SDW_STREAM_ENABLED that also implicit that its 
>> prepared too. Similar thing with SDW_STREAM_DEPREPARED.
>> Isn't it?
> 
> the stream state is a scalar value, not a mask. The state machine only 
> allows transition from CONFIGURED TO PREPARED or from DEPREPARED TO 
> PREPARED, or DISABLED to PREPARED.
> There is no allowed transition from ENABLED TO PREPARED, you have to go 
> through the DISABLED state and make sure a bank switch occurred, and 
> re-do a bank switch to prepare again.
I agree with you if are on single dai case. Am happy to move to stream 
handling to machine driver for now.

But this also means that in cases like multi-codec its not recommended 
to call sdw_prepare and sdw_enable in a single function from codec.
Which might be worth documenting.

--srini
