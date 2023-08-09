Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9977762B8
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 16:40:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75632839;
	Wed,  9 Aug 2023 16:40:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75632839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691592055;
	bh=Y14GTCD/FFFYIOKjtHy7N58tlI47R3xa3Cl0aUBW+Do=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jH6UfdAwEaXMLkiWc/fji3dCAGdwE7r8CWcXY5gfhUvc1fMlYgDvn/CaaDdCwr5z7
	 epaPFaK3R6ZWAFi5K9K3lO1grZ0wjoRZj4cPiPZEnRTvJh51PMdvMvhRI3Ywzxzq6t
	 wh0Ea4vNNfqQm80UwhqgMncy5RQna42Tjy13gzn8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AC79F80536; Wed,  9 Aug 2023 16:40:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 048E8F80116;
	Wed,  9 Aug 2023 16:40:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E884F80134; Wed,  9 Aug 2023 16:40:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5A14BF800FE
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 16:39:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A14BF800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ozbusDol;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Ixk0Mlw1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 333B61F38C;
	Wed,  9 Aug 2023 14:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1691591996;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4yRbiZ4Jcfjevh0wen8DDHRXtqzt/p+upzdmWj+W99A=;
	b=ozbusDolaNkoloASVsBv98k1Za+pFgTEa3De2kRcVGOaPuoQ5zmSZ90CxUcCE8OmJXwPYP
	EZZfgKApxFp9Mz7q9wtwaqH5f4CJ8bk4dlXfLduaB6EWYXgahGb9NV8qOt2oYza01cD7aP
	6UYjQdhY0lGh3eZ/HIWDw34K+FXjmmw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1691591996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4yRbiZ4Jcfjevh0wen8DDHRXtqzt/p+upzdmWj+W99A=;
	b=Ixk0Mlw1usfvh/RcTae495hMDFChICQ4FFEdbTz1+uDKRuuKqqN39R54txxUzF4b+CaW5Q
	wVVQUrCeCohTnXCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0A3D9133B5;
	Wed,  9 Aug 2023 14:39:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id ivOIATyl02RgMgAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 09 Aug 2023 14:39:56 +0000
Date: Wed, 09 Aug 2023 16:39:55 +0200
Message-ID: <87bkfge0uc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: alsa-devel@alsa-project.org,
	Rolf Anderegg <rolf.anderegg@weiss.ch>,
	Michele Perrone <michele.perrone@weiss.ch>
Subject: Re: [PATCH] ALSA: dice: add stream format parameters for Weiss
 devices
In-Reply-To: <20230809141854.GA892647@workstation.local>
References: <20230809002631.750120-1-o-takashi@sakamocchi.jp>
	<87msz0e2jv.wl-tiwai@suse.de>
	<20230809141854.GA892647@workstation.local>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: WQEGLPTOJTOMTQAWINUCGZHN3KS6PY47
X-Message-ID-Hash: WQEGLPTOJTOMTQAWINUCGZHN3KS6PY47
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WQEGLPTOJTOMTQAWINUCGZHN3KS6PY47/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 09 Aug 2023 16:18:54 +0200,
Takashi Sakamoto wrote:
> 
> Hi,
> 
> On Wed, Aug 09, 2023 at 04:03:00PM +0200, Takashi Iwai wrote:
> > On Wed, 09 Aug 2023 02:26:31 +0200,
> > Takashi Sakamoto wrote:
> > > 
> > > This patch is for kernel prepatch v6.5.
> > 
> > Why it must be included in 6.5?  This sounds more like a new
> > implementation, rather than an urgent but fix that is needed for rc.
> 
> Thanks for your notice to the patch. Indeed, it is neither urgent nor
> bug fix. It is a kind of 'adding support for new device with slight
> change', like adding new entries in mod device table. The overall change
> and new lines are quite typical in ALSA dice driver, like TC Electronic
> devices in 'sound/firewire/dice/dice-tcelectronic.c'. Things are
> prepared and not brand-new.
> 
> Precisely, current ALSA dice driver supports the Weiss models already,
> while the functionality is limited that the part of sampling transfer
> frequencies are available as the initial author said (e.g. when 44.1/48.0
> kHz are available, 88.2/96.0 kHz are not, vise versa). The patch extends
> the functionality by hard-coding stream formats following to the design
> of ALSA dice driver.
> 
> Of cource, I don't mind postponing the patch to v6.6 kernel, but in my
> point of view, it is worth to v6.5 since users got benefits from the
> code which is not so novel.

OK, then I'd rather put it to 6.6.
If it were for rc2, I could take it.  But it's already in a second
half turn, and I'd rather like to limit the changes for later rcs.


Takashi
