Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9353157FA
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Feb 2021 21:49:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D509216C0;
	Tue,  9 Feb 2021 21:48:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D509216C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612903768;
	bh=TNng1R4llhK0NTyMew6lKUWUvdd6weXOY/BFQ9o7QoQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V5VMjOAAikHF+rZQctEWPWlqwBaUjmxbNgR5oaSivffr4QOzGJ7j5sQskKWnOxnTL
	 XFbqJl8dTh+F40+HjbH0qPWPXFhkQPXipv6A1Ok47VjvXR77IwkyGcLwB2yjJ0zYNI
	 G+3urzY21u8S1jdE6WM+fw38AItzJtL2VPMFVrII=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E91DF801EB;
	Tue,  9 Feb 2021 21:47:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3D33F801D5; Tue,  9 Feb 2021 21:47:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODYSUB_18,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 066B4F8013A
 for <alsa-devel@alsa-project.org>; Tue,  9 Feb 2021 21:47:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 066B4F8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="DkrojXjg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612903668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O0uP9Y2jAE6aDA6DCQxDsSlmpMv/nHoU1iQb8uca7Ks=;
 b=DkrojXjg1xqhb4cnET8MsirYtYKyihKsYErMlo1wgJ137P++0HgR1J5njcfuCiBxrnV20R
 P25vx7afpadsRzPPoL8UY6Gcp4qK4TaaOJXOwW93c/Me6pKNx1Q6BkvkAMXUAM5g7KzLXE
 vhN/g5O2jb7ct2IqacxouNOUEoqoK6s=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-tCwPKrNePRyOfiJKUONn2w-1; Tue, 09 Feb 2021 15:47:44 -0500
X-MC-Unique: tCwPKrNePRyOfiJKUONn2w-1
Received: by mail-ed1-f70.google.com with SMTP id bd22so19415373edb.4
 for <alsa-devel@alsa-project.org>; Tue, 09 Feb 2021 12:47:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O0uP9Y2jAE6aDA6DCQxDsSlmpMv/nHoU1iQb8uca7Ks=;
 b=DcE1oI6lP6NpWHYfDzky2T5a0TePRqrlOf4AhLDIPX86Imc3uzpYaIWZB13uEgraF7
 nToKc6J+UhZS9Z8Y0R5G/ieKfQMTT3C20WmN01ni4PkOdjAnZyeidYMpiwj950x59ERt
 ACZCPc32gqzOeg641ESir1B4A9spHRar5uGc3bPtlzqFF899U90+/AqKkqXfzvjhBhJk
 OyTwgbQM2XhNJCqiWmoNiJpxngfE3ASZVYFNBi0R8BXIRxc1uPCRnJaetd+0MXk0bfru
 uP+TGcJ8M/P11WTAE/CDChH4hrb8LjEjeIKMWhobp0ehFlcJaAkgDkNoXGgA3doz3oGv
 xKog==
X-Gm-Message-State: AOAM530osBKHG6w0Lre7/6YEOg9rtZDH/ebEz9L/2KINN1+oVJ/wTfQ8
 OW2b4wBoWz1djYgl4OABlFZviBsDPAg6Txi7koJilo3rbE2TcasOlfvCZ55L1RYAFp+zd+Tr2y2
 jraAE7I2CVELRlpW+XraqvZbQyLHmYqIpezu+mXqkjU00lpUmMI+dXZ4tDtwD1kJnzsKTO91bQa
 Y=
X-Received: by 2002:a05:6402:2547:: with SMTP id
 l7mr24350217edb.157.1612903662579; 
 Tue, 09 Feb 2021 12:47:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywX7RYgThXUVp9yznb6QI3hrue4sOcNBqjLpY5cgHZR1v+Wtiy8o+EPXvJRg9govrP1kgB0w==
X-Received: by 2002:a05:6402:2547:: with SMTP id
 l7mr24350195edb.157.1612903662341; 
 Tue, 09 Feb 2021 12:47:42 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id a15sm10750702edv.95.2021.02.09.12.47.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 12:47:42 -0800 (PST)
Subject: Re: [PATCH alsa-ucm-conf] bytcr-wm5102: Add new UCM profile for BYT
 boards with a WM5102 codec
To: Jaroslav Kysela <perex@perex.cz>
References: <20210209190859.70997-1-hdegoede@redhat.com>
 <3d2dca5f-dfa6-7a5f-7996-2fe8b53fa83d@perex.cz>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <768a83f1-6f31-10e8-ff19-fd80baf730f0@redhat.com>
Date: Tue, 9 Feb 2021 21:47:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <3d2dca5f-dfa6-7a5f-7996-2fe8b53fa83d@perex.cz>
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

Hi Jaroslav,

On 2/9/21 8:56 PM, Jaroslav Kysela wrote:
> Dne 09. 02. 21 v 20:08 Hans de Goede napsal(a):
>> Add new UCM profile for BYT boards with a WM5102 codec. This has been
>> tested with both the SST and the SOF driver on a
>> Lenovo Yoga Tablet 2 1051L.
> 
> Hans,
> 
> 	could you also add the configuration for the hardware volume mixer controls?

I definitely plan to look into those, but that is going to be a
codec by codec thing.

I want to start with the codecs which are used in devices with mute LEDs,
to see if I can get the LEDs to work in combination with testing the kernel
generic alsa led-trigger kernel-patch you send.

So I would prefer for you to merge this as is for now. Together with the
wm5102 kernel bits which just landed in -next for 5.12, this will result
in working audio at the same level as all the other Intel ASoC using
devices.

There are only so much hours in a day... I do want to add HW volume
control support to all the codecs used on Intel BYT/CHT boards but this
will be something which I need to do on a case by case bases and in
my spare time, so this will take a while.

My priority ordering for upcoming UCM work roughly is:

1. Finish testing all codecs with SOF and fix any SOF only UCM
   (or kernel) issues
2. Add hw volume control for codecs used on devices with mute LEDs
3. Add hw volume control for the most popular codecs
   (all the rt56?? codecs, which also overlaps with 2.)
4. Deal with the remaining codecs

The wm5102 firmly falls under 4. it is only used in 1 Lenovo design
and I only ended up working on it at all because I happen to have
such a Lenovo tablet and Pierre-Louis pointed out to me that there
already was a machine-driver available in some Android kernels.

Regards,

Hans

