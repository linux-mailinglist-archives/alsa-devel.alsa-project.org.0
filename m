Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1516A6DF217
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Apr 2023 12:38:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7214310CF;
	Wed, 12 Apr 2023 12:38:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7214310CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681295937;
	bh=K7z0m/uGXWIExlxp9kQ1rn+uTqo+41hh1mPPSNnQYLA=;
	h=Date:From:To:Subject:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p7mencQhOCTH0Q9ZyaDDwn5KU8hDZos2edfIKLXr+FbqwjLGXwi2KWbIiztbPLQc0
	 xgXwXzUSJdgXxmJKVJ90keV0Hy8T9usaRmUvJAO3pNLiL4aNQuMsAixqGvKdNAPAK0
	 2hsOL5Op57jUtNthyTF37+kIKPOQxLwe+J9SVDsI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7614F8025E;
	Wed, 12 Apr 2023 12:38:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2FF9F8032B; Wed, 12 Apr 2023 12:38:03 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E655DF800E5
	for <alsa-devel@alsa-project.org>; Wed, 12 Apr 2023 12:37:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E655DF800E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=mHS1fokY;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Iop0UzPX
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 023021F890;
	Wed, 12 Apr 2023 10:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1681295878;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gs8Y5P+Jw69iw00dN18P1cyRdBJ6IoLQtoEhIdbPoc8=;
	b=mHS1fokYPXDnlwSc508r25TDzHmN/8vX5dq7r/LdRk4ai6ZnCv3139IIwXP0y/WnVs6jZW
	bmwKpRGnQ5r7ewN4evoUesuG8icqzlLDqghg5gd0QyZGUyhJg4SH7aalRll6nwJSpnvxn8
	pH+AeGd6ragNsdSSVQm3eZLfKoxy9nc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1681295878;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gs8Y5P+Jw69iw00dN18P1cyRdBJ6IoLQtoEhIdbPoc8=;
	b=Iop0UzPXtyQdPqb4U3PO0YVG7qGMTc8u256+kl4AnLm5vNT6xwNLTB/kiMdVsOx14GtvWu
	DCl1v+V3YAXK8aBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E6C5D132C7;
	Wed, 12 Apr 2023 10:37:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id DuK3NwWKNmTtHgAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 12 Apr 2023 10:37:57 +0000
Date: Wed, 12 Apr 2023 12:37:56 +0200
Message-ID: <87wn2ho06z.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Subject: Re: [PATCH 2/2] ALSA: pcm: auto-fill buffer with silence when
 draining playback
In-Reply-To: <ZDZmDyOMYMD4Uu5g@ugly>
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
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: QRYPNQHUI7MVX6XIQOY55R2PFHITHUNP
X-Message-ID-Hash: QRYPNQHUI7MVX6XIQOY55R2PFHITHUNP
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QRYPNQHUI7MVX6XIQOY55R2PFHITHUNP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 12 Apr 2023 10:04:31 +0200,
Oswald Buddenhagen wrote:
> 
> On Wed, Apr 12, 2023 at 09:54:54AM +0200, Takashi Iwai wrote:
> > I'm thinking whether we need to change anything in the kernel side for
> > this at all.  Can't it be changed rather in alsa-lib side instead?
> > 
> it could, but it would be a lot uglier. user space would have to do a
> "man-in-the-middle attack" on the data, while in the kernel we can
> just slightly modify the consumer. this would be particularly obvious
> in the case of write() access.

But basically it'd be like fiddling sw_params temporarily for
draining, I suppose?  And the "attack" here can be taken too
seriously; the whole PCM operation can be somehow interfered if a
process may have the access to the PCM device, and changing sw_params
itself must not introduce too much trouble.


thanks,

Takashi
