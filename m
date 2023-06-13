Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75ACA72DB18
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 09:37:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CA881EF;
	Tue, 13 Jun 2023 09:36:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CA881EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686641857;
	bh=xHt6kGMbJ3iZt2ZiML4uEdu0Iq5ALkDqc7rv8tfqGf8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=agczXQoKxuMczdMxdilDoPaF50245J+Z6CJ9SIZl/e8+GrvK2caFPVW+SbIV/ffB2
	 2ye1Xs0IhB2PNoy/Wg6qk6GwBBM5DgLj1QW4AEHnH+owxxEzIX/htF2bjCYvLFSYWh
	 1x5f26qPkujbdqyNxc03RizQHvW3vjN3o9Z4gLNs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE2BAF80544; Tue, 13 Jun 2023 09:36:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C145CF80132;
	Tue, 13 Jun 2023 09:36:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EE66F80149; Tue, 13 Jun 2023 09:36:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75163F80130
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 09:36:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75163F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=t6M9c4a9;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Hg56atq0
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5981E21F89;
	Tue, 13 Jun 2023 07:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686641796;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fARwb/FOWC2J0IiNmo1ULMamrop8hmzZFfpzdyoCU/w=;
	b=t6M9c4a9ynt2QnblBDTEeXcbL5TbH+GJaFmhsxIVUIXmfDOlDnJ7Q/BK9eU+j6Klpr+7nw
	csDs23DWMVBjkP2q0HriN8VjMonS4SY/lGRzjpWn4uv2fLmy7PXIuIGUkQXpQgFX/1fpVS
	U2aPyyvBnK0GzepwuydyZH62QPL7vKc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686641796;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fARwb/FOWC2J0IiNmo1ULMamrop8hmzZFfpzdyoCU/w=;
	b=Hg56atq0EVLED9Hh+7DNyJdiD+EQGbDEx3vKkZTa8dxznXxZ5AKI7x1NsqQReFeMA0Xd1/
	8vQemszzlpj/uIBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2B7A713345;
	Tue, 13 Jun 2023 07:36:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id hdzECYQciGQ7GAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 13 Jun 2023 07:36:36 +0000
Date: Tue, 13 Jun 2023 09:36:34 +0200
Message-ID: <877cs7g6f1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: Use maple tree register cache
In-Reply-To: <87v8fua1qm.wl-tiwai@suse.de>
References: <20230609-alsa-hda-maple-v1-1-a2b725c8b8f5@kernel.org>
	<87v8fua1qm.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: J2CFTUTOTFR3RX3IJLRETTUMMLYU2H5M
X-Message-ID-Hash: J2CFTUTOTFR3RX3IJLRETTUMMLYU2H5M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J2CFTUTOTFR3RX3IJLRETTUMMLYU2H5M/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 11 Jun 2023 09:37:21 +0200,
Takashi Iwai wrote:
> 
> On Sat, 10 Jun 2023 16:26:37 +0200,
> Mark Brown wrote:
> > 
> > HDA can only support single register read and write operations so does not
> > benefit from block writes. This means it gets no benefit from using the
> > rbtree register cache over the maple tree register cache so convert it to
> > use maple trees instead, it is more modern.
> > 
> > Signed-off-by: Mark Brown <broonie@kernel.org>
> 
> Thanks, applied to for-next branch.

Now I noticed errors like

  snd_hda_codec_realtek hdaudioC0D0: Unable to sync register 0x2f0009. -5

and it turned out that the error comes from this patch.

This is an error from regache_sync_val(), and it indicates that the
synced register is write-only; regcache_maple_sync() tries to sync all
cached values no matter whether it's writable or not, then hitting
this.

I'll submit a fix patch.


thanks,

Takashi
