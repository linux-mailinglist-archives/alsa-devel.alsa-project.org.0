Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0211B890819
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Mar 2024 19:16:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BEB12CAD;
	Thu, 28 Mar 2024 19:16:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BEB12CAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711649791;
	bh=rIL/RbCTqRPeLSNUR01+nAhLNjjxpyUuDFgGJNbe3gk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gOjZWN4pe5xp7a9LMomTEGuYSf9yMQ/MCo7zFiWA5TIjiOtH+RSH6WQWmGMjhvBiX
	 GhD5NjqA5xTyzno3Lv6pyP5bffG2IsBWmR/IOUSVdE6dgxBxQICAyZDtuNrLCGXBxS
	 NZg7zKXMgztyFGSdOW9/9w/R0qQQ4ouyhVqW5lJU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 429EAF80571; Thu, 28 Mar 2024 19:16:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7D02F80236;
	Thu, 28 Mar 2024 19:15:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 469CDF8025F; Thu, 28 Mar 2024 19:15:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C82D4F80074
	for <alsa-devel@alsa-project.org>; Thu, 28 Mar 2024 19:15:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C82D4F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CtiIMkQm
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8328ACE2C36;
	Thu, 28 Mar 2024 18:15:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72449C433F1;
	Thu, 28 Mar 2024 18:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711649747;
	bh=rIL/RbCTqRPeLSNUR01+nAhLNjjxpyUuDFgGJNbe3gk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CtiIMkQmCh9a/0N/3P2DLD0QhLHp/Kt9fbxbPQ3ssIYyckRTxinp8lfwYUpzO/jac
	 fMlHWcbfiiIzdQyKdC9bgxtCB35ZsJraQtdF1pB8tMmXpA8hg44HW9S2J2cFYxGnOB
	 yo7iD+WWFCKD8xqz29xGf422wyt8O+EHbXzO4K+Iqc0EtCtr/kVjxmK/4VznQvWNY7
	 t69gA4hN1ZDPlb19F39mUW9jZ0cYAH7rydGF9yMraDsFnf7bBb9kXkrrqSKSQRFzrU
	 q0N3teu3U99JwA0RmmEDyBSbE5WAUbdZxlZSTzF4Pmd3bXx1B9lb/RQKH0mJb4f8gj
	 2OCCBPT/3vbMQ==
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>
In-Reply-To: <2024013025-spoiling-exact-ad20@gregkh>
References: <2024013025-spoiling-exact-ad20@gregkh>
Subject: Re: (subset) [PATCH 0/7] Soundwire: clean up sysfs group creation
Message-Id: <171164974294.128475.17340584183341425045.b4-ty@kernel.org>
Date: Thu, 28 Mar 2024 23:45:42 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
Message-ID-Hash: DEWTEQNWTWFJIR4UNPUFVDBZRFY4HIDW
X-Message-ID-Hash: DEWTEQNWTWFJIR4UNPUFVDBZRFY4HIDW
X-MailFrom: vkoul@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DEWTEQNWTWFJIR4UNPUFVDBZRFY4HIDW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 30 Jan 2024 10:46:26 -0800, Greg Kroah-Hartman wrote:
> Note, this is a redone version of a very old series I wrote back in
> 2022:
> 	https://lore.kernel.org/r/20220824135951.3604059-1-gregkh@linuxfoundation.org
> but everyone has forgotten about it now, and I've reworked it, so I'm
> considering it a "new" version, and not v2.
> 
> Here's a series that adds the functionality to the driver core to hide
> entire attribute groups, in a much saner way than we have attempted in
> the past (i.e. dynamically figuring it out.)  Many thanks to Dan for
> this patch.  I'll also be taking this into my driver-core branch and
> creating a stable tag for anyone else to pull from to get it into their
> trees, as I think it will want to be in many for this development cycle.
> 
> [...]

Applied, thanks!

[2/6] soundwire: sysfs: move sdw_slave_dev_attr_group into the existing list of groups
      commit: b1b11bb07898b7e0313438734c310100219e676f
[3/6] soundwire: sysfs: cleanup the logic for creating the dp0 sysfs attributes
      commit: 3ee43f7cc9841cdf3f2bec2de4b1e729fd17e303
[4/6] soundwire: sysfs: have the driver core handle the creation of the device groups
      commit: fc7e56017b51482f1b9da2e778eedb4bd1deb6b3
[5/6] soundwire: sysfs: remove sdw_slave_sysfs_init()
      commit: f88c1afe338edbcbfd23743742c45581075fb86c
[6/6] soundwire: sysfs: remove unneeded ATTRIBUTE_GROUPS() comments
      commit: 91c4dd2e5c9066577960c7eef7dd8e699220c85e

Best regards,
-- 
~Vinod


