Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F8D2FC832
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 03:48:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CCFF18E3;
	Wed, 20 Jan 2021 03:47:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CCFF18E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611110881;
	bh=F7HMPhtnx3pSsrIBzQovHis+rjIFYltTmH0p5Dj4k1I=;
	h=To:References:Subject:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jl/C3oGVJeR9KRfHfAqiNTVMzX4jQJlXFbM7ghkvZiJ4FRQUBm9TgFNfkBAuwNrDa
	 5XsrPBihtGtaUk5tpcvfIsVeFFGzWNL0Y5lecrshwTIhDbhW0qBPkhwYRHXudsHM2q
	 lqzlTYZc24eeiC5XWpOweo1uuwmP4HQYZi4ExaDQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 052FEF8026A;
	Wed, 20 Jan 2021 03:46:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0664CF80257; Wed, 20 Jan 2021 03:46:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31C13F80117
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 03:46:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31C13F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mixxx-org.20150623.gappssmtp.com
 header.i=@mixxx-org.20150623.gappssmtp.com header.b="cceUUK/E"
Received: by mail-io1-xd2b.google.com with SMTP id x21so25863430iog.10
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 18:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mixxx-org.20150623.gappssmtp.com; s=20150623;
 h=to:references:subject:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=w6lJWcUeIrWdLxn4W6lfCqC5lXiBMDQSlgSrIFZMGmY=;
 b=cceUUK/EYMF1LnAJ5myl9SuAPDp35yn2DPOhC4Xm3sk+atgMYw0qpzvUauOezLot8c
 EYSikbtHUKdx4j+KofNODPARz2zu9GmwpmElKgBvkvT2voimRBQAq2ldo1/08aN9oYF4
 TSRgoLEZijaVOAnnw8YQSl19V9fl/vkwTbH6LqZqz72wp4ME+8eqnvqbJZe6bv7ZnVys
 cTW3Hp0/x/9TDSYed1D7KcuwrMwQKAsMUEENAJ6AyAJrLas33kzYcYCVaFk3VB9/Fo2C
 +aTE/X9h2tMuLjxbU3TqOgbSDqDIzkTiQSXOiD/k+7J5GMo0lltL0piH9xKgseg2a8dV
 vrig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:references:subject:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=w6lJWcUeIrWdLxn4W6lfCqC5lXiBMDQSlgSrIFZMGmY=;
 b=iYxyIxvdjyeAU5tKcFKVDPGuAXRs5FcOGHXDnZ6oFAlSOrNL2J77Z5H6YpxOasAA20
 Ym1nbFYCXkj4VXaS+J2SfVauDDszWcyXMSMlU3bYB0uNlx9GhDhCmz2wB37rQKQJQfEd
 otWXa7aPyXU+NoMSVHGYDmt34wu5tS1g+hOSVL9qiUFSeuf/zaOQPzdZsmHL4rk8lRmC
 Pqiqf4SGp1qsV0dhZiaKpfmX/Git23rJ8UAAei+9+16dWUVrdE5umyGa6G7IOgrgm97d
 tqxhtuP1UYqx/USQIFPstXSMIHVlklF2Ya1B6ehj0Oilb+VtMOB+KOz6S/0156H0WGit
 snCw==
X-Gm-Message-State: AOAM530mgYfNJ0JvsVZ53mevTcmgQM6GLVW/mKr+/wi2g2rQA/+zdgxM
 0fNUZzSq9qpEMm6pQAYATmJ+2w==
X-Google-Smtp-Source: ABdhPJzPRImCtYjk21aw2FDEyMe+AKqp1//QwqTXENo+n4HWpEKrVjuWU0Ovo47/+qWCzDdj13F1dQ==
X-Received: by 2002:a92:c102:: with SMTP id p2mr6009607ile.254.1611110768128; 
 Tue, 19 Jan 2021 18:46:08 -0800 (PST)
Received: from localhost.localdomain (mobile-166-175-59-115.mycingular.net.
 [166.175.59.115])
 by smtp.gmail.com with ESMTPSA id c10sm415646ils.46.2021.01.19.18.46.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 18:46:07 -0800 (PST)
To: alsa-devel@alsa-project.org
References: <435f4228-e323-5caf-9209-1372221e12fb@frantovo.cz>
Subject: Re: MIDI handshake for Pioneer DJ DJM-250MK2 to enable recording
 LINE/PHONO channels
From: Be <be@mixxx.org>
Message-ID: <acafdceb-6e84-2166-2e99-150a2ea89f56@mixxx.org>
Date: Tue, 19 Jan 2021 20:46:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <435f4228-e323-5caf-9209-1372221e12fb@frantovo.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: livvy@base.nu
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

I discourage doing this in the kernel. If Pioneer did this in their drivers on Windows and macOS, I would recommend doing it in the kernel. But they do not; Rekordbox does it at the application level. Mixxx users are currently unable to use the phono inputs of these devices regardless of OS (see https://mixxx.discourse.group/t/pioneer-djm-250-mk2/17001/29 ). The best way to implement this would be through Mixxx's MIDI controller mapping system so that it works across Linux, Windows, and macOS.

I am CCing Olivia Mackintosh because the Pioneer DJM 750 likely uses the same or very similar MIDI signals. They could probably share one MIDI script in Mixxx. The Pioneer DJM 900 NXS2 probably uses the same or very similar signals too.

If you're interested in implementing this in Mixxx, let's continue the discussion in Mixxx's Zulip chat: https://mixxx.zulipchat.com/

> Dne 19. 01. 21 v 9:54 Takashi Iwai napsal(a):
> >/I haven't looked closely, but if it's about MIDI messaging, it can be /> >/implemented in the kernel, too (only if it fits better than /> >/user-space), yes. If it's over HID, it's a different story, though. />
> Yes, it is only MIDI. The scenario is:
>
> 1) send a greeting message to the mixer
>
> 2) receive a greeting message
>
> 3) send another constant message
>
> 4) receive the response
>
> 5) compute something and send it back
>
> 6) receive the confirmation message
>
> 7) start sending a keep-alive message each 200 ms
>
> Specific received messages might be consumed by kernel (invisible for user-space), but others should flow undisturbed to the user-space. The sent messages should be injected and intermixed with normal messages coming from user-space. The kernel should not claim exclusive access to the MIDI device, because user-space tools might want to use it too.
> 
> Is there already anything similar, for inspiration?
>
> Franta


------------------------------------------------------------------------
