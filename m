Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 120E83F1BDA
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Aug 2021 16:46:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A153F1685;
	Thu, 19 Aug 2021 16:46:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A153F1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629384410;
	bh=yC8qsHLHQzqKcQ9arf4vfiRvxuZ7q17KbRGPH1eSMp4=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M/IpF25Iw9GP++AvpNdF6dqK82FocISdj6XhC6yFyT2VLLozeYRgSmtlrACECQgYw
	 jgIyaR0ZZ53uF+uRpgEeLRvyKxBtKvxEwGAVC0y22m+Ec2TBqEyimoQ+y0DuPnpAwU
	 X7A7kjsZrnIb5BvK4MN9FNMNQHvZI09kI2v+b2aY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BDB2F80272;
	Thu, 19 Aug 2021 16:45:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6645F8026D; Thu, 19 Aug 2021 16:45:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64534F800F8
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 16:45:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64534F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Xw7SIqrt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629384323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XioJlDpUv7HsMPJyAejavtA0W9Ks413uJ4WOt/jRJVg=;
 b=Xw7SIqrtYzLXsG2LN5Bj1E2MFTL59TTD6ntX6CcXLWVPQ07vWDU/LjXEy4KeaFm3e3+E/t
 U3e//A05ow4Vdx28PF0kHoArHyBbywfD8CAxXeqZ00Nw55DJYAplNKId68wRWTapFn7Xv7
 S/yScG1Yws5pV9Ba8qZTvK1M1ZQxMPA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-hxaOH5rtO8aiqDgFbg7DFw-1; Thu, 19 Aug 2021 10:45:21 -0400
X-MC-Unique: hxaOH5rtO8aiqDgFbg7DFw-1
Received: by mail-ej1-f72.google.com with SMTP id
 ne21-20020a1709077b95b029057eb61c6fdfso2329979ejc.22
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 07:45:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XioJlDpUv7HsMPJyAejavtA0W9Ks413uJ4WOt/jRJVg=;
 b=o0ieDEHdri+f6vx/YtQQWTEZxt6DPgnH/WISMgk2FT5vAo0uj2r630MBf8yg9Fof8e
 SUq5T0m+jjB52W3G37uBrN1tSKibgRAZ7zpfaWloEGJ/lbvrLQ9tbrhJCXSbD0qAm4EY
 vDlSXzN0q/RlRC1PxdzopW3a91QiG+lrrTk+SQ+67LvEUZlSgIb+KHKYhkLONTLMN92m
 Z4tYE72vOesDKIT8dl63m3ERCD/MuCkrgwJQpzqfubAvY7c2Z6ocM72HOtlP8Fi7OAfr
 ef6nteHets2anxEmNNp1kpUEPSTfpNa3BBNMlTohadSYo56H5unZN4ZYvMRtVQrGw95s
 cGzw==
X-Gm-Message-State: AOAM530qAmRsUGNUbY8ZQptjt4ebh5JD3dfLfFCwVFNV/6WOOAi9kQja
 2I1vMHeINxMVu57KIeoPlYMtaHVhxhiEloKRa9QvxVxR+96dDKm+Uv1GZb2C9aicxX9/ectKd1c
 jo7aQ4RKRpwsXLI+r33z7Ks4ENu6z6qAlWlgT05QqcBEV9HYn9/L+sw0o9bp4dKWN3gvsN9RP2Z
 U=
X-Received: by 2002:a05:6402:1515:: with SMTP id
 f21mr17072948edw.45.1629384320124; 
 Thu, 19 Aug 2021 07:45:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0Pwze4BsRGS4T7usbKP47kGWrzfLO8C9P6bYfwS1Be8uYwceTjfkw0uG8XnoFKxuOmrehug==
X-Received: by 2002:a05:6402:1515:: with SMTP id
 f21mr17072929edw.45.1629384319940; 
 Thu, 19 Aug 2021 07:45:19 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id j22sm1408940ejt.11.2021.08.19.07.45.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 07:45:19 -0700 (PDT)
Subject: Re: [5.14 regression] "ASoC: intel: atom: Fix reference to PCM buffer
 address" breaks Intel SST audio
From: Hans de Goede <hdegoede@redhat.com>
To: Takashi Iwai <tiwai@suse.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <2048c6aa-2187-46bd-6772-36a4fb3c5aeb@redhat.com>
Message-ID: <e9ac9c13-75c6-89a4-39d0-8c82dda2e560@redhat.com>
Date: Thu, 19 Aug 2021 16:45:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2048c6aa-2187-46bd-6772-36a4fb3c5aeb@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

On 8/19/21 4:42 PM, Hans de Goede wrote:
> Hi All,
> 
> After rebasing a set of bytcr_rt5640 patches, on top of asoc/for-next
> I noticed that playing back audio would only generate random-noise / buzzing
> (I did not try recording any audio). 
> 
> After poking at this for a while I've found the culprit:
> 
> 2e6b836312a4 ("ASoC: intel: atom: Fix reference to PCM buffer address")
> 
> If I revert that single commit then audio on Intel Bay Trail and
> Cherry Trail devices works fine again with 5.14.
> 
> This is with a Fedora 34 userspace using pipewire as audiodaemon
> 
> I'm not sure what is going on here, but since the old code
> changed by the broken commit has worked fine for ages and
> given where we are in the devel-cycle I think it might be best
> to just revert 2e6b836312a4 again.

p.s. to be clear I noticed this after rebasing on top of asoc/for-next
but the troublesome commit is actually in Linus tree now and thus
will hit end users once 5.14 is released.

(the troublesome commit landed in 5.14-rc6 and my previous tests
were with 5.14-rc5)

Regards,

Hans

