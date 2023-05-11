Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B59B6FF6B4
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 18:03:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B845EF6;
	Thu, 11 May 2023 18:02:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B845EF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683820999;
	bh=CBV8odCl3RFWLtwP1mzoXMUxsoBoXZy3BrC1q2dOfcg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gd2jWfOX4KKGwa5SqcblKygFt/wAoiK33i9kRLie2bWzERUaAWwcYU8VzOyVTcK/7
	 dwzdiU3im9T0d4E8qHJLeXmwk2+fiMz3iy+jnVR0pn59VzN4h6BQ/ldVzNnXEpdopK
	 LF9eMJiOapd4Vc8vu1OB7wUEOyREblcCz8GZMv7c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8C3BF80534; Thu, 11 May 2023 18:02:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B5E4F8032D;
	Thu, 11 May 2023 18:02:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 352BCF8052E; Thu, 11 May 2023 18:02:25 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id F2838F802E8
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 18:02:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2838F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=MBRp0cVn;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=zZMP78BD
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 545A21FF8C;
	Thu, 11 May 2023 16:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1683820938;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IRcN6s7OyHD80E/ijgnyaP44Gr69HdU45sBWHhRkUog=;
	b=MBRp0cVnD3ozAdAChK7AiN7naUzqPZRjQVwS7jhcGjow3p96g1jdMOsM4cPapCFFPKps+E
	0s3GIRIoinL5CUpFmE+m9/fa9WLBrqHYJqX2hjXexydwjAjCqivNzYrjNT/ts+ECJ167+N
	MjctHrKsgog00VHKcBVhiqiYEqrvknk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1683820938;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IRcN6s7OyHD80E/ijgnyaP44Gr69HdU45sBWHhRkUog=;
	b=zZMP78BD7aiL/LFMM1inz7/8sTw4stQEzZ68IByatTf2wqBiR5wME1ahcCyeMifhaN1nNQ
	+1FoNtyl0mMos/Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DF3A2134B2;
	Thu, 11 May 2023 16:02:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 5GxdNYkRXWSOAgAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 11 May 2023 16:02:17 +0000
Date: Thu, 11 May 2023 18:02:17 +0200
Message-ID: <87h6si501i.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Alexandru Sorodoc <ealex95@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,	Takashi Iwai <tiwai@suse.com>,	Stefan
 Binding <sbinding@opensource.cirrus.com>,	Tim Crawford
 <tcrawford@system76.com>,	Andy Chi <andy.chi@canonical.com>,	Meng Tang
 <tangmeng@uniontech.com>,	"Luke D. Jones" <luke@ljones.dev>,	Philipp
 Jungkamp <p.jungkamp@gmx.net>,	Kacper =?ISO-8859-2?Q?Michaj=B3ow?=
 <kasper93@gmail.com>,	Yuchi Yang <yangyuchi66@gmail.com>,
	alsa-devel@alsa-project.org,	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] ALSA: hda/realtek: Add quirks for ASUS GU604V and
 GU603V
In-Reply-To: <20230509163746.6949-1-ealex95@gmail.com>
References: <20230509163746.6949-1-ealex95@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: WKB33DCSJLJHNU7J4ANCOYVY4KJ3DMJN
X-Message-ID-Hash: WKB33DCSJLJHNU7J4ANCOYVY4KJ3DMJN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WKB33DCSJLJHNU7J4ANCOYVY4KJ3DMJN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 09 May 2023 18:37:46 +0200,
Alexandru Sorodoc wrote:
> 
> @@ -9543,6 +9561,8 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x1043, 0x8398, "ASUS P1005", ALC269_FIXUP_STEREO_DMIC),
>  	SND_PCI_QUIRK(0x1043, 0x83ce, "ASUS P1005", ALC269_FIXUP_STEREO_DMIC),
>  	SND_PCI_QUIRK(0x1043, 0x8516, "ASUS X101CH", ALC269_FIXUP_ASUS_X101),
> +	SND_PCI_QUIRK(0x1043, 0x1473, "ASUS GU604V", ALC285_FIXUP_ASUS_HEADSET_MIC),
> +	SND_PCI_QUIRK(0x1043, 0x1483, "ASUS GU603V", ALC285_FIXUP_ASUS_HEADSET_MIC),
>  	SND_PCI_QUIRK(0x104d, 0x9073, "Sony VAIO", ALC275_FIXUP_SONY_VAIO_GPIO2),
>  	SND_PCI_QUIRK(0x104d, 0x907b, "Sony VAIO", ALC275_FIXUP_SONY_HWEQ),
>  	SND_PCI_QUIRK(0x104d, 0x9084, "Sony VAIO", ALC275_FIXUP_SONY_HWEQ),

The table is sorted in PCI SSID order.
Could you try to put the new entries at the right point?


thanks,

Takashi
