Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB9474EC4C
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 13:09:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B71EB207;
	Tue, 11 Jul 2023 13:08:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B71EB207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689073747;
	bh=w4QhknQYuo0UXeeAezX2W2oXgCNNtW0bV9rpO82zBf8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G+sbpCmw1S+D2QE22Wqh9+IPvlszb5cYonO4ZOcDmV7FkX/UqZcGW3Nj6PsvL6Zj4
	 WRykAFdkdT12j4huC9P0vuWfzMQGH1u2bqAWmNNTcpg3jk3lFi3Y9rEitteawYW1+n
	 CTS4nlT/EcXVi5KxmSGWqn2gwOx26ZRw9udqM9lw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 436EDF80153; Tue, 11 Jul 2023 13:08:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EECB8F80153;
	Tue, 11 Jul 2023 13:08:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F163FF80236; Tue, 11 Jul 2023 13:08:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1E467F800E4
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 13:08:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E467F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=g09X+9vD;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Q6MktIap
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 58F7E21CBE;
	Tue, 11 Jul 2023 11:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689073686;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ziznrMBv/5lEPWt2uBXMEb655J1dle31oJ8/rSx8oq4=;
	b=g09X+9vDl6o3hLWqgMTK2mv70FiGDlPiH6jcw3ygKgZqaBikA8uGiQoCnQvDo7ar2KxB02
	h3k8s53+ueJ04EZKl2zRzQI1+3nxIa5/2jdToqi9rSiIzAO8aa2fcsGAPT/K858Zt+8kZT
	cRLJaBUNRGEx3OhA49cG9P5a8KV31i0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689073686;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ziznrMBv/5lEPWt2uBXMEb655J1dle31oJ8/rSx8oq4=;
	b=Q6MktIapYjYO4PxodwZcW9ZfjUjExw5jho4dhpurzHqxHfAXaJE35z8Y7DYVJcUwrnRJGf
	5oYnX62u2ENKFQBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 384EF1390F;
	Tue, 11 Jul 2023 11:08:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 8IauDBY4rWRxEQAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 11 Jul 2023 11:08:06 +0000
Date: Tue, 11 Jul 2023 13:08:05 +0200
Message-ID: <87mt02wvsa.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH v2 0/8] ALSA: emu10k1: add support for high-bitrate modes
 of E-MU cards
In-Reply-To: <ZK0rw5j5BbyppXZ/@ugly>
References: <20230630144542.664190-1-oswald.buddenhagen@gmx.de>
	<87sf9vyfer.wl-tiwai@suse.de>
	<ZK0rw5j5BbyppXZ/@ugly>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 2JKQZF3J6IKYLICYLSMPCAUD3DGWYR3G
X-Message-ID-Hash: 2JKQZF3J6IKYLICYLSMPCAUD3DGWYR3G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2JKQZF3J6IKYLICYLSMPCAUD3DGWYR3G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 11 Jul 2023 12:15:31 +0200,
Oswald Buddenhagen wrote:
> 
> On Mon, Jul 10, 2023 at 05:06:36PM +0200, Takashi Iwai wrote:
> > On Fri, 30 Jun 2023 16:45:34 +0200,
> > Oswald Buddenhagen wrote:
> >> 
> >> This series is what all the work was about: support the "dual-/quad-pumped"
> >> modes of the E-MU cards.
> >> 
> >> Oswald Buddenhagen (8):
> >>   ALSA: emu10k1: introduce alternative E-MU D.A.S. mode
> >>   ALSA: emu10k1: improve mixer control naming in E-MU D.A.S. mode
> >>   ALSA: emu10k1: set the "no filtering" bits on PCM voices
> >>   ALSA: emu10k1: make playback in E-MU D.A.S. mode 32-bit
> >>   ALSA: add snd_ctl_add_locked()
> >>   ALSA: emu10k1: add support for 2x/4x word clocks in E-MU D.A.S. mode
> >>   ALSA: emu10k1: add high-rate capture in E-MU D.A.S. mode
> >>   ALSA: emu10k1: add high-rate playback in E-MU D.A.S. mode
> > 
> > I still can't agree with the basic design using the dynamic kctl
> > addition / deletion in kcontrol's put action.
> > 
> you are not being constructive. please provide specific, actionable
> responses to _all_ challenges/questions.

The fundamental idea to add / delete the kctls from the put callback
is unacceptable; as repeated many times, this is known to break
existing applications.  As long as you are sticking with this idea, it
can go further.  Please avoid it and use the (more or less) static
configuration instead.


thanks,

Takashi
