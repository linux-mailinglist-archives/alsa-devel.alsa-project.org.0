Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C7A7A944C
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 14:35:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 075FEA4B;
	Thu, 21 Sep 2023 14:34:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 075FEA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695299747;
	bh=zacGcCQNPddYg6wI6xsuje7lsd2ePZLjuXKCOmBglgY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jLVVY5ornlKBcp9W5efigTcMAH13LvPdWZAIsxwHDD6G43ddFIGwFflRNJFGaY3ZM
	 FVPgqmp3KCmK213SaVWrEB63eMfpq6tHB1/bw5W6aOirvsW4smCRTRt8PUXZpbqNNu
	 RB8VQTJPHeK1fL1JpeAuuDRonAqY9AiVi1FeW6fg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CA96F80124; Thu, 21 Sep 2023 14:34:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A9E9FF801F5;
	Thu, 21 Sep 2023 14:34:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0FCAF8025A; Thu, 21 Sep 2023 14:34:51 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 29E51F80124
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 14:34:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29E51F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=NGGmLTC9;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=7qmWLwF9
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 76DB81FF92;
	Thu, 21 Sep 2023 12:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1695299676;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s3PAjVQpTlMd9Gu0cRfBf3FIuzmNRq3LvspgelyA/Nk=;
	b=NGGmLTC91fXHacMyxxDZTzXktxIYQfRANaaIVE2Hz5+m4SwHrYy3iuH577CzvPtAaTHACz
	i96MUFqBj9A4F2BUcUEA8nA+XMzS6QoWm8Cdu2bK67iDUUYDqLttU9s5PBsKMmahTaX4Sa
	AdCLhLaKzgczY4om35oFOpACBtalbNk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1695299676;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s3PAjVQpTlMd9Gu0cRfBf3FIuzmNRq3LvspgelyA/Nk=;
	b=7qmWLwF9F6iknQ4fUecTouPNdTu6nssyW90AAfQKWubGaWmR4GS1kH3KM60vLrRLAY9Ird
	PVdkZVH8fUa+BlCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 485FF134B0;
	Thu, 21 Sep 2023 12:34:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id ueK6EFw4DGXcHAAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 21 Sep 2023 12:34:36 +0000
Date: Thu, 21 Sep 2023 14:34:35 +0200
Message-ID: <87pm2bzov8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: <arnd@arndb.de>,
	<treding@nvidia.com>,
	<llvm@lists.linux.dev>,
	<oe-kbuild-all@lists.linux.dev>,
	<alsa-devel@alsa-project.org>
Subject: Re: [tiwai-sound:for-next 36/38]
 sound/pci/hda/cirrus_scodec_test.c:151:60: error: initializer element is not
 a compile-time constant
In-Reply-To: <0a4644bc-d345-9988-2eb6-e95c8db06219@opensource.cirrus.com>
References: <202309210751.TXlnuEMF-lkp@intel.com>
	<0a4644bc-d345-9988-2eb6-e95c8db06219@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: STYBL4I4NGRRT4RINAGIMA2IJI3KB4YH
X-Message-ID-Hash: STYBL4I4NGRRT4RINAGIMA2IJI3KB4YH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/STYBL4I4NGRRT4RINAGIMA2IJI3KB4YH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 21 Sep 2023 11:23:14 +0200,
Richard Fitzgerald wrote:
> 
> On 21/9/23 00:35, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
> > head:   72f6a13022f3bf16df305b75c32f95ece263a5ce
> > commit: 2144833e7b41459fa2d52bb0676f0ab4920cf32c [36/38] ALSA: hda: cirrus_scodec: Add KUnit test
> > config: hexagon-randconfig-r041-20211219 (https://download.01.org/0day-ci/archive/20230921/202309210751.TXlnuEMF-lkp@intel.com/config)
> > compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309210751.TXlnuEMF-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202309210751.TXlnuEMF-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >     In file included from sound/pci/hda/cirrus_scodec_test.c:9:
> >     In file included from include/linux/gpio/driver.h:6:
> >     In file included from include/linux/irqchip/chained_irq.h:10:
> >     In file included from include/linux/irq.h:20:
> >     In file included from include/linux/io.h:13:
> >     In file included from arch/hexagon/include/asm/io.h:337:
> >     include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
> >             val = __raw_readb(PCI_IOBASE + addr);
> >                               ~~~~~~~~~~ ^
> >     include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
> >             val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
> >                                                             ~~~~~~~~~~ ^
> >     include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
> >     #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
> >                                                       ^
> 
> This looks like it has nothing to do with cirrus_scodec_test, it's just
> unfortunate that including gpio/driver.h results in also including io.h.

Yeah, I believe this part is irrelevant can be ignored.  It's included
as a part of (single) log.

Only the line indicated with the marker ">>" is interesting, and
that's what Andy already fixed in properties.h.


thanks,

Takashi
