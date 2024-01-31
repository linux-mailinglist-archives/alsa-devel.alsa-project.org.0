Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40839844487
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jan 2024 17:31:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E14B6850;
	Wed, 31 Jan 2024 17:31:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E14B6850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706718709;
	bh=EK6mQSU0rXidzQqllRwP/i4twW+fkBaD850m2dD4R6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=po1N+f0QYEnZdJEt0Zwa3d/gAEcDeCuZZ9xZzvtAyHn7ix4Z1TpqTP2kzRJ9XkQ16
	 D40qmyWCwDDI8T3Ur6vp8IFZaEslHOH6Ky+Jt4AjWRSDa62dBSOItK5JLXc/Ar7pI3
	 767FV5eY0aR1kOXbC8fQ3qITnb7mI2LbKuAYZ2wc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FA86F80580; Wed, 31 Jan 2024 17:31:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB8A5F80568;
	Wed, 31 Jan 2024 17:31:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E8DAF8055C; Wed, 31 Jan 2024 17:31:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CF4A6F80149
	for <alsa-devel@alsa-project.org>; Wed, 31 Jan 2024 17:30:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF4A6F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=GL+2WMA3
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A50A5618A0;
	Wed, 31 Jan 2024 16:30:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64931C43399;
	Wed, 31 Jan 2024 16:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706718654;
	bh=EK6mQSU0rXidzQqllRwP/i4twW+fkBaD850m2dD4R6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GL+2WMA36zNaEzVS4UtwxtwU87UtEAZBZuoua1+MclmG0EvDU5inUx5xPgWlQhCx+
	 tKugeGg8DdA7+H8g4Mepz8bunlb4c0wF/Pr0qr4f3jJkorpgNAn6azaNsOIaOJ6UPE
	 LIF4d4pVZs/ptNasV6jTOPtZAMkLI0nblUby8KQA=
Date: Wed, 31 Jan 2024 08:30:53 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [PATCH 1/6] sysfs: Introduce a mechanism to hide static
 attribute_groups
Message-ID: <2024013139-thermal-eaten-f179@gregkh>
References: <2024013025-spoiling-exact-ad20@gregkh>
 <2024013028-deflator-flaring-ec62@gregkh>
 <b93ec9c2-23f5-486b-a3dc-ed9b960df359@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b93ec9c2-23f5-486b-a3dc-ed9b960df359@linux.intel.com>
Message-ID-Hash: OYFIW6LBDVFQ35ILGX5FCITM243RXI2J
X-Message-ID-Hash: OYFIW6LBDVFQ35ILGX5FCITM243RXI2J
X-MailFrom: gregkh@linuxfoundation.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OYFIW6LBDVFQ35ILGX5FCITM243RXI2J/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jan 31, 2024 at 02:05:04PM +0100, Pierre-Louis Bossart wrote:
> 
> 
> On 1/30/24 19:46, Greg Kroah-Hartman wrote:
> > From: Dan Williams <dan.j.williams@intel.com>
> > 
> > Add a mechanism for named attribute_groups to hide their directory at
> > sysfs_update_group() time, or otherwise skip emitting the group
> > directory when the group is first registered. It piggybacks on
> > is_visible() in a similar manner as SYSFS_PREALLOC, i.e. special flags
> > in the upper bits of the returned mode. To use it, specify a symbol
> > prefix to DEFINE_SYSFS_GROUP_VISIBLE(), and then pass that same prefix
> > to SYSFS_GROUP_VISIBLE() when assigning the @is_visible() callback:
> > 
> > 	DEFINE_SYSFS_GROUP_VISIBLE($prefix)
> > 
> > 	struct attribute_group $prefix_group = {
> > 		.name = $name,
> > 		.is_visible = SYSFS_GROUP_VISIBLE($prefix),
> > 	};
> > 
> > SYSFS_GROUP_VISIBLE() expects a definition of $prefix_group_visible()
> > and $prefix_attr_visible(), where $prefix_group_visible() just returns
> > true / false and $prefix_attr_visible() behaves as normal.
> > 
> > The motivation for this capability is to centralize PCI device
> > authentication in the PCI core with a named sysfs group while keeping
> > that group hidden for devices and platforms that do not meet the
> > requirements. In a PCI topology, most devices will not support
> > authentication, a small subset will support just PCI CMA (Component
> > Measurement and Authentication), a smaller subset will support PCI CMA +
> > PCIe IDE (Link Integrity and Encryption), and only next generation
> > server hosts will start to include a platform TSM (TEE Security
> > Manager).
> > 
> > Without this capability the alternatives are:
> > 
> > * Check if all attributes are invisible and if so, hide the directory.
> >   Beyond trouble getting this to work [1], this is an ABI change for
> >   scenarios if userspace happens to depend on group visibility absent any
> >   attributes. I.e. this new capability avoids regression since it does
> >   not retroactively apply to existing cases.
> > 
> > * Publish an empty /sys/bus/pci/devices/$pdev/tsm/ directory for all PCI
> >   devices (i.e. for the case when TSM platform support is present, but
> >   device support is absent). Unfortunate that this will be a vestigial
> >   empty directory in the vast majority of cases.
> > 
> > * Reintroduce usage of runtime calls to sysfs_{create,remove}_group()
> >   in the PCI core. Bjorn has already indicated that he does not want to
> >   see any growth of pci_sysfs_init() [2].
> > 
> > * Drop the named group and simulate a directory by prefixing all
> >   TSM-related attributes with "tsm_". Unfortunate to not use the naming
> >   capability of a sysfs group as intended.
> > 
> > In comparison, there is a small potential for regression if for some
> > reason an @is_visible() callback had dependencies on how many times it
> > was called. Additionally, it is no longer an error to update a group
> > that does not have its directory already present, and it is no longer a
> > WARN() to remove a group that was never visible.
> > 
> > Link: https://lore.kernel.org/all/2024012321-envious-procedure-4a58@gregkh/ [1]
> > Link: https://lore.kernel.org/linux-pci/20231019200110.GA1410324@bhelgaas/ [2]
> > Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> This patch seems to introduce a regression on our Lunar Lake test
> devices, where we can't boot to an ssh shell. No issues on older devices
> [1]. Bard Liao and I reproduced the same results on different boards.
> 
> We'll need to find someone with direct device access to provide more
> information on the problem, remote testing without ssh is a
> self-negating proposition.
> 
> Is there a dependency on other patches? Our tests are still based on
> 6.7.0-rc3 due to other upstream issues we're currently working through.

This should be totally stand-alone and not cause any problems,
especially if you don't have any other patches applied.

I did make this against 6.8-rc2, perhaps that's the issue?

thanks,

greg k-h
