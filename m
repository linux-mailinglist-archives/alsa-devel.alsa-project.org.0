Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 907077BB3E0
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 11:08:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56FDC84B;
	Fri,  6 Oct 2023 11:07:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56FDC84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696583294;
	bh=Ml0CKtKtSGe4+I+DpWiPD8qB/8hzvkLAbDBN5R6kZco=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eR13Mww4vo780EmVPGCpXWZW0F/A27xj+8RpUS6BosIM3acVmy+wodpSF9euboJmX
	 cwreyw/Shkktcex/QGlTFNelVdgUOPHjhhA2N4P7t2XktIxlkry5qBnvqvzvOQmUYf
	 FI1gY5jIdkJwg3PRwvSsJ9cgHQXkw7oqZPbuvYTQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21231F80310; Fri,  6 Oct 2023 11:07:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B5034F80310;
	Fri,  6 Oct 2023 11:07:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32FFEF8047D; Fri,  6 Oct 2023 11:07:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA73EF80130
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 11:07:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA73EF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=QivChJSv;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=UHQiahYz
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5FAC41F45F;
	Fri,  6 Oct 2023 09:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1696583237;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bD8sbVGvSvFYAjwHjrWGO9qMkoH9v3/UrCG8PEtboOg=;
	b=QivChJSvJVR8LNOdOhA6MDbLOFK3wpE7D7XMJIyasGwuGu/4l26HnM//XIORawkiEB/Gow
	C0skXqh2tYQngnKOcb/L03B6npSZD+FAt1M4UX2qgdjxRWuYNK/AHG4DCvcL+5xW9466Ke
	SL6TyhFOSbgzrphv8mmuE7rtxfCHbic=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1696583237;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bD8sbVGvSvFYAjwHjrWGO9qMkoH9v3/UrCG8PEtboOg=;
	b=UHQiahYzglBAec0t79mMCcMVS9H25khzq8WOyn4Fv/tBvtjPL04D0wVfJXmhPn/Imt0fwy
	LwenhH/KPL8E6HBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 33F5A13A2E;
	Fri,  6 Oct 2023 09:07:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id jEO6C0XOH2UtLAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 06 Oct 2023 09:07:17 +0000
Date: Fri, 06 Oct 2023 11:07:16 +0200
Message-ID: <87lecgw24b.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rob Herring <robh@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: aoa: Replace asm/prom.h with explicit includes
In-Reply-To: <20231003163209.770750-1-robh@kernel.org>
References: <20231003163209.770750-1-robh@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: TLPUDUPUK2OLTULK656TBUB6PFRW65PL
X-Message-ID-Hash: TLPUDUPUK2OLTULK656TBUB6PFRW65PL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TLPUDUPUK2OLTULK656TBUB6PFRW65PL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 03 Oct 2023 18:32:02 +0200,
Rob Herring wrote:
> 
> asm/prom.h should not be included directly as it no longer contains
> anything drivers need. Drivers should include of.h and/or other headers
> which were getting implicitly included.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied now to for-next branch.  Thanks.


Takashi
