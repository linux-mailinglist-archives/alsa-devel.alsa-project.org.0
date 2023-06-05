Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE26721F6B
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 09:22:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C7973E8;
	Mon,  5 Jun 2023 09:21:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C7973E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685949742;
	bh=9I+WY78IyCFLqeC7tG4g96i0xirphXYSDDp4BtTTAZc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=usrfOwdv4z8OLI0FEdufbJkXLiJBCUTf1/46TSQ1KzFY2AMbE5dBI06LqNAYK2hx6
	 pUbmpoZGdTKpn5q6pcm2CfrrwvvEXGUm6XIz3RmpE6RJXH23mvTU0hzeUx9+xUJc6B
	 qjWbOMAufsuzUBJ0Iz6mJr6FzHbPmritxH2y5T6I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC615F80130; Mon,  5 Jun 2023 09:21:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF36DF8016C;
	Mon,  5 Jun 2023 09:21:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A68ECF80199; Mon,  5 Jun 2023 09:21:28 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 6B059F80130
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 09:21:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B059F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=GLlHDA3M;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=cjKJXDE8
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 74E9F1F8AE;
	Mon,  5 Jun 2023 07:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1685949685;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UYDbnuU9fxM3O749pKYl9Dg/BsDW7P3xdvEx+Q4AYYA=;
	b=GLlHDA3Mjnv2FZkoS1Fr+X/G42wTIB30Sf8urcZ4QAmcFimlS1x/URNy2c8ayc1RrENS1J
	+gXQRkWOd2/cSWDf36xqO0T2j8Z/BjXm+AcVqe7l2OMrDtu2Tzs2JkgzMevv+F1Vtlxd5B
	EhHQASC0K9C6q7vZWA7byLT0zZNEYTY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1685949685;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UYDbnuU9fxM3O749pKYl9Dg/BsDW7P3xdvEx+Q4AYYA=;
	b=cjKJXDE8KtGJsBeGabZtD/r2XBSy2JIqD//MJMQPIEAfun+gK/MADSxi6RoWRJBKGhSQc9
	7ycWLci6pPBXJqBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4BADC139C7;
	Mon,  5 Jun 2023 07:21:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 9QGQEfWMfWSzaAAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 05 Jun 2023 07:21:25 +0000
Date: Mon, 05 Jun 2023 09:21:24 +0200
Message-ID: <87zg5eidcb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH RESEND v1 2/3] ALSA: hda: cs35l41: Fix endian conversions
In-Reply-To: <20230525135955.2108140-3-sbinding@opensource.cirrus.com>
References: <20230525135955.2108140-1-sbinding@opensource.cirrus.com>
	<20230525135955.2108140-3-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: RUIDG76XNL4M5XFBVJXZH37UNS2J5T5I
X-Message-ID-Hash: RUIDG76XNL4M5XFBVJXZH37UNS2J5T5I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RUIDG76XNL4M5XFBVJXZH37UNS2J5T5I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 25 May 2023 15:59:54 +0200,
Stefan Binding wrote:
> 
> @@ -379,10 +379,10 @@ static int cs35l41_save_calibration(struct cs35l41_hda *cs35l41)
>  
>  				/* Calibration can only be applied whilst the DSP is not running */
>  				ret = cs35l41_apply_calibration(cs35l41,
> -								cpu_to_be32(cl->calAmbient),
> -								cpu_to_be32(cl->calR),
> -								cpu_to_be32(cl->calStatus),
> -								cpu_to_be32(cl->calR + 1));
> +								(__be32)cpu_to_be32(cl->calAmbient),
> +								(__be32)cpu_to_be32(cl->calR),
> +								(__be32)cpu_to_be32(cl->calStatus),
> +								(__be32)cpu_to_be32(cl->calR + 1));

Do we really need those cast?  Even if yes, it must be with __force
prefix for the endian cast in general.


thanks,

Takashi
