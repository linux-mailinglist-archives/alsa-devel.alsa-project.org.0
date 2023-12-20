Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD54819A3D
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Dec 2023 09:15:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F50E836;
	Wed, 20 Dec 2023 09:14:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F50E836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703060109;
	bh=JGXWoqYx/nNn1D9cxcQE2BENiUK4DrQlVhOIF7wk8Ws=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZnRgJ8SKj4QV4PPRBizRUdAAEAxX3/V9y5aRKW9ZNsJGgnBlzHkKhrf+Jx3TeQeth
	 9oVhTcrX0kDBUsfeR7U4M0U4Zhz5grWWp/+JakSPeb/hVcDiXatPzt/1/oBvl5fZsB
	 45O4jlA/yrx/7aOe6oADJfpqbqmAPlhbJBoEKEBc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7E90F80568; Wed, 20 Dec 2023 09:14:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42CBFF8057F;
	Wed, 20 Dec 2023 09:14:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EE90F80425; Wed, 20 Dec 2023 09:10:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B32BF800D2
	for <alsa-devel@alsa-project.org>; Wed, 20 Dec 2023 09:10:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B32BF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=yP2pDTrU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=SB7ag+G9;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=yP2pDTrU;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=SB7ag+G9
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 67C2B21EA6;
	Wed, 20 Dec 2023 08:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1703059838;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OeeY1coWVj10KFZo2dtcob3FMIN2wLZHWXWf9T04zvM=;
	b=yP2pDTrUVDVPCBGsaRh8ZGIkRH/EwbtfNgfd9Z5QI+YXYyL1XkOfLQBvooZcyPosXp3mMR
	NTOkqmj1R7q2HEbRRrqcA9pK6g28iIH0d8nvCJeqh+eGDaHXMwg5+kNNyutMaLGZX3fDbx
	eVSn6Oy+hCb5lCz9YPOhF1TL18d9V5A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1703059838;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OeeY1coWVj10KFZo2dtcob3FMIN2wLZHWXWf9T04zvM=;
	b=SB7ag+G9nSt4alG06a8lMZHCwSaALRB1YxOVb42A2/CXu+IGHVgRzNRQZZA4Viy+6NX3AG
	Dxzhq5Xhp2siinDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1703059838;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OeeY1coWVj10KFZo2dtcob3FMIN2wLZHWXWf9T04zvM=;
	b=yP2pDTrUVDVPCBGsaRh8ZGIkRH/EwbtfNgfd9Z5QI+YXYyL1XkOfLQBvooZcyPosXp3mMR
	NTOkqmj1R7q2HEbRRrqcA9pK6g28iIH0d8nvCJeqh+eGDaHXMwg5+kNNyutMaLGZX3fDbx
	eVSn6Oy+hCb5lCz9YPOhF1TL18d9V5A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1703059838;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OeeY1coWVj10KFZo2dtcob3FMIN2wLZHWXWf9T04zvM=;
	b=SB7ag+G9nSt4alG06a8lMZHCwSaALRB1YxOVb42A2/CXu+IGHVgRzNRQZZA4Viy+6NX3AG
	Dxzhq5Xhp2siinDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 467B913722;
	Wed, 20 Dec 2023 08:10:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7ficEH6hgmW1RwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 20 Dec 2023 08:10:38 +0000
Date: Wed, 20 Dec 2023 09:10:37 +0100
Message-ID: <s5h8r5puwea.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1 2/2] ALSA: hda: cs35l41: Only add SPI CS GPIO if SPI is
 enabled in kernel
In-Reply-To: <20231219162232.790358-3-sbinding@opensource.cirrus.com>
References: <20231219162232.790358-1-sbinding@opensource.cirrus.com>
	<20231219162232.790358-3-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-0.01 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.91)[86.10%]
Authentication-Results: smtp-out1.suse.de;
	none
Message-ID-Hash: HOXQTAS4RDFWRLWMZRAIGCOJZJV2P6QU
X-Message-ID-Hash: HOXQTAS4RDFWRLWMZRAIGCOJZJV2P6QU
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HOXQTAS4RDFWRLWMZRAIGCOJZJV2P6QU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 19 Dec 2023 17:22:32 +0100,
Stefan Binding wrote:
> 
> If CONFIG_SPI is not set in the kernel, there is no point in trying
> to set the chip selects. We can selectively compile it.

I guess it should with IS_REACHABLE() instead of IS_ENABLED()?
It can be still CONFIG_SPI=m while CONFIG_SND_HDA_*=y.


thanks,

Takashi


> 
> Fixes: 8c4c216db8fb ("ALSA: hda: cs35l41: Add config table to support many laptops without _DSD")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312192256.lJelQEoZ-lkp@intel.com/
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> ---
>  sound/pci/hda/cs35l41_hda_property.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
> index 73b304e6c83c..194e1179a253 100644
> --- a/sound/pci/hda/cs35l41_hda_property.c
> +++ b/sound/pci/hda/cs35l41_hda_property.c
> @@ -210,6 +210,8 @@ static int generic_dsd_config(struct cs35l41_hda *cs35l41, struct device *physde
>  
>  	if (cfg->bus == SPI) {
>  		cs35l41->index = id;
> +
> +#if IS_ENABLED(CONFIG_SPI)
>  		/*
>  		 * Manually set the Chip Select for the second amp <cs_gpio_index> in the node.
>  		 * This is only supported for systems with 2 amps, since we cannot expand the
> @@ -249,6 +251,7 @@ static int generic_dsd_config(struct cs35l41_hda *cs35l41, struct device *physde
>  				spi_setup(spi);
>  			}
>  		}
> +#endif
>  	} else {
>  		if (cfg->num_amps > 2)
>  			/*
> -- 
> 2.34.1
> 
