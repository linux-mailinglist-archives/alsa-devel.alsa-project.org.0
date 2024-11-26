Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C0A9D9926
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Nov 2024 15:09:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F0D221A3;
	Tue, 26 Nov 2024 15:09:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F0D221A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732630189;
	bh=L8jfaL3IIivgsSHYwK0obIyod/JHy3ugOzMFp9k2J1w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qDezJFDawgoPaHesgV1ZidkayuTHjfWUG3LYOv86+2yghqE40psi9CaIFSgCHtSXS
	 dNF90qvBXAltx8PV26lTzi1BaixpZi4WzDir4ghW7QriqfTUVslDlkcd6m8ZoJd4j3
	 RDbQfLyUTSisrsuy7CPK0e+CsfScBCQrvsmFfuCA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35D26F805C5; Tue, 26 Nov 2024 15:09:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85B66F80236;
	Tue, 26 Nov 2024 15:09:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4AEB6F80496; Tue, 26 Nov 2024 15:09:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6857CF8019B
	for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2024 15:09:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6857CF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=04swAq7K;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=aetlFBmz;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=04swAq7K;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=aetlFBmz
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 20ABD1F74B;
	Tue, 26 Nov 2024 14:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1732630147;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XdFqV87bvCKF9fqbmasfDFCuSHehKZpNIZATTCyQnbw=;
	b=04swAq7K4ahkr7D8955XjtuBE8Le+xbze1GXegW6YO3GpN39WQSmrMmA8YB16sSyV0SvUd
	Wu5juCqHneimWReCvbrcIKImGuoSj+hctAat0+MrSptdgh3ZJdHYkq3VOKCvyaEs8uujSE
	Otzo7RjlxBpBA1AX6p3RhaJ1UTQMdl4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732630147;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XdFqV87bvCKF9fqbmasfDFCuSHehKZpNIZATTCyQnbw=;
	b=aetlFBmzUHiE7w0dqkAAO4+yxgc0UFhXVzpNyv/j2kIhcoR0D12E8rPwgC3E4iYKIx2rr5
	/MnOAMZR6BOsujBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1732630147;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XdFqV87bvCKF9fqbmasfDFCuSHehKZpNIZATTCyQnbw=;
	b=04swAq7K4ahkr7D8955XjtuBE8Le+xbze1GXegW6YO3GpN39WQSmrMmA8YB16sSyV0SvUd
	Wu5juCqHneimWReCvbrcIKImGuoSj+hctAat0+MrSptdgh3ZJdHYkq3VOKCvyaEs8uujSE
	Otzo7RjlxBpBA1AX6p3RhaJ1UTQMdl4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732630147;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XdFqV87bvCKF9fqbmasfDFCuSHehKZpNIZATTCyQnbw=;
	b=aetlFBmzUHiE7w0dqkAAO4+yxgc0UFhXVzpNyv/j2kIhcoR0D12E8rPwgC3E4iYKIx2rr5
	/MnOAMZR6BOsujBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 104E5139AA;
	Tue, 26 Nov 2024 14:09:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZyJNA4PWRWe/cQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 26 Nov 2024 14:09:07 +0000
Date: Tue, 26 Nov 2024 15:09:06 +0100
Message-ID: <87ed2yaxz1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: Set pcbeep to default value
In-Reply-To: <2721bb57e20a44c3826c473e933f9105@realtek.com>
References: <a76a10fc88e740f2b157375d44f167c7@realtek.com>
	<87r0731uk1.wl-tiwai@suse.de>
	<cb9caa0e01f34e3b881bad24701c741f@realtek.com>
	<87v7wbxti2.wl-tiwai@suse.de>
	<2721bb57e20a44c3826c473e933f9105@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.29 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.19)[-0.969];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: WT5HDNUCU2FE2YPPYEZLXEO6SKSCEIBQ
X-Message-ID-Hash: WT5HDNUCU2FE2YPPYEZLXEO6SKSCEIBQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WT5HDNUCU2FE2YPPYEZLXEO6SKSCEIBQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 26 Nov 2024 09:05:37 +0100,
Kailang wrote:
> 
> Sorry! Attach again.
> 
> Add ALSA: hda/realtek: to Title.

Applied now.  Thanks.


Takashi
