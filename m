Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B24725BC4
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 12:45:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2E0874C;
	Wed,  7 Jun 2023 12:44:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2E0874C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686134710;
	bh=hMv/DQ+5nD12fXaLnTxCd2UlyAfRtAogH1xRGGdi3Qo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cjpLx05XA6mLc316clky7EMeLRhp4795NpalXfi5ho90h/iS7uDL7/ywSxp2AATxN
	 GJGfHbp7v0C8QqfQJ8k7EeYnYO3iBTZ4xcLPbNjabt75c1DhMie62odVK4kWl8ZKEO
	 UMVCUU0gNDKTjcYJa/bgrhYICE9mJP7lEjemoOmc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CB45F80199; Wed,  7 Jun 2023 12:44:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7D94F80155;
	Wed,  7 Jun 2023 12:44:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FD86F80199; Wed,  7 Jun 2023 12:44:14 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E6E3F80130
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 12:44:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E6E3F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ROA7xn5p;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=JQUcKif7
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C60E41FDAC;
	Wed,  7 Jun 2023 10:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686134648;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/4U+KzlgYk2IZQ12on1zqqqiAPOWrHNNCypW4QgdQDE=;
	b=ROA7xn5pYcgJKc2ri1PXQIyNovfJFTaNGnsRKtQos9HzQlzGIy/tFDb2fpkNkKW+qxjtX+
	+u8Hs9KdmX+7F0lvhYSXOoYQ8eeeCnIE0EOKKUBLg6kfq1FufDJpQWHClIo1aLSlM16weg
	TPp2LACDFscKWRrYq/LviAlnyhiYKgw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686134648;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/4U+KzlgYk2IZQ12on1zqqqiAPOWrHNNCypW4QgdQDE=;
	b=JQUcKif7SS1Ze0iVzEvfBXg7pPWDqRlvnnh7YP0DVFaTGeIC3Y5T2EDPLwTpkVtDy6XuH2
	Gr584zK8EmBI3TDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ACC711346D;
	Wed,  7 Jun 2023 10:44:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id XkyYKXhfgGSUCgAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 07 Jun 2023 10:44:08 +0000
Date: Wed, 07 Jun 2023 12:44:08 +0200
Message-ID: <87mt1b1rif.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Yanteng Si <siyanteng@loongson.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	chenhuacai@loongson.cn,
	alsa-devel@alsa-project.org,
	loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH RESEND v3 0/4] Add Loongson HD Audio support
In-Reply-To: <cover.1686128807.git.siyanteng@loongson.cn>
References: <cover.1686128807.git.siyanteng@loongson.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: V5TFNRMX6U3ODF3XEQI6GDFEZFK3I3EH
X-Message-ID-Hash: V5TFNRMX6U3ODF3XEQI6GDFEZFK3I3EH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V5TFNRMX6U3ODF3XEQI6GDFEZFK3I3EH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 07 Jun 2023 11:21:48 +0200,
Yanteng Si wrote:
> 
> v3:
> * Adding some comments.
> * Seting polling_mode flag.
> 
> v2:
> * Handling with two new flags added to struct hdac_bus.
> 
> v1:
> * The Loongson HDA controller is compatible with High Definition Audio
>   Specification Revision 1.0a.
>   See <https://loongson.github.io/LoongArch-Documentation/Loongson-
>   7A1000-usermanual-EN.html#hda-controller>
> 
> Yanteng Si (4):
>   ALSA: hda: Add Loongson LS7A HD-Audio support
>   ALSA: hda: Using polling mode for loongson controller by default
>   ALSA: hda: Workaround for SDnCTL register on loongson
>   ALSA: hda/intel: Workaround for WALLCLK register for loongson
>     controller

Applied all four patches now.

The patch 3 had a typo (missing Signed-off-by: for Yingkun, so I
corrected it manually.


thanks,

Takashi
