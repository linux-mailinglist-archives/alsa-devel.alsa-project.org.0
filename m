Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0F672F46E
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jun 2023 08:10:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7372B822;
	Wed, 14 Jun 2023 08:09:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7372B822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686723038;
	bh=JUd5eUrevETwWL6T6iZXQZD05C0beWx/ouBTxnTZrmE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m4WmQTniGkdfNpbcyzNMql8RtQq3e8YKArNUUdqmQeyj6pUNYuWehCmwn/mDfWg1D
	 1x2YYcG3+E4sPT6IJIOmXgJmlSYvHMDXrGwy5/saUCNnpU0GjGJJ19TDOA8nSuThdl
	 cR6iAY/belV/hwIw9KZfXxKIvfersRYzRGiNXZ+o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE57BF8025E; Wed, 14 Jun 2023 08:09:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39238F80132;
	Wed, 14 Jun 2023 08:09:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E3A7F80149; Wed, 14 Jun 2023 08:09:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D05EF80093
	for <alsa-devel@alsa-project.org>; Wed, 14 Jun 2023 08:09:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D05EF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ICFmOPD/;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=RAYtUaNC
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A234E1FDD8;
	Wed, 14 Jun 2023 06:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686722977;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fqo+P8rPSCtMjcx2Z5rA24K3TLNFPF6bYKbZyFIHyDo=;
	b=ICFmOPD/Pr0hBt2zSs6gR4rbqxnSKvCQmT4zhX1bBi9IP3+U2xMnzLcFlBfQC2zXSl4ISR
	QU32BQGVHHLT7nqYrjZmPlcM/7zVs0y+wf9XWyJqym8aXdc5TXwoKojuGblsSqMlILvnDF
	3WV3ArM6OaCVCJqPCL0Jzy8Oicb22G8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686722977;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fqo+P8rPSCtMjcx2Z5rA24K3TLNFPF6bYKbZyFIHyDo=;
	b=RAYtUaNCOGBCBdProaxQTYqaPiaqGljSEZOqg6S3BBYhwtrmo7oelesUU04q6vrWoqqGAa
	mFTzDeyNKiMQldCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8591C1357F;
	Wed, 14 Jun 2023 06:09:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id XlayH6FZiWQjdgAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 14 Jun 2023 06:09:37 +0000
Date: Wed, 14 Jun 2023 08:09:37 +0200
Message-ID: <87v8fqbmn2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Symbolic Debugger" <happy.debugging@gmail.com>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH v2 00/37] ALSA: Add MIDI 2.0 support
In-Reply-To: 
 <168672249902.20.14647833450036984617@mailman-web.alsa-project.org>
References: <168666978762.22.2520238479965266775@mailman-web.alsa-project.org>
	<168672249902.20.14647833450036984617@mailman-web.alsa-project.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 2M3MNH655S7CQ3XCPPJ25FLPEZNJHF6Z
X-Message-ID-Hash: 2M3MNH655S7CQ3XCPPJ25FLPEZNJHF6Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2M3MNH655S7CQ3XCPPJ25FLPEZNJHF6Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 14 Jun 2023 08:01:39 +0200,
Symbolic Debugger wrote:
> 
> I could not find the changes and UMP source files on https://github.com/torvalds/linux/tree/master/sound,  is that correct ?
> I am trying to build a kernel with UMP support for testing UMP on a custom made development board.

All MIDI 2.0 stuff will be merged to 6.5 kernel.
Currently it's found in linux-next or sound.git subsystem tree.

In sound.git tree, you can find some branches for the use on older
kernels, too (topic/midi20, topic/midi20-6.1.y, topic/midi20-5.15.y,
topic/midi20-5.10.y, topic/midi20-5.4.y).


Takashi
