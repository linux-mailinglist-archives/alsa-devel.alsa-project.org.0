Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEE228AF6B
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 09:44:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08096167E;
	Mon, 12 Oct 2020 09:43:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08096167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602488658;
	bh=uYiwEU/p5pfDOAk5Mm73SeakuTQ3/L/fgllw7aFtm9g=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tY+GsWchGuszVK7vo1CuYcGXEqdbRcZ/t0VxE47fB0OHkx1Ymilhik6XR0lHxGCQ5
	 uz9zAiXhePPAqg/9856hWqyxi+L63j214/tE6oidSG+G3WiWzo1JQaJkGvEDTaZjGT
	 wlwXolXZGu/pte9tY12APTMDncuAcaMTCvDpg+Ok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67DD7F8021D;
	Mon, 12 Oct 2020 09:42:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C928F80217; Mon, 12 Oct 2020 09:42:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AF88F80141
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 09:42:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AF88F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="IXuu+A0A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602488548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B13nqwQmDHnarZjGaxPQ1Xfk8mU+PI+Vknnu37TvRWk=;
 b=IXuu+A0AnVo26WKt4hBKIRuMdVFgImn3VdQfRLrRvA/gnanrFqm9cR2SpfIayB7h91GSCr
 BvP1U0Ti3Fam0CtVS2AI8wMYQwhiPTaJdAcYWJZfXEOwIyKUwk/FhT0Qo00/ZegJZzWuwM
 SLK76ykeY7k18pjEJ2yC7sfdLk+YZK0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-ht4LzptkPLek8CgzWMUsBw-1; Mon, 12 Oct 2020 03:42:26 -0400
X-MC-Unique: ht4LzptkPLek8CgzWMUsBw-1
Received: by mail-ed1-f72.google.com with SMTP id m10so6320905edj.3
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 00:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B13nqwQmDHnarZjGaxPQ1Xfk8mU+PI+Vknnu37TvRWk=;
 b=q/Y72j4RQsvQGzu7eeUpf/PYNNCQlAyDxSOzWBQdbwNFo2SLGyb2ZkzFb851OMuL+R
 hD3j4ZL/APTONlmi3Ao8g+LVbD5c8fU7FEXsdRXEVDQ7rbb4CQqbE1bWkSqwGkpx5Ylo
 rKFZ7xAWz6rPGcC9SJazWUIXqMTDOfsfkxXxbPRSZD2lWxLg4p5e0UgOVoD0dMXxYE1k
 XtpidlyjNKjZpk9Db/83FvBpmzjEYxvbeh6q5opxIq4EPzADg31/1ZeoBwOSbgKXs8be
 3XNBLM1xMZDwwbKGOZs/aO+OOh/SN4lBYXXe71SDgLGNQZGIQdYbv0m0aeo45SqroPZI
 ygGQ==
X-Gm-Message-State: AOAM531a8gNNG98VjCOCug9GrVN0dWL0qMOQhJnrZO22QhyLB3x3I0hX
 vJUyWySlupvABD+4OvaXRvZudZ+QgYLvxZHaONaNCyhqP7DlBTiI8+rcmwdlo3Bm7g9bZT/80T+
 exKXPKXS0Bbwt6dM8AHFhpxI=
X-Received: by 2002:a17:906:1c90:: with SMTP id
 g16mr26311081ejh.115.1602488544795; 
 Mon, 12 Oct 2020 00:42:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVuLfg95m45Ok98lY/6oDsrSs3hzUVT3HNw99s5Da5cvOZFC8H9iNV0lueqVuEKtRKf1nyQw==
X-Received: by 2002:a17:906:1c90:: with SMTP id
 g16mr26311064ejh.115.1602488544571; 
 Mon, 12 Oct 2020 00:42:24 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id r24sm10105271eds.67.2020.10.12.00.42.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2020 00:42:24 -0700 (PDT)
Subject: Re: [PATCH] ASoC: Intel: Do not load legacy SST driver on BYT when
 SND_SOC_SOF_BAYTRAIL is enabled
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>
References: <20201011095346.49589-1-hdegoede@redhat.com>
 <b92b6b6d382048829a37ae803d4f9451@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <6fbc7ba0-646a-27b9-8879-e9f4045385fa@redhat.com>
Date: Mon, 12 Oct 2020 09:42:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b92b6b6d382048829a37ae803d4f9451@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
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

On 10/12/20 9:24 AM, Rojewski, Cezary wrote:
> On 2020-10-11 11:53 AM, Hans de Goede wrote:
>> The legacy 80860F28 / sst_acpi_baytrail_desc match in sst_acpi_match
>> is already conditional on the the newer SND_SST_IPC_ACPI driver not
>> being enabled.
>>
>> But now that we have an even newer driver in the form of SOF support
>> for BYT devices, we also need to take this into account, so we also
>> must not include the sst_acpi_baytrail_desc match when
>> SND_SOC_SOF_BAYTRAIL is enabled.
>>
>> This fixes snd-soc-sst-acpi binding to the 80860F28 platform device,
>> blocking snd-sof-acpi from binding, which breaks audio support.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
> 
> Hello,
> 
> Series:
> [PATCH v2 00/13] ASoC: Intel: Remove obsolete solutions and components
> https://lore.kernel.org/alsa-devel/20201006064907.16277-1-cezary.rojewski@intel.com/
> 
> removes sst-acpi component along with many others so further changes to
> said component will only cause conflicts -or- require commit reordering.
> I'd advice against that.

As I already mentioned in the private-thread which Pierre-Louis started
with me, Jaroslav Kysela and Liam about this I would advice against applying
that series for now. First we need to put in more work to make sure that
the new drivers are actually ready.

Also I must say that I'm quite disappointed that since I, as the person
who more or less single handedly have made sure that audio works properly o
Bay Trail and Cherry Traul devices (*), has not been Cc-ed on that series,
that seems like a huge oversight.

Anyways I will reply in the thread of the series and ask Mark to revert
the entire series. Since IMHO the new drivers are clearly not ready yet.
Yesterday I ran my first set of tested and I immediately hit a DSP
hang doing just a few very basic tests.

Regards,

Hans



*) And kept it working properly despite other people breaking it with changes
like moving the userspace stuff to UCM2.

