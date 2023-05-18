Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8E57083F4
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 16:33:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6781F208;
	Thu, 18 May 2023 16:32:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6781F208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684420399;
	bh=iOQ3zP5brrlcW9MrUg7bOyShvCqG5pFz12OwjGWv0wA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i1vz364pM3uZ+ONOZ9gqTbz0gYCu9tFSNOygMFLgzgK2yh/+uYKubE36fVtc7Ko/6
	 C/5GgNfQNfb1KB2e611Ju7iMG0De74/wXiSXthaXZfPkS/z/sUA8niua49tzQ7b9w5
	 LKkHytzKM7uipv8IPFOghA5BJ+AohGbJ5da/boX4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95BE3F8016A; Thu, 18 May 2023 16:32:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1611F80272;
	Thu, 18 May 2023 16:32:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3ABECF802E8; Thu, 18 May 2023 16:32:01 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 35F5AF8016A
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 16:31:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35F5AF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Aler/rDn;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ddjIXrX3
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A9A7B22235;
	Thu, 18 May 2023 14:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684420313;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+vp85ppHBjvgs13g9iFXFd7MECAHieQCAHCOCBIubH4=;
	b=Aler/rDn6umpJuIDfCLwwHeyJY6AyvlTO+HTULdNMaMwFF5l5rdMwaWmHoF6/v4xxEksBp
	oI/dGbFMdVSmY8537yHsQAPF0OnZkJxSkd0QjqcU3uijG3PyoxunKOcpBJeXti0H5M3NA4
	0bWcRZeZjbpuKlshfUpTMwnUaDayOS8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684420313;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+vp85ppHBjvgs13g9iFXFd7MECAHieQCAHCOCBIubH4=;
	b=ddjIXrX3wYb4edgrQbfa4UjLrFeTkydda9E18wkLexWalP2LLdFa6qFj1Y8JbOYZbA3DH7
	Bu9ZIyP/ev9RzCBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 10DFE138F5;
	Thu, 18 May 2023 14:31:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id uqgOAdk2ZmQEXQAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 18 May 2023 14:31:53 +0000
Date: Thu, 18 May 2023 16:31:46 +0200
Message-ID: <87wn15hfsd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: Tom Rix <trix@redhat.com>,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: emu10k1: set variables emu1010_routing_info and
 emu1010_pads_info storage-class-specifier to static
In-Reply-To: <ZGYvG2Sf9ZeeOmL6@ugly>
References: <20230518123826.925752-1-trix@redhat.com>
	<ZGYvG2Sf9ZeeOmL6@ugly>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: HXABS4JP354W3XGWSCXRA6ZOHZLVLAJP
X-Message-ID-Hash: HXABS4JP354W3XGWSCXRA6ZOHZLVLAJP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HXABS4JP354W3XGWSCXRA6ZOHZLVLAJP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 18 May 2023 15:58:51 +0200,
Oswald Buddenhagen wrote:
> 
> On Thu, May 18, 2023 at 08:38:26AM -0400, Tom Rix wrote:
> > smatch reports
>  ^^^^^^ is this the best word to use here?

Note that smatch is a name of a static analysis tool :)

> > sound/pci/emu10k1/emumixer.c:519:39: warning: symbol
> >  'emu1010_routing_info' was not declared. Should it be static?
> > sound/pci/emu10k1/emumixer.c:859:36: warning: symbol
> >  'emu1010_pads_info' was not declared. Should it be static?
> > 
> > These variables are only used in their defining file, so it should be static
> 							  ^^ they
> > 
> > Signed-off-by: Tom Rix <trix@redhat.com>
> > 
> Reviewed-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
> 
> (also amending one of the still pending patches. thanks!)

Applied the patch now, thanks.


Takashi
