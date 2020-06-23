Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB1E204EBD
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 12:04:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F0F71737;
	Tue, 23 Jun 2020 12:03:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F0F71737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592906681;
	bh=u3F8kx7ZhS+mkFXI2qf+IlPrCwD4E04lAJlHGGiAyyA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GmRtj16alDWrmkZYoaWZIA71Tr4p/TEIjMlW5FQl90VCiUT0QDdmzdBK0yJs0LFnW
	 PmnsUQ0+LWfX8Ahcbw1uF7o/TnXuWUX5JCfhcAWvJV2WtB8zgfbsXksQicp8AFNyE4
	 Synl0oRniA/0sEzDOaG/R8bbBwv8WP33OaobYcGc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41B54F8023E;
	Tue, 23 Jun 2020 12:03:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0367DF80234; Tue, 23 Jun 2020 12:02:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CDF8F8012F
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 12:02:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CDF8F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="gwSKIaKX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592906539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nx0sK69lkHZ4JtMLJoQCivFzP5HBHYe36hgK8JDGKuk=;
 b=gwSKIaKXotnfvjZGbC9DRQ+KYL5HjKo9APIBGKRL9AX3N/63GupXxjI7IWSp7iRfvxmBEx
 Z7zWg9UkixLLqCnDU/aedbQl8gAPd4n/J30AO8uLieBJRKk7Rx7URld87gzZV5nZYciEsz
 mW8MQX02EeszK/9vM6s9n/Vca7a2OZ8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-o6VWXRzuOPCUaG6_eIb4og-1; Tue, 23 Jun 2020 06:02:13 -0400
X-MC-Unique: o6VWXRzuOPCUaG6_eIb4og-1
Received: by mail-ed1-f71.google.com with SMTP id h5so3357033edl.7
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 03:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nx0sK69lkHZ4JtMLJoQCivFzP5HBHYe36hgK8JDGKuk=;
 b=JVrSbmYhn6qWMYwOxPYBnXSmYihsTsbb6hS8z/E2Ycb5RxEkRW1b0K58IYgfav+dGV
 RIcoAtBlJc2P2aufEAsuW4jZicNZ6KhFJN0y1P8LCqhgsq6RocCbsPi0Cz5nUZ9ES23s
 QdEskQueoh/C4EG/VyhnVSKJUXs+PQA31B99N2sizWozOkh84yzi9+Aw0O6LvpwOybwJ
 tCq5cx2eCa5KDEEVcsibcBlUO9C00aIPcnoz3rh6mNQSut7luBvEqeVDK6oBppIz1XzF
 e5rMt+GY6BVf04Ze3+NAN6MXXUEql8cTh9JOfH6LDZ4MpcWBq/6j75jKWGYfsMjvQH19
 M4hw==
X-Gm-Message-State: AOAM533tNS8sAQmAbAgTFBrXfIIHpafNzOsXzC3vfNEcyc9Merxo06GN
 vMm6Xtyq8L1E4rXeClI3V+VDfqV5CJgvfTzTozqq34VYQ9/IfilxGKgptwRxYtR+j8pzCZTZdWr
 NY/9nK8Ktqzyi2Fjq18blyDY=
X-Received: by 2002:a17:906:9394:: with SMTP id
 l20mr10122245ejx.467.1592906531634; 
 Tue, 23 Jun 2020 03:02:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3vXNgFArJRjEohx2PZpGCTq7xosQNT2K3W5kynv0p3VFyHuM3i8/RnzfywuwZsu4sDbvBIw==
X-Received: by 2002:a17:906:9394:: with SMTP id
 l20mr10122225ejx.467.1592906531419; 
 Tue, 23 Jun 2020 03:02:11 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id l16sm13419986ejx.19.2020.06.23.03.02.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2020 03:02:10 -0700 (PDT)
Subject: Re: Fixing sound on Asus UX534F / some UX533 models
To: Kailang <kailang@realtek.com>, Takashi Iwai <tiwai@suse.de>
References: <808c7b46-c86f-a3de-b645-c47e658e8abb@redhat.com>
 <s5hr1uxhc6k.wl-tiwai@suse.de> <b647b169111f4c46a7c81ec80c551498@realtek.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <1a98fc46-b22a-cc2d-8de9-c2e703b2206b@redhat.com>
Date: Tue, 23 Jun 2020 12:02:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <b647b169111f4c46a7c81ec80c551498@realtek.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 c <kai.heng.feng@canonical.com>, "nuno.dias@gmail.com" <nuno.dias@gmail.com>
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

On 6/4/20 8:49 AM, Kailang wrote:
> Hi Hans de Goede,
> 
> Please test below.
> 
> hda-verb /dev/snd/hwC0D0 0x20 0x500 0xf
> hda-verb /dev/snd/hwC0D0 0x20 0x400 0x7774
> hda-verb /dev/snd/hwC0D0 0x20 0x500 0x45
> hda-verb /dev/snd/hwC0D0 0x20 0x400 0x5289
> 
> I think Headset Mic will work.

Thank you, and sorry for being somewhat slow to respond.

I do not have access to the affected hardware myself.

I've asked users who have reported bugs about this to test these setting
and report back in the following bug-reports:

https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1850439
https://bugzilla.kernel.org/show_bug.cgi?id=206289
https://bugzilla.redhat.com/show_bug.cgi?id=1834751

I will follow-up when I have heard back from the
bug-reporters.

Regards,

Hans


>> -----Original Message-----
>> From: Takashi Iwai <tiwai@suse.de>
>> Sent: Tuesday, June 2, 2020 8:42 PM
>> To: Hans de Goede <hdegoede@redhat.com>
>> Cc: Kailang <kailang@realtek.com>; c <kai.heng.feng@canonical.com>;
>> alsa-devel@alsa-project.org; nuno.dias@gmail.com
>> Subject: Re: Fixing sound on Asus UX534F / some UX533 models
>>
>> On Tue, 02 Jun 2020 11:51:49 +0200,
>> Hans de Goede wrote:
>>>
>>> Hi Kai-Heng Feng, Takashi,
>>>
>>> I see that you are on the notification list for this bug:
>>> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1850439
>>>
>>> So you may have already seen this. Some owners of affected laptops
>>> (which have non working speakers / headphone output atm), have done
>>> some heroic debugging work and come up with a set of
>>> 2 hda-verb commands which fix this.
>>>
>>> I'm not all that familiar with writing hda quirks, so I was hoping
>>> that one of you 2 can come up with a patch to fix this at the kernel
>>> level.
>>>
>>> This would also resolve these 2 bugs, which I believe are the same bug
>>> really:
>>>
>>> https://bugzilla.kernel.org/show_bug.cgi?id=206289
>>> https://bugzilla.redhat.com/show_bug.cgi?id=1834751
>>
>> Adding verbs are trivial and it can be done even without patching kernel but
>> providing by a patch via patch module option of snd-hda-intel driver.
>>
>> But, before moving forward, I'd like to confirm about the correctness (and the
>> safeness) of those verbs.
>>
>> Kailang, could you check the COEF verbs mentioned in the bug entry above?
>>
>>
>> thanks,
>>
>> Takashi
>>
>> ------Please consider the environment before printing this e-mail.
> 

