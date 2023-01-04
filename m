Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF72465CE26
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Jan 2023 09:17:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D104990A;
	Wed,  4 Jan 2023 09:16:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D104990A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672820254;
	bh=DuYbrWi3+/Nv8W9ShxRg9jQRdLFOrw/YmBcOHGMaqOQ=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=b5gEkOIJwk7o9OVv6T1zSFhlVFXg1E3xt6Ko5kAmFJSUgZ31vfULZsR5fiFJTc1m+
	 fh3p2NYpKvcCKzDrTuw7PU/O01VEckytJGrCuUE7ph53kVXcIPBnS8Wm+QGG7Dkzkh
	 CEAwwgFXrUWpR9jaFchNGHLoE3w61BKrkHybd6gs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F144BF8024D;
	Wed,  4 Jan 2023 09:16:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49CBDF8024D; Wed,  4 Jan 2023 09:16:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 913FBF8023B
 for <alsa-devel@alsa-project.org>; Wed,  4 Jan 2023 09:16:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 913FBF8023B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=zapD2kck; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ALrc19ey
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BF18743C1;
 Wed,  4 Jan 2023 08:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672820190; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FLF1tG4C9Ywcys+2llBqDMcyOSkGTHUxQaQHjgJI+8M=;
 b=zapD2kckjnA6B2CTHFW3lt+IUueYZBN0+NV+9JTXXdyj6p2dTRgpWtmgFxF3lVr7BX3dBW
 /SpPGhIquS1qotgkdUYyJtmChX4Uw72lmeYE2IPJ1kw4ed+VBq/hdCi/w1BjiozDzBvcwJ
 fEMc+ZDuYqweUp/UiKirXYXILZIIT0g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672820190;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FLF1tG4C9Ywcys+2llBqDMcyOSkGTHUxQaQHjgJI+8M=;
 b=ALrc19eybdlI+2fuWd/SYwapi/CpiVCZcSqVhPT5VqutdZqEnxBmvW0t9gamBlWk05q3UW
 3ovcqSe1m+X699Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 95C59133D1;
 Wed,  4 Jan 2023 08:16:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aF7CI941tWNQFAAAMHmgww
 (envelope-from <tiwai@suse.de>); Wed, 04 Jan 2023 08:16:30 +0000
Date: Wed, 04 Jan 2023 09:16:30 +0100
Message-ID: <87ilhmpvdt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Michael Ralston <michael@ralston.id.au>
Subject: Re: USB-Audio regression on behringer UMC404HD
In-Reply-To: <CAC2975Jw63j26DhvDjiLc7dXwaRz=eK0aWNuErQ8dkEn_Gemjg@mail.gmail.com>
References: <CAC2975JXkS1A5Tj9b02G_sy25ZWN-ys+tc9wmkoS=qPgKCogSg@mail.gmail.com>
 <bf646395-1231-92f6-7c5a-5b7765596358@leemhuis.info>
 <87zgb0q7x4.wl-tiwai@suse.de>
 <CAC2975K24Gt3rGieAToHjb7FEHv84aqiRSQx7EOuR2Q7KByUXw@mail.gmail.com>
 <87sfgrrb5f.wl-tiwai@suse.de>
 <CAC2975+cUqiFC0LO-D-fi0swH+x=_FMuG+==mhg6HH4pc_YDRA@mail.gmail.com>
 <87bknfr6rd.wl-tiwai@suse.de>
 <CAC2975+CP0WKmXouX_8TffT1+VpU3EuOzyGHMv+VsAOBjCyhnA@mail.gmail.com>
 <878rijr6dz.wl-tiwai@suse.de>
 <CAC2975+Ybz2-jyJAwAUEu5S1XKfp0B-p4s-gAsMPfZdD61uNfQ@mail.gmail.com>
 <87zgazppuc.wl-tiwai@suse.de>
 <CAC2975+476CHDL3YM=uExHu96UB2rodAng9PVYHX+vGnSCppGA@mail.gmail.com>
 <CAC2975Ja-o6-qCWv2bUkt3ps7BcKvb96rao_De4SGVW1v8uE=A@mail.gmail.com>
 <CAC2975KFqvTitbJHJZ6a4Tuxsq=nPGvW3vjAAtkQxw=sBgeDqw@mail.gmail.com>
 <CAC2975Jw63j26DhvDjiLc7dXwaRz=eK0aWNuErQ8dkEn_Gemjg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, regressions@lists.linux.dev,
 Takashi Iwai <tiwai@suse.com>, stable@vger.kernel.org,
 Thorsten Leemhuis <regressions@leemhuis.info>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, 03 Jan 2023 20:29:54 +0100,
Michael Ralston wrote:
> 
> On Wed, 4 Jan 2023 at 06:27, Michael Ralston <michael@ralston.id.au> wrote:
> >
> > On Wed, 4 Jan 2023 at 06:24, Michael Ralston <michael@ralston.id.au> wrote:
> > >
> > > I did a diff between the sound/usb directory for 6.0.16 and 6.1.2 and
> > > reverted that entire directory.
> > >
> > > It is working with that change, so there must be something else.
> > >
> >
> > Logs below...
> >
> 
> This line from the logs stands out to me as different. Could this mean anything?
> 
> > Jan 04 06:20:27 leatherback kernel: usb 1-4: clock source 41 is not
> > valid, cannot use

This might be due to the commit
ac5e2fb425e1121ceef2b9d1b3ffccc195d55707
  ALSA: usb-audio: Drop superfluous interface setup at parsing

I believe it's time to check which commit broke things.
Assume that the bug is USB audio core changes, the following 8 commits
are relevant:

1045f5f1ff0751423aeb65648e5e1abd7a7a8672
9355b60e401d825590d37f04ea873c58efe9b7bf
a74f8d0aa902ca494676b79226e0b5a1747b81d4
9902b303b5ade208b58f0dd38a09831813582211
9a737e7f8b371e97eb649904276407cee2c9cf30
2be79d58645465351af5320eb14c70a94724c5ef
ac5e2fb425e1121ceef2b9d1b3ffccc195d55707


Could you try to revert from top to bottom one-by-one, and check which
one makes things working again?  The most suspected one is
2be79d586454 (one before the last, a big change), but who knows...


thanks,

Takashi
