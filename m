Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E09662AFE
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 17:17:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2223B6ED;
	Mon,  9 Jan 2023 17:17:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2223B6ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673281073;
	bh=gfjzt/DnF9JCvu8ufzPU2ZxmvixSmjjSU/gNSsjFWEI=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=m+T8lvv++qF5mPNgTbXZ3kQbAUAlpkVv0C7pKtGcTDAbC4mK/xTXf73A6Sku8qPVk
	 u7ZaWDlsyGu42Bk3omTmVsllYKnVdPmsfgYb026T0bMDbjHawtzQwpjyNjoxQ2kr5c
	 JD5DOn1sL7P0ckT2G00N5LbRPaRqASCaNQPOw0SI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A2A9F80245;
	Mon,  9 Jan 2023 17:16:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D1C4F8030F; Mon,  9 Jan 2023 17:16:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B3E3F8026A
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 17:16:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B3E3F8026A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=V88ClifF
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D970EB80E3F;
 Mon,  9 Jan 2023 16:16:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12184C433F1;
 Mon,  9 Jan 2023 16:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673281009;
 bh=gfjzt/DnF9JCvu8ufzPU2ZxmvixSmjjSU/gNSsjFWEI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V88ClifFKaGQJE/tkgPL9sOuWJq7wM0ylZS3l3ybzyNdtm4NfkW8jwDdGDwxzWGcK
 hMLo6bdOt5emTRJxjvQ4nZD2ICBEys2A+0/T6+0vAL7E5rZXNzUxVLahb8NEAZhzHn
 XG89infn9dhpMxnJxMCibE3bFRchbex5U2Sln5zQNYHKpmcCk8RT2ZZwF0NwCCfbGX
 0mK7RdnmvDh0jQgJZk2M6Cz+TIts3+2cY6OYuK1sws9H9tfBqItsOeVhcvTsfnt20f
 DmSZbUjbJLq69nYj2iTUqkUe5BSnlLRub8vY+o0zDi3Fo3PeeefkGWKSWRpAcGfMCl
 CLyAzkdXNwoQg==
Date: Mon, 9 Jan 2023 21:46:45 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v4 0/4] Minor SoundWire clean ups
Message-ID: <Y7w97fs92SL8Sg5U@matsya>
References: <20221125142028.1118618-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221125142028.1118618-1-ckeepax@opensource.cirrus.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 25-11-22, 14:20, Charles Keepax wrote:
> Just some minor tidy ups and preparation for starting to upstream some
> Cirrus SoundWire devices. The first three patches are pretty trivial,
> the last patch which moves the remaining core over to using the no_pm
> functions could probably use some careful review.

Applied, thanks

> 
> Changes since v3:
>  - Return an error and add a WARN_ONCE if the build stubs are used.
> 
> Changes since v2:
>  - Fix up a memory leak of a buffer on the error path
>  - Added some reviewed by's
> 
> Thanks,
> Charles
> 
> *** BLURB HERE ***

oops :)

 
> 
> Charles Keepax (3):
>   soundwire: Provide build stubs for common functions
>   soundwire: debugfs: Switch to sdw_read_no_pm
>   soundwire: stream: Move remaining register accesses over to no_pm
> 
> Simon Trimmer (1):
>   soundwire: bus: export sdw_nwrite_no_pm and sdw_nread_no_pm functions
> 
>  drivers/soundwire/bus.c       |  10 ++--
>  drivers/soundwire/debugfs.c   |  13 ++++-
>  drivers/soundwire/stream.c    |  30 +++++-----
>  include/linux/soundwire/sdw.h | 107 ++++++++++++++++++++++++++++++----
>  4 files changed, 129 insertions(+), 31 deletions(-)
> 
> -- 
> 2.30.2

-- 
~Vinod
