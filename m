Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4827C776204
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 16:05:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62A76E0F;
	Wed,  9 Aug 2023 16:04:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62A76E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691589934;
	bh=R7G+TQBcptv+xFcs0uqi4t7R11t4UQ+MShRNTHWRbZc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aktZaCv7TW/tb2UfWsu8EkwNoQddBGuU0jdj5E8ZAPoPGX8ZwJM0cjmVJz9rqytnB
	 jbQ1qTCqqazHf+cLziBXOhdPtr4W1xjFmN07PBAWZdMAX4bMeedZoDuXkRJ+4fVcOn
	 hVhK02JZwKwvmxfbxfYrW8v0uDBM95XXKEn+VkU8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 808B9F80134; Wed,  9 Aug 2023 16:04:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC2B3F80116;
	Wed,  9 Aug 2023 16:04:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 896FFF80134; Wed,  9 Aug 2023 16:04:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B756F800FE
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 16:04:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B756F800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ZMeQ6ydv;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=/5Js4drN
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1F8CB1F38C;
	Wed,  9 Aug 2023 14:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1691589871;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gpRhv21nUll8M2hRktXD7evPQXpiruatUOPPJP4LeL8=;
	b=ZMeQ6ydvPgWCFJcH59qjzT3rj0RGqRDHzQcMkSWmrfKFg4OChnAKwxySGy2eEZJtiOmQdc
	ZmVCsz/0bXzLUZFi1CO3AbpSUCN8p+po8rp1LcezB+2ULvzFnmIrdOa4tNumKRutLUpZKR
	stLkoDUu1hyF3+1c0rEpkY4ExlbDGIY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1691589871;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gpRhv21nUll8M2hRktXD7evPQXpiruatUOPPJP4LeL8=;
	b=/5Js4drN+VsXFNNBv3AS30Kt/VXnVyS6QViipEoehoejC8mU4yk2D6oe0Z56wIPMw+Wjga
	UWmffNeo6phXTTCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E41D2133B5;
	Wed,  9 Aug 2023 14:04:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id w/+yNu6c02Q+IQAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 09 Aug 2023 14:04:30 +0000
Date: Wed, 09 Aug 2023 16:04:30 +0200
Message-ID: <87leeke2hd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH v1 0/2] Add HP G11 Quirks and update Dell Oasis Quirks
In-Reply-To: <20230809140048.669797-1-sbinding@opensource.cirrus.com>
References: <20230809140048.669797-1-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 5DIEE52ELGEUMWPGVDPXG5DKQ2KF3ZRY
X-Message-ID-Hash: 5DIEE52ELGEUMWPGVDPXG5DKQ2KF3ZRY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5DIEE52ELGEUMWPGVDPXG5DKQ2KF3ZRY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 09 Aug 2023 16:00:46 +0200,
Stefan Binding wrote:
> 
> Add quirks to support HP G11 using CS35l41 HDA, using both SPI and I2C.
> One older HP laptop has an SSID removed.
> In addition, all Dell Oasis laptops using CS35L41 have been switch to
> use SPI, with one SSID removed.
> 
> Stefan Binding (2):
>   ALSA: hda/realtek: Add quirks for HP G11 Laptops
>   ALSA: hda/realtek: Switch Dell Oasis models to use SPI

Both look like correction of the existing quirks.
Could you put the corresponding Fixes tags?


thanks,

Takashi
