Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7FC845AB0
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Feb 2024 15:57:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66B17850;
	Thu,  1 Feb 2024 15:57:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66B17850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706799436;
	bh=p99XZQDSIF4J5KL8P8p6PnOx6ioMQ12GswsvQJ4B65I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZQkEQdAYqAmkrROojHlmiwZyD4n6x9J8XcYsmJQHVqoz1w8uW+7M92xGoEaWK+Ihm
	 kTEqcoKkFyht3mQ9xxoBDNHNMd2LphsMht8vI7OPmtgf4f+sisYzXw2CD/iGIyLsL0
	 aZqY98baeM1t6OlQ/L8/hNDcoohYuGv1QVvqP8js=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0EA3F8058C; Thu,  1 Feb 2024 15:56:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF6FCF805A0;
	Thu,  1 Feb 2024 15:56:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69919F8055C; Thu,  1 Feb 2024 15:56:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0268DF80548
	for <alsa-devel@alsa-project.org>; Thu,  1 Feb 2024 15:56:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0268DF80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=AMTa4S3R
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DFD50CE1E5B;
	Thu,  1 Feb 2024 14:56:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4B51C433F1;
	Thu,  1 Feb 2024 14:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706799386;
	bh=p99XZQDSIF4J5KL8P8p6PnOx6ioMQ12GswsvQJ4B65I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AMTa4S3RnwgGsx1mp/r7TQh4PlnxN5s3g8fYtcGLxAid5zSuAbFd+Z7KMYFAeju0L
	 td9wX/2PmPUP+kMls+w/dKY7Coy/vPN4OpKu9RvuBfDJoZqdAFOr8SUBwjmReKJ3PI
	 PG5LjvXLrIV2jW6TgD1WDWJYtzryZ8p0BGOocsbE=
Date: Thu, 1 Feb 2024 06:56:25 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Dan Williams <dan.j.williams@intel.com>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [PATCH 2/6] soundwire: sysfs: move sdw_slave_dev_attr_group into
 the existing list of groups
Message-ID: <2024020137-rebel-perkiness-7248@gregkh>
References: <2024013025-spoiling-exact-ad20@gregkh>
 <2024013029-afternoon-suitably-cb59@gregkh>
 <65b9d883538fa_5a9dd2946a@dwillia2-mobl3.amr.corp.intel.com.notmuch>
 <e2756783-b279-71c2-f844-4c3a4128bad9@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2756783-b279-71c2-f844-4c3a4128bad9@linux.intel.com>
Message-ID-Hash: 6UH2BKCPCRIF2X4OFKCK22MEX46YLCUL
X-Message-ID-Hash: 6UH2BKCPCRIF2X4OFKCK22MEX46YLCUL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6UH2BKCPCRIF2X4OFKCK22MEX46YLCUL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jan 31, 2024 at 08:12:10AM +0100, Pierre-Louis Bossart wrote:
> 
> > Makes sense. I won't say "looks good" as this file has "slave" all over
> > the place, but I checked and it entered the kernel just before the
> > CodingStyle changed.
> 
> SoundWire 1.2.1 introduced the terms "Manager" and "Peripheral", I had a
> patchset to rename everything maybe two years ago already but it's been
> difficult to add without getting in the way of development and backports.

Don't worry about backports for stable, we can handle that.  Development
for fixes or changes should NEVER worry about stable kernels, worst
case, we can just take all of the same changes into them, no problem.

> Maybe a gradual replacement makes more sense, not sure how to go about this.

Just rename it all.

thanks,

greg k-h
