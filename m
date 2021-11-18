Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F18458994
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Nov 2021 08:04:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 188BD168D;
	Mon, 22 Nov 2021 08:03:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 188BD168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637564661;
	bh=d3P0YhZdZnwFN22BQn2BcKHZqNKK5G4J6qyIDwLSz1g=;
	h=Date:To:References:From:Subject:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lupf/VAozcC1NeTJnUXeLtbEp1xq1oTXNw6901eYN0OIFmN4EbyQ+kNmPbIDiaQrs
	 +5Vk5atXUL1YN3ANIupDyYZD1wg7D9IBt/TOawkrjSA5zOkJc7j3ZiqLzVk2e8PUsa
	 HUYWL9gaPk7UGOqAgmaKUXwp05E0woW3BrweqSJo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AD12F804F1;
	Mon, 22 Nov 2021 08:02:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47838F8010B; Thu, 18 Nov 2021 23:14:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
 DKIM_INVALID,DKIM_SIGNED,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 NICE_REPLY_A,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86539F8010B
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 23:13:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86539F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RCvJUJZm"
Received: by mail-wm1-x335.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso6668993wmh.0
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 14:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=tZl2BN55c9nxvN98+IIn8ra567E4ddOU9gxhiJKnjZ4=;
 b=RCvJUJZm2FtNYHDP4bhbw14jPuqAPAqC280nrvc+vDEF7cUGY4g35nU4hKnBhHU3cO
 IxPGaUKEw4RIRTzcsXdBDExdFyqeNJLA2XLbD/2wK5rsv0IehkEBQRGzekcDyjJRRapw
 cNWwMHOTyEnxMdkfxnjg+NL+RMNtl0FF2BOzARCywGZ5dbI4UdthJFXNnUo3PQpjgtac
 wEyNj0L8+2CuLIS8IKL0EqR4aU4S03CYwpjmxCy7avLkq6tIyBGQEGhTX4D1wzvv1+Pe
 1N8LcnCVOt38YFOTO8IhazZxGB1KOPvl+GoLtg4hip1v74gfvimSxA0PSgM7cE7f/HR4
 JBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=tZl2BN55c9nxvN98+IIn8ra567E4ddOU9gxhiJKnjZ4=;
 b=Dg/ZW6p2H2qqIxPihzwtmNH9Xn8NSkAMlMxFljx6AoaFW3ltnfT0YcyeP4el7AN+1O
 Yq3qRbAbW/kNGbpDmcN2y1ElY92aaj4bf50axW0FU5HbO0Jc1PEfv5u9I4ndjkmIePmr
 9fYOAQq+f3lK2eKzX6y4qF0KQMHlCIITV+wF5H6FKqmsHcMQtKRZFaCb8sD5f/NVluot
 eurK0hbhpn4+rwpiv4+19v7IoMEXpKfip/a/lqy8/9ozgnCQEJh0EoxGOpd359mG7FpT
 gsNleh6ZV5VXFHG7uHOnGJne/XiZFSTl+nWC58jw4dbuwbJn9XANrVPL/m1KeHV+FAGG
 G/aw==
X-Gm-Message-State: AOAM5301gSiIbFNk22XQR4K3PWmEekBACAozt8UHy675W2BFPg/Q/Ck6
 LZ9h/qk9M6KRyvm7ZcPvPkpWkNbDuok=
X-Google-Smtp-Source: ABdhPJyfx4zsZAdKEmZFB/+BHjEh/dN07fNPVH81OesgGKkTZrxc3uHxCpsZhYRA6QYujiVtY+LT8Q==
X-Received: by 2002:a05:600c:4e07:: with SMTP id b7mr675327wmq.8.1637273636786; 
 Thu, 18 Nov 2021 14:13:56 -0800 (PST)
Received: from ?IPV6:2003:ea:8f1a:f00:fc8d:4de8:c1d1:9213?
 (p200300ea8f1a0f00fc8d4de8c1d19213.dip0.t-ipconnect.de.
 [2003:ea:8f1a:f00:fc8d:4de8:c1d1:9213])
 by smtp.googlemail.com with ESMTPSA id o3sm11868127wms.10.2021.11.18.14.13.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 14:13:56 -0800 (PST)
Message-ID: <bc281416-e28d-4c18-2475-add92d38a554@gmail.com>
Date: Thu, 18 Nov 2021 23:13:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <d9d76980-966a-e031-70d1-3254ba5be5eb@gmail.com>
 <s5hczmxgnm2.wl-tiwai@suse.de>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: Warning due to "ALSA: hda: intel: More comprehensive PM runtime
 setup for controller driver"
In-Reply-To: <s5hczmxgnm2.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 22 Nov 2021 08:01:48 +0100
Cc: alsa-devel@alsa-project.org, Linux PM <linux-pm@vger.kernel.org>
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

On 18.11.2021 22:28, Takashi Iwai wrote:
> On Thu, 18 Nov 2021 21:33:34 +0100,
> Heiner Kallweit wrote:
>>
>> I get the following warning caused by 4f66a9ef37d3 ("ALSA: hda: intel: More
>> comprehensive PM runtime setup for controller driver"):
>>
>> snd_hda_intel 0000:00:1f.3: Unbalanced pm_runtime_enable!
>>
>> Not sure how this patch was tested because the warning is obvious.
>> The patch doesn't consider what the PCI sub-system does with regard to
>> RPM. Have a look at pci_pm_init().
>>
>> I'd understand to add the call to pm_runtime_dont_use_autosuspend(),
>> but for all other added calls I see no justification.
>>
>> If being unsure about when to use which RPM call best involve
>> linux-pm@vger.kernel.org.
> 
> Thanks for the notice.  It's been through Intel CI and tests on a few
> local machines, maybe we haven't checked carefully those errors but
> only concentrated on the other issues, as it seems.
> 
> There were two problems: one was the runtime PM being kicked off even
> during the PCI driver remove call, and another was the proper runtime
> PM setup after re-binding.
> 

Having a look at the commit message of "ALSA: hda: fix general protection
fault in azx_runtime_idle" the following sounds weird:

  - pci-driver.c:pm_runtime_put_sync() leads to a call
    to rpm_idle() which again calls azx_runtime_idle()

rpm_idle() is only called if usage_count is 1 when entering
pm_runtime_put_sync. And this should not be the case.
pm_runtime_get_sync() increments the usage counter before remove()
is called, and remove() should also increment the usage counter.
This doesn't seem to happen. Maybe for whatever reason 
pm_runtime_get_noresume() isn't called in azx_free(), or azx_free()
isn't called from remove().
I think you should trace the call chain from the PCI core calling
remove() to pm_runtime_get_noresume() getting called or not.


> For avoiding the former, only the pm_runtime_forbid() (and maybe
> pm_runtime_dont_use_autosuspend(), too) would suffice?  Also, for PCI
> device, no need for pm_runtime_set_supended() at remove, right?
> 
> 
> thanks,
> 
> Takashi
> 

