Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1CB301687
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Jan 2021 17:00:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD3321ABD;
	Sat, 23 Jan 2021 16:59:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD3321ABD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611417622;
	bh=AR31PM0AT4xNgKxfKj6f4Ya43k7U6c9TTprvJJ6GzZo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MvG5arK31sCIVJzCPdiNNuDpjDpjWWLrOwzc50XAv8lEiiK2dX2cFLNarR5d7yWgk
	 CnJRIjhiXpEAQQAxP+LrkqRTm0tFypkDT3jNHEaIjcOyZiSJR34dWmnNITzcqjPMHI
	 hKK5SyOtX0EmnVIrcrTjgSrjb8VkAk6eUulzYbPo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62906F8015B;
	Sat, 23 Jan 2021 16:59:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B3B8F8027D; Sat, 23 Jan 2021 16:59:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBBAAF800FD
 for <alsa-devel@alsa-project.org>; Sat, 23 Jan 2021 16:59:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBBAAF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="QyKAwbsW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611417562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kzqbd4zUbwj3cz7F2MYlcHDyhxJmQ+DUDdVQq2IEaOA=;
 b=QyKAwbsWFD9SaYHxO4NkGN68/0o3rNp1gg3bUnQZSJGBw7VQZlkvV5MyMcy6DaFeo6J3VO
 DSlzTNTWNYun1HQGjzYe9nATGzM3fIVE2z/DCLJOlN5cVhrz2FkrIMru/Cc3q2HQ6SDhS1
 /JpUX+/UbaaM8VwkH8mCLoiZEnuYuGA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-dDP7QrjwO1GddyG4tAEYlg-1; Sat, 23 Jan 2021 10:59:19 -0500
X-MC-Unique: dDP7QrjwO1GddyG4tAEYlg-1
Received: by mail-ed1-f70.google.com with SMTP id dg17so4648675edb.11
 for <alsa-devel@alsa-project.org>; Sat, 23 Jan 2021 07:59:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kzqbd4zUbwj3cz7F2MYlcHDyhxJmQ+DUDdVQq2IEaOA=;
 b=XG/5ul2C6ivsrbwRVqhktwH2xvORLY4hb3JZ+qk8w7Yg1en1PL2SxwcDLVBmZn04vE
 gpBVi+/Y9pII3+gggAdJFrssG2INdKdehyVJjnQWFL3EhyvrOJ+6o4ibT4Rx6it9MdpM
 bcIZON5SWUS6MvF7JczotqO54J2d56Lq52HtQArcC2SzUz6GrRi5smswm4fpSr2W0xqn
 BVPatlOiBBWa2VD8fCyvkQZCu9H5HHcRA8keljGkNHxbso9ddCJ9KAx8THOshbh8TBqR
 QyW7k9k3pzAjQNQ8wXFatXimrY77rYvikjAnw7GNRbNH7RehuaV55j6WtCh23HZ+lzCE
 Lsqw==
X-Gm-Message-State: AOAM532MeFcs28PX/GpVSDg/NzRBNBLijRLh79WN9Yq0g9YpHRWq/uTW
 kBFVcbVWpJ2uTvZ16qG/1QQEU8O/VGHRsdg8RYp+RYJ17CjUzJr1TJ5wkr/P5uaxie6dbCVMPhJ
 qLC71FITLDDuRvCzKXmfop4w=
X-Received: by 2002:a17:906:a94:: with SMTP id
 y20mr384933ejf.525.1611417558382; 
 Sat, 23 Jan 2021 07:59:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwS/dSnJpPIp2kv7xNGYoq7pm5HFgSlSnAbtiCxU3rJQGSMwnHsA0BN9kAnjff3S8K6nOapNw==
X-Received: by 2002:a17:906:a94:: with SMTP id
 y20mr384930ejf.525.1611417558190; 
 Sat, 23 Jan 2021 07:59:18 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id z6sm6114726ejx.17.2021.01.23.07.59.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jan 2021 07:59:17 -0800 (PST)
Subject: Re: [PATCH alsa-ucm-conf 1/3] chtnau8824: Move DAC Channel Source
 selection to Speaker/Headphones EnableSeq
To: Jaroslav Kysela <perex@perex.cz>
References: <20201216153838.34945-1-hdegoede@redhat.com>
 <7c075e59-8576-99e9-3688-1ab858e59716@redhat.com>
 <90f18f8a-192e-fa2c-8975-93acd70006ee@perex.cz>
 <78e29bab-1b9f-b57e-0d2a-46a6838018db@perex.cz>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <9a70c017-80d5-4a11-5d92-d527713fbcab@redhat.com>
Date: Sat, 23 Jan 2021 16:59:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <78e29bab-1b9f-b57e-0d2a-46a6838018db@perex.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On 1/18/21 3:40 PM, Jaroslav Kysela wrote:
> Dne 17. 01. 21 v 17:52 Jaroslav Kysela napsal(a):
>> Dne 17. 01. 21 v 17:09 Hans de Goede napsal(a):
>>> Hi,
>>>
>>> On 12/16/20 4:38 PM, Hans de Goede wrote:
>>>> Move DAC Channel Source selection to Speaker/Headphones EnableSeq.
>>>>
>>>> The main reason for doing this is to make it easier to allow using
>>>> variables, as the Speaker/Headphones conf files are evaluated after
>>>> the main HiFi.conf had a chance to set them.
>>>>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>
>>> ping? It would be nice to get this series merged for proper SOF
>>> support.
>>>
>>> Maybe this got confused with my other UCM chtnau8824 series which
>>> I send 10 days before t
>>
>> Hi,
>>
>> Thanks for the reminder. I though that this one was resolved. I don't think
>> that we need the first change - the evaluation for If and Include sequences is
>> executed before SectionVerb {} parsing. So the If...Define.RightOutputChannel
>> should be valid for SectionVerb...Include...File
>> "/codecs/nau8824/EnableSeq.conf". The 'DACR Channel Source' control seems to
>> require a static settings so keeping it in the verb init sequence has sense.
>>
>> I applied the second (SST variable) patch for now. It's nice cleanup. Thanks.
> 
> Hans,
> 
> 	could you test https://github.com/alsa-project/alsa-ucm-conf/pull/74 ?

I can confirm that the simplified version from that pull-req works as it should, thanks.

Regards,

Hans

