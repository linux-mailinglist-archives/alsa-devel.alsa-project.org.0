Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3126EADE6
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 17:17:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59878AE8;
	Fri, 21 Apr 2023 17:17:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59878AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682090278;
	bh=FSo+li7V3x7la4kJ9lzBJZzaazJXbuj+O1+aXAdyUQU=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nnUTCMhnn/fQ8GYjg95ZBuNLEdFI84C1tTDpxe4N6EB6mU6PajRS1n6GDHCSJcVOz
	 R61taG2M89m9TTm1nVz8l5wS5TjJEOyZiGTSjxbkNC80+Rs2EwT6Z7FJJATdhAvNED
	 Vtth4ZvSjta9gl6tAUR84u7lFDV/kmnQdKPXcERc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1E87F80149;
	Fri, 21 Apr 2023 17:17:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BAB1F80155; Fri, 21 Apr 2023 17:17:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 51C83F800D0
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 17:17:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51C83F800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chrisdown.name header.i=@chrisdown.name
 header.a=rsa-sha256 header.s=google header.b=TVoz+qIZ
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f09b9ac51dso53445285e9.0
        for <alsa-devel@alsa-project.org>;
 Fri, 21 Apr 2023 08:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1682090220; x=1684682220;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2FLIRu+J3TTNH4UC41pvBd3yuWmEfjvLFBhfQG12ctk=;
        b=TVoz+qIZFjTNqFGQR7N+9SmzNW/TlKMeSydu6mfCgsxrtVMF21U1n5yIoc+5ToMimC
         p0do4+yC8QJmbzE4zDobrvFli/ArhW/FE0clp3wWI3Rvgb/IXj3F6ZIBmVBTzeGPo7EP
         YnWVItChXlfATI0KLc92b14iv98yYLr+4sftc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682090220; x=1684682220;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2FLIRu+J3TTNH4UC41pvBd3yuWmEfjvLFBhfQG12ctk=;
        b=KW66RPRopzbkul6+HL+yhbOnuzP2IK9xUxHTQfaOml4bFsbZ3hl+VUYqK3nkDG0Bfu
         RpbyiqyzNgGgsGP0DM0B1alJQI+LZOZvjKC/XXPRQkLbJ2BXe2wfmqkvudvoVBE0zoGR
         ki7DalSIrxMgeV7wlRjFfmIpr1x9BXTbgMi4IQrb5/24JkrqTyJFcTbeYd818US84YqX
         5J5irkIdwOjR+gAZAzojwsNPmQIODGIWLMWP1KLwmPqC1xfY16QFqqWRW+YJaoMYBPK9
         QlOGm86H26h50HTuCLrE0XqpMcyCt8HYQybtngRQREFWS+m16jnkrvi3WQf0y0U5FCGD
         PPEw==
X-Gm-Message-State: AAQBX9f/ShNMoHVcjckc/kBWmKUX+uiBZxRWw1T/TkE9sPZ8wu9OhFO6
	5bT/+wm9ophm+eyGz6UA9gfDWA==
X-Google-Smtp-Source: 
 AKy350a2se3RpoghadyqoDnl7K3fPuHUrm7BD47UxyDgzE8hqtX9JzyFIdkZyqIzm7SW062U3y4b0g==
X-Received: by 2002:adf:f092:0:b0:2fe:c8b5:b5da with SMTP id
 n18-20020adff092000000b002fec8b5b5damr4306620wro.13.1682090220316;
        Fri, 21 Apr 2023 08:17:00 -0700 (PDT)
Received: from localhost ([2a01:4b00:8432:8600:5ee4:2aff:fe50:f48d])
        by smtp.gmail.com with ESMTPSA id
 s1-20020adff801000000b00300aee6c9cesm4640202wrp.20.2023.04.21.08.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 08:16:59 -0700 (PDT)
Date: Fri, 21 Apr 2023 16:16:59 +0100
From: Chris Down <chris@chrisdown.name>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] usb-audio: Rate limit usb_set_interface error reporting
Message-ID: <ZEKo68jUGe1taYxz@chrisdown.name>
References: <ZEKf8UYBYa1h4JWR@chrisdown.name>
 <87wn25qosu.wl-tiwai@suse.de>
 <ZEKiO7lh94QUyuAs@chrisdown.name>
 <87mt31qngg.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87mt31qngg.wl-tiwai@suse.de>
User-Agent: Mutt/2.2.10 (2023-03-25)
Message-ID-Hash: CM542YTCVADKZ2FJW4KQBOT7CCS2JTK3
X-Message-ID-Hash: CM542YTCVADKZ2FJW4KQBOT7CCS2JTK3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CM542YTCVADKZ2FJW4KQBOT7CCS2JTK3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Takashi Iwai writes:
>Hrm, is "usb 3-7.1.4" really the USB audio device?  The previous
>errors like "Unable to submit urb #2..." are certainly for USB audio,
>and those are with "usb 3-7.4".

There are two USB audio devices -- 3-7.1.4 is input, 3-7.4 is output.

     % dmesg --notime | grep -e 'usb 3-7.4' -e 'usb 3-7.1.4' | grep Product: | sort | uniq
     usb 3-7.1.4: Product: USB2.0 Microphone
     usb 3-7.4: Product: USB Audio Device

Thanks,

Chris
