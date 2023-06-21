Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 980F0737AA2
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 07:34:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DCA174C;
	Wed, 21 Jun 2023 07:33:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DCA174C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687325652;
	bh=VjI5bIzhx2GPjxhvClJwUaAzcj8vKsMba7lldXy8u0k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=da2vJhUheypY/Iww8iO23Chsww82sz/8xlex9RbTaOtHzwIkgmMhNjL8nA1xmJDum
	 lR3huccHs3n97sTrGiQOAiKvqNiVE8cMph+J+D/aSn7ICQ4KROAjJP5eknCyCK772s
	 l0S0f1ccxH6o40lIJKnOO4MxVnVwz9J+7SR16Z1Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29043F80124; Wed, 21 Jun 2023 07:33:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF835F80132;
	Wed, 21 Jun 2023 07:33:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA334F80141; Wed, 21 Jun 2023 07:33:17 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 97D19F80124
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 07:33:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97D19F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=KPzhrX8t;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=pB43P/hl
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DAACB218E5;
	Wed, 21 Jun 2023 05:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1687325593;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GEQ46uuX4UWuGsVizAzU8Goi8ofOIjHFOOipdR0Mt+I=;
	b=KPzhrX8tkmxxlzjm1g2mCR50A96JI8TkC+KiK4Fl6Lq3ehlksfev3ESmiG7iX/9VB/aUma
	J7ruuCvM8bWYdCCT4HArKBjcC5y7GkrG1+RDDNLr/hdx8C1R9M0movtFi8WIrNGdflcoUl
	3lUmPdBP03Ix1TzyzsUs48hrwgyvK9o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1687325593;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GEQ46uuX4UWuGsVizAzU8Goi8ofOIjHFOOipdR0Mt+I=;
	b=pB43P/hlB6m236+aMv78LFuGDizfj0Vsg1tD/8v0DB9ThK+d5azhkxvUIFawautKWftwuj
	BI54wQpWUK+jCZCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A3EA513A20;
	Wed, 21 Jun 2023 05:33:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 4zMJJ5mLkmRyCwAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 21 Jun 2023 05:33:13 +0000
Date: Wed, 21 Jun 2023 07:33:13 +0200
Message-ID: <87ttv1qt0m.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: alsa-devel@alsa-project.org,	linux-kernel@vger.kernel.org,	Ivan Orlov
 <ivan.orlov0322@gmail.com>,	Jaroslav Kysela <perex@perex.cz>,	Takashi Iwai
 <tiwai@suse.com>,	Geoff Levand <geoff@infradead.org>,	Thierry Reding
 <treding@nvidia.com>,	Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] sound: make all 'class' structures const
In-Reply-To: <20230620175633.641141-2-gregkh@linuxfoundation.org>
References: <20230620175633.641141-2-gregkh@linuxfoundation.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YKZ5EONIXGIKIMTCFVLLEB5G65BB5AJN
X-Message-ID-Hash: YKZ5EONIXGIKIMTCFVLLEB5G65BB5AJN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YKZ5EONIXGIKIMTCFVLLEB5G65BB5AJN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 20 Jun 2023 19:56:34 +0200,
Greg Kroah-Hartman wrote:
> 
> From: Ivan Orlov <ivan.orlov0322@gmail.com>
> 
> Now that the driver core allows for struct class to be in read-only
> memory, making all 'class' structures to be declared at build time
> placing them into read-only memory, instead of having to be dynamically
> allocated at load time.
> 
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Ivan Orlov <ivan.orlov0322@gmail.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Geoff Levand <geoff@infradead.org>
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
> Cc: alsa-devel@alsa-project.org
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Applied to for-next branch now.  Thanks.


Takashi
