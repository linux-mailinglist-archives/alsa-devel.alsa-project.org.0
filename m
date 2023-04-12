Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD3D6DF189
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Apr 2023 12:04:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56FFB10CB;
	Wed, 12 Apr 2023 12:03:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56FFB10CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681293863;
	bh=orE2O/zMsVFBriViH8enOqSC4BSUkPwPs4na+wpil/Y=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oiAojdJ5Yw8AZN2Lj/rV3z7cO98YuH/JZnJXKsiIAO65Ls31FWT2CFGqWcXN7lJCW
	 bWeDDEiGq4xVhpVvPZM5p004lJ9ZfQm8noQZ9wR+Bs3aavxXwcxomKpuFlKu5gTXcK
	 anW0aNpIrwT4yukjoR6OiXiiv3tAj0BGOC8WNPJs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D25EF8025E;
	Wed, 12 Apr 2023 12:03:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43E2DF8032B; Wed, 12 Apr 2023 12:03:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE10EF800E5
	for <alsa-devel@alsa-project.org>; Wed, 12 Apr 2023 12:03:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE10EF800E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=vD8ctv5v
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4A9EC60FC9;
	Wed, 12 Apr 2023 10:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38537C433EF;
	Wed, 12 Apr 2023 10:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681293796;
	bh=orE2O/zMsVFBriViH8enOqSC4BSUkPwPs4na+wpil/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vD8ctv5vHUXhXwPYclZbTLkfZC5IuRcYtwzRJApLNXhQwkzxBut9x9KCPT/jUTT4V
	 oiIvMccrumVHSoH+CRYQ1qZL2r/LN/ae0K95zMF8rrhvxtqagRiEDG7ll+BNsb+Ee7
	 D/mQiwWcexV2kKBQjC5UwaHGaqYcf3dLOT4q/qqziwP2pRYf6V07aXIIo4ljkHWwYX
	 7LomUPi2BY6L+6PJkGycjrglHlTdDN2fED63eCbHVRFEt0cxEARdu541Vrh3/GetnQ
	 tDVYWLgD9tikGIiTVTxpZqco1iD4skLkqo7ocJ2pAMJ6fpK+W+0RfxKOxHAxaA6KPC
	 lkRcBE6GYYxTw==
Date: Wed, 12 Apr 2023 15:33:12 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: intel: don't save hw_params for use in prepare
Message-ID: <ZDaB4Nea32pNWpeN@matsya>
References: <20230321022642.1426611-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230321022642.1426611-1-yung-chuan.liao@linux.intel.com>
Message-ID-Hash: JCK2BF57IBLEPBZZ2XN5JDK5Z6MPSJVA
X-Message-ID-Hash: JCK2BF57IBLEPBZZ2XN5JDK5Z6MPSJVA
X-MailFrom: vkoul@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JCK2BF57IBLEPBZZ2XN5JDK5Z6MPSJVA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 21-03-23, 10:26, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> The existing code copies the hw_params pointer and reuses it later in
> .prepare, specifically to re-initialize the ALH DMA channel
> information that's lost in suspend-resume cycles.
> 
> This is not needed, we can directly access the information from the
> substream/rtd - as done for the HDAudio DAIs in
> sound/soc/sof/intel/hda-dai.c
> 
> In addition, using the saved pointer causes the suspend-resume test
> cases to fail on specific platforms, depending on which version of GCC
> is used. Péter Ujfalusi and I have spent long hours to root-cause this
> problem that was reported by the Intel CI first with 6.2-rc1 and again
> v6.3-rc1. In the latter case we were lucky that the problem was 100%
> reproducible on local test devices, and found out that adding a
> dev_dbg() or adding a call to usleep_range() just before accessing the
> saved pointer "fixed" the issue. With errors appearing just by
> changing the compiler version or minor changes in the code generated,
> clearly we have a memory management Heisenbug.
> 
> The root-cause seems to be that the hw_params pointer is not
> persistent. The soc-pcm code allocates the hw_params structure on the
> stack, and passes it to the BE dailink hw_params and DAIs
> hw_params. Saving such a pointer and reusing it later during the
> .prepare stage cannot possibly work reliably, it's broken-by-design
> since v5.10. It's astonishing that the problem was not seen earlier.
> 
> This simple fix will have to be back-ported to -stable, due to changes
> to avoid the use of the get/set_dmadata routines this patch will only
> apply on kernels older than v6.1.

Applied, thanks

-- 
~Vinod
