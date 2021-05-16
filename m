Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE9E381EEC
	for <lists+alsa-devel@lfdr.de>; Sun, 16 May 2021 14:57:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD2D816AA;
	Sun, 16 May 2021 14:56:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD2D816AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621169852;
	bh=Q7bQUno3qBWuOvh+/in0lBItriONMrX4nK06EMS3dH4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JIKYOhlee0jcSA6uDVFyddkLVchyIu52rnfUHSh47WDWJdgV79IFuEwpn94qiWROn
	 9FCkmz9M2XobUPJzz07NIL1+EV3PAh+En2tA/KGNaJO092NMENBMZTk2/gmdv3svZp
	 wfuoqXJvULD3ULwa1HcRitODOWqCCGAwGGD8EgXc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40872F80229;
	Sun, 16 May 2021 14:56:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 437E3F80217; Sun, 16 May 2021 14:56:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5AB4F8013A
 for <alsa-devel@alsa-project.org>; Sun, 16 May 2021 14:55:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5AB4F8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="U7x3BfjB"
Received: by mail-pg1-x52c.google.com with SMTP id m190so2840884pga.2
 for <alsa-devel@alsa-project.org>; Sun, 16 May 2021 05:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZxcBGrT6Kyw/+duJ+BUSdpPCJHKScouIvkGJ8rV7HfI=;
 b=U7x3BfjBpTAKts9FEMf8K29lMBLNInANLuYCvw9ZMoG5tfsIVytInnUkmLdqo5FO/q
 GcQGQmK0d+FLzMEuXhCaOgJeqSddjApL8ZcIvygk7vjH9ypviy413lXoFiXf+jNPPwRB
 XHP3IE9eUmqkK8mpdWq3T8DT0r+mwXPzXxvwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZxcBGrT6Kyw/+duJ+BUSdpPCJHKScouIvkGJ8rV7HfI=;
 b=tMXCJwZpL3b7+V5XpAEfoDp+b5LeNUksQ3wwtqXMEPTG5QUIfh/PzvXmWERC42HWcz
 NbLQilpDttjgTS1wPhninfcjJolQa2jEgLvf3twMdsjVQRCB4y+d2PK27Hr8YQRi6Fy3
 B1Fqkhhbwhin56V9iSA/Nvta9k3NScFFgIcLXqE3lcuWIaP/ONc2uGJ7Aq9D5EWsdhzp
 4X2g/VI1Ly1URg5a97iUfZqdvgYEiZZeukTP7zkJuMrVfu83ihYFBjNvyO+cUnU2ayBz
 61PZATCPIj18Tu8EKRWCdXqn58LBY8bGJ9RoxOk8pbfKJK6dy6WbCcvJGFffo89B6IPC
 1/LQ==
X-Gm-Message-State: AOAM532ffhUtzOkEBoI8gz7YtiqTFaAefkQQWkGEZnvq6EhjWsS29wgq
 LEwg0L2nyq+oatnvGoQK8JZc4xU7r0hOpg==
X-Google-Smtp-Source: ABdhPJwBSVlfoJv9AlafwzBVQ170xi4hh/0woJXOQkdsUBMyXrxu/TCRP/+JGLPdo9R5VbUN9J8B3A==
X-Received: by 2002:a63:af57:: with SMTP id s23mr4519959pgo.393.1621169750516; 
 Sun, 16 May 2021 05:55:50 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:4596:acad:c782:2f52])
 by smtp.gmail.com with ESMTPSA id 187sm7572024pff.139.2021.05.16.05.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:55:49 -0700 (PDT)
Date: Sun, 16 May 2021 21:55:45 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: ALSA: intel8x0: div by zero in snd_intel8x0_update()
Message-ID: <YKEWUYdGSXQFf02o@google.com>
References: <YJ4yBmIV6RJCo42U@google.com> <s5hk0o18tio.wl-tiwai@suse.de>
 <YJ5cHdv6MVmAKD3b@google.com> <YKDYQfDf7GiMfGCN@google.com>
 <YKDYbaprE3K2QpCe@google.com> <s5hbl9b6mah.wl-tiwai@suse.de>
 <YKEAqdIAZ5K5FS+1@google.com> <s5h5yzi7uh0.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5h5yzi7uh0.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Leon Romanovsky <leon@kernel.org>,
 linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Sergey Senozhatsky <senozhatsky@chromium.org>
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

On (21/05/16 14:07), Takashi Iwai wrote:
> > > For fixing the crash, this patch adds a internal flag indicating that
> > > the stream is ready to be updated, and check it (as well as the flag
> > > being in suspended) to ignore such spurious update.
> > 
> > I reproduced the "spurious IRQ" case, and the patch handled it correctly
> > (VM did not crash).
> > 
> > > Cc: <stable@vger.kernel.org>
> > > Reported-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> > > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > 
> > I'll keep running test, but seems that it works as intended
> > 
> > Tested-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> 
> OK, below is the revised patch I'm going to apply.
>

Sounds good.

> Thanks!

Thank you.
