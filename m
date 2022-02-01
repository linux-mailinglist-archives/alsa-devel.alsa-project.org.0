Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E274A62D5
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Feb 2022 18:46:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14A451884;
	Tue,  1 Feb 2022 18:45:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14A451884
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643737600;
	bh=kKqE4Sj09HDpH4YvIhjnTjK8aNimmNPXPIh9zoQQAx8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K2xLYokNRxlg9BqSqmOFP+GnEj89u6IExwsIx2RTy+ntv4GDwbdZS4LcBMR7q2jvN
	 LQYvmNqzH3Hdb6FM9qujU7EqmMj0h/sZbxUTNk9UXwtXtK0kzoHBqDG3fZU6U8NJiI
	 Mvz8tJKeyIOy1SEs/3+W1JN8u30ZJcnPGz0+Svj4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8564FF80130;
	Tue,  1 Feb 2022 18:45:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 040E2F8012C; Tue,  1 Feb 2022 18:45:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65EA4F80089
 for <alsa-devel@alsa-project.org>; Tue,  1 Feb 2022 18:45:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65EA4F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="JT39to3C"
Received: by mail-io1-xd2c.google.com with SMTP id 9so22262740iou.2
 for <alsa-devel@alsa-project.org>; Tue, 01 Feb 2022 09:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hZJGDi4O38yZhJdwibyuJTdCKMidi1j6wS2HcvSmoow=;
 b=JT39to3C36+ZOsdkWRmlycM58WEzIi02MD2At9C+vYNsMBlFs/gnUF8kQHiW5KgjMV
 aWUxLEtmEcTX7xh1rj3AGThTMH8F3HDpXr++mGTx0xaZgrGltnEJjcT8vLeRUzk1+koC
 UnSk4IDWihdzb9R/rib+f2rvSiuONHqew6Veg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hZJGDi4O38yZhJdwibyuJTdCKMidi1j6wS2HcvSmoow=;
 b=647vRk0A2H40/GDPzkMO/xj8zs70ayvBR14+GrpCXRN0eYJ2XpsQaktV6t27wjRV2J
 FzHQR25acDptK+8kQl63BghMZJwOvIdeAzatA/kCnDOCCd3bxo09WfFD0g05RcjPGD4P
 1HD5wW/LJ7GReOrorQNXpeJxmBg1y6C0RbIgaliLS3FdDh1Xu9fMEZBdhzdjYsqautTq
 Ogcb021Ul+ofSnwYpB+pd39LY/7GRJs2e/j4UL8VddO8YfR/k9m4TWWPcTRqlgQI1IJI
 fJXbBCRNM+A2mgrrab20qHmMR75SFhugJ+AElyW/mTbzUrIJTgw/RzkAR/UFfD41uEKT
 2L7A==
X-Gm-Message-State: AOAM5313TTy/yX6S0VNyD58+PINwQ16Uj+WOfG06BA2kx2UKPrWPlJit
 5Ht0QZFW+8qz8FgD8vOtSADtXg==
X-Google-Smtp-Source: ABdhPJxu24Z2OMYalmTSNKDV1Z7lmV7+UiQTl3i3BGPSDKUuSjsIdUqyKL957baWoqv5R+htZecIyA==
X-Received: by 2002:a05:6602:158b:: with SMTP id
 e11mr9772951iow.93.1643737526680; 
 Tue, 01 Feb 2022 09:45:26 -0800 (PST)
Received: from [192.168.1.128] ([71.205.29.0])
 by smtp.gmail.com with ESMTPSA id t7sm18456372ilu.37.2022.02.01.09.45.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 09:45:26 -0800 (PST)
Subject: Re: [PATCH] kselftest: alsa: Check for event generation when we write
 to controls
To: Mark Brown <broonie@kernel.org>
References: <20220201151551.21497-1-broonie@kernel.org>
 <0e1bc48d-ff3e-a4f8-5f81-d6902e89458d@linuxfoundation.org>
 <YflxOnS65NDyx5Ul@sirena.org.uk>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <dbdb5e4b-37de-d17a-d149-5c735d016115@linuxfoundation.org>
Date: Tue, 1 Feb 2022 10:45:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YflxOnS65NDyx5Ul@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
 Shuah Khan <shuah@kernel.org>
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

On 2/1/22 10:43 AM, Mark Brown wrote:
> On Tue, Feb 01, 2022 at 09:18:52AM -0700, Shuah Khan wrote:
>> On 2/1/22 8:15 AM, Mark Brown wrote:
> 
>>> +int wait_for_event(struct ctl_data *ctl, int timeout)
>>
>> Let's make this static.
> 
> None of the other functions in this file are static, that'd be a further
> change to make the whole file consistent rather than having a mix I
> think.
> 

Let's plan for it as a separate patch then.

thanks,
-- Shuah
