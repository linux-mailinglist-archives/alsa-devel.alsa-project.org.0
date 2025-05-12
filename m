Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0E4AB7F02
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 09:40:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1368604CE;
	Thu, 15 May 2025 09:33:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1368604CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747294397;
	bh=+o6yR/P2xYE8Li6Iox3E0PAeKRKfR5KLkStd/n5YwUs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZgqlpxpfyCrxtKuBdwhOG8kTapn+ZHoum6PeCsPz56FmkhtHdZOCPEsNiELwMZY/i
	 WEv2REspugSHcW2+AENqVKtBci0CQA1iphyQPaAeEcpjkiQde0NcOIJkiRFzHMdM/n
	 LAKXYyxpS8HsisSYuxMhkMqDbyqbp/+mHX2su/kM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85FF6F89A33; Mon, 12 May 2025 17:07:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67191F89A2F;
	Mon, 12 May 2025 17:07:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D56ECF89A1C; Mon, 12 May 2025 17:07:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 158A6F80805
	for <alsa-devel@alsa-project.org>; Mon, 12 May 2025 17:07:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 158A6F80805
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=i7cyqOkh;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=WNkMv1T/;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=i7cyqOkh;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=WNkMv1T/
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7835D1F790;
	Mon, 12 May 2025 15:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1747062420;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BvTm2OOd5aLCAsrYpKV5YaeMP78ew2u5mUF8tbcsfYc=;
	b=i7cyqOkhOKnqoVLN23e+UKeTk79Olz47K/c6bcYel5nmuAbM/sbnee1/cBQT/erXt023Ks
	DG9OZ3uuelGqP/2Z6jsHTPug2wXeu4Vu92e1FEqIkOvWQ+agFetL4lCudBmhyvlow+0z0D
	JBvpB9hI3HRUpUQYwxBFDAo1oTn7Wf4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747062420;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BvTm2OOd5aLCAsrYpKV5YaeMP78ew2u5mUF8tbcsfYc=;
	b=WNkMv1T/bnvLpXYMG1ZH0Y32vNRepkSYmqQ70EpE9Fvvf+wdOuWKiNTTeYUmGIzPRNzxyx
	+k8jZ/t2CVkXYKCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=i7cyqOkh;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="WNkMv1T/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1747062420;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BvTm2OOd5aLCAsrYpKV5YaeMP78ew2u5mUF8tbcsfYc=;
	b=i7cyqOkhOKnqoVLN23e+UKeTk79Olz47K/c6bcYel5nmuAbM/sbnee1/cBQT/erXt023Ks
	DG9OZ3uuelGqP/2Z6jsHTPug2wXeu4Vu92e1FEqIkOvWQ+agFetL4lCudBmhyvlow+0z0D
	JBvpB9hI3HRUpUQYwxBFDAo1oTn7Wf4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747062420;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BvTm2OOd5aLCAsrYpKV5YaeMP78ew2u5mUF8tbcsfYc=;
	b=WNkMv1T/bnvLpXYMG1ZH0Y32vNRepkSYmqQ70EpE9Fvvf+wdOuWKiNTTeYUmGIzPRNzxyx
	+k8jZ/t2CVkXYKCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3FF2A137D2;
	Mon, 12 May 2025 15:07:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id o1lmDpQOImj9SQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 12 May 2025 15:07:00 +0000
Date: Mon, 12 May 2025 17:06:59 +0200
Message-ID: <87o6vxuauk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "kailang@realtek.com" <kailang@realtek.com>
Cc: Ruslan Nikolaev <nruslan_devel@yahoo.com>,
    "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"sashal@kernel.org" <sashal@kernel.org>,
	"perex@perex.cz" <perex@perex.cz>
Subject: Re: Fwd: [Bug 220109] New: Audio disappears on HP 15-fc000 after warm
 boot again (ALC256 code path)
In-Reply-To: <1064773772.509063.1747061777318@mail.yahoo.com>
References: <1064773772.509063.1747061777318.ref@mail.yahoo.com>
	<1064773772.509063.1747061777318@mail.yahoo.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 7835D1F790
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[yahoo.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[yahoo.com,lists.linux.dev,suse.com,alsa-project.org,kernel.org,perex.cz];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
Message-ID-Hash: RVT4QNRWPLABD6DJZ6BDTLB4JHLSXSFN
X-Message-ID-Hash: RVT4QNRWPLABD6DJZ6BDTLB4JHLSXSFN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RVT4QNRWPLABD6DJZ6BDTLB4JHLSXSFN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 12 May 2025 16:56:17 +0200,
Ruslan Nikolaev wrote:
> 
> Hi,
> 
> Forwarding my regression bug report for HP 15-fc000 / ALC236 (ALC256 code path).
> 
> #regzbot introduced: v6.12.2
> https://bugzilla.kernel.org/show_bug.cgi?id=220109
> 
> Sincerely,
> Ruslan
> 
> Forwarded Message (see logs in the bug report above):
> 
> There was a similar bug in the past (Bug 217440), which was fixed for this laptop. (I believe the code path is for ALC256, see below.) The same issue is occurring again as of kernel v.6.12.2. The symptoms are very similar - initially audio works but after a warm reboot, the audio completely disappears until the computer is powered off (there is no audio output at all).
> 
> The issue is caused by a different change now. By bisecting different kernel versions, I found that reverting cc3d0b5dd989d3238d456f9fd385946379a9c13d in patch_realtek.c ( see https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/sound/pci/hda/patch_realtek.c?h=v6.12.2&id=4ed7f16070a8475c088ff423b2eb11ba15eb89b6 ) restores the sound and it works fine after the reboot.

It's the commit cc3d0b5dd989d3238d456f9fd385946379a9c13d
Author: Kailang Yang <kailang@realtek.com>
Date:   Thu Nov 14 15:21:09 2024 +0800

    ALSA: hda/realtek: Update ALC256 depop procedure
    
    Old procedure has a chance to meet Headphone no output.
    
    Fixes: 4a219ef8f370 ("ALSA: hda/realtek - Add ALC256 HP depop function")
    Signed-off-by: Kailang Yang <kailang@realtek.com>
    Link: https://lore.kernel.org/463c5f93715d4714967041a0a8cec28e@realtek.com
    Signed-off-by: Takashi Iwai <tiwai@suse.de>

and it modified alc256_init() sequence.

Kailang, could you check this regression?


And, Ruslan, it's the case without the headphone, right?
Is the sound still lost when you connect the headphone and apply the
same procedure?


thanks,

Takashi
