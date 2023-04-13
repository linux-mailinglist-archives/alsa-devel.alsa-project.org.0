Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A83106E067F
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Apr 2023 07:43:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D3ACF2A;
	Thu, 13 Apr 2023 07:42:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D3ACF2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681364589;
	bh=cjgz3HhK4M5QsV790gY6/KNWfTAgMVB596rKfNeh+k0=;
	h=Date:From:To:Subject:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l28z4/Fsmmqj/HBY7B/ZUPk2ySYadQKDymYhl2pd+Tr6w8+oUA8H7YvfcI3Q3dtUb
	 NLXujcoGqfJbhydgHytW2HPQcEwtk3Us7DuZ5RlFmQNKM0FZIPptKhF+WnJbUWCy2U
	 phETQHswQyoNit/yeaeqNrFRyxdZJh8+tsVd/NRQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02115F8025E;
	Thu, 13 Apr 2023 07:42:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 632D5F8032B; Thu, 13 Apr 2023 07:42:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A317F80100
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 07:42:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A317F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=llG+iTio;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=VoO2TMYH
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9DA1B1FD66;
	Thu, 13 Apr 2023 05:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1681364527;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q+zNMKfO3GHSJRk0FDLSjnxPzs6ia61jUFS5WhbaGfY=;
	b=llG+iTiouUzKB1GCiFIek3FyA5y7c3D7b0I5ApaunkFpYbh/7LSj35I8oiiktSdhAHymUa
	VSNmuNjBzxrK3e6huGofpoDXaczacsDDl9Vf8p3ht5Tm8NrTxhoNxAsOlhaYAGaCH6DLZn
	6OJOtFaY+OUpzdgG6y5JTNC/pMeJcGU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681364527;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q+zNMKfO3GHSJRk0FDLSjnxPzs6ia61jUFS5WhbaGfY=;
	b=VoO2TMYHIF35Cp7F4FSX4+gMWgoJCfxYfTBwSVIPDt30F6OZSlpld2Ro7vxI/WVoqwhayR
	Itq7mTqEqPP8R0DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7D6B9138E3;
	Thu, 13 Apr 2023 05:42:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id tj5VHS+WN2SCUQAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 13 Apr 2023 05:42:07 +0000
Date: Thu, 13 Apr 2023 07:42:06 +0200
Message-ID: <871qkoxrrl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 2/2] ALSA: pcm: auto-fill buffer with silence when
 draining playback
In-Reply-To: <54c16616-dee7-b50f-d612-82eef906d1df@perex.cz>
References: <20230405201219.2197789-1-oswald.buddenhagen@gmx.de>
	<20230405201219.2197789-2-oswald.buddenhagen@gmx.de>
	<3d75c103-7e94-e6a1-7f3d-7f957c33cddc@perex.cz>
	<ZDEWyjdVE2IocpGY@ugly>
	<22f551f3-deae-1536-bd07-0b9340940ea4@perex.cz>
	<ZDVnUj2B0EkMiOlA@ugly>
	<6d6c5f3a-81bc-acf4-eb4d-229b581bbe8b@perex.cz>
	<ZDWPy9YbXWWOqaC+@ugly>
	<7b317956-deb1-0a75-0a34-f82d6a81cf90@perex.cz>
	<87ttxl7cxd.wl-tiwai@suse.de>
	<ZDZmDyOMYMD4Uu5g@ugly>
	<87wn2ho06z.wl-tiwai@suse.de>
	<54c16616-dee7-b50f-d612-82eef906d1df@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: L7E6TL6XCFWIJHDYRABGXMF2CBVGOJ22
X-Message-ID-Hash: L7E6TL6XCFWIJHDYRABGXMF2CBVGOJ22
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: ALSA development <alsa-devel@alsa-project.org>,
 Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L7E6TL6XCFWIJHDYRABGXMF2CBVGOJ22/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 12 Apr 2023 21:59:28 +0200,
Jaroslav Kysela wrote:
> 
> On 12. 04. 23 12:37, Takashi Iwai wrote:
> > On Wed, 12 Apr 2023 10:04:31 +0200,
> > Oswald Buddenhagen wrote:
> >> 
> >> On Wed, Apr 12, 2023 at 09:54:54AM +0200, Takashi Iwai wrote:
> >>> I'm thinking whether we need to change anything in the kernel side for
> >>> this at all.  Can't it be changed rather in alsa-lib side instead?
> >>> 
> >> it could, but it would be a lot uglier. user space would have to do a
> >> "man-in-the-middle attack" on the data, while in the kernel we can
> >> just slightly modify the consumer. this would be particularly obvious
> >> in the case of write() access.
> > 
> > But basically it'd be like fiddling sw_params temporarily for
> > draining, I suppose?  And the "attack" here can be taken too
> > seriously; the whole PCM operation can be somehow interfered if a
> > process may have the access to the PCM device, and changing sw_params
> > itself must not introduce too much trouble.
> 
> This looks like a sane proposal, but some drivers does not require the
> silencing at all, so we can probably skip this step for them (new
> SNDRV_PCM_INFO_PERFECT_DRAIN flag?).

Sure, we should apply it only conditionally.  Also, we may skip the
workaround for applications accessing directly via mmap as default.
Also we may provide a flag in asoundrc config, if any, too.
The implementation in alsa-lib is more flexible in this regard.

> The other not-yet-discussed option is to just print an warning in
> alsa-lib that the residue samples may be played (when no silencing /
> period size align is used). Then introduce a new helper function to
> setup silencing for the drivers without new
> SNDRV_PCM_INFO_PERFECT_DRAIN flag set.

Hm, I don't think this would be useful.  Spewing warnings are rather
annoying or confusing for end users, and I bet the old applications
wouldn't be fixed even with such annoyance.


thanks,

Takashi
