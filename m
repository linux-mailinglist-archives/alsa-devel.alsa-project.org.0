Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C029376D39B
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 18:26:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB83F3E7;
	Wed,  2 Aug 2023 18:25:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB83F3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690993606;
	bh=z2GNkrzDnIZ2M8EG2mnGFYrFGtYzhPvZFKvGFeCBXIU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=GhxIQyfp6WsD1cm6imS2Ku5aMhlVmp7g1tpuoRLBqcKOlj0rP5u2SdieM7ev+jLlX
	 gbbRLRklj3MEwAfzXjrVvDvdASeRPIMAjfgt65uMs5ePoT6Cuv2qOlsplefJ4rxctH
	 iEmsHjilNTNqF/zxf7ST6cUUahEL+s5VSj9Opl+g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25A40F8016D; Wed,  2 Aug 2023 18:25:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C85FDF8016D;
	Wed,  2 Aug 2023 18:25:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F47EF8025A; Wed,  2 Aug 2023 18:25:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AFB1AF80087
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 18:25:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFB1AF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gFjLP5bP
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 72D6761A17;
	Wed,  2 Aug 2023 16:25:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A02DDC433C7;
	Wed,  2 Aug 2023 16:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690993543;
	bh=z2GNkrzDnIZ2M8EG2mnGFYrFGtYzhPvZFKvGFeCBXIU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=gFjLP5bPL5szB0HXuK48OR27CZJS9vooMh2M1jijAUj/eQTB8619rus9DX4ZrIx94
	 fK8vueua5+1f17fm7VUy+IFf+jsSJbYGhbR4QtXgxNCt9OcRLpAICNJCSGVqZmBrzS
	 0ndOLdGu9SbdlYgRX+DjzIK6D1/5V3AkLPvnf1jOjD7xdoSuWQn14/CiiN5Hh72ywi
	 WEprz8UDVlLsO18B0LhhlDUXHoEAVcyVbPPKQQVdAW1bGUWKd1D2qTqU4geB+5nPle
	 FTEVBXHx1GZkbkxsrpODFjAbfIY1AesCzjh4SRqR0OzUHASzgUHL/AMzRdQO9McIKk
	 sQ2U7kuMbkzyg==
Date: Wed, 2 Aug 2023 11:25:41 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	broonie@kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 1/5] PCI: add ArrowLake-S PCI ID for Intel HDAudio
 subsystem.
Message-ID: <20230802162541.GA60855@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <206f5a15-29f0-ec7c-1b85-50ace8ae7c2f@linux.intel.com>
Message-ID-Hash: 3ZCXXK3RB33ADJKRMDUY5K2EPGNQT2SV
X-Message-ID-Hash: 3ZCXXK3RB33ADJKRMDUY5K2EPGNQT2SV
X-MailFrom: helgaas@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3ZCXXK3RB33ADJKRMDUY5K2EPGNQT2SV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Aug 02, 2023 at 11:07:36AM -0500, Pierre-Louis Bossart wrote:
> On 8/2/23 10:57, Takashi Iwai wrote:
> > On Wed, 02 Aug 2023 17:52:26 +0200,
> > Bjorn Helgaas wrote:
> >> On Wed, Aug 02, 2023 at 10:01:01AM -0500, Pierre-Louis Bossart wrote:
> >>> Add part ID to common include file
> >>
> >> Please drop period at end of subject and add one at the end of the
> >> commit log.
> >>
> >> Also mention the drivers that will use this new #define; looks like
> >> hda_intel.c and ...
> >>
> >> Well, actually, I only see that one use, which means we probably
> >> shouldn't add this #define to pci_ids.h, per the comment at the top of
> >> the file.  If there's only one use, use the hex ID in the driver (or
> >> add a #define in the driver itself).
> > 
> > Judging from the previous patterns, the same ID could be required for
> > ASoC SOF driver, too, which isn't included in this patch set.  In
> > that case, it's worth to put to pci_ids.h.
> > (OTOH, it can be done at a later stage, too.)

When it becomes shared is the standard point at which we add to
pci_ids.h.

> I am not following. we just agreed a couple of weeks ago to record ALL
> Intel/HDaudio PCI IDs in the same pci_ids.h include file.

I'm not sure who "we" is here.  If it included me and I signed up to
it, I apologize for forgetting, and go ahead and add my:

  Acked-by: Bjorn Helgaas <bhelgaas@google.com>

I'm just pointing out the usual practice for pci_ids.h, as mentioned
in the file itself.

> ArrowLake-S is the first addition to first file after the work done by
> Cezary/Amadeusz. Yes it's required to be added since it'll be used in
> other parts later on. But even if there was ONE use of this PCI ID, why
> would we not add it for consistency to the global pci_ids.h file?
> Takashi's hda_intel.c file would look really bad if we have a mix of
> single-use PCIs and shared ones...

We already have a mix:

  static const struct pci_device_id azx_ids[] = {
        /* CPT */
        { PCI_DEVICE(0x8086, 0x1c20),
          .driver_data = AZX_DRIVER_PCH | AZX_DCAPS_INTEL_PCH_NOPM },
        /* PBG */
        { PCI_DEVICE(0x8086, 0x1d20),
          .driver_data = AZX_DRIVER_PCH | AZX_DCAPS_INTEL_PCH_NOPM },
        /* Panther Point */

I think the reason we don't add names used only once is because it
makes backporting things harder because it leads to more merge
conflicts in pci_ids.h.

Bjorn
