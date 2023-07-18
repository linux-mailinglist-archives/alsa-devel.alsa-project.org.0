Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5716D757BDB
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 14:32:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD396AEA;
	Tue, 18 Jul 2023 14:31:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD396AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689683530;
	bh=8GMn3j5Bz8xBcYnHZlg6ul/Gyg4GMkCrRKCRbKZYQxc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AX85Hq9sxogrB6rGo0kGe+JOwYAXwgYXE34i/NPc8ly0LuBIRIL0A4eKiMVoYnakd
	 HL90MtZ2Di8LTNNTUt+kdnelojsfX0NvD5z6nZOSJ7Q8fuMlnVZNGP0cUjS2XrBrJi
	 FatorUbi5NCRhQwId+WN+eC99QiiJqHjZPqIoqWU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33FBFF8032D; Tue, 18 Jul 2023 14:31:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BA68F8027B;
	Tue, 18 Jul 2023 14:31:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0178F8027B; Tue, 18 Jul 2023 14:31:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7330F8007E
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 14:31:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7330F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=RymDNfSa;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=uLYybcIK
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F40C22195A;
	Tue, 18 Jul 2023 12:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689683465;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KbjvdsHsS1PmNV4JGwm/IUUOXq5JvVmOTqBck+EzJEk=;
	b=RymDNfSaGPwdSqtX2PwhA7GLLqrSo7DFLn8fHZrcCEzTV4W0ZDaLLD+PJ1FRHPXu5SMgGc
	nCt9BxL8UUn0v7vXkgWrRRGXhKvEMpKGEpZhbTzb4J41+Iy1tapHlLc4WgIvZLfYjgCvd4
	UxZ0GdERj5YY6gJk8lQL9178OX7pnZk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689683465;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KbjvdsHsS1PmNV4JGwm/IUUOXq5JvVmOTqBck+EzJEk=;
	b=uLYybcIKIBzGtKobmZyQ05Z9kjWOjiLzlEKIt6RmL5oXEsuCP67rph5FANpRa2tXuOmTyU
	l4Wi0hxzHCF52gDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AEE8F134B0;
	Tue, 18 Jul 2023 12:31:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id sCHNKQiGtmQUSAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 18 Jul 2023 12:31:04 +0000
Date: Tue, 18 Jul 2023 14:31:04 +0200
Message-ID: <87351lo0zb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,	alsa-devel@alsa-project.org,
	linux-pci@vger.kernel.org,	linux-kernel@vger.kernel.org,	Cezary Rojewski
 <cezary.rojewski@intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,	Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,	Andy Shevchenko
 <andriy.shevchenko@intel.com>,	Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 00/15] PCI: Define Intel PCI IDs and use them in
 drivers
In-Reply-To: <20230717114511.484999-1-amadeuszx.slawinski@linux.intel.com>
References: <20230717114511.484999-1-amadeuszx.slawinski@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
Message-ID-Hash: S6UHUTZXRKICFGIPCWTIYM5W6ZJAMFZT
X-Message-ID-Hash: S6UHUTZXRKICFGIPCWTIYM5W6ZJAMFZT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S6UHUTZXRKICFGIPCWTIYM5W6ZJAMFZT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 17 Jul 2023 13:44:56 +0200,
Amadeusz S³awiñski wrote:
> 
> PCI IDs for Intel HDA are duplicated across quite a few drivers, due to
> various configurations and historical reasons. Currently almost all uses
> of HDA PCI IDs have corresponding comment telling which platform it is.
> Additionally there are some inconsistencies between drivers about which
> ID corresponds to which device.
> 
> Simplify things, by adding PCI IDs to global header and make use of them
> in drivers. This allows for removal of comments by having IDs themselves
> being self explanatory. Additionally it allows for removal of existing
> inconsistencies by having one source of truth.
> 
> Changes from v3:
>  - Fix double space in commit message title (Ilpo)
>  - Comment ACPI/PCI ID handling in Atom SST driver (Andy)
>  - Rebased once again and used --base this time (Andy)
> 
> Changes from v2:
>  - Change CHV to BSW (Andy)
>  - Fix incorrectly rebased patches (Andy)
>  - Fix commit message and add suggestions from Andy to SST patch (Andy)
>  - Rebased on top of Linus tree commit: 4b810bf037e5
> 
> Changes from v1:
>  - Remove BXT-T PCI ID as it is not released (Andy)
>  - Reorder macros to start from pci_match_id() (Andy)
>  - Add comment about BXT->APL name change in commit messages (Andy)
>  - Use SST as part of macro name for DSP only devices (Andy)
>  - Add PCI IDs for all SST combinations (Andy)
> 
> Changes from RFC:
>  - Sort Intel PCI IDs before adding new ones
>  - Fix ordering of new PCI IDs (Andy)
>  - Define all used Intel IDs (Andy)
>  - Add macros for controller type detection (Andy/Bjorn)
>  - Add set of patches changing to use above macro (Andy/Bjorn)
>  - Use PCI_DEVICE_DATA for Intel IDs in sound/pci/hda/hda_intel.c (Andy)
>  - Commit message wording (Andy)
>  - Remove unnecessary tabs (Andy)
> 
> Amadeusz S³awiñski (15):
>   PCI: Sort Intel PCI IDs by number
>   PCI: Add Intel Audio DSP devices to pci_ids.h
>   ASoC: SOF: Remove unused Broxton PCI ID
>   ALSA: Remove unused Broxton PCI ID
>   ALSA: hda: Add controller matching macros
>   ALSA: hda: Use global PCI match macro
>   ALSA: hda/i915: Use global PCI match macro
>   ASoC: Intel: Skylake: Use global PCI match macro
>   ALSA: intel-dsp-config: Convert to PCI device IDs defines
>   ALSA: hda: Convert to PCI device IDs defines
>   ASoC: Intel: avs: Convert to PCI device IDs defines
>   ASoC: Intel: avs: Convert to PCI device IDs defines
>   ASoC: Intel: Skylake: Convert to PCI device IDs defines
>   ASoC: SOF: Intel: Convert to PCI device IDs defines
>   ASoC: Intel: sst: Convert to PCI device IDs defines

Now applied all to sound.git tree, merged to for-next branch.

I pushed a signed tag hda-pci-ids including those (based on 6.5-rc2).
  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/hda-pci-ids

Feel free to merge to other trees.


thanks,

Takashi
