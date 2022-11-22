Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4152A633B08
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Nov 2022 12:17:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7844163B;
	Tue, 22 Nov 2022 12:17:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7844163B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669115874;
	bh=vfNTX6BhrZaDAi08j0OWJTgMeZ3Iwj3r3S0pJdA5VfU=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DlHh9x3gyubKKyl9TmQVGKJLDeK9gcceyswFEXnI7EeR5XHcOdLoBufqeKaFAdhIW
	 798bHVFG/t9lH5+AdO0tx9dH6aM1oOG7qZNpldj7LwLh/NEhq8wVZQwqaslh/KqvrC
	 xg3WjH5LM+NW4/bP8dHqFJtZ0/aKdSlecMFA0oUs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37974F80115;
	Tue, 22 Nov 2022 12:16:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0BFCF80272; Tue, 22 Nov 2022 12:16:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-out-auth1.hosts.co.uk (mail-out-auth1.hosts.co.uk
 [195.7.255.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 494D5F80115
 for <alsa-devel@alsa-project.org>; Tue, 22 Nov 2022 12:16:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 494D5F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=carlh.net header.i=@carlh.net
 header.b="qX8zGKI/"
Received: from main.carlh.net ([164.90.213.35])
 by smtp.hosts.co.uk with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim) (envelope-from <unknown@carlh.net>) id 1oxRGj-000244-E2;
 Tue, 22 Nov 2022 11:16:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=carlh.net; 
 s=rsa1;
 h=Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject
 :cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6dhLsfjVz5aFBoHkDwn/Cl17mJowYKEMwmWpTcKnERQ=; b=qX8zGKI/GdG4pQ8SRGzXbvqle8
 7usk4RYEFKCQOX9xb/39KXD+kyY8sD8+ELHeOppWCBgLXXmgnIxGVqG0L225SFhQ6GlJNfbvnlUqv
 oN3mrExhlK1b+qazGYLF+xzFdfbCo3EQQ9ca5ObXbPUFN92EP7crV+TOUxhPUDqdc+XPwNR/ZptSC
 Feu1UfTJiWuX1Xe2Kuv7iOef3z+hNjEB9CFKDjZa+94ZVaR3J+sSWUDqazsPMGhhi3lPE1iSq8vnC
 NYjw1SED0UU7NV52t0Thwz6TeE7eGbr8BVp1F3NVDcVJEr1ix18FmtiPDpU1chYsGO667FISqTpA+
 cpe03ZYQ==;
Received: from carl (helo=localhost)
 by main.carlh.net with local-esmtp (Exim 4.94.2)
 (envelope-from <unknown@carlh.net>)
 id 1oxRGh-00BeCs-P4; Tue, 22 Nov 2022 11:16:48 +0000
Date: Tue, 22 Nov 2022 11:16:47 +0000 (GMT)
From: Carl Hetherington <lists@carlh.net>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: Query about xrun on usb/pcm
In-Reply-To: <87y1s3v4ba.wl-tiwai@suse.de>
Message-ID: <e830ee7b-e79e-54fb-a2ca-ffffd777b3f@carlh.net>
References: <b4e71631-4a94-613-27b2-fb595792630@carlh.net>
 <87y1s3v4ba.wl-tiwai@suse.de>
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

Thank you for getting back to me!

On Tue, 22 Nov 2022, Takashi Iwai wrote:

[snip]

> > Now, snd_usb_endpoint_start() is called on 0x2 and that is fine.  Next,
> > snd_usb_endpoint_start() is called on 0x82 and that fails because its
> > state is still STOPPING.
> >
> > At this point things seem broken.
> >
> > Does anyone have a hint about where in this sequence things are going
> > wrong, and maybe even why?
>
> The problem is that it's treating XRUNs on the both streams
> individually.  It's correct to recover only the PCM stream when an
> XRUN is reported to the PCM stream.  However, for an XRUN on the
> capture stream that serves as a sync source, it should stop and
> recover not only the capture PCM stream but also the playback stream
> as a sync sink as well.
>
> Below is a possible test fix (totally untested!).
> This may give XRUNs twice eventually, which is a bit confusing, but it
> aligns with the actual hardware behavior, at least.

[snip fix]

Makes sense, thank you!  Sadly, the fix doesn't seem to work because (I
think) the xruns I'm seeing come via a different path (not though
notify_xrun()).  Mine arrive via this trace:

__snd_pcm_xrun
snd_pcm_update_state
snd_pcm_update_hw_ptr
usb_hcd_giveback_urb
snd_pcm_period_elapsed_under_stream_lock
snd_pcm_period_elapsed
retire_capture_urb
snd_complete_urb

I'll see if can apply a similar fix to this case, though to my naive
eyes it looks a little trickier as the xrun is found in the snd_pcm
code rather than the USB code.  Any suggestions most welcome!

Kind regards,
Carl


