Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C54F15951D4
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 07:18:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 667EE15E2;
	Tue, 16 Aug 2022 07:17:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 667EE15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660627092;
	bh=qPKdxeRNzS2EG6XwXZi03DGt1/5NmVpPqYZX3qsiTDk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F7j/R5oBBhgRr2OH5FOlwEaPO4eCq0AYWJ/K/e9Ixz5wwxrpAqev541wTAtQxvWka
	 cBCxf/+2D7G3ZrCcWYYFBl6WWwWpXmBxlTbZfZIArkdF+iWqkqcD446kKscl0s0Y4U
	 89sxl/aoL7QCWXDBtNM5KwQQ+IfO2W/9TqTF7wTE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AC8CF80552;
	Tue, 16 Aug 2022 07:16:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50FF3F8025A; Mon, 15 Aug 2022 14:11:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D5B1F80125
 for <alsa-devel@alsa-project.org>; Mon, 15 Aug 2022 14:10:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D5B1F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lGLY3FpD"
Received: by mail-pj1-x1030.google.com with SMTP id
 t2-20020a17090a4e4200b001f21572f3a4so6605881pjl.0
 for <alsa-devel@alsa-project.org>; Mon, 15 Aug 2022 05:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=w0Mjm1yI3tFxRPUURdrFm5SP6GE+L3QToY/2DXzlvgk=;
 b=lGLY3FpDa9kFxeJRGunbWRcIA04Z1farW0ZsA8fkYWIVVBBg/f86rbsJfSD3ibtX0M
 U3dt1gpti5wKm97ffMpCka3KZBy+ikdjeUGkST3VTMXiF4k540cNl27zZdH/fYK0/d1B
 cuPYbQfwuhy28GZnC+9uAhPZIARXBXPKfTqVbMuSMaCet8U4wyD4mmQta79XcxQsoUXq
 hF7U4RiikpUDxqfnn1npFWQQu9ywiyis3iSuwl+XwcgH/UHnO6HoPEyjxJdI0w+w+CZC
 lyW02uvt+kaJYNdLfa6qROGaANZB5EMRQAPYncThTOMLD/GaYh3TEqYgbRf1I56lnRvt
 PLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=w0Mjm1yI3tFxRPUURdrFm5SP6GE+L3QToY/2DXzlvgk=;
 b=SW0sb11+7pVaq/40S4bLivMrBEPNv/MsWv12FrK/HgSPV6LcsXULsEnKnYUWqgsafY
 lKE7oOhEsq8FyonUsl10d/vwug9VCEXr8KRqVm61qjwGIxo6M7OQFNqZNRIqZRO0rqij
 TLze/aDmEWNyzIx1eQM7F+DWxhCSIw96Ym6meMp+L3cHSoe7HRny/GIDGmrcOerLuae2
 jwxUDJe16qbsjpMh1F5jHlHZxrPSsKHbjvcN8gXiJm91bvX8tuKBhwEStLKfYgAjOUUG
 PnPMAs7M1kZk/4YPgssTIeM41YfbuzT5NEhzrExaBnqQWWNtnMT1m4/nn68PXtWqVv0Q
 /3OA==
X-Gm-Message-State: ACgBeo2ZrGePvuju2eM4mkXbDhDha2Xf1vhsJxrrsbvzXDC663Q4V3Gs
 SA0hpD6XMs5qnw7ZOkQ3Cv8=
X-Google-Smtp-Source: AA6agR4syNM8Z3sSCzQzhZW2WNyv5yIvr0ICRxqdKmutKqGSYqWka1B4xOFbsbHO3K5TcK8hKP8oJw==
X-Received: by 2002:a17:90b:380d:b0:1f5:2c6d:7de8 with SMTP id
 mq13-20020a17090b380d00b001f52c6d7de8mr27495438pjb.18.1660565452735; 
 Mon, 15 Aug 2022 05:10:52 -0700 (PDT)
Received: from [192.168.0.110] ([103.159.189.152])
 by smtp.gmail.com with ESMTPSA id
 fh3-20020a17090b034300b001ef87123615sm4421101pjb.37.2022.08.15.05.10.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 05:10:51 -0700 (PDT)
Message-ID: <2f0d50a1-b9d0-577f-d718-459ae0b1ba77@gmail.com>
Date: Mon, 15 Aug 2022 18:10:43 +0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [RFC PATCH] Soundwire: Initialize multi_link with fwnode props
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20220814080416.7531-1-khalid.masum.92@gmail.com>
 <CAHp75Ve4UaLsUknGKm14_-f5=qsq1s_Ws+j6h0kAY5_XMkSmQw@mail.gmail.com>
 <54dd86bd-416b-3048-9bd0-368afa3aaf2f@gmail.com>
 <741edbf0-5835-eb89-bb6a-69d7e0d00e36@linux.intel.com>
From: Khalid Masum <khalid.masum.92@gmail.com>
In-Reply-To: <741edbf0-5835-eb89-bb6a-69d7e0d00e36@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 16 Aug 2022 07:16:15 +0200
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Scally <djrscally@gmail.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, Len Brown <lenb@kernel.org>
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

On 8/15/22 14:16, Pierre-Louis Bossart wrote:
> 
> 
> On 8/15/22 06:28, Khalid Masum wrote:
>> On 8/15/22 00:46, Andy Shevchenko wrote:
>>> On Sun, Aug 14, 2022 at 11:31 AM Khalid Masum
>>> <khalid.masum.92@gmail.com> wrote:
>>>>
>>>> According to the TODO, In sw_bus_master_add, bus->multi_link is to be
>>>> populated with properties from FW node props. Make this happen by
>>>> creating a new fwnode_handle flag FWNODE_FLAG_MULTI_LINKED and use
>>>> the flag to store the multi_link value from intel_link_startup. Use
>>>> this flag to initialize bus->multi_link.
>>>
>>> ...
>>>
>>>>           /*
>>>>            * Initialize multi_link flag
>>>> -        * TODO: populate this flag by reading property from FW node
>>>>            */
>>>> -       bus->multi_link = false;
>>>> +       bus->multi_link = (fwnode->flags & FWNODE_FLAG_MULTI_LINKED)
>>>> +               == FWNODE_FLAG_MULTI_LINKED;
>>>
>>> NAK (as far as I understood the context of the comment and the change
>>> itself).
>>>
>>> These flags are for devlink, we do not mix FW properties with those
>>> internal flags anyhow. The comment suggests that this should be az
>>> property. Also commit message doesn't explain the relation to devlink.
>>>
>> That is a good information to know. Thanks.
>>
>> I shall try to find out if I can somehow get multi_link's value from
>> fwnode in any other way and look into devlink in the process.
>>
>> If you have any suggestions regarding this TODO, please let me know.
> 
> The suggestion is to remove the TODO and leave the code as is: the
> capabilities enabled for multi-link are required as part of the
> programming sequences, even when a stream uses a single link we still
> use the syncArm/syncGo sequences.
> 
> Please don't change this.

Thanks for the suggestion! I shall send a patch with the TODO removed, 
leaving the code as is.

   -- Khalid Masum

