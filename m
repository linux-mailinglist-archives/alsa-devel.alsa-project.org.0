Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D61E86FF6BB
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 18:04:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F37A9F0D;
	Thu, 11 May 2023 18:03:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F37A9F0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683821064;
	bh=sJ4gQtJx+711GurUaIcBBK6BrEW13ZRo1V8mavNVy4c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Lxqvn5uV04m9seNyCxNhOvrS8sayeft/baH+SKRUaifaZ9lCzcisd+tIW1b8aVkgD
	 ZR8rdidm+mlXLYHZM5RdEoazg96nxJ/6X8bW6w5XRcLn1kw7339c2mERqgvppY550Q
	 d6Vc8K8Sad+CwvB3VkWnIQh/PPMdSmuB+O0qe9/U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1B13F8032D; Thu, 11 May 2023 18:03:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67B34F8052E;
	Thu, 11 May 2023 18:03:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33E2AF80534; Thu, 11 May 2023 18:03:29 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7BB0BF8032D
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 18:03:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BB0BF8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=CjvQMdJs;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=KcJYJ+JL
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 161F61FF8F;
	Thu, 11 May 2023 16:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1683821004;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IQ1rt7FZMKYQH9rKdMP3kJRS2fvxQRkprXYeNPPYKQ4=;
	b=CjvQMdJszE/NVBIB3lpDDSQ73BB35C5RnjcXLJJ64Q+iq+HMk118OyRBT7063NHzYbkBo6
	8jV+EuKBSyR0Y+x3oO2y1AS6ABVNgUvrTBPusLAme9igGwh6J4RgfT4lu8495BUo5pYg/O
	mRfyAVVCKgWFvVOSxdQX/zJEV46nofc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683821004;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IQ1rt7FZMKYQH9rKdMP3kJRS2fvxQRkprXYeNPPYKQ4=;
	b=KcJYJ+JLIMtrcmscHSxa6YF7ICrE6Q7HiCZ3kebnJgAHgLQN8GmL7MoU3xo1DdZBO6JgQX
	ePCNXSx1vIyStaDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D19B2134B2;
	Thu, 11 May 2023 16:03:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id TfQ5MssRXWQbAwAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 11 May 2023 16:03:23 +0000
Date: Thu, 11 May 2023 18:03:23 +0200
Message-ID: <87fs824zzo.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	<alsa-devel@alsa-project.org>,
	<patches@opensource.cirrus.com>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for HP EliteBook G10 laptops
In-Reply-To: <20230510142227.32945-1-vitalyr@opensource.cirrus.com>
References: <20230510142227.32945-1-vitalyr@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: FRZUESRYPPUMLVTJKK74ONCA7S6M6B3L
X-Message-ID-Hash: FRZUESRYPPUMLVTJKK74ONCA7S6M6B3L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FRZUESRYPPUMLVTJKK74ONCA7S6M6B3L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 10 May 2023 16:22:27 +0200,
Vitaly Rodionov wrote:
> 
> Add support for HP EliteBook 835/845/845W/865 G10 laptops
> with CS35L41 amplifiers on I2C/SPI bus connected to Realtek codec.
> 
> Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>

Thanks, applied.


Takashi
