Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6877E419A
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Nov 2023 15:11:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D7467F8;
	Tue,  7 Nov 2023 15:10:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D7467F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699366267;
	bh=NRvtLB3dpb5qKfYvSs0OJajSk2UkuhidC5jDHNvUCxU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OP3KAKM6YTBHy/xwEExgsAmcHeMoOqvk8XrDXTvWj+brksCu+sojBiynFKwjonM2Q
	 bbSvIYkXEpsMryJIrfFpSAZDMbFO+Lueg1wb2cA5J1/OD97jADn2Cd/6AzlekhRboN
	 +sn/Z6vXJrUwjXYfTa6ck1E5FTc3Z0cQEWbrWNRo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09529F80549; Tue,  7 Nov 2023 15:10:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C0CAFF80169;
	Tue,  7 Nov 2023 15:10:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6354F8016D; Tue,  7 Nov 2023 15:10:13 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C1165F80152
	for <alsa-devel@alsa-project.org>; Tue,  7 Nov 2023 15:10:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1165F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=em5ODSq5;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=bB+GevcQ
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 45C8E2190B;
	Tue,  7 Nov 2023 14:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1699366210;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H5cjZNHpxuGWSmT2zmwf2NB+u/SGgNHH2dKh8C7ovmk=;
	b=em5ODSq5zm1cU4/E2lGJvYbN3/faZaJLhRnH8l0Bebg9dF8o01A4EhPHSP4hOoO0OR1hVS
	SWa+gG5bYa3jWCdEs/ysYAAwJVqhhkyl0IIl2JNg7KqViT64fXfFUzyKqDkFT4ADcv5YLx
	lf8VZuisabHMAaWQZGa4s7J5IpkT+vQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1699366210;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H5cjZNHpxuGWSmT2zmwf2NB+u/SGgNHH2dKh8C7ovmk=;
	b=bB+GevcQ8b7XJFT+2UMNwxkG5W8gXYf4ALOgK/EDcEjK1ac+cX798wwzvckItKgT1Sg3Np
	/iZkUCfqP4T5CxDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1487913907;
	Tue,  7 Nov 2023 14:10:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id CNYmBEJFSmUFdwAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 07 Nov 2023 14:10:10 +0000
Date: Tue, 07 Nov 2023 15:10:09 +0100
Message-ID: <87v8adr6wu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Alexander Koskovich <AKoskovich@pm.me>
Cc: perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Alexander Koskovich <akoskovich@pm.me>
Subject: Re: [PATCH 1/1] ALSA: hda: Add ASRock X670E Taichi to denylist
In-Reply-To: <20231105152834.5620-1-akoskovich@pm.me>
References: <20231105152834.5620-1-akoskovich@pm.me>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: C2ULJFGCJZA5SQUPGZZDEHJVPFH77KGV
X-Message-ID-Hash: C2ULJFGCJZA5SQUPGZZDEHJVPFH77KGV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C2ULJFGCJZA5SQUPGZZDEHJVPFH77KGV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 05 Nov 2023 16:29:29 +0100,
Alexander Koskovich wrote:
> 
> Recent AMD platforms expose an HD-audio bus but without any actual
> codecs, which is internally tied with a USB-audio device, supposedly.
> It results in "no codecs" error of HD-audio bus driver, and it's
> nothing but a waste of resources.
> 
> snd_hda_intel 0000:59:00.6: no codecs found!
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>

Thanks, applied now.


Takashi
