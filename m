Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D435ACF59
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Sep 2022 12:00:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2807E12;
	Mon,  5 Sep 2022 11:59:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2807E12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662372009;
	bh=pi8Pg5NxSKQl2rjshE2nk7CBMLeWxytIlWnTjWWymeY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YV5P19dhA4paS0WAx994fdABsGw0auUpiS48xs2vljMicfvXH6PIRXMxvoqdY+39Y
	 Sfxz2LhBWzYMJzmkjllK9hivWV14PUIczn+GVFZAKQUxiBndSQBst5V6YCqi6ywbnq
	 OnBuk1USU8GUTl9fHoIxbAKQPdvbtgU/BUGX9nco=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5479AF800E8;
	Mon,  5 Sep 2022 11:59:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46945F800E9; Mon,  5 Sep 2022 11:59:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03F4AF800E9
 for <alsa-devel@alsa-project.org>; Mon,  5 Sep 2022 11:59:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03F4AF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="VWFHvdWM"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C44E3B81002;
 Mon,  5 Sep 2022 09:58:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1808C433D6;
 Mon,  5 Sep 2022 09:58:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="VWFHvdWM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1662371936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=djzuTynXF33xQt9q6oEjyvObywHD8Hr3NC7Wxk5AXsI=;
 b=VWFHvdWMW4zOjNS0XpHuYj0C8Ifmw6QhsyJSAcgctde2p9CBH52A48LgfhTXfQtyaJz2Yf
 WWfKoJnB7TVplT2la6th76L6BFK/hpCMlDKq35Znht5NX/S7zFO+R6twnFNXvFN18DSEIr
 8unP9q4DYGX3c65pLM0vKVmj7+MrPIc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d15a05f2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 5 Sep 2022 09:58:56 +0000 (UTC)
Date: Mon, 5 Sep 2022 11:58:50 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: usb-audio: Refcount multiple accesses on the
 single clock
Message-ID: <YxXIWv8dYmg1tnXP@zx2c4.com>
References: <20220516104807.16482-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220516104807.16482-1-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, 89q1r14hd@relay.firefox.com,
 linux-kernel@vger.kernel.org, Wim Taymans <wtaymans@redhat.com>
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

Hi Takashi,

On Mon, May 16, 2022 at 12:48:07PM +0200, Takashi Iwai wrote:
> When a clock source is connected to multiple nodes / endpoints, the
> current USB-audio driver tries to set up at each time one of them is
> configured.  Although it reads the current rate and updates only if it
> differs, some devices seem unhappy with this behavior and spew the
> errors when reading/updating the rate unnecessarily.
> 
> This patch tries to reduce the redundant clock setup by introducing a
> refcount for each clock source.  When the stream is actually running,
> a clock rate is "locked", and it bypasses the clock and/or refuse to
> change any longer.

This breaks things on 5.19+. Specifically, it causes pipewire and
pulseaudio to be stuck using 44.1khz rather than 48.0khz (or anything
else). The reason is that initially devices are started at 44.1khz, and
then the list of supported sample rates is read, and finally the best
one is chosen. With this commit, the returned list of sample rates is
locked at 44.1khz, which means pulseaudio and pipewire can't change it
to 48.0khz (or anything else).

This headscratcher is being tracked over at:
https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/2620
where I triaged it to this commit.

Can we revert this for the time being and backport the revert to stable?
Or might you have some other fix idea in mind?

Thanks,
Jason
