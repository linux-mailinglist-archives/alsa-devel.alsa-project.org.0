Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E1196B7B8
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2024 12:04:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 769FDA4B;
	Wed,  4 Sep 2024 12:04:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 769FDA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725444260;
	bh=YdqvvWCzC8N19fQFpIA9Rn4nu73HuITBH9OyFzVD1u8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DtvPq/gNTWCGKLk5Wu7k4m4imjfI18SZoaBx0VLf5n66HINwSOri7dyTMIV1PG4nR
	 z6dgTqEyNlLSai1j6GVjL2UOe4XfS4CP3gCh6KUVm+3p1PmrUAr6yuXgZa6KUS2Zpp
	 zc1sEArLNEshjYlrpy9L5nMlkd0LHQ6LvO3dYcQw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B949F805B0; Wed,  4 Sep 2024 12:03:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 467AFF8016C;
	Wed,  4 Sep 2024 12:03:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FC77F80199; Wed,  4 Sep 2024 12:03:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE93BF80107
	for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2024 12:03:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE93BF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=OhSvUAIF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=dB1xxZxv;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=bhzsJknS;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=hxgv+2KA
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C0F32219A0;
	Wed,  4 Sep 2024 10:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1725444221;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E3CihsqhGIyVwTYZC7YzVWH03HJ3Vfy3c/YBjsZnP6E=;
	b=OhSvUAIF5IT6+7IKUsP2pz9/Vf+Po0+K/m0hkVEYa873lBWiIEe2fYL0kn2MFFNg0glcbK
	QwvqaAOjHl9NAGMwa6wuRu18utkPlpIZyOnQqEdiiCfl3Zj7yLHN6q1JNyeJjMTBqVPyA9
	vJvmizGcY3EucB30B9KBZv0FGE26zkE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725444221;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E3CihsqhGIyVwTYZC7YzVWH03HJ3Vfy3c/YBjsZnP6E=;
	b=dB1xxZxvgfFLSnk18lE5nSustfqTLDUmkmrKYzy3/Iq4ApF76hWPz+eoM4Z5Ju+uCQXzeB
	TN7ZeL0c9HNvaDAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1725444219;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E3CihsqhGIyVwTYZC7YzVWH03HJ3Vfy3c/YBjsZnP6E=;
	b=bhzsJknSc/E9n5XVJ8eTTw/BRGQL0PcG/QXxDMduZR9tC0UpyJ0NtheSaiszCpJufCK86S
	3hqz+cSbku4LqikZxEJFrngCOr61Lr2G41MpbRJK9YhF0N7+zL0RBOP357VstJhnl1KUnf
	DEY1bzWSgMvCiYiimK0rx6dsC6C4vKo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725444219;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E3CihsqhGIyVwTYZC7YzVWH03HJ3Vfy3c/YBjsZnP6E=;
	b=hxgv+2KANuVGF5nIfrKBoAxXghRl0vaLWD09iNLkntS7kjkuLNKHVpFrLGPKEptQ+F1hDZ
	jTEBsOVHCr16jZDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9B979139D2;
	Wed,  4 Sep 2024 10:03:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id y3KdJHsw2GYqIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 04 Sep 2024 10:03:39 +0000
