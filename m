Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EB8893AB4
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 13:47:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 307DC2318;
	Mon,  1 Apr 2024 13:46:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 307DC2318
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711972015;
	bh=JG56/VIF7nGSXyF1vticRoP+S1Ia0KpEMyEjcYayir4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JLHpekyibr1a+uDbNvlUrYSWkektWHUizc8bYQqVX7smjfdCtM13F8LqxtCYtwp0n
	 +BC08SXgx4+vF2PHLZ3Y+HBMaZRNI0zbn1NycOHTr6PFJS96Tk5OzczuRra/EOFXR0
	 QVDiz+uBHPPuuTqrtZDEs/hLcRGy45PpYi6DUA6g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70B2DF80589; Mon,  1 Apr 2024 13:46:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1383F8057A;
	Mon,  1 Apr 2024 13:46:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1192FF80236; Mon,  1 Apr 2024 13:46:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4964DF8016E
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 13:46:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4964DF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=AnynoRy3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=emZn3LsR
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 54E6933992;
	Mon,  1 Apr 2024 11:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1711971976;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c/P9D0zj3SgS39zJWbyWM8/mrl9HetiZgtzn9wzpvvk=;
	b=AnynoRy3a17VuykeWkCG3+Q/SG2ksAIzNMEaIT5KyyHPOkT19/NONsI95DpAMgetatjZ1I
	QpGBu3e1ZEsJdQI1Af/88PWKclVSyVLt2B6HB0PCLAEwEQYOI+QXZxDurnDhSDhPczhy2k
	QemTgvdnYIoRGYPloQVDm3xszK+SXOE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1711971976;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c/P9D0zj3SgS39zJWbyWM8/mrl9HetiZgtzn9wzpvvk=;
	b=emZn3LsRluDkiyBwB4ZXqXCqSlgT41Tka+MhZYdwySB5RcH0cVxq99trSLs1NXvxJXzhRu
	obywrhO46zd94LAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 1671D139BE;
	Mon,  1 Apr 2024 11:46:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id uin4A4ieCmY5EAAAn2gu4w
	(envelope-from <tiwai@suse.de>); Mon, 01 Apr 2024 11:46:16 +0000
Date: Mon, 01 Apr 2024 13:46:20 +0200
Message-ID: <87sf05e25v.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: <broonie@kernel.org>,
	<tiwai@suse.com>,
	<linux-sound@vger.kernel.org>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH 0/5] ALSA: cirrus: Tidy up of firmware control read/write
In-Reply-To: <41d1aad9-2381-4d7b-b247-9d114c5c517f@opensource.cirrus.com>
References: <20240325113127.112783-1-rf@opensource.cirrus.com>
	<87o7awnmdd.wl-tiwai@suse.de>
	<41d1aad9-2381-4d7b-b247-9d114c5c517f@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 54E6933992
X-Spamd-Result: default: False [-1.05 / 50.00];
	BAYES_HAM(-1.74)[93.45%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	R_DKIM_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
Message-ID-Hash: OPGAJDYG3O5KHFTJWLMQKWYXHYSHX5UW
X-Message-ID-Hash: OPGAJDYG3O5KHFTJWLMQKWYXHYSHX5UW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OPGAJDYG3O5KHFTJWLMQKWYXHYSHX5UW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 01 Apr 2024 11:32:49 +0200,
Richard Fitzgerald wrote:
> 
> On 30/03/2024 08:40, Takashi Iwai wrote:
> > On Mon, 25 Mar 2024 12:31:22 +0100,
> > Richard Fitzgerald wrote:
> >> 
> >> This set of patches factors out some repeated code to clean up
> >> firmware control read/write functions, and removes some redundant
> >> control notification code.
> >> 
> >> Simon Trimmer (5):
> >>    firmware: cs_dsp: Add locked wrappers for coeff read and write
> >>    ASoC: wm_adsp: Use cs_dsp_coeff_lock_and_[read|write]_ctrl()
> >>    ALSA: hda: hda_cs_dsp_ctl: Use
> >>      cs_dsp_coeff_lock_and_[read|write]_ctrl()
> >>    ASoC: wm_adsp: Remove notification of driver write
> >>    ALSA: hda: hda_cs_dsp_ctl: Remove notification of driver write
> > 
> > The patch 4 doesn't look cleanly applicable to my tree.
> > Should it be applied via Mark's tree?
> > 
> 
> Yes, it will need to go through Mark's tree.
> Mark's for-next has one extra patch to wm_adsp.c that changes
> the same function:
> 
> f193957b0fbb ("ASoC: wm_adsp: Fix missing mutex_lock in
> wm_adsp_write_ctl()")

OK, then it should go via Mark's tree.
Feel free to take my ack:

Reviewed-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi
