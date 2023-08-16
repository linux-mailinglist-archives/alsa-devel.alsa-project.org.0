Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C794977D9F5
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Aug 2023 07:50:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E5B9827;
	Wed, 16 Aug 2023 07:49:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E5B9827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692165007;
	bh=UL/UeYqoqy4gNkuxde2Bygr5vEqi5fbAZ3Cix5ST8E4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fsiAhe/ZdKLiwDV/N9UOc6abXHBiO5Ay3cYcBx2MF3DmmijHND+whsZ4Ra+1wReHq
	 t87jMcLfM1qRX+153FIdnxeiKSE+pCZXgj2mee+yCSVSW6ReOO9Y3xxlyJ3Npes7tc
	 TEJ/nTEZ2eRQVbLBlJmInRoF6iE8Z1NTnxHAdACI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B84CBF80290; Wed, 16 Aug 2023 07:49:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 673ACF8016A;
	Wed, 16 Aug 2023 07:49:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 400CCF8016D; Wed, 16 Aug 2023 07:47:45 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 74967F800EE
	for <alsa-devel@alsa-project.org>; Wed, 16 Aug 2023 07:47:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74967F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=fjXjgxRf;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=zehJicrX
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 11C9F21228;
	Wed, 16 Aug 2023 05:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692164859;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=79zqhi9MtPJbu5WMh9gthdv6+I1eYvwHJFYWnYiHJZM=;
	b=fjXjgxRf3TVLKjn97OZq3WL5waiflyaiHJLAURF6/in6oWllxgAfmnNzSTdwR7cE2byirM
	TW3sgHNJ+/tH28dhS+CF+4rSAmgX541vRuovvZyq1eV9BD/GMOEGrX1dCoO1n+W62XVr4G
	qjBv8CcgI/aiQqoe84SNZI0qSdATx/c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692164859;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=79zqhi9MtPJbu5WMh9gthdv6+I1eYvwHJFYWnYiHJZM=;
	b=zehJicrXQJv68xaOHvqc1H5O0pK4g7gPixW8TRg5fbQClzfr7qdNf1tI011znE46jJ70Az
	n0ybNr3EFl/55+Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E011E134B0;
	Wed, 16 Aug 2023 05:47:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id nyW1Nfpi3GT8XgAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 16 Aug 2023 05:47:38 +0000
Date: Wed, 16 Aug 2023 07:47:38 +0200
Message-ID: <877cpvy1vp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Curtis Malainey <cujomalainey@google.com>
Cc: alsa-devel@alsa-project.org,
	Curtis Malainey <cujomalainey@chromium.org>,
	Stephen Boyd <swboyd@google.com>
Subject: Re: [PATCH RFC 0/6] ALSA: Fix UAF with delayed kobj release
In-Reply-To: <878raby2fb.wl-tiwai@suse.de>
References: <20230807135207.17708-1-tiwai@suse.de>
	<CAOReqxhV=gfwNpxnEU+ruOx6gjD2BSZbYPJ6+iWzkPCidFmCBA@mail.gmail.com>
	<CAOReqxgCDdXAEyF8pt4dePQ2H_ub=hYczvO1xGpKWAt35z5B2Q@mail.gmail.com>
	<87o7jgfxgj.wl-tiwai@suse.de>
	<87sf8se471.wl-tiwai@suse.de>
	<CAOReqxjnWruX20YyUcAjwv8zLourFv4hUKGq9_1FBsXA6Fra9Q@mail.gmail.com>
	<87ttt3pdp5.wl-tiwai@suse.de>
	<CAOReqxhtcyePP+B6egNufuzM_ML3W7PVPNEENqxDfa605DoP9w@mail.gmail.com>
	<87msysxp9z.wl-tiwai@suse.de>
	<CAOReqxiq86kxj1HEmjYPUZ5gW49y2x9ZFYa8mAH1VWFAF7dEuw@mail.gmail.com>
	<878raby2fb.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: XE4LDGMXYEEJ3EGLUHL4MJLUUEKSYIT5
X-Message-ID-Hash: XE4LDGMXYEEJ3EGLUHL4MJLUUEKSYIT5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XE4LDGMXYEEJ3EGLUHL4MJLUUEKSYIT5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 16 Aug 2023 07:35:52 +0200,
Takashi Iwai wrote:
> 
> On Tue, 15 Aug 2023 23:32:31 +0200,
> Curtis Malainey wrote:
> > 
> > I still don't understand why you need the kref. The devices are
> > already reference counting, why not use them? If we split them up into
> > their own structs we could then just device_put everything on removal
> > and let it roll up the tree with releases automatically, blocking
> > where userspace is still holding references. I will share a patches
> > sometime this week of what I mean. They will probably be a bit bigger
> > blast radius but I think its what is needed here.
> 
> We want to trigger the top-level release free procedure once when all
> files are closed.  This top-level release does put_device() of all
> belonging devices.
> 
> The card_dev device refcount was used for this purpose.  OTOH, if we
> want to construct the topology of the devices until the actual
> deletion (i.e. keep card_dev until pcm and others are really
> released/deleted), the card_dev refcount will be used for managing
> the topology, too.  So, it'll get a side-effect side-effect that the
> card_dev refcount won't be zero even after all files are closed (it's
> referred from the children).
> 
> So, it's a kind of preparation for the future.

That said, the first two patches are basically independent from the
rest.  We can apply the rest changes at first for addressing the
existing UAF issues, then think of the further restructuring, too.


Takashi
