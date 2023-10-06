Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E757BB3F9
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 11:10:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4FA6828;
	Fri,  6 Oct 2023 11:09:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4FA6828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696583415;
	bh=3MBA6DKrepq8JGGJE87jd/eRbL+4986IKCyAX6J/AQo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ughI+DEb2g24tzB7QlZmxwdYE734jPp46i8MbnrBf9NYCUfKiJDxWyDR7+wrrKcz4
	 Hu4aRESKmDQT84LnSqL5D2d/bt+ndVDS4kkCwdO3Zx4p+4JRyPK5o6eN27HMFOmOYD
	 DirSFHzxDu4q/YwMd7CkEiFQJ3JNIuw06q1W2IDk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99B66F80552; Fri,  6 Oct 2023 11:09:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 636B2F80310;
	Fri,  6 Oct 2023 11:09:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C80FF8047D; Fri,  6 Oct 2023 11:09:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D1927F80130
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 11:09:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1927F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=DsMx2hfe;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=iKHtbM4o
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 71E2921866;
	Fri,  6 Oct 2023 09:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1696583357;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hfDu0Tnvszk5ryBuBvQFAZ33piyiVEia7Kh3a6jecqA=;
	b=DsMx2hfeaV+WKX+xP88bYYvJMh/a1OS9rZSXxWzPhtSlabPjpIU0CBODQmftCesaixPzzY
	bphBAehanNIWqd+YTeKFeWj9As9dCc3xSELtTMFIaOSc39aXqC3ksl35pMUnXxRG11Thq2
	yU+EO106vu04YvnlNwwwJIKhreKzu1A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1696583357;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hfDu0Tnvszk5ryBuBvQFAZ33piyiVEia7Kh3a6jecqA=;
	b=iKHtbM4oDqe0uxR1jLpPoQ6ozKzqsVrAT5aEzs1YdEU2qs2ZMSfefDeYteYQgdHMjPhOY4
	3baMRQAn2Oqic6Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0B82813586;
	Fri,  6 Oct 2023 09:09:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id NxncAb3OH2VZLQAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 06 Oct 2023 09:09:17 +0000
Date: Fri, 06 Oct 2023 11:09:16 +0200
Message-ID: <87jzs0w20z.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Whale Chang <whalechang@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Ai Chao <aichao@kylinos.cn>,
	Jaroslav Kysela <perex@perex.cz>,
	John Keeping <john@keeping.me.uk>,
	Jussi Laako <jussi@sonarnerd.net>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: usb-audio: Fix microphone sound on Opencomm2
 Headset
In-Reply-To: <20231006044852.4181022-1-whalechang@google.com>
References: <20231006044852.4181022-1-whalechang@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: ERQJ275ZDBNIEIWPWJPZJT5PF22VUNVC
X-Message-ID-Hash: ERQJ275ZDBNIEIWPWJPZJT5PF22VUNVC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ERQJ275ZDBNIEIWPWJPZJT5PF22VUNVC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 06 Oct 2023 06:48:49 +0200,
Whale Chang wrote:
> 
> From: WhaleChang <whalechang@google.com>
> 
> When a Opencomm2 Headset is connected to a Bluetooth USB dongle,
> the audio playback functions properly, but the microphone does not work.
> 
> In the dmesg logs, there are messages indicating that the init_pitch
> function fails when the capture process begins.
> 
> The microphone only functions when the ep pitch control is not set.
> 
> Toggling the pitch control off bypasses the init_piatch function
> and allows the microphone to work.
> 
> Signed-off-by: WhaleChang <whalechang@google.com>

Thanks, applied now.


Takashi
