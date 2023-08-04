Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9119576FEF6
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 12:49:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02E88832;
	Fri,  4 Aug 2023 12:49:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02E88832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691146197;
	bh=JOLjEp0xgezi69RFcXY28TJz2VrcYRnI0WGcU7viafo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sKtSNzXOqIom/LwWJKffqfuKg8oXCWJ5ELhTpPZLG93L0Ip2EQhA9KsYNGw3mPB6o
	 HIoqhh8or9vyKwqHsPG7caRppSxoU0d+Rqdf9BvQBF6QVH9ezvJjIZ69q9CT8PZqzv
	 YtGa4Mlj4oHEgwFxbsIt2XogBe4tHVmOaVysCVrc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B626F80578; Fri,  4 Aug 2023 12:48:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F740F8053B;
	Fri,  4 Aug 2023 12:48:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F3E3F80553; Fri,  4 Aug 2023 12:48:52 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id EF5ADF80425
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 12:48:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF5ADF80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=j79NYrYa;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=OCd88Ixk
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5178A21867;
	Fri,  4 Aug 2023 10:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1691146129;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rpza79Iiy2YD7BExWRThaSJL3I98xI1r05EfxEEAiak=;
	b=j79NYrYaOgwNkCswSqD9K5Klp8RB1hjuqBG/Ogm/H/RXjtWR2x1lL+U4PEebkXER8b584u
	csfdcL2lU+nPRMIhJd8hKnlrui3uOlbhPZopH9RBjV/E6KlILDfufkYeAnWQ86nerpp1Ue
	t3ihJK26ezgkpBDntw49x+Y2kYpBicg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1691146129;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rpza79Iiy2YD7BExWRThaSJL3I98xI1r05EfxEEAiak=;
	b=OCd88Ixk+z+76VzqepMPfHsHe8UurS7XjXMGuMLAzWCB5Bx9Ckrf+EbH09tHYeyGn2LFdj
	TFH/pvDk48W0piAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2995F133B5;
	Fri,  4 Aug 2023 10:48:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id wRwrCZHXzGRkPwAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 04 Aug 2023 10:48:49 +0000
Date: Fri, 04 Aug 2023 12:48:48 +0200
Message-ID: <87leer9j73.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: dengxiang <dengxiang@nfschina.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add support for Mythware XA001AU capture
 and playback interfaces.
In-Reply-To: <20230803024437.370069-1-dengxiang@nfschina.com>
References: <20230803024437.370069-1-dengxiang@nfschina.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 75XBXMTTHPMJOGTABW52JZKBMRX2MQTG
X-Message-ID-Hash: 75XBXMTTHPMJOGTABW52JZKBMRX2MQTG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/75XBXMTTHPMJOGTABW52JZKBMRX2MQTG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 03 Aug 2023 04:44:37 +0200,
dengxiang wrote:
> 
> This patch adds a USB quirk for Mythware XA001AU USB interface.
> 
> Signed-off-by: dengxiang <dengxiang@nfschina.com>

Thanks, applied now.


Takashi
