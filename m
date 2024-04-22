Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE118AC8BE
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Apr 2024 11:21:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E9F7DFA;
	Mon, 22 Apr 2024 11:20:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E9F7DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713777662;
	bh=T5tRASABoyAmF4/TwmiQdb4aSxJ5IjEe6kgVUHlghnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NwjEJU/nlZRw4X5agtXCZH5eR+d048Hg/CrzTBqynQMG7ZNduKq2lRcQT2cNNA5rl
	 25swOACOnE/9KwNB23zEEkDfT0HV6371g8jRZJRs9t+FUWGsE3pw8bdfupneZIt9XC
	 3J5UdDO6OtuemBr8l54T05ROgGv6xFRfnnoL/uzM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0362CF805AB; Mon, 22 Apr 2024 11:20:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 95641F80579;
	Mon, 22 Apr 2024 11:20:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71D44F802E8; Mon, 22 Apr 2024 11:20:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net
 [83.223.78.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5AB4F800B5
	for <alsa-devel@alsa-project.org>; Mon, 22 Apr 2024 11:20:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5AB4F800B5
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net",
 Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 2EF4A280108A8;
	Mon, 22 Apr 2024 11:20:16 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 03FB34D34A; Mon, 22 Apr 2024 11:20:15 +0200 (CEST)
Date: Mon, 22 Apr 2024 11:20:15 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Dan Williams <dan.j.williams@intel.com>
Cc: gregkh@linuxfoundation.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Marc Herbert <marc.herbert@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-coco@lists.linux.dev, alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/3] sysfs: Fix crash on empty group attributes array
Message-ID: <ZiYrzzk9Me1aksmE@wunner.de>
References: 
 <170863444851.1479840.10249410842428140526.stgit@dwillia2-xfh.jf.intel.com>
 <170863445442.1479840.1818801787239831650.stgit@dwillia2-xfh.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <170863445442.1479840.1818801787239831650.stgit@dwillia2-xfh.jf.intel.com>
Message-ID-Hash: QHNSZCUPAE226SPNYO2SRAJZA6OSWFTN
X-Message-ID-Hash: QHNSZCUPAE226SPNYO2SRAJZA6OSWFTN
X-MailFrom: foo00@h08.hostsharing.net
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QHNSZCUPAE226SPNYO2SRAJZA6OSWFTN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Feb 22, 2024 at 12:40:54PM -0800, Dan Williams wrote:
> It turns out that arch/x86/events/intel/core.c makes use of "empty"
> attributes.
> 
> 	static struct attribute *empty_attrs;
> 
> 	__init int intel_pmu_init(void)
> 	{
> 	        struct attribute **extra_skl_attr = &empty_attrs;
> 	        struct attribute **extra_attr = &empty_attrs;
> 	        struct attribute **td_attr    = &empty_attrs;
> 	        struct attribute **mem_attr   = &empty_attrs;
> 	        struct attribute **tsx_attr   = &empty_attrs;
> 		...
> 
> That breaks the assumption __first_visible() that expects that if
> grp->attrs is set then grp->attrs[0] must also be set and results in
> backtraces like:
> 
>     BUG: kernel NULL pointer dereference, address: 00rnel mode
>     #PF: error_code(0x0000) - not-present ] PREEMPT SMP NOPTI
>     CPU: 1 PID: 1 Comm: swapper/IP: 0010:exra_is_visible+0x14/0x20
>      ? exc_page_fault+0x68/0x190
>      internal_create_groups+0x42/0xa0
>      pmu_dev_alloc+0xc0/0xe0
>      perf_event_sysfs_init+0x580000000000 ]---
>     RIP: 0010:exra_is_visible+0x14/0
> 
> Check for non-empty attributes array before calling is_visible().
[...]
> --- a/fs/sysfs/group.c
> +++ b/fs/sysfs/group.c
> @@ -33,10 +33,10 @@ static void remove_files(struct kernfs_node *parent,
>  
>  static umode_t __first_visible(const struct attribute_group *grp, struct kobject *kobj)
>  {
> -	if (grp->attrs && grp->is_visible)
> +	if (grp->attrs && grp->attrs[0] && grp->is_visible)
>  		return grp->is_visible(kobj, grp->attrs[0], 0);
>  
> -	if (grp->bin_attrs && grp->is_bin_visible)
> +	if (grp->bin_attrs && grp->bin_attrs[0] && grp->is_bin_visible)
>  		return grp->is_bin_visible(kobj, grp->bin_attrs[0], 0);
>  
>  	return 0;

I'm wondering why 0 is returned by default and not SYSFS_GROUP_INVISIBLE.

An empty attribute list (containing just the NULL sentinel) will now
result in the attribute group being visible as an empty directory.

I thought the whole point was to hide such empty directories.

Was it a conscious decision to return 0?
Did you expect breakage if SYSFS_GROUP_INVISIBLE is returned?

Thanks,

Lukas
