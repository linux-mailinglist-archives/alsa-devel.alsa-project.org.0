Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EE87426B1
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 14:47:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67CE47F4;
	Thu, 29 Jun 2023 14:46:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67CE47F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688042853;
	bh=C2Y24ivHm/B/fKxjKnmKGxzY8SU7utz2eHE5M2snbCk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oCzBIZZkvnp2JYzpGCADd4Rz2jEqOLk3YA5kaTP5jP4qYsm3J1qIpOiNLFJN+xzBE
	 94ONl49UtR2rIXsV/JGiaozMaAmZ755sOr/xzFU6ODA8bt4HOSm8TtfSG9sx81+qxI
	 nnkSxF+oJex2W5hibxhCII5EaPPu2kHyDQ23nwTg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA7BEF8053B; Thu, 29 Jun 2023 14:46:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83016F80212;
	Thu, 29 Jun 2023 14:46:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4ADA7F80246; Thu, 29 Jun 2023 14:46:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D5F5DF80093
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 14:46:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5F5DF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=bDjJbTjY;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ABOeuopA
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BDF101F8BE;
	Thu, 29 Jun 2023 12:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1688042793;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vAH504Fcy+aW1ZxkZK4KYeGzA66qMsvuD3CDKEk1s5U=;
	b=bDjJbTjY4kz98CZ0t2VRvkGqMAwn3TBFyIzYy8hMncfaKL7kt1bOU+lFtQ05HYwIjMOE0k
	Msfbu6zkRorNZK+Z0Z3Pq2o0izlN8tRPT24lTlVAi8XMuabkZg40Ue0YJWeAo22xbB2qwi
	57pbASxulLL50qEt1b9uRL+AVq5ADYQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688042793;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vAH504Fcy+aW1ZxkZK4KYeGzA66qMsvuD3CDKEk1s5U=;
	b=ABOeuopA1kVgF2TtlPJ+8UvGp9jXGkD2up7/XPFqn6Yb/sJzEMdYSB9Dvgt33xd7o0a0Md
	ENykrl7Juw0zusDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A5D51139FF;
	Thu, 29 Jun 2023 12:46:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id sZDOJyl9nWRlYgAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 29 Jun 2023 12:46:33 +0000
Date: Thu, 29 Jun 2023 14:46:29 +0200
Message-ID: <87ttuqfnbu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Huang Rui <vowstar@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	vitalyr@opensource.cirrus.com
Subject: Re: [PATCHv2] ALSA: hda/realtek: fix mute/micmute LEDs for HP
 EliteBook G10
In-Reply-To: <20230629123557.3627401-1-vowstar@gmail.com>
References: <20230629123557.3627401-1-vowstar@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: Z6Q5XCT2IGGN3OV7U6O6G4OF5N5FOLY3
X-Message-ID-Hash: Z6Q5XCT2IGGN3OV7U6O6G4OF5N5FOLY3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z6Q5XCT2IGGN3OV7U6O6G4OF5N5FOLY3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 29 Jun 2023 14:35:57 +0200,
Huang Rui wrote:
> 
> In the commit 3e10f6ca76c4 ("ALSA: hda/realtek: Add quirk for
> HP EliteBook G10 laptops"), speakers are fixed but mute/micmute
> LEDs does not lit. Need the ALC287_FIXUP_CS35L41_I2C_2_HP_GPIO_LED
> to get all mute/micmute LEDs working.
> 
> Signed-off-by: Huang Rui <vowstar@gmail.com>
> Fixes: 3e10f6ca76c4 ("ALSA: hda/realtek: Add quirk for HP EliteBook G10 laptops")
> ---
> V1 -> V2: Add fixes to link a previously committed issue

This was already fixed by Andi's patch.


thanks,

Takashi
