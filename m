Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCB22FBD65
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 18:19:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C9D418E0;
	Tue, 19 Jan 2021 18:18:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C9D418E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611076756;
	bh=Rms5ELoFxfiK8+tYFt4kwYOi3SZCDaO+793193w9Jgc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T+vHP6PRZqK24KZfSbonOxfs8QDL7SytiW98u7kKCzG/cqH84N3zZke5KRLndU/q8
	 ZqvLxahb4KtrWv23lvs56/OKKAq5dzxpzKZ42ga1s735/p7fG+9hHVjM8pUY3x+cTo
	 hzTedqx2Lu/YJUEti9fbAjneUdEW98fOfYtLQ2+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 405A9F8029B;
	Tue, 19 Jan 2021 18:18:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 074B6F8029B; Tue, 19 Jan 2021 18:18:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F663F80255
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 18:18:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F663F80255
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="HQ62BOIw"
Received: by mail-wr1-x432.google.com with SMTP id c5so20492029wrp.6
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 09:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PX8jr8Vol/FRGp2UsPj8sDZPjVgGqVfVrry+qL8uzSI=;
 b=HQ62BOIwPxntJC5g9aANwDM3cB1Q2qOY90oFj4gO6Pfcj6HhOhENOxwtHo5XiK6mKF
 Up1URUpJm/0+sIdw/j78rrT2QH7JU3oG90kne3CFKN6utKTk693LsuSjM2fjOBH/0RhQ
 kVkDvSDND/ZAk5QQcpgrmRqhWbSvowMK6RYhwi94b9eOWTRolCsy8SfKqNP9U98mPq3o
 rUnBFRHh5HP8pl3O/Y5gxz443GTH2ctNWUpp2jumg0u+Kg31BcTj/oBcrIRaFbs8eUOP
 JSurL8r4tSbXaGCs+g1MptUa4b2e7HjBjQLBWe5PivvCRAvKGOILv3Do6ZdPYCuc2GUv
 a8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PX8jr8Vol/FRGp2UsPj8sDZPjVgGqVfVrry+qL8uzSI=;
 b=skqoq4fq/rm7lvk561EamoHXcsokt4bqXjq2aaoon7ZQQfyu63+wUVE7ef7lPK6zxG
 lVe8CqXZJrGWmQR87HXBsKwZRLJE9jaFJcEMDXTrdOP84WrfOM5qzr4Lpc3DlUaTRrN+
 8o/dFEB8gVP7vN/y+SRhPmcRLHSDqO342Fgz5PeeAGKj1YK4v6jKWSSqhpEIq/4Dca4p
 DQB7V2+1SoZaP5CGjFdsyxBA+l5mHHtRD6uiMcc1m3wfSZijJAeewn9gdv6FkpBd9jV+
 r7taiISPSAKYimJGXkbtMA1u/1GuxuENhKqdcisoS/7H0B9qnN4HOZtIYeADSMkgKO76
 2/gQ==
X-Gm-Message-State: AOAM531593ZjjFpghlWPKYrjjMQSSuw1e7a0LIcYnT1uWC2jCId96Ay5
 wE6LlM++Nh0rFQAF5ySs9iRRCQ==
X-Google-Smtp-Source: ABdhPJzwNASgk/oldbP8/0Yg312a6aP5Lt7vjj+T3gJkpWKzNyXUsEINQRu9oIBJciWdNyIffDprlA==
X-Received: by 2002:adf:f590:: with SMTP id f16mr5503102wro.40.1611076680563; 
 Tue, 19 Jan 2021 09:18:00 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id n11sm41822628wra.9.2021.01.19.09.17.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Jan 2021 09:17:59 -0800 (PST)
Subject: Re: [PATCH] soundwire: debugfs: use controller id instead of link_id
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>
References: <20210115162559.20869-1-srinivas.kandagatla@linaro.org>
 <20210119145220.GS2771@vkoul-mobl>
 <45300dc3-00b0-497b-804e-f7f1e857f32a@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <57d5f1bd-50fa-30ab-03c0-260460e45d61@linaro.org>
Date: Tue, 19 Jan 2021 17:17:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <45300dc3-00b0-497b-804e-f7f1e857f32a@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: gregkh@linuxfoundation.org, alsa-devel@alsa-project.org,
 yung-chuan.liao@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com
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



On 19/01/2021 15:54, Pierre-Louis Bossart wrote:
> 
> 
> On 1/19/21 8:52 AM, Vinod Koul wrote:
>> On 15-01-21, 16:25, Srinivas Kandagatla wrote:
>>> link_id can be zero and if we have multiple controller instances
>>> in a system like Qualcomm debugfs will end-up with duplicate namespace
>>> resulting in incorrect debugfs entries.
>>>
>>> Using id should give a unique debugfs directory entry and should fix 
>>> below
>>> warning too.
>>> "debugfs: Directory 'master-0' with parent 'soundwire' already present!"
>>
>> Yeah id is guaranteed to be unique so this will work.
>>
>> Applied, thanks
> 
> This patch is a no-op for Intel, but I am not convinced it's the right 
> fix or the definitions are not consistent.

It depends if the intention is to represent full Hierarchy in debugfs, 
then I agree. Its was consistent even before!

currently we have
/sys/kernel/debug/soundwire/master-*

Are you suggesting that we have something like this:

/sys/kernel/debug/soundwire/xyz-controller/master-<LINK-ID> ??
/sys/kernel/debug/soundwire/xyz-controller/master-<LINK-ID>/xyz-slave/master-<LINK-ID> 
??


Or may be something much simpler like:

/sys/kernel/debug/soundwire/master-<ID>.<LINK_ID>


--srini

> 
>   * @link_id: Link id number, can be 0 to N, unique for each Master
>   * @id: bus system-wide unique id
> 
> In the MIPI/DisCo definitions, a controller can have multiple masters. 
> if you have multiple controllers, each of them should have their own 
> debugfs directory IMHO. It's totally fine to have multiple bus/masters 
> with a link_id == 0.
