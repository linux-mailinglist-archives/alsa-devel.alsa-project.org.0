Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C837D6E1F4B
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Apr 2023 11:29:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38601DF9;
	Fri, 14 Apr 2023 11:28:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38601DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681464576;
	bh=1AHToPX24EBXGeLeeTk4I3nInPscgpcjK6cm3QRlaco=;
	h=Date:From:To:Subject:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bBLch42pJgu0zMpKGJpB9uEkmBJir/Nioqe9e62WQup2F5wV5YTiCNJ5PRZLiow7H
	 VFuAL7O5yM+lUAWnw4vtuKgGvSiXbHLvJs8UG5vuAhfV3n0OztCd1nnsk2pAXM+HKV
	 hyNl/bYgNhZAhBu6ymMyM1NeaSyeDLErD7eDtazU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 735D4F8025E;
	Fri, 14 Apr 2023 11:28:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 169B7F8032B; Fri, 14 Apr 2023 11:28:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F32B2F80149
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 11:28:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F32B2F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Dyd8VemJ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=U2Y3GlUy
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6FAA1219D0;
	Fri, 14 Apr 2023 09:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1681464509;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t08R0Aw7vQoR6TxJWUAYF6fRvdCaKK3LgktDIqFjfIQ=;
	b=Dyd8VemJzl58sF0GCCUtJTmtZ5GivdNJ8qQtNwnsprutgZAqVSXWlCW64hmgHl1KXtFHdF
	0q4viPxrwq1TCYwAPKauJpTP0YeP5uqG7sh7VErm5TYmV30OKwTnDCtBUneYJiyWfITAyH
	H/tjRKYkfJ18uzVv5pu68o4PfCZCroc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681464509;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t08R0Aw7vQoR6TxJWUAYF6fRvdCaKK3LgktDIqFjfIQ=;
	b=U2Y3GlUyNjSlZFbWBlnt0q3dCFbfhvzcpcokg6AQ23RU1dtfPKgIVH6GMOLlKa6XWlC34/
	RH8e97F0S68OxnDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 591F913498;
	Fri, 14 Apr 2023 09:28:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id rVBQFL0cOWTaCQAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 14 Apr 2023 09:28:29 +0000
Date: Fri, 14 Apr 2023 11:28:28 +0200
Message-ID: <878reun77n.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Subject: Re: [PATCH 2/2] ALSA: pcm: auto-fill buffer with silence when
 draining playback
In-Reply-To: <ZDkVKhergjGu5S3F@ugly>
References: <ZDZmDyOMYMD4Uu5g@ugly>
	<87wn2ho06z.wl-tiwai@suse.de>
	<54c16616-dee7-b50f-d612-82eef906d1df@perex.cz>
	<871qkoxrrl.wl-tiwai@suse.de>
	<ZDfWZG+VASX/Xo/j@ugly>
	<87ile0vzxp.wl-tiwai@suse.de>
	<ZDfjKgLJ2tpV45eW@ugly>
	<87edoovvdy.wl-tiwai@suse.de>
	<ZDgYto5sExV2q3pE@ugly>
	<87h6tina31.wl-tiwai@suse.de>
	<ZDkVKhergjGu5S3F@ugly>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 5ZRMXYXMAHGTFBTOBUYOH7OW7ZW3YJTY
X-Message-ID-Hash: 5ZRMXYXMAHGTFBTOBUYOH7OW7ZW3YJTY
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: ALSA development <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5ZRMXYXMAHGTFBTOBUYOH7OW7ZW3YJTY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 14 Apr 2023 10:56:10 +0200,
Oswald Buddenhagen wrote:
> 
> On Fri, Apr 14, 2023 at 10:26:26AM +0200, Takashi Iwai wrote:
> > BTW, I guess that one missing piece in your patch is the case where
> > the drain is called at the moment of fully filled data.  You added
> > snd_pcm_playback_silence() at snd_pcm_do_drain_init(), but in this
> > scenario, the call wouldn't do anything at this moment.  But
> > snd_pcm_playback_silence() won't be called afterwards because
> > runtime->silence_size = 0.  So this workaround won't take effect in
> > that case, no?
> > 
> the hunk in snd_pcm_update_hw_ptr0() should take care of that.

OK, I see.  Thanks.


Takashi
