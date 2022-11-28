Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F1263B4FE
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 23:52:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DC67168D;
	Mon, 28 Nov 2022 23:52:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DC67168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669675978;
	bh=OkeLKSQaSOlnn31gS2/ScgmuSK6bAk5YBrMPeOlbBy0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ep6pkjLUjGL2oHkdL3tp1LmVgVRH8fJFi3U6/cepWjp9ee6DHuMwQVilHifVp71MZ
	 imRbR5tNl/DfAJgN/NaDuN1pBD+rRA6V6kiKZLcLCeC/xYc2UB5fY7JgO41Himm2no
	 Q1W/65rsHPE3Ai7PdmPhHXQf8tRUiD2fLvhHuuVY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0582AF8016E;
	Mon, 28 Nov 2022 23:52:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2680DF8020D; Mon, 28 Nov 2022 23:52:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from smtp.hosts.co.uk (smtp.hosts.co.uk [85.233.160.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A35B9F8016E
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 23:51:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A35B9F8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=carlh.net header.i=@carlh.net
 header.b="uGroGmg+"
Received: from [164.90.213.35] (helo=main.carlh.net)
 by smtp.hosts.co.uk with esmtpsa (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim) (envelope-from <unknown@carlh.net>) id 1ozmyj-00081p-Dx;
 Mon, 28 Nov 2022 22:51:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=carlh.net; 
 s=rsa1;
 h=Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject
 :cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5YWHwWBw0HKm9DlYQdCOPma+HYJmho9dQfP5T4MMscE=; b=uGroGmg+R/jcUmngRh966h8Vhj
 7C4xsUTmaMeb0Qz+7zWBXUI8iz1vMvrAyrn8fJSek+n0GxYQH0KuwwX/5xYR4bsS8DvbkRRHgfP4s
 zgG50LY/K1MTqbNMSf83JN6J3HC/KWAYuaSGBMxhuQeOgn3ZGcCc0lX1l8vwRrfzqnl8JWPt5wY6I
 bnGpNYf5A+U56JkUFxyBmJO+XC9brtE4PBYa8zxbwbIRjWQ3muR/yNTz35EiGrQdVV0+Pbo8/CCmD
 yJ0uhutTQiCc58PM/sgy/txXPgAlpw6Bl2yTfCEfSy35vku+hc7lmH3ciqALjIVCDYTFaiDLjVoyE
 akrZPejA==;
Received: from carl (helo=localhost)
 by main.carlh.net with local-esmtp (Exim 4.94.2)
 (envelope-from <unknown@carlh.net>)
 id 1ozmyh-003Rpa-KW; Mon, 28 Nov 2022 22:51:55 +0000
Date: Mon, 28 Nov 2022 22:51:55 +0000 (GMT)
From: Carl Hetherington <lists@carlh.net>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: Query about xrun on usb/pcm
In-Reply-To: <87edtv6pi6.wl-tiwai@suse.de>
Message-ID: <baa6589-184f-6751-71be-1d5d67f8a6d5@carlh.net>
References: <b4e71631-4a94-613-27b2-fb595792630@carlh.net>
 <87y1s3v4ba.wl-tiwai@suse.de> <e830ee7b-e79e-54fb-a2ca-ffffd777b3f@carlh.net>
 <87edtv6pi6.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam_score: -1.9
X-Spam_bar: -
Cc: alsa-devel@alsa-project.org
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

Thank you for your continued attention with this!

[snip]

> > I'll see if can apply a similar fix to this case, though to my naive
> > eyes it looks a little trickier as the xrun is found in the snd_pcm
> > code rather than the USB code.  Any suggestions most welcome!
>
> OK, then it's a bit different problem, and not so trivial to fix in
> the kernel side alone, I'm afraid.  Basically it's a race between
> start and stop of two streams.  The key point is that, for stopping a
> (USB) stream, a sync-stop operation is needed, and this can't be
> performed at the PCM trigger itself (which is an atomic operation).
> So, the kernel trigger may at most return an error there.
>
> I assume that it's from snd_usb_endpoint_start() and it returning
> -EPIPE error.  If so, we may change the PCM core code to set the PCM
> state again XRUN in such an error case, so that application may repeat
> the standard recovery process.  Something like below.

Thanks for the suggestion.  I experimented a little with this, but I
think the problem I'm seeing is that (even if the application knows it
should retry the snd_pcm_prepare() step) we still end up with an endpoint
in EP_STATE_STOPPING while the corresponding stop_operating flag is 0.

This means that snd_pcm_sync_stop will never call the USB sync_stop
handler, which AFAICS is the only way (?) the endpoint can get back to
EP_STATE_STOPPED.

In my error case, the code in snd_pcm_sync_stop sets stop_operating to
false (perhaps assuming that substream->ops->sync_stop will "succeed"
in setting any STOPPING endpoints to STOPPED) but then this doesn't
happen because of this xrun that arrives halfway through the sync_stop
operation.

I experimented with removing the check at the top of snd_pcm_sync_stop,
so that we enter the if body regardless of
substream->runtime->stop_operating, and making my application retry
snd_pcm_prepare() if it fails with -EPIPE, and this seems to "fix" my
problem.  Obviously this causes more (unnecessary) calls to the
sync_stop() entry point...

I'd be grateful of any thoughts you have about that.

Kind regards,
Carl
