Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B997A6EAD69
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 16:49:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEAC7E9A;
	Fri, 21 Apr 2023 16:48:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEAC7E9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682088589;
	bh=X5IdsZ+tnt6VdzUOLXibT5CVMACoWmNIEnAt+Lpb8aU=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gLa2IqA2SugrOK2i2w8yof91BuhnBJlPQ719En/23FFWfSDWhPGpymHXRoHk0Idt7
	 Pk8VCH0iUYM5qtqLHOc4jaRJsLSkeEKjneWP+5VxQQetSs9z1ygitrK6NSOjO3+ycp
	 JLJRV6wzrgfDEJm9Upx7mbUZUsg1GCf6HuqTJRwE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C51FF804FC;
	Fri, 21 Apr 2023 16:48:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 532F6F80510; Fri, 21 Apr 2023 16:48:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A72B5F8019B
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 16:48:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A72B5F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chrisdown.name header.i=@chrisdown.name
 header.a=rsa-sha256 header.s=google header.b=E4WlLCNh
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f09b4a156eso12806635e9.3
        for <alsa-devel@alsa-project.org>;
 Fri, 21 Apr 2023 07:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1682088509; x=1684680509;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTbZjx2Ju7l0danMJinUwAgoWWitXzPCiVyIbPSimKU=;
        b=E4WlLCNh9cY9f0OQilScTn8I4bDE5QieQlYcbD2RdZ6vrpoRUGIya8HY4K6ORhFpzr
         GgP70+ww+cob+kdwv2yXLZJlfwSEGhyTsls8yKPiT+4lWuDGWe5uNkSlkuOmAYsVVNiy
         cG/o27T56DLAG0OO4drFQmFOfLBNgkwVKfN+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682088509; x=1684680509;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uTbZjx2Ju7l0danMJinUwAgoWWitXzPCiVyIbPSimKU=;
        b=UhKQLB33kQH/8ULBDbrwwC4rgGLytouFtaaBvJvCYwYGGS2uKrMz705lQ3B2BAm32D
         Ag/uEEiU2YDdEEzsS+OBCjIo5oIKkxXxVaA1Ns1C43b67L5AlQuNSu3AVjamaX9LrpRi
         2i3f4jA+47IFogHbwvuh/7cyal7ur5kUDmgXkX1xBXChSBGnAQoQ/n3TAWFgkBWp/NR+
         r6352cfZKLUngxigdN61AX1geW/wkAfWuMkV4D26auZpRcJ4lliZSinlLS2yaWBqG3u9
         YB1+R1ymFyu8ayfVLudAgVs72LmTSUAyAgtJaahMD1tUeHmiPYHvJQPKummwPruEW1+j
         IviA==
X-Gm-Message-State: AAQBX9cso0vgHxy2G9BTOPBF0PaSQi4a1OVeAt7kxN7vIWhS9PgPdpig
	2fKDokunOEyRE/ywnV42WHzOHg==
X-Google-Smtp-Source: 
 AKy350btJKj/Eho9sNQ77ryDl0t2OzKq0NwdI8z5zPWlI+1B0eIAUwep3uQE2s8DrRgzBZEzcAHs1A==
X-Received: by 2002:a05:600c:ac1:b0:3f0:7eda:c19f with SMTP id
 c1-20020a05600c0ac100b003f07edac19fmr2194046wmr.11.1682088508728;
        Fri, 21 Apr 2023 07:48:28 -0700 (PDT)
Received: from localhost ([2a01:4b00:8432:8600:5ee4:2aff:fe50:f48d])
        by smtp.gmail.com with ESMTPSA id
 v17-20020a5d43d1000000b002fdf0f6b07csm4549010wrr.67.2023.04.21.07.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 07:48:28 -0700 (PDT)
Date: Fri, 21 Apr 2023 15:48:27 +0100
From: Chris Down <chris@chrisdown.name>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] usb-audio: Rate limit usb_set_interface error reporting
Message-ID: <ZEKiO7lh94QUyuAs@chrisdown.name>
References: <ZEKf8UYBYa1h4JWR@chrisdown.name>
 <87wn25qosu.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87wn25qosu.wl-tiwai@suse.de>
User-Agent: Mutt/2.2.10 (2023-03-25)
Message-ID-Hash: ZXVIJBE3RUKNAUXJOVJRAZNJMZ3YC3JD
X-Message-ID-Hash: ZXVIJBE3RUKNAUXJOVJRAZNJMZ3YC3JD
X-MailFrom: chris@chrisdown.name
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZXVIJBE3RUKNAUXJOVJRAZNJMZ3YC3JD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi,

Takashi Iwai writes:
>This patch itself is safe and good to have, so I'm going to take it as
>is.

Thanks!

>But I'm still curious in which code path the problem happens.  That
>is, we should address such unnecessary repeats if possible.  Do you
>have some more data?

Unfortunately not, I've been running with a kernel testing some other mm 
changes recently so haven't had a chance to debug what's going on here. But it 
starts like this:

     [Fri Apr 21 13:21:10 2023] usb 3-7: USB disconnect, device number 39
     [Fri Apr 21 13:21:10 2023] usb 3-7.1: USB disconnect, device number 40
     [Fri Apr 21 13:21:10 2023] usb 3-7.1.1: USB disconnect, device number 42
     [Fri Apr 21 13:21:10 2023] usb 3-7.4: cannot submit urb (err = -19)
     [Fri Apr 21 13:21:10 2023] usb 3-7.4: Unable to submit urb #2: -19 at snd_usb_queue_pending_output_urbs
     [Fri Apr 21 13:21:10 2023] usb 3-7.4: cannot submit urb 0, error -19: no device
     [Fri Apr 21 13:21:10 2023] usb 3-7.4: cannot submit urb 0, error -19: no device
     [Fri Apr 21 13:21:10 2023] usb 3-7.4: cannot submit urb 0, error -19: no device
     [Fri Apr 21 13:21:10 2023] usb 3-7.4: 1:0: usb_set_interface failed (-19)
     [Fri Apr 21 13:21:10 2023] usb 3-7.4: 2:0: usb_set_interface failed (-19)
     [Fri Apr 21 13:21:10 2023] usb 3-7.1.2: USB disconnect, device number 44
     [Fri Apr 21 13:21:10 2023] usb 3-7.1.4: 1:1: usb_set_interface failed (-19)
     [Fri Apr 21 13:21:10 2023] usb 3-7.1.4: 1:1: usb_set_interface failed (-19)
     [Fri Apr 21 13:21:10 2023] usb 3-7.1.4: 1:1: usb_set_interface failed (-19)
     [Fri Apr 21 13:21:10 2023] usb 3-7.1.4: 1:1: usb_set_interface failed (-19)
     [Fri Apr 21 13:21:10 2023] usb 3-7.1.4: 1:1: usb_set_interface failed (-19)
     [Fri Apr 21 13:21:10 2023] usb 3-7.1.4: 1:1: usb_set_interface failed (-19)
     [Fri Apr 21 13:21:10 2023] usb 3-7.1.4: 1:1: usb_set_interface failed (-19)
     [Fri Apr 21 13:21:10 2023] usb 3-7.1.4: 1:1: usb_set_interface failed (-19)
     [... thousands of messages ensue ...]

So it looks like maybe some ordering is not quite right in destruction, perhaps 
only on multi-level USB topologies?

Thanks,

Chris
