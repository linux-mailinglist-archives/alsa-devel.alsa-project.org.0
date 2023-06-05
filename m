Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D569721FB4
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 09:36:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03513839;
	Mon,  5 Jun 2023 09:36:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03513839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685950615;
	bh=NyomJYK9szSjfWnE0Z1znTjPFT8sv2akv6aSWkNeEWQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HcLLVVc7WvJLk8dEM/3D8+2vULi9ri86vrs5MS0Qxgh3ncFPPioJFNnV7l6F88DFX
	 B1eQrovM/bUsYM3ecYVECIhXdvYSFaWBzZHaE0U6BiQKQnEennCelhMP/apSh374OE
	 z924tr1m6dm9OsI/Tg0zDFQM6ivps7sz5i04fSdI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B483F80527; Mon,  5 Jun 2023 09:35:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AF906F8016C;
	Mon,  5 Jun 2023 09:35:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62201F80199; Mon,  5 Jun 2023 09:35:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9BCB1F80130
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 09:35:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BCB1F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=oknVIiiw;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=D340LMFo
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 54B1221AF9;
	Mon,  5 Jun 2023 07:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1685950550;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WM1VYeRiPI0gK99qp7cgaYfMmsErgvMnsEQDPIt+seI=;
	b=oknVIiiwTETtKr7f/yaPAdZt+Jj+icPNX0KAlzqjajWRj4GvccRNjFFWH34P4BcIRvwll8
	p4NJshNjcdJfrDd4GeYPAmcxPXpfyUTiyPcoiPunUcMphn0g0AfvFj5m+xzuvciG9EobNZ
	z1AL/zAtnWMneYwrgRqtJxgx67nl1aY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1685950550;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WM1VYeRiPI0gK99qp7cgaYfMmsErgvMnsEQDPIt+seI=;
	b=D340LMFovvwGSx42EOj2ZswqC4Pr+bGevLyIwkgH32/QSUl09QE+B5j+HBKZ1Av1NdHSFs
	EhschHQPi7qlzlAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1EC34139C7;
	Mon,  5 Jun 2023 07:35:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id r7yTBlaQfWSxbwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 05 Jun 2023 07:35:50 +0000
Date: Mon, 05 Jun 2023 09:35:49 +0200
Message-ID: <87sfb6icoa.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Yanteng Si <siyanteng@loongson.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	chenhuacai@loongson.cn,
	alsa-devel@alsa-project.org,
	loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn,
	Yingkun Meng <mengyingkun@loongson.cn>
Subject: Re: [PATCH 2/4] ALSA: hda: Using polling mode for loongson controller
 by default
In-Reply-To: 
 <ad85194e2da2118ff49f127ffd74727e298a3ea5.1685501806.git.siyanteng@loongson.cn>
References: <cover.1685501806.git.siyanteng@loongson.cn>
	<ad85194e2da2118ff49f127ffd74727e298a3ea5.1685501806.git.siyanteng@loongson.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 3WVFBGVDIXBCH5RDBS6XWBWBRX5O4G3B
X-Message-ID-Hash: 3WVFBGVDIXBCH5RDBS6XWBWBRX5O4G3B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3WVFBGVDIXBCH5RDBS6XWBWBRX5O4G3B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 31 May 2023 05:21:32 +0200,
Yanteng Si wrote:
> 
> On loongson controller, RIRBSTS.RINTFL cannot be cleared,
> azx_interrupt() is called all the time. We disable RIRB
> interrupt, and use polling mode by default.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Signed-off-by: Yingkun Meng <mengyingkun@loongson.cn>
> ---
>  sound/hda/hdac_controller.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/hda/hdac_controller.c b/sound/hda/hdac_controller.c
> index 3c7af6558249..dbaa19cb8162 100644
> --- a/sound/hda/hdac_controller.c
> +++ b/sound/hda/hdac_controller.c
> @@ -10,6 +10,7 @@
>  #include <sound/hdaudio.h>
>  #include <sound/hda_register.h>
>  #include "local.h"
> +#include "../pci/hda/hda_controller.h"
>  
>  /* clear CORB read pointer properly */
>  static void azx_clear_corbrp(struct hdac_bus *bus)
> @@ -42,6 +43,8 @@ static void azx_clear_corbrp(struct hdac_bus *bus)
>   */
>  void snd_hdac_bus_init_cmd_io(struct hdac_bus *bus)
>  {
> +	struct azx *chip = bus_to_azx(bus);

You can't convert in this way in the generic HD-audio bus code in
sound/hda/*.  The struct azx is specific to sound/pci/hda/*.


>  	WARN_ON_ONCE(!bus->rb.area);
>  
>  	spin_lock_irq(&bus->reg_lock);
> @@ -79,7 +82,10 @@ void snd_hdac_bus_init_cmd_io(struct hdac_bus *bus)
>  	/* set N=1, get RIRB response interrupt for new entry */
>  	snd_hdac_chip_writew(bus, RINTCNT, 1);
>  	/* enable rirb dma and response irq */
> -	snd_hdac_chip_writeb(bus, RIRBCTL, AZX_RBCTL_DMA_EN | AZX_RBCTL_IRQ_EN);
> +	if (chip->driver_caps & AZX_DCAPS_LOONGSON_WORKAROUND)
> +		snd_hdac_chip_writeb(bus, RIRBCTL, AZX_RBCTL_DMA_EN);
> +	else
> +		snd_hdac_chip_writeb(bus, RIRBCTL, AZX_RBCTL_DMA_EN | AZX_RBCTL_IRQ_EN);

That is, for some device-specific workaround like this, you'd need to
introduce a new flag in struct hdac_bus, set up in the
sound/pci/hda/hda_intel.c instead.


thanks,

Takashi
