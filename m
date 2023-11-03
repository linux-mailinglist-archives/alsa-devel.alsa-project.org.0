Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A797E041D
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Nov 2023 14:59:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13C9A7F1;
	Fri,  3 Nov 2023 14:58:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13C9A7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699019971;
	bh=UGQRzc6WyuTLeBuEB23NAelDjKx4UL4j3VQh3SGZv3s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DtmZHlkonUzpSgiNrkbYT37ZHVy3heJ3M5KoeGjU5+Unk2VFwjfz+QDqkBcvYMaZi
	 qefaNfuffkDOLB3ZfZjoQZfcfS2hAhTtWGdob+JWfZGUmFdvqzzwbMr5VZL4Oa461D
	 +gdGUTyHzg9qCOM8WjhsJuaxby23PsV9lEj4f4iQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A11FF80558; Fri,  3 Nov 2023 14:58:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4409F8020D;
	Fri,  3 Nov 2023 14:58:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF4E2F80290; Fri,  3 Nov 2023 14:58:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ABC15F8016D
	for <alsa-devel@alsa-project.org>; Fri,  3 Nov 2023 14:58:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABC15F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=lV0X33It;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=eSm4LnF/
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C63CD218E4;
	Fri,  3 Nov 2023 13:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1699019902;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IWvTVIfzxqo7HC5kMHZmahlO81FTRnR1EO1pSWh2HWI=;
	b=lV0X33ItHYWgx2s1cdyTsX3ovLD3s0j/gAgBo0SRXtgLyXPmyJ8bgmFaX2+CEIi9gvpKGF
	y8X5+U2SPW6IlMI3tzRgPDQccA1OD6HF+yNTUpy5e4GO+P/sjJO33QFos6ewfw6wmZRYq6
	C6b76s86sfOi+LOmLy3C7ebPiMwgKlg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1699019902;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IWvTVIfzxqo7HC5kMHZmahlO81FTRnR1EO1pSWh2HWI=;
	b=eSm4LnF/Yb28DDXkRgfVjeroL3KdzJBI2EUif/G0jQeYG62Ug8TL4l+f9DtzPDZwKQ0iRJ
	k9LTlkqjOpy7UVCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 97CB213907;
	Fri,  3 Nov 2023 13:58:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id RIsqJH78RGVlBQAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 03 Nov 2023 13:58:22 +0000
Date: Fri, 03 Nov 2023 14:58:22 +0100
Message-ID: <87pm0rszup.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Dave Airlie <airlied@redhat.com>
Subject: Re: [PATCH] sound/isa/wavefront: copy userspace array safely
In-Reply-To: <20231102190309.50891-2-pstanner@redhat.com>
References: <20231102190309.50891-2-pstanner@redhat.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 2T5MAIU2WYKPH4JM2FDHZQ3WLMTDEIAO
X-Message-ID-Hash: 2T5MAIU2WYKPH4JM2FDHZQ3WLMTDEIAO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2T5MAIU2WYKPH4JM2FDHZQ3WLMTDEIAO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 02 Nov 2023 20:03:10 +0100,
Philipp Stanner wrote:
> 
> wavefront_fx.c utilizes memdup_user() to copy a userspace array. This
> does not check for an overflow.

There is a check above the memdup_user() call; it's at most 512
bytes.

> Use the new wrapper memdup_array_user() to copy the array more safely.
> 
> Suggested-by: Dave Airlie <airlied@redhat.com>
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>

Although the check is already present, it's still better to use the
new helper, so I applied the patch now.


thanks,

Takashi
