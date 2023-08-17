Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E099077F0B7
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Aug 2023 08:49:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52751828;
	Thu, 17 Aug 2023 08:48:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52751828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692254961;
	bh=REGKTKZRDYOUBOKpdNMXVIbWTSV3zWUTRhQObmLaR0U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aFdg/ewbYCqO5iGCI4lJhdGjaYkglcXs0WW8D+9EzTLfaU6CFp3eSQf7XSGny5hMp
	 Y6j85tKxdguyhvrEDpcSSfTC+udHg/mS4TArNXNURXEPzWnK1q68v4L/pv8z0G5dVc
	 /JuewfWvpg4/JP0qjbtxPJU72YQbUrXUofb+qH00=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3A2AF80272; Thu, 17 Aug 2023 08:48:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D981F8016A;
	Thu, 17 Aug 2023 08:48:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 232D2F8016D; Thu, 17 Aug 2023 08:47:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 24910F80027
	for <alsa-devel@alsa-project.org>; Thu, 17 Aug 2023 08:47:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24910F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=BKtiayC1;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=eH78f4eu
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DF8202184E;
	Thu, 17 Aug 2023 06:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692254823;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s3aoRbCsKPHILzVFtPRgXD8NBhNgXibhwBUQ5R+gG6E=;
	b=BKtiayC1WwdJnaYiK53crl78e7fehB0Y9xycfNGrtW5ebBI6bnR3eGw6X4RlYmu6jMyras
	v8nzav1eU9qnkyNsd2ZUa+Bk8iMvbrGRoEEpaTye+w7qalghd9t/Of2V91rdXmbMOPFmrP
	ApzdXb5ELDm2wWcriOP5ph8vVW+A2O8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692254823;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s3aoRbCsKPHILzVFtPRgXD8NBhNgXibhwBUQ5R+gG6E=;
	b=eH78f4eu9Ob/6QKS0itaCm00GE2a/F9Bofm/s2/8Nc7hdRgXM3vOHKMGtqP9PVXTNw5Vkx
	9fehlsDxFbsHx/CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B47FF1358B;
	Thu, 17 Aug 2023 06:47:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id H1K3KmfC3WTdIwAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 17 Aug 2023 06:47:03 +0000
Date: Thu, 17 Aug 2023 08:47:03 +0200
Message-ID: <87bkf6w4go.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ruan Jinjie <ruanjinjie@huawei.com>
Cc: <alsa-devel@alsa-project.org>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH -next] ALSA: pcmtest: Drop unnecessary error check for
 debugfs_create_dir
In-Reply-To: <20230817063922.282746-1-ruanjinjie@huawei.com>
References: <20230817063922.282746-1-ruanjinjie@huawei.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: YSRVXQZT763RTTU3ZN4TFMWY2XHSPILH
X-Message-ID-Hash: YSRVXQZT763RTTU3ZN4TFMWY2XHSPILH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YSRVXQZT763RTTU3ZN4TFMWY2XHSPILH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 17 Aug 2023 08:39:22 +0200,
Ruan Jinjie wrote:
> 
> This patch removes the error checking for debugfs_create_dir in
> pcmtest.c. This is because the DebugFS kernel API is developed
> in a way that the caller can safely ignore the errors that
> occur during the creation of DebugFS nodes. The debugfs APIs have
> a IS_ERR() judge in start_creating() which can handle it
> gracefully. So these checks are unnecessary.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>

I believe debugfs is mandatory in this case (it's a test module that
manipulates / gets notification via debugfs), hence it makes sense to
check the error.

Maybe we should add a dependency on CONFIG_DEBUG_FS in Kconfig?


thanks,

Takashi

> ---
>  sound/drivers/pcmtest.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
> index 7f170429eb8f..9360b3bb771e 100644
> --- a/sound/drivers/pcmtest.c
> +++ b/sound/drivers/pcmtest.c
> @@ -669,8 +669,6 @@ static int init_debug_files(int buf_count)
>  	char len_file_name[32];
>  
>  	driver_debug_dir = debugfs_create_dir("pcmtest", NULL);
> -	if (IS_ERR(driver_debug_dir))
> -		return PTR_ERR(driver_debug_dir);
>  	debugfs_create_u8("pc_test", 0444, driver_debug_dir, &playback_capture_test);
>  	debugfs_create_u8("ioctl_test", 0444, driver_debug_dir, &ioctl_reset_test);
>  
> -- 
> 2.34.1
> 
