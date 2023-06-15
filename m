Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07851730F8F
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jun 2023 08:42:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FF766C0;
	Thu, 15 Jun 2023 08:42:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FF766C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686811377;
	bh=xcbySdb/HHlzi5qoxQbAinRwZ3b3xw5SsDsTJEs/uMI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=elZPk2IvEY/PSxw3jO7PQZkO+76lJCw6flD060LD+2mBJQqRx9n7uk6o6EDBcCQo5
	 LLCiyfKXUUdNRxw52L3PGm9wcJYvm7XlhznwWlTKIHprc1B2UDcYna048MO/CsctYV
	 3+PnudfKm7PZDX1uAuRcJw9Dpat26139Qd93SCVA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB50AF80246; Thu, 15 Jun 2023 08:42:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FBDDF80130;
	Thu, 15 Jun 2023 08:42:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39D4CF800BA; Thu, 15 Jun 2023 08:41:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F6BDF800BA
	for <alsa-devel@alsa-project.org>; Thu, 15 Jun 2023 08:41:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F6BDF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=17hpmG/M;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=sZitHZ+Z
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 59FCC1F381;
	Thu, 15 Jun 2023 06:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686811313;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ft/zj4ilzEumTWLpEQ07nLe+sIIdIKTeXHm4HA2N188=;
	b=17hpmG/Maa7k+KgeOcBx2Qx6wOPTd9n9rIMnpJNKnxLDW00TA6tw8GbwgCDwMxvj79LO/T
	tHobk0dCZEbtSR1g7jLCIFiJFSWvmW30QMYq38dqqB/qmz0Yo7adaLr/V/pAWNivyKVp9M
	75q7VDLJ2KLfDZ1WZu4LJR7Lm7ntpbo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686811313;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ft/zj4ilzEumTWLpEQ07nLe+sIIdIKTeXHm4HA2N188=;
	b=sZitHZ+ZzbnztOhMC8NH8z4v1JHREWOq2w+ssNFnk6QfFeJFf8rdYCt0+VgX31Y9Jph5IF
	PvUh+e1jO3DriiCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1B68B13467;
	Thu, 15 Jun 2023 06:41:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id /rG8BbGyimS9eAAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 15 Jun 2023 06:41:53 +0000
Date: Thu, 15 Jun 2023 08:41:52 +0200
Message-ID: <87r0qd8bwv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Su Hui <suhui@nfschina.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	maciej.szmigiero@oracle.com,
	yangyingliang@huawei.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ALSA: ac97: Fix possible NULL dereference in
 snd_ac97_mixer
In-Reply-To: <20230615021732.1972194-1-suhui@nfschina.com>
References: <20230615021732.1972194-1-suhui@nfschina.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 3XB2FRMZLVBHGS7WW5OL6OAAEC5RJ6S5
X-Message-ID-Hash: 3XB2FRMZLVBHGS7WW5OL6OAAEC5RJ6S5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3XB2FRMZLVBHGS7WW5OL6OAAEC5RJ6S5/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 15 Jun 2023 04:17:32 +0200,
Su Hui wrote:
> 
> smatch error:
> sound/pci/ac97/ac97_codec.c:2354 snd_ac97_mixer() error:
> we previously assumed 'rac97' could be null (see line 2072)
> 
> remove redundant assignment, return error if rac97 is NULL.
> 
> Fixes: da3cec35dd3c ("ALSA: Kill snd_assert() in sound/pci/*")
> Signed-off-by: Su Hui <suhui@nfschina.com>

Thanks, applied.


Takashi
