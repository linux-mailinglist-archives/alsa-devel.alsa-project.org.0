Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD50228B041
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 10:28:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DAC5167E;
	Mon, 12 Oct 2020 10:27:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DAC5167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602491294;
	bh=SsIfwnwUXqgtS4rgwZDcAJWNQTiTNTy8WoDNT/j7ZQ4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uEZFZ8CylizzpQ0U8VOBEiI2EpjJjHxWQ5CeEd9dcABGUFtSb/KpHDpxvX/+2EoZ7
	 lCYkATiNQ2+6hTCOtdMwUzIrFmG8iFF/dM788uQD890yvBpen+yCjzgZNcgi2j2faC
	 nWR3e25QJ9/KtDT7buyFghAgOjTz+Coxi3f2WyEk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF9C0F8021D;
	Mon, 12 Oct 2020 10:26:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0FACF80217; Mon, 12 Oct 2020 10:26:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0F50F800D8
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 10:26:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0F50F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="g9gnXfRc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602491184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WgYOY+JLVBI6mpZQYvS8RYhawoxSpz+V6bugUiyKOaE=;
 b=g9gnXfRcEcch2MdmuoL0/V/VKCW0a11ZlpoMVSEBfrEVZ9DRFfujTOXMMEnJYaKfM1OysM
 Oc7At3xpIhYbhrqO6YsIjYW1fPBkiHejyX3eImbJs/T8kn640cwvEZWBxqsz+VYy8hSvp8
 cgt6gSZrc2AoMhyhDAAph9AVUrHaV5k=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-V10BS6PEOvu5G2NXqJyrtg-1; Mon, 12 Oct 2020 04:26:20 -0400
X-MC-Unique: V10BS6PEOvu5G2NXqJyrtg-1
Received: by mail-ej1-f69.google.com with SMTP id k23so6102779ejx.0
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 01:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WgYOY+JLVBI6mpZQYvS8RYhawoxSpz+V6bugUiyKOaE=;
 b=g2sL1KIZs6XO+mXUA/ACY/FpGfbQQr6JvzxuSOrytk25JfVMg8JCCfGCOuYGW/PspQ
 OsoaXQiqzZ7MXFtPDHgkto5Mf41SbBfythANa3+m763ibkZDa+q3t1EHNgxL7ynqwXLF
 LMFOj0+vhyOYRP8oCPJVYKVgPyylbIO8a4HHohkEYf+XDs0QRdEnigLXkEhs181u2G/R
 O2p69NHVm8JJZYRZ2I0GkmGMhVvFAUjE4L5DfPH8tK9cvdeQfjYVrbr6gMtV84+A1P59
 wLvwvs0xDy+mHQj2NO0mNnF92CwLuwHulm0RjTzCamfqvqrplZ91NEL4heHMoRJzcH3Q
 nD0A==
X-Gm-Message-State: AOAM530wM97ltlJWRvM5e3fY3F+H9rtXGxvVlnSwha+KONALb0GAaInI
 MUlBjFuQfsuE7QYPbHRlVCfS0akBizVgMNEoYGtDvlLEKH400svkAZCPn9+WC2mX1TD6F6/8/vr
 1AaairhQT1ZQgmkP7y9sUj8k=
X-Received: by 2002:a17:906:b1a:: with SMTP id
 u26mr26626396ejg.23.1602491178817; 
 Mon, 12 Oct 2020 01:26:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycPedMhiNLZHIgWSc7j6M8zWrBg9crhWo4GnPqNb8MQIVrn7s8sJttAmjdA+8qeKtKsbIxhQ==
X-Received: by 2002:a17:906:b1a:: with SMTP id
 u26mr26626377ejg.23.1602491178569; 
 Mon, 12 Oct 2020 01:26:18 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id w25sm9725226ejy.123.2020.10.12.01.26.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2020 01:26:17 -0700 (PDT)
Subject: Re: [PATCH v2 00/13] ASoC: Intel: Remove obsolete solutions and
 components
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20201006064907.16277-1-cezary.rojewski@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <cf1fb47d-412f-48fd-4501-e63f1db32bc1@redhat.com>
Date: Mon, 12 Oct 2020 10:26:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201006064907.16277-1-cezary.rojewski@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: krzysztof.hejmowski@intel.com, filip.kaczmarski@intel.com,
 harshapriya.n@intel.com, ppapierkowski@habana.ai, marcin.barlik@intel.com,
 zwisler@google.com, pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 filip.proborszcz@intel.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, michal.wasko@intel.com, tiwai@suse.com,
 andriy.shevchenko@linux.intel.com, cujomalainey@chromium.org,
 vamshi.krishna.gopal@intel.com
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

On 10/6/20 8:48 AM, Cezary Rojewski wrote:
> Follow up to catpt series as mentioned in:
> [PATCH v10 00/14] ASoC: Intel: Catpt - Lynx and Wildcat point
> https://www.spinics.net/lists/alsa-devel/msg116440.html
> 
> As catpt is a direct replacement to sound/soc/intel/haswell, it leaves a
> lot of code redudant. The second legacy solution - baytrail - is
> deprecated for a long time by sound/soc/intel/atom with SOF flavor
> available too.
> 
> This series addresses the redudancy and removes obsolete code. Along
> with the legacy solutions, all orphaned components are removed too.
> 
> As a consequence, further cleanups are unlocked: sound/soc/intel/skylake
> becomes the sole user of processing code found in
> sound/soc/intel/common. Those are not part of this series.

Since I've mostly worked with Pierre-Louis on this, I guess you may not
know this, but I have more or less single handedly have made sure that
audio works properly on Bay Trail and Cherry Trail devices during the
last few years.  Can you please Cc me on future series which impact
Bay Trail / Cherry Trail support ?

FWIW (since that this is already merged) I'm fine with removing the
quite old Bay Trail support from common/sst-acpi.c, at least Fedora
has been using the medium-old (with SOF being the new thing)
CONFIG_SND_SST_IPC_ACPI support for Bay Trail audio support for
quite some time now.

This is not just about Bay Trail And Cherry Trail devices though,
this series also makes changes impacting Haswell and Broadwell devices.

The commit removing this support claims that at least for Haswell the
new sound/soc/intel/catpt replaces it, but I do not see that code in
5.9, so that means that in one cycle we are both introducing the
replacement and dropping the old code ?  I'm not sure if that is such
a great idea, what is the fallback plan if testing does find significant
issues with the new catpt code ?

Anyways since AFAIK this series is already in next I guess we will
find out how this goes.

Regards,

Hans

