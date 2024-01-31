Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F53084400E
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jan 2024 14:07:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 990F6B76;
	Wed, 31 Jan 2024 14:07:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 990F6B76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706706433;
	bh=GEGBOsy/KDcNncxgnTgbSSkW226Obrv2mcjzoIzZO1s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OxFj89vbDm3TcgccdrMpR7Jdmzv2tkVVPb6zc8T4GDPHxEPIULRHuF95n2Q8yM63N
	 ZtPzDIQlaqDfRoG7uMM5hpaSgiO5+wZBuTW7bgyhbfCpolP6W6nfByVT2ndg5+IoSw
	 2x80WVzamQeS1fJw2meixiLnWsv2pWX0UIKGyohs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B477DF80563; Wed, 31 Jan 2024 14:06:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2394F805A0;
	Wed, 31 Jan 2024 14:06:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5182F8055C; Wed, 31 Jan 2024 14:06:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15F54F8020D
	for <alsa-devel@alsa-project.org>; Wed, 31 Jan 2024 14:06:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15F54F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Q3+mtwm4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706706387; x=1738242387;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=GEGBOsy/KDcNncxgnTgbSSkW226Obrv2mcjzoIzZO1s=;
  b=Q3+mtwm4np3iR79Py4Ti/r01Riw6qFXnoXnj37Epa5vUmksYk6mdKgq3
   YqxqqZX9bVK26HiVP4RE1kb6JVO28WmgRW+dWZ7ool2ZumR1jfkKv7vpz
   ySUWfCLsmx6B4QqrJD060cgzUPY+oQW903em/ukCpL+uHdZGu/giM9NCT
   MibXZfV98RT95x0M5CCWN2RmqTw4cL1Qr73mwJd8dMa/kLeq3A6B0TrwC
   YV8aawynaUfRBWqyYlcxgcPqTMCx1gVX7CBI5yysQA6por0wq9TojSFdj
   9OMi/qTpW+oHvphe2hKIZmLdWOBQoM7cbclRvNgXTCx5txTprPrOs6ql5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="403216494"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400";
   d="scan'208";a="403216494"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 05:05:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="931835998"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400";
   d="scan'208";a="931835998"
Received: from hmer-mobl.ger.corp.intel.com (HELO [10.251.217.183])
 ([10.251.217.183])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 05:05:28 -0800
Message-ID: <b93ec9c2-23f5-486b-a3dc-ed9b960df359@linux.intel.com>
Date: Wed, 31 Jan 2024 14:05:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] sysfs: Introduce a mechanism to hide static
 attribute_groups
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>
References: <2024013025-spoiling-exact-ad20@gregkh>
 <2024013028-deflator-flaring-ec62@gregkh>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <2024013028-deflator-flaring-ec62@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ITICYVEQUPPW2EMJ6LAZ5DURRNRTDAQL
X-Message-ID-Hash: ITICYVEQUPPW2EMJ6LAZ5DURRNRTDAQL
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ITICYVEQUPPW2EMJ6LAZ5DURRNRTDAQL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 1/30/24 19:46, Greg Kroah-Hartman wrote:
> From: Dan Williams <dan.j.williams@intel.com>
> 
> Add a mechanism for named attribute_groups to hide their directory at
> sysfs_update_group() time, or otherwise skip emitting the group
> directory when the group is first registered. It piggybacks on
> is_visible() in a similar manner as SYSFS_PREALLOC, i.e. special flags
> in the upper bits of the returned mode. To use it, specify a symbol
> prefix to DEFINE_SYSFS_GROUP_VISIBLE(), and then pass that same prefix
> to SYSFS_GROUP_VISIBLE() when assigning the @is_visible() callback:
> 
> 	DEFINE_SYSFS_GROUP_VISIBLE($prefix)
> 
> 	struct attribute_group $prefix_group = {
> 		.name = $name,
> 		.is_visible = SYSFS_GROUP_VISIBLE($prefix),
> 	};
> 
> SYSFS_GROUP_VISIBLE() expects a definition of $prefix_group_visible()
> and $prefix_attr_visible(), where $prefix_group_visible() just returns
> true / false and $prefix_attr_visible() behaves as normal.
> 
> The motivation for this capability is to centralize PCI device
> authentication in the PCI core with a named sysfs group while keeping
> that group hidden for devices and platforms that do not meet the
> requirements. In a PCI topology, most devices will not support
> authentication, a small subset will support just PCI CMA (Component
> Measurement and Authentication), a smaller subset will support PCI CMA +
> PCIe IDE (Link Integrity and Encryption), and only next generation
> server hosts will start to include a platform TSM (TEE Security
> Manager).
> 
> Without this capability the alternatives are:
> 
> * Check if all attributes are invisible and if so, hide the directory.
>   Beyond trouble getting this to work [1], this is an ABI change for
>   scenarios if userspace happens to depend on group visibility absent any
>   attributes. I.e. this new capability avoids regression since it does
>   not retroactively apply to existing cases.
> 
> * Publish an empty /sys/bus/pci/devices/$pdev/tsm/ directory for all PCI
>   devices (i.e. for the case when TSM platform support is present, but
>   device support is absent). Unfortunate that this will be a vestigial
>   empty directory in the vast majority of cases.
> 
> * Reintroduce usage of runtime calls to sysfs_{create,remove}_group()
>   in the PCI core. Bjorn has already indicated that he does not want to
>   see any growth of pci_sysfs_init() [2].
> 
> * Drop the named group and simulate a directory by prefixing all
>   TSM-related attributes with "tsm_". Unfortunate to not use the naming
>   capability of a sysfs group as intended.
> 
> In comparison, there is a small potential for regression if for some
> reason an @is_visible() callback had dependencies on how many times it
> was called. Additionally, it is no longer an error to update a group
> that does not have its directory already present, and it is no longer a
> WARN() to remove a group that was never visible.
> 
> Link: https://lore.kernel.org/all/2024012321-envious-procedure-4a58@gregkh/ [1]
> Link: https://lore.kernel.org/linux-pci/20231019200110.GA1410324@bhelgaas/ [2]
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

This patch seems to introduce a regression on our Lunar Lake test
devices, where we can't boot to an ssh shell. No issues on older devices
[1]. Bard Liao and I reproduced the same results on different boards.

We'll need to find someone with direct device access to provide more
information on the problem, remote testing without ssh is a
self-negating proposition.

Is there a dependency on other patches? Our tests are still based on
6.7.0-rc3 due to other upstream issues we're currently working through.

[1] https://github.com/thesofproject/linux/pull/4799
