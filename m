Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D281914A4F
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jun 2024 14:39:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D198982B;
	Mon, 24 Jun 2024 14:39:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D198982B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719232770;
	bh=5f271pDr1ahM5SqwJ/FdzIvWr5YTy8DEC+ubl041pkA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FKnSx+O/F8YQvIjAHeNXJKEdKAQzfzTVT65WuFtWPkb2Yodjb3lfkBJ0X9MrL2Kaz
	 yUhJqsX0c8WwCASo/yFZ9dQJSYYjiL3rcgG3EBJQwi9VMPOjAwpVUUwgcs9moeNgNU
	 RCsdMMkbzmYbqKkHZpN7qQdpVCQe1OnDHDelJYRI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DF43F805AA; Mon, 24 Jun 2024 14:38:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7471F805B1;
	Mon, 24 Jun 2024 14:38:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 860ADF8049C; Mon, 24 Jun 2024 14:38:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 302FCF80154
	for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2024 14:38:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 302FCF80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=CcfiOsim;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=90Mqj0rn;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=CcfiOsim;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=90Mqj0rn
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 444611F80B;
	Mon, 24 Jun 2024 12:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1719232725;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XbSage3HyrEVwFLtd/Vvui2tvoWIUIjXv/F2zE7Q6fM=;
	b=CcfiOsimvtVMem5AXBI8XchBHjKtHK/2Z31AG7GcElIeKJ+98O7RfCWzkCbg42vVf30QMH
	BqVRuh2YmnXYgijwdR1GET3WvLAPSXpDvxE3I7Im4Y2tn+Knw/CljYQ6AAMcwpDFUaNU/a
	1GwF1vu/185iDIVPKfqtIGRHbkxpzZ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719232725;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XbSage3HyrEVwFLtd/Vvui2tvoWIUIjXv/F2zE7Q6fM=;
	b=90Mqj0rnCZbnLYmhZNvEDKpRJIvo15yJznxe+aLPbWoxEVOOkEFcaTqVJ792LZDZdWyek2
	V/dXcDiHA9EWsoDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1719232725;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XbSage3HyrEVwFLtd/Vvui2tvoWIUIjXv/F2zE7Q6fM=;
	b=CcfiOsimvtVMem5AXBI8XchBHjKtHK/2Z31AG7GcElIeKJ+98O7RfCWzkCbg42vVf30QMH
	BqVRuh2YmnXYgijwdR1GET3WvLAPSXpDvxE3I7Im4Y2tn+Knw/CljYQ6AAMcwpDFUaNU/a
	1GwF1vu/185iDIVPKfqtIGRHbkxpzZ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719232725;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XbSage3HyrEVwFLtd/Vvui2tvoWIUIjXv/F2zE7Q6fM=;
	b=90Mqj0rnCZbnLYmhZNvEDKpRJIvo15yJznxe+aLPbWoxEVOOkEFcaTqVJ792LZDZdWyek2
	V/dXcDiHA9EWsoDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 03BD41384C;
	Mon, 24 Jun 2024 12:38:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3XVJO9RoeWasZAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 24 Jun 2024 12:38:44 +0000
Date: Mon, 24 Jun 2024 14:39:12 +0200
Message-ID: <87cyo6plan.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>,
	lars@metafoo.de,
	perex@perex.cz,
	tiwai@suse.com,
	broonie@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [RESEND PATCH] ALSA: dmaengine_pcm: terminate dmaengine before
 synchronize
In-Reply-To: 
 <CAA+D8APZ8-3NFceuQeTnEL-K4reUGGfrgyG63jyjydFA6o_4MA@mail.gmail.com>
References: <1718851218-27803-1-git-send-email-shengjiu.wang@nxp.com>
	<87frt82gj7.wl-tiwai@suse.de>
	<CAA+D8APZ8-3NFceuQeTnEL-K4reUGGfrgyG63jyjydFA6o_4MA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: 2FSKVCBQ5FLJQUKGGD3GPOVQMRVTHYBK
X-Message-ID-Hash: 2FSKVCBQ5FLJQUKGGD3GPOVQMRVTHYBK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2FSKVCBQ5FLJQUKGGD3GPOVQMRVTHYBK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 21 Jun 2024 04:21:19 +0200,
Shengjiu Wang wrote:
> 
> On Thu, Jun 20, 2024 at 3:56 PM Takashi Iwai <tiwai@suse.de> wrote:
> > But, this may need more rework, too; admittedly it imposes the
> > unnecessary resume of the stream although it shall be stopped and
> > closed immediately after that.  We may have some optimization in
> > addition.
> 
> The suspended_state is not cleared that the resume may be called again
> at the end of stream.

Right, that's the known side effect of this approach.

> Will you push the code?

I'm rethinking of this again, and I'm inclined rather to take your
patch for now.  The side-effect above would be much higher impact in
theory, so I'm not quite sure whether the behavior is acceptable.

Basically, a missing piece is the shortcut state change from SUSPENDED
to CLOSED.  Most drivers don't care as the SUSPENDED state is almost
equivalent with STOPPED state, and they don't support RESUME (hence
the application needs to re-initialize via PREPARE).  But a case like
dmaengine, there can be inconsistency as you pointed out.

By putting snd_pcm_resume() at the beginning of close procedure like
my patch, the state change itself is corrected.  However, it imposes
unnecessary resume, which should be avoided.

Ultimately, we may need some flag or conditional trigger for clearing
this pending SUSPENDED state.  But it needs further consideration.


thanks,

Takashi
