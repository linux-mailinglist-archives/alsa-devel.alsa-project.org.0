Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 875805951D3
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 07:18:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25FE21637;
	Tue, 16 Aug 2022 07:17:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25FE21637
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660627080;
	bh=gH4kpM2zoHsS71pXeXN0q4Pz9+SPpIqZ4yT4Au9UauQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iIe5RpKj76rXga3DMlYMIUZTxgqqT4hPcACCFAuTsjQGXGAoHhd5FI/VhSa5yuli4
	 3V+3P5VnX+tA4uSmCXbqYUnNegN+4IlwszORW+6YOXIHv8tKOM3qAAPBuY3CFn6wmY
	 6f96neVzPBZF75DL/5HyKl3yZ37CUXRp89oKhOAs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07FF6F80082;
	Tue, 16 Aug 2022 07:16:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E07F4F80095; Mon, 15 Aug 2022 06:28:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8652FF80095
 for <alsa-devel@alsa-project.org>; Mon, 15 Aug 2022 06:28:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8652FF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EiZ46NWg"
Received: by mail-pj1-x1030.google.com with SMTP id
 e8-20020a17090a280800b001f2fef7886eso5814707pjd.3
 for <alsa-devel@alsa-project.org>; Sun, 14 Aug 2022 21:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=AxntZ5boEdqFqlgnkvj7nx9yV31SjrqxErxj02VUkgI=;
 b=EiZ46NWgWvaPrWGZpEefUGH8iyYRrNyxPcZFIYYXH1N8zjQloB6tCImzZpIVPLxywV
 vvyyCkK9dDeDt7iSwYZs5PMf3Bp037GUBrBFN01bWAJ72NpP06EtdZlV1FKXm653cwX1
 wo8o5GLfryMyJ+1ZnsFNTEeTf+sdzRGnYhiiFAJbNzKyCg7cKOTj46KZPv9lhejF+hys
 +f0JYi+/ciwR5SdnaOiW3IGj7nqdcuHuml0Nonjl2N2YXx4U61l5YaMx4ic3xRYZWWQO
 0F+OC0HTjyGxpiJOuxcqqEGO1U3lt/938nOLcJ09iB5MjBqOQuLp7rZmVVIdZOKk/eEe
 m0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=AxntZ5boEdqFqlgnkvj7nx9yV31SjrqxErxj02VUkgI=;
 b=SAHjHI/DCs3VsjGdLu8ppUChEIfHn5dffpzrnMmJ2dkfp0AV0AqygX9SAU9uzxlaPq
 hihPg4MzlyTiJFYpils+ezvUruscbbRmm7OY6+3pq7qPyI4H3CvIxe+HI5cLoc85ocuf
 gha0uXnuM4k/4oCq/pDl+SPxMXcmfu0gIWHJbbS2UBhcFjgvj6FxgL4mQK7WSEf3coHM
 8bsyT5sF87icAdgLeUPNXYz0J8k88L0nD9aWXB843MaQhg0frO0HaHnnBocNVgGUYR8V
 0ntEP6Ti1A1PvSFdBpXC76uJsK40gipWFoc3o0NWIc9ki9C4A7P6ksLKwG0OEDaVPlOw
 T6mQ==
X-Gm-Message-State: ACgBeo3J03uZDYMExeM0FWmjOgeUClJ5m74Bgp7bPiBr3DcDi/15YUN6
 h6CcVMOSPmOgFLyq2PCgB84=
X-Google-Smtp-Source: AA6agR6MAp7+b/8FUDKU99TCqhom1gNdLqL4D9vAA6/sxWFPfnKjoyXgKgGz0y5SYQ1WL0Q+KddeKA==
X-Received: by 2002:a17:90b:4b91:b0:1f4:e116:8f1 with SMTP id
 lr17-20020a17090b4b9100b001f4e11608f1mr16664416pjb.121.1660537693908; 
 Sun, 14 Aug 2022 21:28:13 -0700 (PDT)
Received: from [192.168.0.110] ([103.159.189.148])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a170902d38600b001709b9d292esm6118545pld.268.2022.08.14.21.28.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Aug 2022 21:28:13 -0700 (PDT)
Message-ID: <54dd86bd-416b-3048-9bd0-368afa3aaf2f@gmail.com>
Date: Mon, 15 Aug 2022 10:28:05 +0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [RFC PATCH] Soundwire: Initialize multi_link with fwnode props
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20220814080416.7531-1-khalid.masum.92@gmail.com>
 <CAHp75Ve4UaLsUknGKm14_-f5=qsq1s_Ws+j6h0kAY5_XMkSmQw@mail.gmail.com>
From: Khalid Masum <khalid.masum.92@gmail.com>
In-Reply-To: <CAHp75Ve4UaLsUknGKm14_-f5=qsq1s_Ws+j6h0kAY5_XMkSmQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 16 Aug 2022 07:16:15 +0200
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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

On 8/15/22 00:46, Andy Shevchenko wrote:
> On Sun, Aug 14, 2022 at 11:31 AM Khalid Masum <khalid.masum.92@gmail.com> wrote:
>>
>> According to the TODO, In sw_bus_master_add, bus->multi_link is to be
>> populated with properties from FW node props. Make this happen by
>> creating a new fwnode_handle flag FWNODE_FLAG_MULTI_LINKED and use
>> the flag to store the multi_link value from intel_link_startup. Use
>> this flag to initialize bus->multi_link.
> 
> ...
> 
>>          /*
>>           * Initialize multi_link flag
>> -        * TODO: populate this flag by reading property from FW node
>>           */
>> -       bus->multi_link = false;
>> +       bus->multi_link = (fwnode->flags & FWNODE_FLAG_MULTI_LINKED)
>> +               == FWNODE_FLAG_MULTI_LINKED;
> 
> NAK (as far as I understood the context of the comment and the change itself).
> 
> These flags are for devlink, we do not mix FW properties with those
> internal flags anyhow. The comment suggests that this should be az
> property. Also commit message doesn't explain the relation to devlink.
> 
That is a good information to know. Thanks.

I shall try to find out if I can somehow get multi_link's value from 
fwnode in any other way and look into devlink in the process.

If you have any suggestions regarding this TODO, please let me know.

Thanks,
   -- Khalid Masum
