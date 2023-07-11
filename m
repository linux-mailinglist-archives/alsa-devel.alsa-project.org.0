Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D228374F3E9
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 17:43:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 112FFED5;
	Tue, 11 Jul 2023 17:42:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 112FFED5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689090198;
	bh=iPB72lqInGqVWWwOy3PMpCjEz28cqiSrwBC3uayCRIo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b4lkE3rhfzy5Yinj54tzLpikKpuDI4xhc3kfsWGtx+g+t1w4SgntIDF+QURGFw/qN
	 YUIL14ay1BBFteII2d5LO0zj+NY6XMLbIwnV+zwbX+V9Xb2HMLUEp3xbhxH2P7EmWh
	 vTODAVa1f/zUfqPQmKs+XeoiHZJPdJQDTYXKueW4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CFDDF8024E; Tue, 11 Jul 2023 17:42:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C75FCF80236;
	Tue, 11 Jul 2023 17:42:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B8B0F80249; Tue, 11 Jul 2023 17:42:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BEE4AF80153
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 17:42:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEE4AF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=UfQ4urB4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=TYUBrLVv
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3AC7F2275C;
	Tue, 11 Jul 2023 15:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689090134;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rQYkKfGFGC5pVN3aJkpbpkhHDlSbsj+GelqxV7zZTRk=;
	b=UfQ4urB4+8BgTndkCc7fCiD3ME3yHDkc4GP5nB/e9EIsE/TMJJFKSb8Uo+WvN9EmPVizRO
	1zbuOk0jlFMYDrrqOoJ0UJd4woZwQ8jdxnOUDtwwSXYvkzL/FhicmT6qrzsRWIN8eYjy2L
	pCOcupFyxCMKJEu/HUUsyjdzYRa1gKc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689090134;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rQYkKfGFGC5pVN3aJkpbpkhHDlSbsj+GelqxV7zZTRk=;
	b=TYUBrLVvAW/nJukV/0wT380gWBhvaXjoaLokOXLrdH4Dys9++VALmNxWyyZx+Q4jrleDfB
	PTQsaFoVjhbLmMDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EAE081390F;
	Tue, 11 Jul 2023 15:42:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id FWnaN1V4rWRKIgAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 11 Jul 2023 15:42:13 +0000
Date: Tue, 11 Jul 2023 17:42:13 +0200
Message-ID: <87jzv6h2ui.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,	Amadeusz
 =?ISO-8859-2?Q?S=B3awi=F1ski?= <amadeuszx.slawinski@linux.intel.com>,	Bjorn
 Helgaas <bhelgaas@google.com>,	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,	Cezary Rojewski <cezary.rojewski@intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,	Andy Shevchenko
 <andriy.shevchenko@intel.com>,	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 00/13] PCI: Define Intel PCI IDs and use them in drivers
In-Reply-To: <46d612f4-24a4-4493-aa9f-0ace5225a38b@sirena.org.uk>
References: <20230711125726.3509391-1-amadeuszx.slawinski@linux.intel.com>
	<bc2484ba-3bb2-7d74-fcd1-55c9ec253b9c@linux.intel.com>
	<46d612f4-24a4-4493-aa9f-0ace5225a38b@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JJ63Z7GXKHYBG2XOG6SL7CCFUUQKDEKI
X-Message-ID-Hash: JJ63Z7GXKHYBG2XOG6SL7CCFUUQKDEKI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JJ63Z7GXKHYBG2XOG6SL7CCFUUQKDEKI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 11 Jul 2023 17:36:20 +0200,
Mark Brown wrote:
> 
> On Tue, Jul 11, 2023 at 05:24:07PM +0200, Pierre-Louis Bossart wrote:
> > On 7/11/23 14:57, Amadeusz S³awiñski wrote:
> 
> > > Simplify things, by adding PCI IDs to global header and make use of them
> > > in drivers. This allows for removal of comments by having IDs themselves
> > > being self explanatory. Additionally it allows for removal of existing
> > > inconsistencies by having one source of truth.
> 
> > I'd like to hear from Takashi and Mark on how this would work, we have
> > to provide new PCI IDs for both trees using a common 'pci_ids.h' file.
> 
> We can probably just agree on a tree to apply things and work from
> there.

Yes, simply apply on top of 6.5-rc1 or such a stable point and tag it.
Then other trees can merging it.

I can do it if both Bjorn and Mark agree (after all patches get
reviewed and no objection comes up).


Takashi
