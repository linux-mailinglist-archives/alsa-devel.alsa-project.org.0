Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 980B674F4FB
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 18:20:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0E27EF2;
	Tue, 11 Jul 2023 18:19:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0E27EF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689092429;
	bh=93JhDreefZ2IaOeQ5o+vxmKR9FPwV2k7NiXOGpNuMCM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=f2oo8jR9wKEJI08VCcurzedoIg3vn9wp7go2M+zg7jDf+3xOpZN88Cydy28m33Gw0
	 N4VJJ1iVq1durEiWLJqJKDOSnJjmtsObEjr/L2ypunGlIGP3pd60GTSMgC8uv9cS6o
	 6wuH9BeUp9FL0c7fZJEJ/sngXHZCyz+DgJZ3j2Ec=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B318F8027B; Tue, 11 Jul 2023 18:19:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B161F80236;
	Tue, 11 Jul 2023 18:19:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FCA1F80249; Tue, 11 Jul 2023 18:19:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B0750F80093
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 18:19:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0750F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GqeN214M
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 61A8261573;
	Tue, 11 Jul 2023 16:19:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E95D6C433C9;
	Tue, 11 Jul 2023 16:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689092372;
	bh=93JhDreefZ2IaOeQ5o+vxmKR9FPwV2k7NiXOGpNuMCM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=GqeN214M5tCT1zk3DKwIwk9lUERRHUO5CzojBlqjfl864/8o/15oEIAtlfKGaU7SH
	 64mmYRlhtcOyIamQwm5tShwx4KAhmOpsOPW2aoPhviU9yVNuBt8emDlfucOwXtRjvS
	 U7AH4V3gC3Kf5dR6XpwgcdSYJcA1/G12ZbT7FZ3Ziz1RMlx39mZY+GBz82/YbkNV65
	 ZwebRQFY6e/Nxv5oFdJktBrFR3sdObl7CQkTglS7B0Bt971vxtxI6p7daFugYx3t6E
	 Yn10gmBjI+wjVnKMNbN4nIesLF/BGScBHm0fZZjH9ImEuTgpc3AvsUlb939VnXhCzT
	 MXaj/jXbYHmdg==
Date: Tue, 11 Jul 2023 11:19:30 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Mark Brown <broonie@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 00/13] PCI: Define Intel PCI IDs and use them in drivers
Message-ID: <20230711161930.GA250687@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87jzv6h2ui.wl-tiwai@suse.de>
Message-ID-Hash: 3T6RKUR4YZ4BD7UOX7BXT5FVPDPKKQK3
X-Message-ID-Hash: 3T6RKUR4YZ4BD7UOX7BXT5FVPDPKKQK3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3T6RKUR4YZ4BD7UOX7BXT5FVPDPKKQK3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jul 11, 2023 at 05:42:13PM +0200, Takashi Iwai wrote:
> On Tue, 11 Jul 2023 17:36:20 +0200, Mark Brown wrote:
> > On Tue, Jul 11, 2023 at 05:24:07PM +0200, Pierre-Louis Bossart wrote:
> > > On 7/11/23 14:57, Amadeusz Sławiński wrote:
> > 
> > > > Simplify things, by adding PCI IDs to global header and make use of them
> > > > in drivers. This allows for removal of comments by having IDs themselves
> > > > being self explanatory. Additionally it allows for removal of existing
> > > > inconsistencies by having one source of truth.
> > 
> > > I'd like to hear from Takashi and Mark on how this would work, we have
> > > to provide new PCI IDs for both trees using a common 'pci_ids.h' file.
> > 
> > We can probably just agree on a tree to apply things and work from
> > there.
> 
> Yes, simply apply on top of 6.5-rc1 or such a stable point and tag it.
> Then other trees can merging it.
> 
> I can do it if both Bjorn and Mark agree (after all patches get
> reviewed and no objection comes up).

Sure.  I acked the PCI ones, so you can merge these via whatever tree
makes the most sense.  We might have minor conflicts during the merge
window, but they should be easy to fix.

Bjorn
