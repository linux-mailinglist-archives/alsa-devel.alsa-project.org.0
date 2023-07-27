Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBB776506B
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jul 2023 11:56:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB1FA843;
	Thu, 27 Jul 2023 11:55:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB1FA843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690451774;
	bh=a5qLxM5zI8RlfHgdZ6HoaHnzmCP4YGFjBkOSk7lzSFU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AqgOLaKbm/lraSJrZJKjkhrhoHH/dEoguxIaNUD3PsUjGH2Z2P+JNyTJIjv9nQgy1
	 HTfG1DYUHjjxMxkAlcUncYnGaCHzsq1LA024ENhCEM+0dkRuUqqRNsHxUNaHSKAAZ2
	 KdH5wkauixNmvJBvlLsWSYgDeLXDkCSvwh9lwjMw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4742CF80535; Thu, 27 Jul 2023 11:55:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9A30F80163;
	Thu, 27 Jul 2023 11:55:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73E49F8019B; Thu, 27 Jul 2023 11:54:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93A2EF80149
	for <alsa-devel@alsa-project.org>; Thu, 27 Jul 2023 11:54:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93A2EF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=txAKfRKf;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=xi//VXiV
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B90DC1F383;
	Thu, 27 Jul 2023 09:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690451694;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vnfmdu0vsAQ3YswW3o395wjQ3f3E8+rwFcL/SgdccDk=;
	b=txAKfRKfbmIkMnnCMDyEPaVpdaT/WvimH8A30mD4SzgMv+JQF+FF2ZI9YjeKhY1jeimLOV
	jq148RlwE44ZRwHMJtgaLYTVIPy8ylb5ZEeIxdC4rQPq9AITfQC88Jr754BPMOMhfq4I23
	XabRr0pLg2WA1OE/7OiLHsfsLhp+9cg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690451694;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vnfmdu0vsAQ3YswW3o395wjQ3f3E8+rwFcL/SgdccDk=;
	b=xi//VXiVOFawp1f9eFrm8Cral/u2FSsoinP0eRetzlNvQNskUec5x+q/fMbprVSh/fU1CS
	cCmsLt/zmXUS1wDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 56A7A138E5;
	Thu, 27 Jul 2023 09:54:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id RTofFO4+wmRpegAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 27 Jul 2023 09:54:54 +0000
Date: Thu, 27 Jul 2023 11:54:53 +0200
Message-ID: <87cz0d65n6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Simon Trimmer <simont@opensource.cirrus.com>,
	James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/cs35l56: Do some clean up on probe error
In-Reply-To: <465160f4-b7cf-41d5-931e-d6c9e68fa3c7@moroto.mountain>
References: <465160f4-b7cf-41d5-931e-d6c9e68fa3c7@moroto.mountain>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 52VIF7QYYUGP62PH7V2SMZL7LINVSCGT
X-Message-ID-Hash: 52VIF7QYYUGP62PH7V2SMZL7LINVSCGT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/52VIF7QYYUGP62PH7V2SMZL7LINVSCGT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 27 Jul 2023 09:16:33 +0200,
Dan Carpenter wrote:
> 
> Smatch complains that this return should be a goto:
> 
>     sound/pci/hda/cs35l56_hda.c:910 cs35l56_hda_common_probe()
>     warn: missing unwind goto?
> 
> The goto error disables cansleep so that seems reasonable.
> 
> Fixes: 73cfbfa9caea ("ALSA: hda/cs35l56: Add driver for Cirrus Logic CS35L56 amplifier")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks, applied now.


Takashi
