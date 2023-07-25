Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5149A7610CC
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 12:26:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93787E99;
	Tue, 25 Jul 2023 12:25:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93787E99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690280802;
	bh=cCmmdzyk2ApRoaaR4rb9fFZnEddb2ws0TQsqPYdpCxA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A+QMJSpmxpFthBcB2PQekZpGcwU9BoRFAmhbWG9SsOztmhxqQZKyXWaa/CHqrkUHw
	 7AXAJvVN8dD2umOFHed+6gvn7+kKarUuTWcAsetHyuTAoZsf4K/hplt2SGKTI46EFu
	 HPb1ehNuRsnkHq6uUAl64FkqWJFsv1AvCwumf3PI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7738F80153; Tue, 25 Jul 2023 12:25:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EBE2F80153;
	Tue, 25 Jul 2023 12:25:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B141F80163; Tue, 25 Jul 2023 12:25:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88C11F80149
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 12:25:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88C11F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ym3Lv9sg;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=WuVD7u7M
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0F87D1F460;
	Tue, 25 Jul 2023 10:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690280717;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sPXUUer8dtBxkifUah0s+drgmpgMVOIa5o/QnqYNCHo=;
	b=ym3Lv9sgaJ1VMH2LJsSNU0hGmh3AQ9VdvdgOIH3Fp1WgPSRJeHAzkmapsT0AwRJw/eKDfp
	UpO4lbRzu0DLOocr+RgWHrFL0HcWi6bn7HOagAJ6u/C5vAQ6H1db0AG2W/AE+CyYRENhyB
	ih4I4c4Qdo+sb1gKrJKlGtNZI6/aCbc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690280717;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sPXUUer8dtBxkifUah0s+drgmpgMVOIa5o/QnqYNCHo=;
	b=WuVD7u7Mdr14TBPy8HQ6d6jrTR2obm53BZmhyjq0dellnrrFw9XmTYZzFsVy/phOK/Q5/L
	MRbExldgdPeJVPBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D9EE213342;
	Tue, 25 Jul 2023 10:25:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 8ShUNAyjv2QAegAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 25 Jul 2023 10:25:16 +0000
Date: Tue, 25 Jul 2023 12:25:16 +0200
Message-ID: <87lef4thir.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Robert Lee <lerobert@google.com>
Cc: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: compress: add opus codec define
In-Reply-To: 
 <CAOM6g_Db8qwbDmbWSSLKqUHsSMLUYxFtpqKi1cWsXsXTE9B+vA@mail.gmail.com>
References: <20230725093005.3499455-1-lerobert@google.com>
	<87sf9ctifg.wl-tiwai@suse.de>
	<CAOM6g_Db8qwbDmbWSSLKqUHsSMLUYxFtpqKi1cWsXsXTE9B+vA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-2022-JP
Message-ID-Hash: U2MVIXPSW4OPFNLFH4RNNXUBEQGDOCKH
X-Message-ID-Hash: U2MVIXPSW4OPFNLFH4RNNXUBEQGDOCKH
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U2MVIXPSW4OPFNLFH4RNNXUBEQGDOCKH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 25 Jul 2023 12:14:56 +0200,
Robert Lee wrote:
> 
> Thanks for reply so quickly.
> And yes, there are other changes but it is inside our offload pcm
> driver to handle it.
> Currently we only use it to decode, and we don't need additional option for it.

It means still a downstream-only change :)

It's nice to upstream changes in general, but from the upstream POV,
only changing this gives no benefit.  Let's tie with the actual use
case *in the upstream*.


thanks,

Takashi

> 
> Thanks,
> Robert.
> 
> Takashi Iwai <tiwai@suse.de> 於 2023年7月25日 週二 下午6:05寫道：
> >
> > On Tue, 25 Jul 2023 11:30:05 +0200,
> > Robert Lee wrote:
> > >
> > > Add to support decode Opus codec in Ogg container.
> > >
> > > Signed-off-by: Robert Lee <lerobert@google.com>
> >
> > The change makes sense only when it's really used.  So usually it's
> > better to put into a series that actually implements its usage.
> >
> >
> > thanks,
> >
> > Takashi
> >
> > > ---
> > >  include/uapi/sound/compress_params.h | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/compress_params.h
> > > index ddc77322d571..bac5797bcb02 100644
> > > --- a/include/uapi/sound/compress_params.h
> > > +++ b/include/uapi/sound/compress_params.h
> > > @@ -43,7 +43,8 @@
> > >  #define SND_AUDIOCODEC_BESPOKE               ((__u32) 0x0000000E)
> > >  #define SND_AUDIOCODEC_ALAC                  ((__u32) 0x0000000F)
> > >  #define SND_AUDIOCODEC_APE                   ((__u32) 0x00000010)
> > > -#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_APE
> > > +#define SND_AUDIOCODEC_OPUS                  ((__u32) 0x00000011)
> > > +#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_OPUS
> > >
> > >  /*
> > >   * Profile and modes are listed with bit masks. This allows for a
> > > --
> > > 2.41.0.487.g6d72f3e995-goog
> > >
> 
