Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9809F70B5D8
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 09:06:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9ECB083E;
	Mon, 22 May 2023 09:05:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9ECB083E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684739172;
	bh=UItKLKHgM89xl87cs44Lu61NwpXMwtkkkndT7gH52iA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l2WndXVkl/6hbP3f/enKidddRm1tdgxgeRuM5DdQBGUI/lbHDZQ2QjaEcCI7tJvsI
	 b0A2WassbllMJ9EmePuNr6YTz2bNUX+FmPnUPIoOPHy/JtEOkztZeXwLl7pYrYvNHn
	 9Abutth0gEHd4xAcrc3kHcZTGkOKhcfuIlj0Gq8Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3293FF80549; Mon, 22 May 2023 09:04:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 828FBF80549;
	Mon, 22 May 2023 09:04:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62681F80551; Mon, 22 May 2023 09:04:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D66E1F8053D
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 09:04:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D66E1F8053D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=m8mFh7rV;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=wKJi2w6Q
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4FBFB1FDAF;
	Mon, 22 May 2023 07:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684739089;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HzP08yr2STd9M3i/4e8AImcadwOtNga9ZNeKAGeZpKc=;
	b=m8mFh7rVX4O89tnz4v1FBjk2hbnTNkquLHR01TZS8vDEYDAPjJSkNwr9mFYVJZCLYK1A7A
	FmJP87NdWNQrzjUgZSsBA1o18pnPj2SEvomlIBEnkc01l6Vw2RyPXYIlbCeo1xzMxFFUPb
	gN1/fsQvpxgK4VvGErxrXjEMaO0Og54=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684739089;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HzP08yr2STd9M3i/4e8AImcadwOtNga9ZNeKAGeZpKc=;
	b=wKJi2w6Q7o7KVjOKwpqQ3mMlV5a0p7aSIYEx7YH6RCz11vPcxWBtqlstlPTJVtaXutTYd2
	BvBqMvW+viB3ENDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3393B13336;
	Mon, 22 May 2023 07:04:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 3t6fCxEUa2SGJgAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 22 May 2023 07:04:49 +0000
Date: Mon, 22 May 2023 09:04:48 +0200
Message-ID: <87pm6syhgv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH 04/36] ALSA: rawmidi: Skip UMP devices at
 SNDRV_CTL_IOCTL_RAWMIDI_NEXT_DEVICE
In-Reply-To: <13f9ddd3-6720-3c77-8bd9-7b21c1fb2d22@perex.cz>
References: <20230519093114.28813-1-tiwai@suse.de>
	<20230519093114.28813-5-tiwai@suse.de>
	<13f9ddd3-6720-3c77-8bd9-7b21c1fb2d22@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: SJSMQMYSL4AFOI4GXS3EECVLLTU5J2KS
X-Message-ID-Hash: SJSMQMYSL4AFOI4GXS3EECVLLTU5J2KS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SJSMQMYSL4AFOI4GXS3EECVLLTU5J2KS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 22 May 2023 08:36:16 +0200,
Jaroslav Kysela wrote:
> 
> On 19. 05. 23 11:30, Takashi Iwai wrote:
> > Applications may look for rawmidi devices with the ioctl
> > SNDRV_CTL_IOCTL_RAWMIDI_NEXT_DEVICE.  Returning a UMP device from this
> > ioctl may confuse the existing applications that support only the
> > legacy rawmidi.
> > 
> > This patch changes the code to skip the UMP devices from the lookup
> > for avoiding the confusion, and introduces a new ioctl to look for the
> > UMP devices instead.
> 
> Missing bump of the control API protocol version ?

Yes, I'll add it in v2.

> 
> Otherwise:
> 
> Reviewed-by: Jaroslav Kysela <perex@perex.cz>


thanks,

Takashi
