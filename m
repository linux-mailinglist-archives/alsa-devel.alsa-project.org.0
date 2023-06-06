Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F19B7244AD
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 15:40:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C49AB820;
	Tue,  6 Jun 2023 15:39:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C49AB820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686058846;
	bh=9tz5M7ilSwzPlHqqRiPI0BDy14TDPiwoxvlm/CeEB6g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=caq8sECV7wBHy47GpX/CmAXdlJilj+H4xRNnO6J/ZyDl3cmmaJxOyicecLQ24lZyG
	 es5gUu7/gXC2v+CG70ObAbjYEi+1Lacoh0z+97Au0BH3gRzMKZa9faH0q0Z9bTduGK
	 ug8+OSkf1gQw7MwMVguxnr7lyllc+Lcm3BEQro0Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2283F80155; Tue,  6 Jun 2023 15:39:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59978F8016C;
	Tue,  6 Jun 2023 15:39:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7793BF80199; Tue,  6 Jun 2023 15:39:25 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 78BE4F80155
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 15:39:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78BE4F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Zc+8aKUH;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=FcI4YqYO
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BFE391FD69;
	Tue,  6 Jun 2023 13:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686058759;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X3xzDKlG3PpmAUkZbQkkaHOVBGjwGcwG319m5fFmdYQ=;
	b=Zc+8aKUHA5399nKts4U33rFj2llZdKPQCtRRs7luCssnsdhlKwsdsaB4yiuo2soiFabSgw
	P6PH6NuDfC4JKTZW4x6P89Hbrh+GQ9YQdu4ok/ka4bagpMeGLxEso50pbBH9Q6rPc4ZqOx
	2F8+wEEQIPpoBq1HMIA37OzSBFA33Fk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686058759;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X3xzDKlG3PpmAUkZbQkkaHOVBGjwGcwG319m5fFmdYQ=;
	b=FcI4YqYOl7VOP9UjTFBiGHlwjSb79wLlLuiIe25aWYi/8zXKnO5IaDj3RcPeWsgMGpd+Eq
	+QmoJnwVS8S57DCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 910CF13776;
	Tue,  6 Jun 2023 13:39:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id /JZpIgc3f2R1YgAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 06 Jun 2023 13:39:19 +0000
Date: Tue, 06 Jun 2023 15:39:19 +0200
Message-ID: <87wn0gg16g.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Yanteng Si <siyanteng@loongson.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	chenhuacai@loongson.cn,
	alsa-devel@alsa-project.org,
	loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn,
	Yingkun Meng <mengyingkun@loongson.cn>
Subject: Re: [PATCH v2 2/4] ALSA: hda: Using polling mode for loongson
 controller by default
In-Reply-To: 
 <521be42ac818d35a996e01cc3d591e1c87f230d9.1686057365.git.siyanteng@loongson.cn>
References: <cover.1686057365.git.siyanteng@loongson.cn>
	<521be42ac818d35a996e01cc3d591e1c87f230d9.1686057365.git.siyanteng@loongson.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: MA4R2KBQXIYOBGPDSOAYBFHWJQIDBJWS
X-Message-ID-Hash: MA4R2KBQXIYOBGPDSOAYBFHWJQIDBJWS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MA4R2KBQXIYOBGPDSOAYBFHWJQIDBJWS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 06 Jun 2023 15:25:28 +0200,
Yanteng Si wrote:
> 
> On loongson controller, RIRBSTS.RINTFL cannot be cleared,
> azx_interrupt() is called all the time. We disable RIRB
> interrupt, and use polling mode by default.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Signed-off-by: Yingkun Meng <mengyingkun@loongson.cn>
> ---
>  include/sound/hdaudio.h     | 1 +
>  sound/hda/hdac_controller.c | 5 ++++-
>  sound/pci/hda/hda_intel.c   | 4 ++++
>  3 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
> index 97f09acae302..a1dcc7f97d08 100644
> --- a/include/sound/hdaudio.h
> +++ b/include/sound/hdaudio.h
> @@ -346,6 +346,7 @@ struct hdac_bus {
>  	bool reverse_assign:1;		/* assign devices in reverse order */
>  	bool corbrp_self_clear:1;	/* CORBRP clears itself after reset */
>  	bool polling_mode:1;
> +	bool no_intr_polling_mode:1;

It isn't clear enough what this flag does.  It's basically prohibiting
the RIRB IRQ (hence requiring the polling mode), right?  Write it in
the comment.

> diff --git a/sound/hda/hdac_controller.c b/sound/hda/hdac_controller.c
> index 3c7af6558249..705e09cc50ac 100644
> --- a/sound/hda/hdac_controller.c
> +++ b/sound/hda/hdac_controller.c
> @@ -79,7 +79,10 @@ void snd_hdac_bus_init_cmd_io(struct hdac_bus *bus)
>  	/* set N=1, get RIRB response interrupt for new entry */
>  	snd_hdac_chip_writew(bus, RINTCNT, 1);
>  	/* enable rirb dma and response irq */
> -	snd_hdac_chip_writeb(bus, RIRBCTL, AZX_RBCTL_DMA_EN | AZX_RBCTL_IRQ_EN);
> +	if (bus->no_intr_polling_mode)
> +		snd_hdac_chip_writeb(bus, RIRBCTL, AZX_RBCTL_DMA_EN);
> +	else
> +		snd_hdac_chip_writeb(bus, RIRBCTL, AZX_RBCTL_DMA_EN | AZX_RBCTL_IRQ_EN);
>  	/* Accept unsolicited responses */
>  	snd_hdac_chip_updatel(bus, GCTL, AZX_GCTL_UNSOL, AZX_GCTL_UNSOL);
>  	spin_unlock_irq(&bus->reg_lock);
> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> index 9c353dc7740c..1e8993836fc6 100644
> --- a/sound/pci/hda/hda_intel.c
> +++ b/sound/pci/hda/hda_intel.c
> @@ -1875,6 +1875,10 @@ static int azx_first_init(struct azx *chip)
>  	if (chip->driver_type == AZX_DRIVER_GFHDMI)
>  		bus->polling_mode = 1;
>  
> +	if (chip->driver_type == AZX_DRIVER_LOONGSON) {
> +		bus->no_intr_polling_mode = 1;
> +	}

Don't you need to set the bus->polling_mode?


thanks,

Takashi
