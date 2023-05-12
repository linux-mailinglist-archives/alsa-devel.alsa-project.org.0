Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 649DC700267
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 10:20:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EC791DF;
	Fri, 12 May 2023 10:19:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EC791DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683879612;
	bh=gsxIknhruh4OfwGk39OcgGUAMGa0Zfu1HUlFnPiexmo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nPTBTOrhxV7BdohB2CJJvYm+pH7a6uZrXc5iaSgXbB8iw1nF+Nr8nVYmF4/dLWXOf
	 ViXMV2DO5dmuZLTCQmwZhTKdE+G4wLYARjnjmqbXE0PY2E/ceRF9iWvaH4I4so1r7l
	 D2G9iJnE8RHxAJju14XIraptB4oZkniaOh9iVRfE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 570D2F8032D; Fri, 12 May 2023 10:19:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EF524F8032D;
	Fri, 12 May 2023 10:19:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70B19F8052E; Fri, 12 May 2023 10:18:58 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9BE08F80087
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 10:18:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BE08F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=KuhOTEmA;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=GkmGUlMA
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1C6F020413;
	Fri, 12 May 2023 08:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1683879535;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pHVVEhj71TC5ei0Y7OES5Dbgca5o5EL3xb2/itYcJ0Y=;
	b=KuhOTEmAL4pz5kmY8i0dgeAn/rR9lsUkJRLIwH7Z+xh6Cst0lh9J071NEpB6OT8kASJubS
	/fslgokY1Z9XkE3bVTSVTMlK0jbb4+D9FwYfBoFQ61Gz34bPWn/ED054hxuRnSTYIudPC5
	Xdm2mFse4BgoxYwEDvm87+xfPxZ1bOY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683879535;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pHVVEhj71TC5ei0Y7OES5Dbgca5o5EL3xb2/itYcJ0Y=;
	b=GkmGUlMAOQpLCF5jriMdUR0ztxRyVPlblX6Wsfh0YPl3BEijFIyDqug5qwTPwHQrnD8gx6
	o+R7lduFXbQy6RAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E21BB13466;
	Fri, 12 May 2023 08:18:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id o2hNNm72XWTLHQAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 12 May 2023 08:18:54 +0000
Date: Fri, 12 May 2023 10:18:54 +0200
Message-ID: <873542aro1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ALSA: firewire-digi00x: prevent potential use after free
In-Reply-To: <c224cbd5-d9e2-4cd4-9bcf-2138eb1d35c6@kili.mountain>
References: <c224cbd5-d9e2-4cd4-9bcf-2138eb1d35c6@kili.mountain>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: YSTUZMF7JUTPPNH23KQQWEX5GQJBRNUF
X-Message-ID-Hash: YSTUZMF7JUTPPNH23KQQWEX5GQJBRNUF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YSTUZMF7JUTPPNH23KQQWEX5GQJBRNUF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 09 May 2023 11:07:11 +0200,
Dan Carpenter wrote:
> 
> This code was supposed to return an error code if init_stream()
> failed, but it instead freed dg00x->rx_stream and returned success.
> This potentially leads to a use after free.
> 
> Fixes: 9a08067ec318 ("ALSA: firewire-digi00x: support AMDTP domain")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks, applied now.


Takashi
