Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E70217E045D
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Nov 2023 15:06:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1012B822;
	Fri,  3 Nov 2023 15:05:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1012B822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699020362;
	bh=Ys3BfGLzHTQ2qxC2Kv8A4oVaOBn74Q6mnJ/R+F5Cr4k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KhY64qmlbhECoYuiKu3ZFVnLK6vGRiQpk0avuWB9NikVNg4kNka+iX2pdKzrPaqM5
	 b6G1z66Wqp+nuBfFGZ34qN3YOflFRJxflKvbMioQxsTQnRgiPnh4uypTPP6e30vi+6
	 VX4XlZyVmkLDfQTVjfJJvCQeNfjNOrRggzYqKpjM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 483ACF80558; Fri,  3 Nov 2023 15:04:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B02D3F8020D;
	Fri,  3 Nov 2023 15:04:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DCB5F80290; Fri,  3 Nov 2023 15:04:47 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 0DC22F8016D
	for <alsa-devel@alsa-project.org>; Fri,  3 Nov 2023 15:04:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DC22F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=LR7Xtqvl;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=O11EzMLN
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 66BBE21865;
	Fri,  3 Nov 2023 14:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1699020283;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K+phPigzxGcIPlXMe8J+907GIstYOns+/x2oh4L/kAE=;
	b=LR7XtqvlystAQ8cwpMpLw2H6ykoTS69ka/Sl8lFSfzZciz86hzDxRHwbkZq3mZrKFgTIB5
	kLUhLiRhWARx++pb5r1RctZ8ammYjsVvVTaTUZf+UR7EuFs4uYoOPjNrDytizE7BXyHHeL
	rA9i3iGTLuxEQrdbhQ6yvSvgxi0XEYQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1699020283;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K+phPigzxGcIPlXMe8J+907GIstYOns+/x2oh4L/kAE=;
	b=O11EzMLNUFg186nPO99/Q3JkE26DSNbgYJmvTxrNghs+XCTvXESxaOOTTLgSrDNMSDOP+A
	gwv0oqfxOKpMWGDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3C03413907;
	Fri,  3 Nov 2023 14:04:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id oLK3Dfv9RGWfCAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 03 Nov 2023 14:04:43 +0000
Date: Fri, 03 Nov 2023 15:04:42 +0100
Message-ID: <87o7gbszk5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Dave Airlie <airlied@redhat.com>
Subject: Re: [PATCH] sound/isa/wavefront: copy userspace array safely
In-Reply-To: <87pm0rszup.wl-tiwai@suse.de>
References: <20231102190309.50891-2-pstanner@redhat.com>
	<87pm0rszup.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: BSTZQTCC7XY37IGIBZLMZERJHXFQHUDS
X-Message-ID-Hash: BSTZQTCC7XY37IGIBZLMZERJHXFQHUDS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BSTZQTCC7XY37IGIBZLMZERJHXFQHUDS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 03 Nov 2023 14:58:22 +0100,
Takashi Iwai wrote:
> 
> On Thu, 02 Nov 2023 20:03:10 +0100,
> Philipp Stanner wrote:
> > 
> > wavefront_fx.c utilizes memdup_user() to copy a userspace array. This
> > does not check for an overflow.
> 
> There is a check above the memdup_user() call; it's at most 512
> bytes.
> 
> > Use the new wrapper memdup_array_user() to copy the array more safely.
> > 
> > Suggested-by: Dave Airlie <airlied@redhat.com>
> > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> 
> Although the check is already present, it's still better to use the
> new helper, so I applied the patch now.

... and the helper is available only on Linus tree for now, so I
postpone after 6.7-rc1 release, so that we can have a solid base.


Takashi
