Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B122C2DAF
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 18:04:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F1881725;
	Tue, 24 Nov 2020 18:04:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F1881725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606237491;
	bh=IqR309OHHtYrDAWFZnEdK7+YS0vMSytKKZwTAx0Dgvw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WzxysyoJO88fa/c4ei46sQ7ASt9cOLrTkFhHv+cgp3qFwRe6kWwUdvMOCIwxVNLCS
	 5b1bg7Zs6mkbYvC56o1I3wHUqJl9WfzkfN88kMA4MMWE8BAdQzBKpCZ8MID50txIKh
	 rgS/nmud+dGNwLB0vfmRuIeFTr4WZwH7EeIZGv9A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1A12F80520;
	Tue, 24 Nov 2020 17:58:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7491DF80255; Mon, 23 Nov 2020 18:06:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AB69F80113
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 18:06:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AB69F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="BtEofZ03"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606151171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ETdBmUCF01QVQJOZ+sQu9TUGQeVKu9xOEmE1E5gBvfU=;
 b=BtEofZ03By1sp6OyH8lSI6IT4Bb/Q48OsWV2XnBXmdgQcceGh9rKSaQV86czSHO4W4CJHn
 vUaUaH4n0l1WmtKl1NY4JjZQEtZdHR6F0okj/kLdyZp+LnqjvTzaYPmjipu9+IS6RcbTNg
 lanzsvwsZXvmVS2IMlU/0SstZMlkjqs=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-tZJFUtqYOYqXFAU14tnNWA-1; Mon, 23 Nov 2020 12:06:09 -0500
X-MC-Unique: tZJFUtqYOYqXFAU14tnNWA-1
Received: by mail-qv1-f71.google.com with SMTP id t14so13427581qvc.13
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 09:06:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ETdBmUCF01QVQJOZ+sQu9TUGQeVKu9xOEmE1E5gBvfU=;
 b=mD/EkzcYZQigrwj92y7WCt5wcYhqNariP77q57OWKJpKI2GkXLbKM8YGJq+9BEY/c8
 2jiIb+BFibA7vGErI0BLBmjawzWVSbXPjWdzzachzczBEI2h6dWf2SslWg3d/KFNrqD7
 AooiYxoAxUsxy/k5l5p+7Dh6/2CVqXeSxa+X7MWuMqUnsUIG1m/uZuF1LuZxaX4rpN0p
 ANwujRwY4oYk+eRQw1Au+MeAbw0uH3oh/PWpmNxKzboEUhVZBtAb3lPZ4d61lMfy+dMk
 eQv7iAhCedlhYMAvjCbBRKq0rKYspAYQ8XF+9/81kuZfRQJZRlcEEuZtm5w3adtH7nh0
 ZW5w==
X-Gm-Message-State: AOAM5312W//0gMhnPrcwPXZfUYqFlyZolx91+dtadH9mtPqgLgUXzEMM
 cj+kozSNxB4672fHNHGs7Vx1ThYsSBZpQCE/eunXNqSE/5yMfJ4UKI1eF7DfvZtWJ3b0RE2W17J
 orBO1XszZ5XWyeMb4pEjuvfQ=
X-Received: by 2002:ac8:5d53:: with SMTP id g19mr70924qtx.354.1606151169097;
 Mon, 23 Nov 2020 09:06:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHR8oVpP3xv7xpCkK6lH4mawBfXgRI3GL2dEiLGp13/vfLrDKV7SBtsWnvpv2iFDtHltekRw==
X-Received: by 2002:ac8:5d53:: with SMTP id g19mr70839qtx.354.1606151168572;
 Mon, 23 Nov 2020 09:06:08 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id o187sm10226153qkb.120.2020.11.23.09.06.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 09:06:07 -0800 (PST)
Subject: Re: [RFC] MAINTAINERS tag for cleanup robot
To: Joe Perches <joe@perches.com>, clang-built-linux@googlegroups.com
References: <20201121165058.1644182-1-trix@redhat.com>
 <2105f0c05e9eae8bee8e17dcc5314474b3c0bc73.camel@perches.com>
 <6e8c1926-4209-8f10-d0f9-72c875a85a88@redhat.com>
 <859bae8ddae3238116824192f6ddf1c91a381913.camel@perches.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <88eeba27-ee36-df63-8cd9-3cccbe5e0850@redhat.com>
Date: Mon, 23 Nov 2020 09:06:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <859bae8ddae3238116824192f6ddf1c91a381913.camel@perches.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailman-Approved-At: Tue, 24 Nov 2020 17:58:06 +0100
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-scsi@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 cluster-devel@redhat.com, linux-acpi@vger.kernel.org,
 tboot-devel@lists.sourceforge.net, coreteam@netfilter.org,
 xen-devel@lists.xenproject.org, MPT-FusionLinux.pdl@broadcom.com,
 linux-media@vger.kernel.org, alsa-devel@alsa-project.org,
 intel-gfx@lists.freedesktop.org, ecryptfs@vger.kernel.org,
 linux-omap@vger.kernel.org, devel@acpica.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, netfilter-devel@vger.kernel.org,
 linux-crypto@vger.kernel.org, patches@opensource.cirrus.com,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org
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


On 11/22/20 10:22 AM, Joe Perches wrote:
> On Sun, 2020-11-22 at 08:33 -0800, Tom Rix wrote:
>> On 11/21/20 9:10 AM, Joe Perches wrote:
>>> On Sat, 2020-11-21 at 08:50 -0800, trix@redhat.com wrote:
>>>> A difficult part of automating commits is composing the subsystem
>>>> preamble in the commit log.  For the ongoing effort of a fixer producing
>>>> one or two fixes a release the use of 'treewide:' does not seem appropriate.
>>>>
>>>> It would be better if the normal prefix was used.  Unfortunately normal is
>>>> not consistent across the tree.
>>>>
>>>> So I am looking for comments for adding a new tag to the MAINTAINERS file
>>>>
>>>> 	D: Commit subsystem prefix
>>>>
>>>> ex/ for FPGA DFL DRIVERS
>>>>
>>>> 	D: fpga: dfl:
>>> I'm all for it.  Good luck with the effort.  It's not completely trivial.
>>>
>>> From a decade ago:
>>>
>>> https://lore.kernel.org/lkml/1289919077.28741.50.camel@Joe-Laptop/
>>>
>>> (and that thread started with extra semicolon patches too)
>> Reading the history, how about this.
>>
>> get_maintainer.pl outputs a single prefix, if multiple files have the
>> same prefix it works, if they don't its an error.
>>
>> Another script 'commit_one_file.sh' does the call to get_mainainter.pl
>> to get the prefix and be called by run-clang-tools.py to get the fixer
>> specific message.
> It's not whether the script used is get_maintainer or any other script,
> the question is really if the MAINTAINERS file is the appropriate place
> to store per-subsystem patch specific prefixes.
>
> It is.
>
> Then the question should be how are the forms described and what is the
> inheritance priority.  My preference would be to have a default of
> inherit the parent base and add basename(subsystem dirname).
>
> Commit history seems to have standardized on using colons as the separator
> between the commit prefix and the subject.
>
> A good mechanism to explore how various subsystems have uses prefixes in
> the past might be something like:
>
> $ git log --no-merges --pretty='%s' -<commit_count> <subsystem_path> | \
>   perl -n -e 'print substr($_, 0, rindex($_, ":") + 1) . "\n";' | \
>   sort | uniq -c | sort -rn

Thanks, I have shamelessly stolen this line and limited the commits to the maintainer.

I will post something once the generation of the prefixes is done.

Tom

