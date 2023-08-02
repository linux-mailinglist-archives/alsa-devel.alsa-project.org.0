Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA0976D32A
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 17:58:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6872D82B;
	Wed,  2 Aug 2023 17:57:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6872D82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690991923;
	bh=1j69k9622jI9wsdQv7Y7UnREujPJ+FiLvpiY9beCCPw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tdkQnC85fdXFqEH8M3Cy1A8CLVOLDJlptt0MacK+0SGp53fplSDgft1hAG6By3Jvu
	 yRAv53RpZ1AIVDbxHJrD6ostl6aRV4UxxtS6l6W102xbVre78ZV6Uf242rOFz+WFaN
	 2hzKXyLq9XFeX3Qh2+G6rzoi7UrpKWDeGo08Wrbw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B9DDF8053B; Wed,  2 Aug 2023 17:57:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 60B35F801D5;
	Wed,  2 Aug 2023 17:57:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D859BF8025A; Wed,  2 Aug 2023 17:57:48 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B5EDF8016D
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 17:57:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B5EDF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=WMRCBDYF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=AoPfyvsw
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B86F71F381;
	Wed,  2 Aug 2023 15:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690991865;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y4cKrxXTYWisN5RcuPHnoaVpyBNRXGNZ0s9ctVTI9Yw=;
	b=WMRCBDYFb53QGu4H4gc4yHEbyMMtEPD1aNbvV0uJaKo5/eVUq6afxARy/cqgEpoa4e7DuG
	ngNtErUvq0Ju2cqecycIZg3e/gkMfMxLaV61JybE5SzQTzjkyYOHmn/ai4xHFf4DH2U5Qi
	szybTY+V7hHWfem18pzgvmeXkwUiMIo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690991865;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y4cKrxXTYWisN5RcuPHnoaVpyBNRXGNZ0s9ctVTI9Yw=;
	b=AoPfyvsw1n456CD3En7CnsBBxSriFplxFtgVgcILM+h7LdDTTo+1q0JbJwhuDgqjbJqlAi
	IXbvqhRTpeAcL5Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 830E013909;
	Wed,  2 Aug 2023 15:57:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id INQVH/l8ymTHPAAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 02 Aug 2023 15:57:45 +0000
Date: Wed, 02 Aug 2023 17:57:45 +0200
Message-ID: <87fs51cu86.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	alsa-devel@alsa-project.org,
	broonie@kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 1/5] PCI: add ArrowLake-S PCI ID for Intel HDAudio
 subsystem.
In-Reply-To: <20230802155226.GA59821@bhelgaas>
References: <20230802150105.24604-2-pierre-louis.bossart@linux.intel.com>
	<20230802155226.GA59821@bhelgaas>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: D5DURT54KIQ36APIRZIJYBXEO2KD66CQ
X-Message-ID-Hash: D5DURT54KIQ36APIRZIJYBXEO2KD66CQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D5DURT54KIQ36APIRZIJYBXEO2KD66CQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 02 Aug 2023 17:52:26 +0200,
Bjorn Helgaas wrote:
> 
> On Wed, Aug 02, 2023 at 10:01:01AM -0500, Pierre-Louis Bossart wrote:
> > Add part ID to common include file
> 
> Please drop period at end of subject and add one at the end of the
> commit log.
> 
> Also mention the drivers that will use this new #define; looks like
> hda_intel.c and ...
> 
> Well, actually, I only see that one use, which means we probably
> shouldn't add this #define to pci_ids.h, per the comment at the top of
> the file.  If there's only one use, use the hex ID in the driver (or
> add a #define in the driver itself).

Judging from the previous patterns, the same ID could be required for
ASoC SOF driver, too, which isn't included in this patch set.  In
that case, it's worth to put to pci_ids.h.
(OTOH, it can be done at a later stage, too.)


thanks,

Takashi
