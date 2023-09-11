Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FA979A36F
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 08:22:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD87B83A;
	Mon, 11 Sep 2023 08:21:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD87B83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694413338;
	bh=qASphXNEUpLx7Mq/CRLmACxiVsCJuHWutN3DH2BbjB8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z+GC68kkJ2CCmpD01CMNVvwgB1aN9YmH4IidIanvTSb2AV9/wa7bF6Tv6x4FY8Qdd
	 XMu2DQuWlSKeZrxuUhdUCLb9cPsqoPBCXFSuVaRLGvkqN5v4UGYJQ4l4LRN9HTliV7
	 oqEfm/1M8bc310iY9B1w1c6GTzo2WK5F02JxXxTo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EED4F800AA; Mon, 11 Sep 2023 08:21:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EFBE7F80246;
	Mon, 11 Sep 2023 08:21:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2A15F80425; Mon, 11 Sep 2023 08:21:11 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A34C2F800AA
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 08:21:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A34C2F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=VsvYUCv1;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=gIoCvmzz
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C7D2E1F460;
	Mon, 11 Sep 2023 06:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1694413265;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T6QXNK7tNbgbaK15z80/9lPVg06E4dUIPGRl3/lhwbM=;
	b=VsvYUCv1XDTJawG4PnDWbqG7/+95E/V+uYCzkUklZK5ceJZaNsRGt0IRTe1F2WNwcumt6a
	NHtv6WSl+bcNjABKo5ejbrC+Nh3HJZ9ozqDl1MNZfadcdQsOVn3F8iVxJ2rWTEwypD/rsn
	OIjFHTEj9n3Z8gvgV+ZjRwaHIR0oU0M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694413265;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T6QXNK7tNbgbaK15z80/9lPVg06E4dUIPGRl3/lhwbM=;
	b=gIoCvmzzZTxKr+p2GFqjsq/MHecNqSqwdlnC+cwaZKLkqEdTDsAWSh82kdO8HJeQieJ09i
	XVN+S6XKotSELrBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9795D13780;
	Mon, 11 Sep 2023 06:21:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GLMyJNGx/mT/QgAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 11 Sep 2023 06:21:05 +0000
Date: Mon, 11 Sep 2023 08:21:04 +0200
Message-ID: <87v8ch6xin.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ding Xiang <dingxiang@cmss.chinamobile.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	broonie@kernel.org,
	shuah@kernel.org,
	alsa-devel@alsa-project.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: ALSA: remove unused variables
In-Reply-To: <20230908081040.197243-1-dingxiang@cmss.chinamobile.com>
References: <20230908081040.197243-1-dingxiang@cmss.chinamobile.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: VIH6ZRX26EACMJYYXSHFXBM4KVAGRQPL
X-Message-ID-Hash: VIH6ZRX26EACMJYYXSHFXBM4KVAGRQPL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VIH6ZRX26EACMJYYXSHFXBM4KVAGRQPL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 08 Sep 2023 10:10:40 +0200,
Ding Xiang wrote:
> 
> These variables are never referenced in the code, just remove them.
> 
> Signed-off-by: Ding Xiang <dingxiang@cmss.chinamobile.com>

Thanks, applied.


Takashi
