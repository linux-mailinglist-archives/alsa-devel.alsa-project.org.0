Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C7C70BCCE
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 14:01:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7ED7482B;
	Mon, 22 May 2023 14:00:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7ED7482B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684756861;
	bh=R2DOdvjwp3GeH7BdIHkjq051TV8iqIPJQXZZzznb2Gw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rHQLiyEiZ/W8/NJwoTym91Jk+vD3PUelGoldgDm2+A0PPyPalJ6alV0eiB2vOM5Se
	 kwTaHYPnRxjUxvixYXVlKgM7IpiplZiCDErTs+SCBP61304PFoB30tMmd06cfEWf64
	 Yp5iiPDKHE1Hrsnh3XRWEK8iPhFEGyN2DzBgm4NQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFBFFF80553; Mon, 22 May 2023 14:00:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2979CF8053D;
	Mon, 22 May 2023 14:00:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CD60F80544; Mon, 22 May 2023 14:00:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 230E2F80249
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 13:59:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 230E2F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=qHKQbh6w;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=nuw5oxmN
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9D7DA1FEAA;
	Mon, 22 May 2023 11:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684756793;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wTXdnsTIOpts+ngHHMSt9G0bm+NoUyBrowWRidAO2Nc=;
	b=qHKQbh6wY2MNNQTFNhGrOOiY8nMGEc1TkHIZcZx1jfaABnWfq36pxR3EFOZQJEC5VwYtJQ
	m2sbSRil+kJ6SEJ0zZ5TYCvikBK8VDNhmdGMurxW/fLdm3gC4lwsjnINu9b/qtBpmP58a8
	IC/x1pKqToZo7mmwl+pmt4PPN01xLAU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684756793;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wTXdnsTIOpts+ngHHMSt9G0bm+NoUyBrowWRidAO2Nc=;
	b=nuw5oxmNgsLPzP3xjuG/8vVrfiUjxXMIJ2mEV3/yAfUT+OIqGyRI3csw1JeBuESgcDm2gC
	vpHXDZ14SBwqTrAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3B2E513336;
	Mon, 22 May 2023 11:59:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id zuKsDTlZa2TtSQAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 22 May 2023 11:59:53 +0000
Date: Mon, 22 May 2023 13:59:52 +0200
Message-ID: <87cz2sy3t3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,	Jaroslav Kysela <perex@perex.cz>,	Takashi
 Iwai <tiwai@suse.com>,	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,	Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>,	Mauro Carvalho Chehab
 <mchehab@kernel.org>,	Alan Stern <stern@rowland.harvard.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,	Geert Uytterhoeven
 <geert@linux-m68k.org>,	Paul Walmsley <paul.walmsley@sifive.com>,	Palmer
 Dabbelt <palmer@dabbelt.com>,	Albert Ou <aou@eecs.berkeley.edu>,
	linux-kernel@vger.kernel.org,	linux-arch@vger.kernel.org,
	linux-pci@vger.kernel.org,	Arnd Bergmann <arnd@kernel.org>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v5 32/44] sound: add HAS_IOPORT dependencies
In-Reply-To: <20230522105049.1467313-33-schnelle@linux.ibm.com>
References: <20230522105049.1467313-1-schnelle@linux.ibm.com>
	<20230522105049.1467313-33-schnelle@linux.ibm.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: P7SYTVSRUAROLP5KT6SYWDUERXO3KOH7
X-Message-ID-Hash: P7SYTVSRUAROLP5KT6SYWDUERXO3KOH7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P7SYTVSRUAROLP5KT6SYWDUERXO3KOH7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 22 May 2023 12:50:37 +0200,
Niklas Schnelle wrote:
> 
> In a future patch HAS_IOPORT=n will result in inb()/outb() and friends
> not being declared. We thus need to add HAS_IOPORT as dependency for
> those drivers using them.
> 
> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>

Looks good to me.  Would you like the patch picked up through
sound.git tree, or rather apply all through a different tree?
In the latter case:

Reviewed-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi
