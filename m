Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB182499CD5
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jan 2022 23:14:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C06227EF;
	Mon, 24 Jan 2022 23:13:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C06227EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643062448;
	bh=ommvR4RFDQkn3RvG5xXJ8gbUzRvOpc32z42xi7E2ePg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TfNoS+zbPhl7/oDcp9PQJ6KDuawyjSQ9lyIVN0Hb1AuITBOH+MRVFuiiSutXAKTYO
	 p27YpHYzJ5FJSe2mOQRkBU8AOrSYjH/3ktdT8Lnu5EkQ6uwyb0v6lmo/3DvxPjezpu
	 we+IpfT5bd+CjXbuMCj0vNbSf5W9PWAMPf53jFJ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF64EF802BE;
	Mon, 24 Jan 2022 23:13:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F6E8F8027C; Mon, 24 Jan 2022 23:12:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 236F5F80083
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 23:12:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 236F5F80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="DDTVsNaA"
Received: by mail-il1-x135.google.com with SMTP id u5so15167709ilq.9
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 14:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PzFG9Ft4neOQvOvfQEzqyoKYmf495tiJ7B3zbncRZZw=;
 b=DDTVsNaAbFCpmddw0GDO5l4NnFIxgkzK4lvBgBiv11VpLsCvXHAvcacLDhMS+WNVpM
 YwkE7fAnYPp7JRtna8Mza5bsOzADR3WWXYE2y2jRVthTyS35OKKRp8g4WZyRY9qV/K0e
 W8JxcOREGJQikZzJ9WiRtnnxHV7cZnMVK/79I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PzFG9Ft4neOQvOvfQEzqyoKYmf495tiJ7B3zbncRZZw=;
 b=d1DiBzQScpE/Bxzfut/0nQORvsP3ixzmBAWEdXDXiY2mPFZ0awE7h78CgSW34kU3+2
 sSUBcfBUT0r6ouLKL+m5SxXtcavPFwfnIP/sMw8besIUNfshx1LTFIuwH3wiySD4r/D/
 EK/o4CRkRa/AX81KcFwuN2fW7Nm4M24w18GfxFV0BeDf+yBca9He9cAdVVc2bqjv/poe
 DaDD9EWmXaTzx2IjzyRnYqsnWEGs0HVaPNxmkyHR3X1Lw1QEfxz/BHCwmDbzVDfc8U89
 jsq0x8WiCxHAZBHG+xrPAuU6DrXmjgjKvX8nbMzXCP5vcb5g3CPH8ao6vs7usQK8ZiQH
 Ti5w==
X-Gm-Message-State: AOAM530z7MWrhf67P0wNGKN8H/d4TzOJjqQvU4hfe2b15+GCAUMV62/v
 b5nOhLiT+h1v66ejtdcwgkPCHA==
X-Google-Smtp-Source: ABdhPJyJvPzXpbd0LFupmd5PRT1bo2rG/5zUrQ8MHcgBSo2wDc+IwvUCPwkBGIGPhaYyT/rd7rtNHA==
X-Received: by 2002:a05:6e02:1a88:: with SMTP id
 k8mr9009035ilv.36.1643062369485; 
 Mon, 24 Jan 2022 14:12:49 -0800 (PST)
Received: from ?IPv6:2601:282:8200:4c:b48b:eb27:e282:37fe?
 ([2601:282:8200:4c:b48b:eb27:e282:37fe])
 by smtp.gmail.com with ESMTPSA id x13sm6463429ilu.0.2022.01.24.14.12.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 14:12:49 -0800 (PST)
Subject: Re: [PATCH] kselftest: alsa: Add test case for writing invalid values
To: Mark Brown <broonie@kernel.org>
References: <20220124151410.2715572-1-broonie@kernel.org>
 <f9a0addc-9e81-b2c2-e5c7-d5e69dae26cd@linuxfoundation.org>
 <Ye8enGjqmiUB9HTw@sirena.org.uk>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <92819c09-f77d-0a4b-b3cf-a144cde7e30c@linuxfoundation.org>
Date: Mon, 24 Jan 2022 15:12:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <Ye8enGjqmiUB9HTw@sirena.org.uk>
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

On 1/24/22 2:48 PM, Mark Brown wrote:
> On Mon, Jan 24, 2022 at 02:35:53PM -0700, Shuah Khan wrote:
>> On 1/24/22 8:14 AM, Mark Brown wrote:
> 
>>> +	/* Restore the default value to minimise disruption */
>>> +	err = write_and_verify(ctl, ctl->def_val, NULL);
> 
>> Why not read the value and then restore the value, in case the value
>> before the write test is different from the ctl->def_val?
> 
> That's what we're doing - def_val is the value read from the device at
> the start of the test program before it tries to do any writes, we then
> restore it at the end of every test to minimise the chances that the
> device configuration will be messed up if the test program falls over.
> 

Missed that. Sounds good. In case this is going through sound tree

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
