Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2ADC76FF42
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 13:12:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 552446C0;
	Fri,  4 Aug 2023 13:11:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 552446C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691147547;
	bh=1NeJVNb1DPpacADvXKLuFAoeIe+QboXjmJIitZcqCbg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tcvgwV2Qs+bVuXuQO0koGW07TMIi9m+Ckc9db84jMCuzgeG7zAag0TmgnscJ/SgL6
	 UOXzip+PjN9bCJsVYD1C9GZkmkGw/37vBLYmDuhzmAI/onYR8z43n4ur0orO+/7GQn
	 XVsswtGGmkMN93+PTpg+Oi+tcGucFBprHa5sufAU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB8A4F80425; Fri,  4 Aug 2023 13:11:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 702ABF801D5;
	Fri,  4 Aug 2023 13:11:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E71B3F8025A; Fri,  4 Aug 2023 13:11:30 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9397FF8015B
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 13:10:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9397FF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=qlvTp3l0;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=55Xrkzcc
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A713B2187F;
	Fri,  4 Aug 2023 11:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1691147450;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zQo4b+PRC8QM27PpEfGvop279Ibe/PL70O5uFSym+YA=;
	b=qlvTp3l0pD0YlZjtyveY+1yDTE/GQYZ85t9zz7TpY/DwgZSJ01x1AyAHZ4B65LuEAyq6+K
	/nLc6ZsDDT81JiqkYkWv7xY4U9QkJYSMytz9x8NDUEykFlkYd31cRVO0FDiLJn6Dku2M+6
	xVBU3RjnUhG+eWcTc1iNwUxOcxkjROc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1691147450;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zQo4b+PRC8QM27PpEfGvop279Ibe/PL70O5uFSym+YA=;
	b=55XrkzccKjUSlkbSgg7K5Esmqld61e3yfUvl5GBvxn6luibsoJPXkY20UN50lf/n5QOI9m
	W4Hahu+fbOKAVZCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7ED98133B5;
	Fri,  4 Aug 2023 11:10:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id idX2HbrczGQDSwAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 04 Aug 2023 11:10:50 +0000
Date: Fri, 04 Aug 2023 13:10:50 +0200
Message-ID: <87il9v9i6d.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH 0/5] ALSA/PCI: hda: add ARL-S support, config for MTL/LNL
In-Reply-To: <20230802150105.24604-1-pierre-louis.bossart@linux.intel.com>
References: <20230802150105.24604-1-pierre-louis.bossart@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: KVJXBN45MPOTFMFQHXKNL4QRKDAO63TT
X-Message-ID-Hash: KVJXBN45MPOTFMFQHXKNL4QRKDAO63TT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KVJXBN45MPOTFMFQHXKNL4QRKDAO63TT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 02 Aug 2023 17:01:00 +0200,
Pierre-Louis Bossart wrote:
> 
> Add a new PCI ID and i915 connectivity check for ArrowLake-S, and
> configuration updates for MTL/LNL.
> 
> Kai Vehmanen (2):
>   ALSA: hda: add HD Audio PCI ID for Intel Arrow Lake-S
>   ALSA: hda/i915: extend connectivity check to cover Intel ARL
> 
> Pierre-Louis Bossart (3):
>   PCI: add ArrowLake-S PCI ID for Intel HDAudio subsystem.
>   ALSA: hda: intel-dsp-cfg: use common include for MeteorLake
>   ALSA: hda: intel-dsp-cfg: add LunarLake support

Now I applied all patches.

Mark can pull the changes from tags/hda-intel-6.6 if those changes are
needed for further ASoC patches.  It's based on the previous hda
pci-id changes on top of 6.5-rc2.


thanks,

Takashi
