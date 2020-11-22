Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C942C2DAC
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 18:04:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 028C416FA;
	Tue, 24 Nov 2020 18:03:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 028C416FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606237444;
	bh=Bx0Jg2mhBr2bSvpqWvApEC28zlogWlMHa7aCKrUT0UQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OsEg8Ave4pR5WgyXfYd+O2TefHcV0r6qvYO4VrOwX9SuogGaZeNIXECBfL7IjvquP
	 KKhLxGgBR0vEje72vOhhMU3Y88bsCFaB2+68N+SBPMqZKhONu3AE2AYsXXa63lNm6I
	 GXyAkZQeTE/ZLPiCDrekLR/hoSN0nlJIvaVtv+cU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E00C0F80517;
	Tue, 24 Nov 2020 17:58:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A370EF80165; Sun, 22 Nov 2020 17:11:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,TRACKER_ID,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 898E7F80107
 for <alsa-devel@alsa-project.org>; Sun, 22 Nov 2020 17:11:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 898E7F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="JuTdFtHh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606061463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D4o3+oRulyAmQWJaTM5GlynW0/tmbkOzx3PzhPB5iTg=;
 b=JuTdFtHhsclSCFUt685nObhejVSN718q0xDzBI7qCmYl4/ObRaglwiPh1kkjwftUYKtjGT
 F9V7hg+6Ged1Ypc78HlKhU8yURVG+HfY97vOU+FDQTH2+EktMkCoujoBzuPIEBmLFdUcTH
 U0gcN5s+aBBBeO3IQtZ/9hGSdS8be9I=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-bVmXJMn7N4aDULvI_WFPSw-1; Sun, 22 Nov 2020 11:10:59 -0500
X-MC-Unique: bVmXJMn7N4aDULvI_WFPSw-1
Received: by mail-qt1-f198.google.com with SMTP id 100so11754240qtf.14
 for <alsa-devel@alsa-project.org>; Sun, 22 Nov 2020 08:10:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=D4o3+oRulyAmQWJaTM5GlynW0/tmbkOzx3PzhPB5iTg=;
 b=YbkfN9/c3Q1BZVpz3ycQ2t4rQDCb2V7haWzSy2c06P4QfLd90eC3LLP/5sJXk1jVk5
 ZEZBtOgvPKGU8cNrqqK1SvQ4PQ80XusU/m/CPYN0l2KNd8+D8O3OLHw9B2nAjPPz0G2e
 DX2Sz20KJqgQPr8XJjuan4csasQvB8N1J3YKZbtndhCxnjz2I22Dqone3xl5TN94AWSR
 SFgXDqVYqJuOJIlzNzpTUbHRXttSlAe+L7trg0ON8PkbwF5TF/AOgQKHhXilnXcltyqs
 FZ057/nGEtxWw6/xLDGuEj+mNoDPmavxjLi8v8J+M9FQT2P8x2+chSsYx3oBPY9WHM4/
 E49w==
X-Gm-Message-State: AOAM531S1e8rjF4Y3Rhpfn8ZUoMkq76kv8CwGUaYnyuo2KnZsGUX26UV
 xoPOCogRGLX6sPzQwwNmaNtJREAe9bw+xZVz13T5Jy1I1HdJW5F+m0WJGZXnvlUfLoLU8h5NDxC
 0r1gQ4wjUdwxmwSN3utMkniY=
X-Received: by 2002:ac8:5a8c:: with SMTP id c12mr23364833qtc.97.1606061459424; 
 Sun, 22 Nov 2020 08:10:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6JfmMkGlJyoaKx6ihYsYbDuDsWkyDwIosiC/apv5eylMrcIvHPxlHVgnFDCnun9WXh4UZ3w==
X-Received: by 2002:ac8:5a8c:: with SMTP id c12mr23364770qtc.97.1606061458997; 
 Sun, 22 Nov 2020 08:10:58 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id l3sm2779806qth.13.2020.11.22.08.10.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Nov 2020 08:10:58 -0800 (PST)
Subject: Re: [RFC] MAINTAINERS tag for cleanup robot
To: Matthew Wilcox <willy@infradead.org>
References: <20201121165058.1644182-1-trix@redhat.com>
 <20201122032304.GE4327@casper.infradead.org>
 <ddb08a27-3ca1-fb2e-d51f-4b471f1a56a3@redhat.com>
 <20201122145635.GG4327@casper.infradead.org>
From: Tom Rix <trix@redhat.com>
Message-ID: <0819ce06-c462-d4df-d3d9-14931dc5aefc@redhat.com>
Date: Sun, 22 Nov 2020 08:10:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201122145635.GG4327@casper.infradead.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Mailman-Approved-At: Tue, 24 Nov 2020 17:58:06 +0100
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-scsi@vger.kernel.org, clang-built-linux@googlegroups.com,
 amd-gfx@lists.freedesktop.org, cluster-devel@redhat.com,
 linux-acpi@vger.kernel.org, tboot-devel@lists.sourceforge.net,
 coreteam@netfilter.org, xen-devel@lists.xenproject.org,
 MPT-FusionLinux.pdl@broadcom.com, linux-media@vger.kernel.org,
 alsa-devel@alsa-project.org, intel-gfx@lists.freedesktop.org,
 ecryptfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-omap@vger.kernel.org, devel@acpica.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, netfilter-devel@vger.kernel.org,
 linux-crypto@vger.kernel.org, patches@opensource.cirrus.com, joe@perches.com,
 bpf@vger.kernel.org
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


On 11/22/20 6:56 AM, Matthew Wilcox wrote:
> On Sun, Nov 22, 2020 at 06:46:46AM -0800, Tom Rix wrote:
>> On 11/21/20 7:23 PM, Matthew Wilcox wrote:
>>> On Sat, Nov 21, 2020 at 08:50:58AM -0800, trix@redhat.com wrote:
>>>> The fixer review is
>>>> https://reviews.llvm.org/D91789
>>>>
>>>> A run over allyesconfig for x86_64 finds 62 issues, 5 are false positives.
>>>> The false positives are caused by macros passed to other macros and by
>>>> some macro expansions that did not have an extra semicolon.
>>>>
>>>> This cleans up about 1,000 of the current 10,000 -Wextra-semi-stmt
>>>> warnings in linux-next.
>>> Are any of them not false-positives?  It's all very well to enable
>>> stricter warnings, but if they don't fix any bugs, they're just churn.
>>>
>> While enabling additional warnings may be a side effect of this effort
>>
>> the primary goal is to set up a cleaning robot. After that a refactoring robot.
> Why do we need such a thing?  Again, it sounds like more churn.
> It's really annoying when I'm working on something important that gets
> derailed by pointless churn.  Churn also makes it harder to backport
> patches to earlier kernels.
>
A refactoring example on moving to treewide, consistent use of a new api may help.

Consider

2efc459d06f1630001e3984854848a5647086232

sysfs: Add sysfs_emit and sysfs_emit_at to format sysfs output

A new api for printing in the sysfs.  How do we use it treewide ?

Done manually, it would be a heroic effort requiring high level maintainers pushing and likely only get partially done.

If a refactoring programatic fixit is done and validated on a one subsystem, it can run on all the subsystems.

The effort is a couple of weeks to write and validate the fixer, hours to run over the tree.

It won't be perfect but will be better than doing it manually.

Tom

