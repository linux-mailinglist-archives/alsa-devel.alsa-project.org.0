Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A52225AD215
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Sep 2022 14:08:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A1C8E12;
	Mon,  5 Sep 2022 14:07:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A1C8E12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662379694;
	bh=ibQMPoYjTkCct0rNGOdAswfSbBpmQlsM71MuF5NLFdY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CgOG6qTReVLvaswUmsY3RQfBpNLkdnT4Ci/OdSQ9bf7Hc7DMyzpa0AzkX3zxEdAro
	 /W0ED4NYbToTx/4NNqw75OQ6WsVgr8M0E2S7loAFBBsc/31I6pd9RMqD72LnND7sjr
	 mcZdE6pt4gDJ+8Z74Bf9TE5lqpdaiq9PlvxozImM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E555F8032D;
	Mon,  5 Sep 2022 14:07:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CAC02F80238; Mon,  5 Sep 2022 14:07:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D951F800E9
 for <alsa-devel@alsa-project.org>; Mon,  5 Sep 2022 14:07:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D951F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="AwQI3zXh"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 9E964CE1277
 for <alsa-devel@alsa-project.org>; Mon,  5 Sep 2022 12:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99A05C433C1
 for <alsa-devel@alsa-project.org>; Mon,  5 Sep 2022 12:06:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="AwQI3zXh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1662379617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZDAdVMlFCiNAiNt/gDe4bwmhdOf+6WpnVaQhoNtIX9w=;
 b=AwQI3zXhAs84MI5DuY4E5HTbVfYtRxaPXrwSWMmMg4TYqlHSg6H73uVNE139sPoXBYVvJO
 dGU/LyhApx5Uk74WWQd+3cMZB4iUsNiqEZm6frbsTfAO6jCC2AHqr7igGE6CO4A5Om8mxd
 N2Tqiw5N2z+ob4UZobo70nN47kcXzRk=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 75a4fcc4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <alsa-devel@alsa-project.org>;
 Mon, 5 Sep 2022 12:06:57 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-32a09b909f6so68930967b3.0
 for <alsa-devel@alsa-project.org>; Mon, 05 Sep 2022 05:06:56 -0700 (PDT)
X-Gm-Message-State: ACgBeo2Edz0EkIQOa2YSkC/svLYhKcDycPj4PiYWElQ6CPJIFA6dVx2X
 D0P1QRXfXRQkn47KycBeczFR/kX1nglfLgyhb24=
X-Google-Smtp-Source: AA6agR5X7dDkj/wLtvhnwZ797YyJChFFYEUZ25C9PbeN9mtjjfKPaq7Gnpog0gNLR7uO8ZVcW/8GIpuSdK/emysn2YU=
X-Received: by 2002:a0d:f082:0:b0:31f:1d1d:118d with SMTP id
 z124-20020a0df082000000b0031f1d1d118dmr38595397ywe.124.1662379616260; Mon, 05
 Sep 2022 05:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220905101403.1435037-1-Jason@zx2c4.com>
 <87sfl6jbb3.wl-tiwai@suse.de>
In-Reply-To: <87sfl6jbb3.wl-tiwai@suse.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 5 Sep 2022 14:06:45 +0200
X-Gmail-Original-Message-ID: <CAHmME9rbqT=dAGU_oybHYH87qkwNNFizHsSyptZU1vKQMo9dgw@mail.gmail.com>
Message-ID: <CAHmME9rbqT=dAGU_oybHYH87qkwNNFizHsSyptZU1vKQMo9dgw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: Don't refcount multiple accesses on the
 single clock
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Wim Taymans <wtaymans@redhat.com>,
 =?UTF-8?B?TmlrbMSBdnMgS2/EvGVzxYZpa292cw==?= <89q1r14hd@relay.firefox.com>,
 LKML <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>
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

On Mon, Sep 5, 2022 at 1:44 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Mon, 05 Sep 2022 12:14:03 +0200,
> Jason A. Donenfeld wrote:
> >
> > This reverts commit 03a8b0df757f1beb21ba1626e23ca7412e48b525.
> > This reverts commit c11117b634f4f832c4420d3cf41c44227f140ce1.
> >
> > Pipewire and PulseAudio start devices with 44.1khz before changing them
> > to 48khz (or something different). By locking the rate, daemons are
> > unable to enumerate possible rates, and so they never change them to a
> > more optimal rate. This revert patch should allow 48khz audio again.
>
> Well, in that case, the revert is no right solution, IMO.
> If the patch caused a problem, it means that the application tries to
> change the rate while it's being still running by another.  If it
> worked, it worked just casually without noticing the bad behavior.

Not sure this is really what's happening. I think the issue is that
alsa reports that the device only supports a limited set of rates.
Pipewire then doesn't see 48khz, so it doesn't try to
stop,reclock,start.

Maybe Wim or Niklavs can provide more info about this.

Jason
