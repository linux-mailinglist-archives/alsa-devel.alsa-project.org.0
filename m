Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C24764851
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jul 2023 09:19:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6641D82A;
	Thu, 27 Jul 2023 09:18:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6641D82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690442371;
	bh=7zwco2DV4b+/glr9zC5XJL0mjn83U4fq5xufN5v+hRg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pYLTjdCc7B4/3OOMfsh+MH/zvZEZFkUAdhFggXxO0gNBPerc/dPUvcthaQ1ZECRWb
	 P1Enx2wFeXmWfqqvSIyccSRtTZBRrA7Jn2FNIpYkfcCI7PvIXh3OUda0/EiOx/VEQ5
	 C8YF4NuxpyTkHyez9FCDgIDc19jHq0Lyz55gz7vY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFFBEF801F5; Thu, 27 Jul 2023 09:18:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B38ACF80163;
	Thu, 27 Jul 2023 09:18:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79564F8019B; Thu, 27 Jul 2023 09:18:36 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C2B4F80153
	for <alsa-devel@alsa-project.org>; Thu, 27 Jul 2023 09:18:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C2B4F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=EO0fQYZT;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Ul850kfc
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CF98F21B73;
	Thu, 27 Jul 2023 07:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690442310;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BbqG0EHD1iZY1Uc8pX8klfq3MJgfowuBi3jaQrv08RE=;
	b=EO0fQYZTM31t9eHDaItSx/8aazhb3gDdnOkmIuScbvNWjpO+/Cm0taRLboGazUiEJhc7V5
	XSlhXHEpc8/ofkKWBH7ITnq7d9aGp18SWXyV0USF4VWop1olZcPa0oVpo6xwKndAEZU6kP
	TU1UED+VoTzesx1/3hMGX2hCsdFv95U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690442310;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BbqG0EHD1iZY1Uc8pX8klfq3MJgfowuBi3jaQrv08RE=;
	b=Ul850kfc+tz7DEeYtuhu2WIaiHdRCP+SXR+fYBEyg7h6gyCrzs5LAngWyOlP2b6cDUl45s
	HuJzh2t2+8qKbdDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AA3CC138E5;
	Thu, 27 Jul 2023 07:18:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id JlWTKEYawmShLgAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 27 Jul 2023 07:18:30 +0000
Date: Thu, 27 Jul 2023 09:18:30 +0200
Message-ID: <87tttp6cvt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pavel Asyutchenko <svenpavel@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	"Luke D . Jones" <luke@ljones.dev>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Support ASUS G713PV laptop
In-Reply-To: <20230726223732.20775-1-svenpavel@gmail.com>
References: <20230726223732.20775-1-svenpavel@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: FFV6YXQNZGU3YCYPOROVU2GBVHW5SJVG
X-Message-ID-Hash: FFV6YXQNZGU3YCYPOROVU2GBVHW5SJVG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FFV6YXQNZGU3YCYPOROVU2GBVHW5SJVG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 27 Jul 2023 00:37:32 +0200,
Pavel Asyutchenko wrote:
> 
> This laptop has CS35L41 amp connected via I2C.
> 
> With this patch speakers begin to work if the
> missing _DSD properties are added to ACPI tables.
> 
> Signed-off-by: Pavel Asyutchenko <svenpavel@gmail.com>

Thanks, applied now.


Takashi
