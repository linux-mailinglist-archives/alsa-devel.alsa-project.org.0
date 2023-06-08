Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E89BC727EFE
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 13:40:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB2293E8;
	Thu,  8 Jun 2023 13:39:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB2293E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686224433;
	bh=nM9Mt74z4YYunGYFvPmP6gQm7sj/Lc0clDW3pL7yI7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=awJy/Mq9Pa7wS6bGOKA9aE7BnK8+UyQIsHXV1qOgLJ/B+eT/T49Ux6Q4ZtK78i2JX
	 i8KIF5IfZT5rnsXWa4giBEcCj6rQ0rdqDdryJH7s2v5cTAkjm51QAA51f2i2m9+7rW
	 t/PUBnCfiY2aLEQEeHKcYnrmN5LEaGrTYX+wlnRs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EBA4F80155; Thu,  8 Jun 2023 13:39:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 905CEF800ED;
	Thu,  8 Jun 2023 13:39:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1986F80199; Thu,  8 Jun 2023 13:39:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 89F06F800ED
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 13:39:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89F06F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=juCXJMO0
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D121564C96;
	Thu,  8 Jun 2023 11:39:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F88FC433D2;
	Thu,  8 Jun 2023 11:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686224369;
	bh=nM9Mt74z4YYunGYFvPmP6gQm7sj/Lc0clDW3pL7yI7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=juCXJMO0YrEKCe2l2oPBwOwKjJrQB+PqFZ3b3C5H+wZFzCK4TidM/Se6OQY2JtuQL
	 n/heOtHYaNTyK1S899ZoXjvPU5llDF3IQrObcgB9qAUIXhYUt8MBg7w7nCyAKJiAeS
	 Hv+bm3Lw8d3QPSD9Dvm42Skj+PqsPft8nsL3soZyUuPwR+quvzsqADiGL4zHtZ42TX
	 VMsu37ErYvXICKLezJkp43j3S2WfPK3dleF1F8FQgb/mVLCJSITWXUlwPVLZfXJVe4
	 eAFJhU6w+yHkAL5TWXa+8zEux+5BRRIZQZUMzyNtUaP8gS8AqINUESF+bq6TI9qu3U
	 hd6uqgUyIArJw==
Date: Thu, 8 Jun 2023 17:09:24 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.intel.com,
	sanyog.r.kale@intel.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v2 1/5] soundwire: stream: Add missing clear of
 alloc_slave_rt
Message-ID: <ZIG97E/9fWmWHhVq@matsya>
References: <20230602101140.2040141-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230602101140.2040141-1-ckeepax@opensource.cirrus.com>
Message-ID-Hash: LJHBPJWTAF2I4N4MDEVXTM4TCHLG2B45
X-Message-ID-Hash: LJHBPJWTAF2I4N4MDEVXTM4TCHLG2B45
X-MailFrom: vkoul@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LJHBPJWTAF2I4N4MDEVXTM4TCHLG2B45/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 02-06-23, 11:11, Charles Keepax wrote:
> The current path that skips allocating the slave runtime does not clear
> the alloc_slave_rt flag, this is clearly incorrect. Add the missing
> clear, so the runtime won't be erroneously cleaned up.

Applied all, thanks

-- 
~Vinod
