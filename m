Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD660750611
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 13:29:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1015D203;
	Wed, 12 Jul 2023 13:28:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1015D203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689161366;
	bh=ONUK2+2l+uIxccBEei+iLnE3S9ewVb0528IlLQ3weCY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HB1nYMNlkmPF2pRfmczkJWn6bdocVuQGItrOCZU8Wobd5PgQCj3igfPx4yfm3Iojd
	 EnXLhVCtQpLfj/+I99fOxGJU2ys6CQROSScsGotn3V/CNc/xmW2XpNTTnTj5B5kt3o
	 u9X/kFZTdbv6MHSavjR/5xPir1Yft7tX81zSK4hg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 413F7F80153; Wed, 12 Jul 2023 13:28:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6D21F80236;
	Wed, 12 Jul 2023 13:28:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B51FBF80249; Wed, 12 Jul 2023 13:28:30 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E0291F800D2
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 13:28:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0291F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=E4rRGYvq;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=g1Ago2G6
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 46CF31F8D9;
	Wed, 12 Jul 2023 11:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689161302;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tgkraBCStp4uHjw1DiSUtNsshJCrMml+0ZZ0JzhB5IE=;
	b=E4rRGYvqiKIfG/O6lN9f+QQkBO51fLIHYOixzLbRWb8whpiZtJxnT2xIsPwX90RN5fuD32
	2DyWH+kj133Mtaxn6RwfU+HGN4did0uLh6cEt8YpvRbu0cSgeZtHl4vMUinRBCT2aFdq8W
	E7GdXQKPJ0qH0dejfPFgMVscYt+Q2Io=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689161302;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tgkraBCStp4uHjw1DiSUtNsshJCrMml+0ZZ0JzhB5IE=;
	b=g1Ago2G6rHfRTsq7TgtoTyYEOrMGpGzHvA3vlsEa7vhvv3N867hahCAkUEY9Mw3ABNo+oT
	34sK4jYT9ZG6yyCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 26B0F133DD;
	Wed, 12 Jul 2023 11:28:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 2KcCCVaOrmSQLAAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 12 Jul 2023 11:28:22 +0000
Date: Wed, 12 Jul 2023 13:28:21 +0200
Message-ID: <871qhdl67e.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 08/13] ALSA: hda: Convert to PCI device IDs defines
In-Reply-To: <ec8bf2d3-6db0-bb9e-0964-fadcf8fa654d@linux.intel.com>
References: <20230711125726.3509391-1-amadeuszx.slawinski@linux.intel.com>
	<20230711125726.3509391-9-amadeuszx.slawinski@linux.intel.com>
	<ZK1iES4aIwr9o29F@smile.fi.intel.com>
	<ec8bf2d3-6db0-bb9e-0964-fadcf8fa654d@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UCNTTJUY5TWDFRLQXVRIZRCN4X2CYNKN
X-Message-ID-Hash: UCNTTJUY5TWDFRLQXVRIZRCN4X2CYNKN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UCNTTJUY5TWDFRLQXVRIZRCN4X2CYNKN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 12 Jul 2023 13:22:22 +0200,
Amadeusz S³awiñski wrote:
> 
> On 7/11/2023 4:07 PM, Andy Shevchenko wrote:
> > I know that AMD owns ATI, but wouldn't make sense to group by company?
> > Maybe as a separate (preparatory?) patch.
> > 
> 
> It seems to be sorted this way because first are Generic ATI and AMD
> HDA cards, followed by ATI HDMI ones. I would just leave it as it is
> unless Takashi also prefers it to be reordered?

Yes, these are some logical grouping :)

We may want to sort differently in future, but let's do it after all
things settle down.


thanks,

Takashi
