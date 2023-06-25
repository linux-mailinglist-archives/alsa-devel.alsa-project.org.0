Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF58873CF65
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Jun 2023 10:35:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3ACC983E;
	Sun, 25 Jun 2023 10:34:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3ACC983E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687682138;
	bh=Q8trk3ouGHY5LVcUD5Jo4FMqJfE03T/dCd3YOGIgY3A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UrV2jcCHbFQLb8O70r2f3BnvjUo2d5YbOizjLLf+Jd7idlktdOIlQzjdtFOCw/TCR
	 RrEEzgBa1mR7tbZnzA/U6jsTjlzrzeH45HCxMIvIlKiS/ka/adp8JKneClLpkBztAI
	 enRSxa+au29RAw9hb1Ij2TLEnqEmRD5+eEPbkWWY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E72AF80548; Sun, 25 Jun 2023 10:34:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 644B0F80246;
	Sun, 25 Jun 2023 10:34:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B191F80246; Sun, 25 Jun 2023 10:34:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D89F6F80093
	for <alsa-devel@alsa-project.org>; Sun, 25 Jun 2023 10:34:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D89F6F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=TXfePj42;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=2Y5bE/AO
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 45764210E7;
	Sun, 25 Jun 2023 08:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1687682047;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B1pUxDWlFpXN/+3fg58m86ckkHcjVAqB9AZUATH33aE=;
	b=TXfePj429nUiQHVNJng78PJ5M9doaxX4ZznR2utVYB2UL5c2oJQHrYBW4elBHMq04g4Qk3
	bjB5cYxjfapNZB3LwcWuDFH9RsRAcsOf7hMLlsxv+cXPIA1/2YN7yVVmOFyTttPNJrAoNW
	cnUv7NEqwXVqAAz31Kz0mEdWLPq/MpU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1687682047;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B1pUxDWlFpXN/+3fg58m86ckkHcjVAqB9AZUATH33aE=;
	b=2Y5bE/AOdByKI+Zam4b+u7/yBcly9+q8CEdXId0CMo2ENztYy53h+ZUIEtMovLvCN2Fa8f
	qHA24QKpEMQWnzBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1902C13462;
	Sun, 25 Jun 2023 08:34:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id VPMUBf/7l2RiIgAAMHmgww
	(envelope-from <tiwai@suse.de>); Sun, 25 Jun 2023 08:34:07 +0000
Date: Sun, 25 Jun 2023 10:34:06 +0200
Message-ID: <87pm5kvt35.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Matthias Reichl <hias@horus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Dom Cobley <popcornmix@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: pcm: fix ELD constraints for (E)AC3,
 DTS(-HD) and MLP formats
In-Reply-To: <20230624165216.5719-1-hias@horus.com>
References: <20230624165216.5719-1-hias@horus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 7CTRTLPIT73GDPCVM7XSJ2DZMCWLN4IJ
X-Message-ID-Hash: 7CTRTLPIT73GDPCVM7XSJ2DZMCWLN4IJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7CTRTLPIT73GDPCVM7XSJ2DZMCWLN4IJ/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 24 Jun 2023 18:52:16 +0200,
Matthias Reichl wrote:
> 
> The SADs of compressed formats contain the channel and sample rate
> info of the audio data inside the compressed stream, but when
> building constraints we must use the rates and channels used to
> transport the compressed streams.
> 
> eg 48kHz 6ch EAC3 needs to be transmitted as a 2ch 192kHz stream.
> 
> This patch fixes the constraints for the common AC3 and DTS formats,
> the constraints for the less common MPEG, DSD etc formats are copied
> directly from the info in the SADs as before as I don't have the specs
> and equipment to test those.
> 
> Signed-off-by: Matthias Reichl <hias@horus.com>

Thanks, applied now.


Takashi
