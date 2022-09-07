Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8F55B01C5
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 12:21:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86CEE16B2;
	Wed,  7 Sep 2022 12:20:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86CEE16B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662546106;
	bh=RNw+YXMxw+tXduyt2kAv7ZUWEhH4nNEIRE62i9aDSfQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V6/PBhjEA0eJfK+aQXWkRVdaf+7TLabB7HYBZc4M1evFMNsKFYAEEOugaL/PPUplE
	 mb/TeKTl+DH/lYgebAvSrYDh6rbC4v6w5qBar3PcMMJUPI6uQk6Bnod/KCaEwFW+Le
	 wpZUFkl6mHUXHwiE3kyFkYWBjHx4qF5XvBGeqDfM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56F37F80249;
	Wed,  7 Sep 2022 12:19:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99C30F804B1; Wed,  7 Sep 2022 12:19:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24B87F804B2
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 12:19:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24B87F804B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="PCoJO+UH"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 83490B81BED
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 10:19:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D9E3C43141
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 10:19:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="PCoJO+UH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1662545953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=91jBrL5aPC80XGukpDEa15OCtEYalVaQ1P75f2zC3YQ=;
 b=PCoJO+UHg3aQ/a0twJgJVq673uPr3VfpKf5hvpDMGkJaVDwVlgzjF2bVzxsYNLmkD32TwB
 HWOUnidPMH+ez/x5+5W8tM9IGBP1qD1FJhqJTzfMlSszAaQQA3lknDsQMVzr4nTbU023o0
 KeTfuiXHxRcpUem5LJoPBfNd2oKpxAU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a005079f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <alsa-devel@alsa-project.org>;
 Wed, 7 Sep 2022 10:19:13 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id f131so5278636ybf.7
 for <alsa-devel@alsa-project.org>; Wed, 07 Sep 2022 03:19:13 -0700 (PDT)
X-Gm-Message-State: ACgBeo2e6Bfm7wvSDG6Fi/BIrNahA9dX+LHilH6fO3uCfSi0OUh6NBCx
 zOgOoYvrnH1/J8amCelPuW7fU1MszQ3pzO1uYkc=
X-Google-Smtp-Source: AA6agR5hEliNB3m0yvJsEMMwwYvv6deicM2/UJkRVXpCl23+4X08LigYKHB92fOHGJx79qP+IXR4fjiwBP1N0Zqf8LQ=
X-Received: by 2002:a5b:888:0:b0:6ad:480c:9b66 with SMTP id
 e8-20020a5b0888000000b006ad480c9b66mr990341ybq.231.1662545952241; Wed, 07 Sep
 2022 03:19:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220907100421.6443-1-tiwai@suse.de>
In-Reply-To: <20220907100421.6443-1-tiwai@suse.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 7 Sep 2022 12:19:01 +0200
X-Gmail-Original-Message-ID: <CAHmME9ojeePgZeiPFnZLxDkTvBSpX+FE6Gu383VRgoE_-CvZKg@mail.gmail.com>
Message-ID: <CAHmME9ojeePgZeiPFnZLxDkTvBSpX+FE6Gu383VRgoE_-CvZKg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: Clear fixed clock rate at closing EP
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org,
 =?UTF-8?B?TmlrbMSBdnMgS2/EvGVzxYZpa292cw==?= <89q1r14hd@relay.firefox.com>,
 Wim Taymans <wtaymans@redhat.com>
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

On Wed, Sep 7, 2022 at 12:04 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> The recent commit c11117b634f4 ("ALSA: usb-audio: Refcount multiple
> accesses on the single clock") tries to manage the clock rate shared
> by several endpoints.  This was intended for avoiding the unmatched
> rate by a different endpoint, but unfortunately, it introduced a
> regression for PulseAudio and pipewire, too; those applications try to
> probe the multiple possible rates (44.1k and 48kHz) and setting up the
> normal rate fails but only the last rate is applied.
>
> The cause is that the last sample rate is still left to the clock
> reference even after closing the endpoint, and this value is still
> used at the next open.  It happens only when applications set up via
> PCM prepare but don't start/stop the stream; the rate is reset when
> the stream is stopped, but it's not cleared at close.
>
> This patch addresses the issue above, simply by clearing the rate set
> in the clock reference at the last close of each endpoint.

Tested-by: Jason A. Donenfeld <Jason@zx2c4.com>
