Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B824A89377
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Apr 2025 07:40:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43E11692F6;
	Tue, 15 Apr 2025 07:40:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43E11692F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1744695626;
	bh=Zw2bRyusBRw9k/dTBM6I+RnkCa3lTE/8z444A8KrfGg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e4Oizbk/3o6fI6Xzg9PyqDypZrphRrL853XqZK8G/mxSdNG/uqkPzO1mssIF/UcUX
	 jE9b5DKbyYYnmWHyom6JQS9Yv0mUGwhjeToiVi0eiUKc6lD276q2z+9uK+JlpPaOgT
	 VN7/+THysbkSj/qPwWVcefTb4qDZulk8HG48KWsY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DCF2F805C0; Tue, 15 Apr 2025 07:39:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F335F805CA;
	Tue, 15 Apr 2025 07:39:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBA8CF80424; Tue, 15 Apr 2025 07:39:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E52E4F800B0
	for <alsa-devel@alsa-project.org>; Tue, 15 Apr 2025 07:39:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E52E4F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=SuFoQfRU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=tFhOchxX;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=zWpEc3F7;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=akDy0ieO
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CC0A021181;
	Tue, 15 Apr 2025 05:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1744695576;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=as3aEVlv44y4roGC0g9l1+Ohb3Id0Aesv2XdI9UUJeE=;
	b=SuFoQfRUJDJ3xxKfKJyMZUj8Oz3+SlEoge0iJxqwK6coCILN5oJSP+QJvBoejZbSphwFgv
	W/GgWS9lNDCiWLWtG/TtyS2Bfxpw/arGefZyKXvD0i3TzWEHPraBB4WA8W+OUs68NTK6Lv
	abjGbmi9p9VH6Ke8UP5SlNyZgN+H0Nw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744695576;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=as3aEVlv44y4roGC0g9l1+Ohb3Id0Aesv2XdI9UUJeE=;
	b=tFhOchxX5sZ9EVm4CKiaPoNy6Xb+j6Qr8TxQC+Z8gLQftuCoVv3mLaoXl2o7KMr8xgIko1
	2JamChE/iJus9cDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zWpEc3F7;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=akDy0ieO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1744695575;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=as3aEVlv44y4roGC0g9l1+Ohb3Id0Aesv2XdI9UUJeE=;
	b=zWpEc3F7+6VjaepTAW2r9+c8VxnxSerNzxCpyv7TlJr35QSKc7FpH9t7ObhYNfe6kfuIde
	NpfIL6thUfhHe3+WRZYO/XBpv0MZYSbvcptHcbfo8DXo8LB7wewwx43Z+OQDJ2fnOMU9q+
	HrlRDK1Uk4dSC/J/v4NBPOwiVRUUpRA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744695575;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=as3aEVlv44y4roGC0g9l1+Ohb3Id0Aesv2XdI9UUJeE=;
	b=akDy0ieOVj041+6NkMauYDWnu6kgQT02JYIYKDSVATsSPPiqUwfGhlxoXz6QpXHlDvcCGi
	JGH7khcnkBS23pCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AECB113927;
	Tue, 15 Apr 2025 05:39:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tKUoKRfx/We1EQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 15 Apr 2025 05:39:35 +0000
Date: Tue, 15 Apr 2025 07:39:35 +0200
Message-ID: <877c3mvv8o.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org
Subject: Re: recent change in seqmid.c is broken?
In-Reply-To: <52b874c1-5e0c-4382-a0f8-b4533d332e27@perex.cz>
References: <87friawxx5.wl-tiwai@suse.de>
	<52b874c1-5e0c-4382-a0f8-b4533d332e27@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: CC0A021181
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: 4M7TQ4WRI5RSA65I5DODLZBOUE4DQWZW
X-Message-ID-Hash: 4M7TQ4WRI5RSA65I5DODLZBOUE4DQWZW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4M7TQ4WRI5RSA65I5DODLZBOUE4DQWZW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 14 Apr 2025 18:45:04 +0200,
Jaroslav Kysela wrote:
> 
> On 14. 04. 25 17:44, Takashi Iwai wrote:
> > Hi Jaroslav,
> > 
> > I'm afraid that your recent fix for alsa-lib commit a4e47461eca1
> > doesn't work as expected:
> > 
> > ```
> > @@ -664,15 +663,11 @@ static void update_group_ports(snd_seq_t *seq, snd_ump_endpoint_info_t *ep)
> >                                  break;
> >                          }
> >   -                       if (!*bp->name)
> > +                       if (bp->name[0] == '\0')
> >                                  continue;
> > -                       len = strlen(blknames);
> > -                       if (len)
> > -                               snprintf(blknames + len, sizeof(blknames) - len,
> > -                                        ", %s", bp->name);
> > -                       else
> > -                               snd_strlcpy(blknames, (const char *)bp->name,
> > -                                           sizeof(blknames));
> > +                       if (blknames[0])
> > +                               snd_strlcpy(blknames, ", ", sizeof(blknames));
> > +                       snd_strlcpy(blknames, (const char *)bp->name, sizeof(blknames));
> >                  }
> >                    if (!*blknames)
> > ```
> > 
> > The original code appended the new bp->name string with the prefix of
> > ", " if blknames is already present, but the new code looks as if it
> > overwrites onto blknames with strlcpy() from scratch for each
> > bp->name.
> > 
> > FWIW, the code there used to be with strlcat(), but it was rewritten
> > in the way above because strlcat() isn't always available in commit
> > d9694398130c.
> 
> Oops.... I am at the end of 1.2.14 release procedure.
> 
> I'm trying to put the correct fix, could you check quickly latest two commits?

Looks good to me.  Thanks!


Takashi