Date: Wed, 04 Sep 2024 12:04:25 +0200
Message-ID: <875xrbka52.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Chancel Liu <chancel.liu@nxp.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"S.J. Wang" <shengjiu.wang@nxp.com>
Subject: Re: Suspend/resume Issue on pcm_dmix.c in alsa-lib
In-Reply-To: <403ab960-ee4f-404a-81ab-e63d4a7f7ef9@perex.cz>
References: 
 <DB9PR04MB94988752ED7C43B399E0BC00E3942@DB9PR04MB9498.eurprd04.prod.outlook.com>
	<87msky1bqh.wl-tiwai@suse.de>
	<DB9PR04MB9498F7BBF2688256DEE7D5F2E39C2@DB9PR04MB9498.eurprd04.prod.outlook.com>
	<403ab960-ee4f-404a-81ab-e63d4a7f7ef9@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-2022-JP
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: PLRH2RMB52GJU25RML35G7XCWGNKJZOK
X-Message-ID-Hash: PLRH2RMB52GJU25RML35G7XCWGNKJZOK
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PLRH2RMB52GJU25RML35G7XCWGNKJZOK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 04 Sep 2024 11:29:05 +0200,
Jaroslav Kysela wrote:
> 
> On 04. 09. 24 11:07, Chancel Liu wrote:
> > Hi Takashi,
> > 
> > Thanks for your reply and suggestions. Finally we have found the root cause.
> > Seems it's related to both drivers and alsa-lib.
> > 
> > When two dmix clients run in parallel we get two direct dmix instances.
> > 1st dmix instance:
> > snd_pcm_dmix_open()
> > 	snd_pcm_direct_initialize_slave()
> > 		save_slave_setting()
> > Since the driver we are using has SND_PCM_INFO_RESUME flag, dmix->spcm->info
> > has this flag. Then this flag is cleared in dmix->shmptr->s.info.
> > 		
> > 2nd dmix instance:
> > snd_pcm_dmix_open()
> > 	snd_pcm_direct_open_secondary_client()
> > 		copy_slave_setting()
> > 2nd dmix->spcm->info is copied from dmix->shmptr->s.info so it doesn' has this
> > flag.
> > 
> > If 1st dmix instance resumes firstly it should implement recovery of slave pcm
> > in snd_pcm_direct_slave_recover(). Because 1st dmix->spcm->info has
> > SND_PCM_INFO_RESUME，snd_pcm_resume(direct->spcm) can be called correctly to
> > resume slave pcm.
> > 
> > However if 2nd dmix instance resumes firstly, snd_pcm_resume(direct->spcm) will
> > not be called because it's spcm->info doesn't has SND_PCM_INFO_RESUME flag. The
> > 1st dmix instance assumes someone else already did recovery so
> > snd_pcm_resume(direct->spcm) won't be called neither. In result the slave pcm
> > fails to resume.
> 
> The snd_pcm_direct_slave_recover() function should be called for both
> dmix instances. It calls snd_pcm_prepare() for the "driver" PCM, so
> the driver should recover from suspend in this case, too.

IIUC, it's called.  snd_pcm_direct_check_xrun() is called in many
places to get the state synced, and this sets the PCM state to
SND_PCM_STATE_SUSPENDED when shmptr->s.recoveries changes.
Then the application calls snd_pcm_resume(), and it calls
snd_pcm_direct_slave_recovery().

> See the "some buggy drivers" comment in
> snd_pcm_direct_slave_recover(). It looks like a driver issue, the
> "resume" flag mangling is just a workaround.

A sort of, yes.  The clearance of INFO_RESUME flag should have been
done no matter whether we do this workaround or not, though.

> > SND_PCM_INFO_RESUME flag has impact on the flow of dmix resume. In my opinion
> > the first resumed dmix instance should make sure slave pcm can be recovered
> > properly no matter it's the first opened instance or secondary opened instance.
> > Do you know why the secondary opened instance clear the SND_PCM_INFO_RESUME
> > flag? Can we do the following modification?
> > 
> > diff --git a/src/pcm/pcm_direct.c b/src/pcm/pcm_direct.c
> > @@ -1183,8 +1226,6 @@ static void save_slave_setting(snd_pcm_direct_t *dmix, snd_pcm_t *spcm)
> >          COPY_SLAVE(buffer_time);
> >          COPY_SLAVE(sample_bits);
> >          COPY_SLAVE(frame_bits);
> > -
> > -       dmix->shmptr->s.info &= ~SND_PCM_INFO_RESUME;
> 
> Another option is to fix the buggy drivers and remove the workround
> (or make it configurable) from alsa-lib (revert commit
> 6d1d620eadf32c6d963468ce56ff52cc3a2f32e2).

I'm afraid that this problem is irrelevant with it.

Although I wrote it as "buggy", it might be better phrased as
"fragile".  We haven't defined strictly how the state should be
changed when SUSPENDED or PAUSED to PREPARE.  Ideally, we could just
jump to PREPARE without clearing the state, but some devices seem
assuming the clearance of those state at first.


Takashi
