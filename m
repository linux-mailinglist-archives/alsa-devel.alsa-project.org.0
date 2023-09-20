Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A766C7A771F
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Sep 2023 11:21:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 349099F6;
	Wed, 20 Sep 2023 11:20:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 349099F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695201695;
	bh=Hr2UUw9qIauKTgRGDlCtf3xpf//KiY9iggzKcyXPGdg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gjkNKafPxEe/Yu/7kV5W+jXhIUmCmHVtim4t3AYMi8jD6ps7+XnrSrNVnhQiIhikZ
	 XamlLbSE989eGbq8aBppJMiWxQKWqG8A/1rhxX5hr3a7mD77fucUObbyqVF9Xzzayf
	 CpDn3SEMmsXGaChpBdfUUD0H4nehYMzDgw6ohWnc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95A5DF801F5; Wed, 20 Sep 2023 11:20:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D952F801F5;
	Wed, 20 Sep 2023 11:20:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38BE5F8025A; Wed, 20 Sep 2023 11:20:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5752EF800F4
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 11:20:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5752EF800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=iMkzUEIn;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=8lRH7N3Q
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 50C7A22289;
	Wed, 20 Sep 2023 09:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1695201617;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jbbGch/Q6HVLRHkYXyo2S8jneaurE4SIb9nFvhy/6gI=;
	b=iMkzUEInCexmZiRYaYpiG+g9/YGV6iXXrwykmYa4XgglV23nD7zxdeOBZOyxfPFVs1+b2P
	/vVaHsLK2EDUQLQQhWgUur497XbJJbT6lUYBRnTxWbAo9y1SiAsdqSnoxfBkGCJPZc0C7h
	oXqxAfX9loiHyQ5CLBd/becvcvt3ar8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1695201617;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jbbGch/Q6HVLRHkYXyo2S8jneaurE4SIb9nFvhy/6gI=;
	b=8lRH7N3Qy8AvnPPrXnCmFsgvnqYroFFstpu248A0+rqwGGOhmhQSks3/fC0I3zWpedGQoX
	rRZP+Tw8vEheuNCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1D5521333E;
	Wed, 20 Sep 2023 09:20:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id EQAHBlG5CmXCcQAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 20 Sep 2023 09:20:17 +0000
Date: Wed, 20 Sep 2023 11:20:16 +0200
Message-ID: <87led1urov.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<patches@opensource.cirrus.com>,
	<linux-kernel@vger.kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ALSA: hda: cirrus_scodec: Select GPIOLIB for KUnit test
In-Reply-To: <20230920090338.29345-1-rf@opensource.cirrus.com>
References: <20230920090338.29345-1-rf@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: DGJWWT3DK4GAW7M55T5UMOLJDX5BD7JH
X-Message-ID-Hash: DGJWWT3DK4GAW7M55T5UMOLJDX5BD7JH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DGJWWT3DK4GAW7M55T5UMOLJDX5BD7JH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 20 Sep 2023 11:03:38 +0200,
Richard Fitzgerald wrote:
> 
> The KUnit test for cirrus_scodec uses GPIO library functions so select
> GPIOLIB in Kconfig.
> 
> This fixes the ld failures on builds that didn't already select GPIOLIB.
>  ld: vmlinux.o: in function `cirrus_scodec_test_gpio_get':
>  sound/pci/hda/cirrus_scodec_test.c:40: undefined reference to
> 	`gpiochip_get_data'
>  ld: vmlinux.o: in function `cirrus_scodec_test_gpio_probe':
>  sound/pci/hda/cirrus_scodec_test.c:94: undefined reference to
> 	`gpiochip_generic_request'
>  ld: sound/pci/hda/cirrus_scodec_test.c:94: undefined reference to
> 	`gpiochip_generic_free'
>  ld: sound/pci/hda/cirrus_scodec_test.c:95: undefined reference to
> 	`devm_gpiochip_add_data_with_key'
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202309201646.NnjfKPWk-lkp@intel.com/
> Fixes: 2144833e7b41 ("ALSA: hda: cirrus_scodec: Add KUnit test")

Thanks, applied now.


Takashi
