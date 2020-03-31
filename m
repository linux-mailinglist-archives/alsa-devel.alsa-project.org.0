Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 679FE199613
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 14:14:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDB621660;
	Tue, 31 Mar 2020 14:13:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDB621660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585656886;
	bh=S54OYpYeff+oe1Y6Eo3WO8tY/lSz6li5w6AwVrLFJsg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iTXJWDjUrB1xuRedgC9/Pb99DITX9Z4QBfiXjpdUk96/w/ZUvXIEINQG3wXs7onVB
	 zA9HqIEuRK+D7wuZSUb29GZaM2SFAgn7UOq+mBXAbyTckKQzi68dPk9Ic0POUDErXc
	 93gN89XmkE3lTESeEJ5wt23fV8+5VWJuXXogEGSs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D284DF8010C;
	Tue, 31 Mar 2020 14:13:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B56DEF80146; Tue, 31 Mar 2020 14:13:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 000DEF8010D
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 14:13:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 000DEF8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Q4sEM0lN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585656779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1iW+7vngmWONzeyMrSalAlBo6ikGmB49M8VFiQKXeRI=;
 b=Q4sEM0lN2DBCSqlKOtQLnkwIL9FxtwXiIRgpYWRc/xT90P8kkg5AV4OpGk+vN59XWc8wPr
 pNJ2RuP0ePM370Mf52OtQmDEe/rzQM03aFDVSVDNltobhbPDFYPVDovordIpLR6sdyzeHC
 XSbCBfUB7+5jXVYX0XlTwiK1q+RxUx8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-gTJEnj9xOGKw2YxgLHJKRg-1; Tue, 31 Mar 2020 08:12:54 -0400
X-MC-Unique: gTJEnj9xOGKw2YxgLHJKRg-1
Received: by mail-wr1-f69.google.com with SMTP id e10so12885663wru.6
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 05:12:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1iW+7vngmWONzeyMrSalAlBo6ikGmB49M8VFiQKXeRI=;
 b=HZtxdVWR0JBBBlfcO8G0crhpoZxqRAFjTStFuGiwPTSldh4awd8bI9sSEe3Kzkpiya
 MC/p6C89PL9Os94ApXMqjYiTxK2AMJsjuR0ZDAYYFmNYasFj3bTdiDGd02uNBrhD2A58
 8qSSG43OteL7jtYMWjdmsoxwxMYhIw9R4OiP1w8A1mwSnT3hE71lRHopYm8slJaOFyOi
 c+UWrBBlWJBoI8tFi2SnQyNANmjvgnvaPzqLCbZw6JTLf8hPixR9OKroFDimcISoG4eu
 llXPph/ROUL84bAb+rOtjnpu5XxsFH0lYmSzoL5xt+AiByfRnUCxsSPzUH5tnYiBQu9w
 VWNw==
X-Gm-Message-State: ANhLgQ3k5qfBxz1MQ/tJQ06fJqMjyFXIM276TN8IQAVlen3KIAMa7Q/+
 U0RHiuiNk3+VaDLvVXLjBHfGXo26vQpVvmiUvqFgQPBnyIYWbJ4RbYhAW4uiIenEQ7ueHTgvurT
 TSD59XCQaxc4wyYNSXbdZQFw=
X-Received: by 2002:a5d:4305:: with SMTP id h5mr19468701wrq.69.1585656773504; 
 Tue, 31 Mar 2020 05:12:53 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs5tBLzHB/axofyDY2gV6TLZKAs4wCQ/uZ1m6Xrk/yCbadzVqZxHdXj5ck2p/VV5VTU4z9pVw==
X-Received: by 2002:a5d:4305:: with SMTP id h5mr19468679wrq.69.1585656773280; 
 Tue, 31 Mar 2020 05:12:53 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
 by smtp.gmail.com with ESMTPSA id w9sm28813241wrk.18.2020.03.31.05.12.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2020 05:12:52 -0700 (PDT)
Subject: Re: [PATCH 3/4] ASoC: Intel: bdw-rt5677: Remove ignore_suspend flag
 from SSP0 dai link
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200319204947.18963-1-cezary.rojewski@intel.com>
 <20200319204947.18963-4-cezary.rojewski@intel.com>
 <dea20cf7-f324-a933-8f8e-e70a4dffa249@linux.intel.com>
 <259cbb60-9e59-1132-8371-83f837577f86@redhat.com>
 <9f1884b4-e356-9a8f-6912-0d55c4bcbf06@intel.com>
 <a48d48cb-ab02-1213-88b9-431109e4b468@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <62061e77-e855-e4e0-1e5d-8d9ccd422011@redhat.com>
Date: Tue, 31 Mar 2020 14:12:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <a48d48cb-ab02-1213-88b9-431109e4b468@linux.intel.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Curtis Malainey <cujomalainey@google.com>, tiwai@suse.com,
 Dominik Brodowski <linux@dominikbrodowski.net>, lgirdwood@gmail.com,
 vkoul@kernel.org, broonie@kernel.org, Ben Zhang <benzh@google.com>
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

Hi,

On 3/31/20 12:54 PM, Pierre-Louis Bossart wrote:
> 
>> Don't believe WoV for WPT has been added for SST linux so .ignore_suspend=1 achieves nothing. The offload part is probably just limited to bigger buffer size compared to system pin than anything else. So, nothing prevents from removing .ignore_suspend for SST solutions until WoV is verified. Don't know about SOF side.
>> Pierre, what's your take on this?
> 
> I think on Baytrail and Broadwell we will most likely never enable hotwording on the Intel DSP, and S0i1-Playback isn't planned either.
> 
> However hotwording is enabled on the RT5677 and there may be clocking dependencies so that the RT5677 remains operational - at least the mclk needs to be on, so the bdw-rt5677 case probably needs more work.
> 
> While I am at it, I think the notion of .ignore_suspend has an assumption baked in. It will work if the only suspend mode is S0i1. If the platform can choose between S0i1 and S3, then we would still want to suspend all paths in S3, which currently isn't really possible.

You can check if S0i1 will be used by using:

pm_suspend_default_s2idle()

If this returns true then S0i1 will be used, otherwise S3.

This is defined in kernel/power/suspend.c and always build, so it
should be ok to also use this in non x86 specific code-paths
(it will simply always return false there I believe).

Regards,

Hans

