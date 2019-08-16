Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DEA8FF55
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Aug 2019 11:46:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FF571662;
	Fri, 16 Aug 2019 11:45:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FF571662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565948772;
	bh=zPGGnIV13C+zuI3bYs9FP+GSpU4JbPhiUeIFPWzEuT8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E1fKJ5eOgAYGT67DdAFMEOpjYzAcPIPo+0m7y7GURax3gGp9mTww3vlG1zh5p9+Lz
	 J227bljk08HDTVIMm642fABypyCXJhfWge1AkGtHl20xqyZVEFkP/EzETXz/hnHvfi
	 lJFUI74UMCcw4TdJ1T5msCPKh8j4B+ShYBuV7u2A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BDE2F803F4;
	Fri, 16 Aug 2019 11:44:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B5CEF80214; Fri, 16 Aug 2019 11:44:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A06FF8011F
 for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2019 11:44:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A06FF8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cpYXQ5It"
Received: from localhost (unknown [117.99.90.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D6FFA20644;
 Fri, 16 Aug 2019 09:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565948661;
 bh=RkU/EVqq1vhFMUqIe13oGkZ0ZSndMkAlwA9Q5IYDAUQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cpYXQ5ItQAhKKEjq3xmvtyw4GoGUmqLAGIUXwwSuYxyZz8+XGNNfVnia17cXeBCj2
 cADfpm5rceB7ENMlPn4bBsDchHOrNt9iF9dzPFvXqioHGibNhOQn/Jz8fUFQROLtWA
 +hvSgeo5JJVi9s9RleY896YefeQCwXB/l4UZ3lXQ=
Date: Fri, 16 Aug 2019 15:13:08 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190816094308.GA12733@vkoul-mobl.Dlink>
References: <20190812235942.7120-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190812235942.7120-1-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com
Subject: Re: [alsa-devel] [PATCH v2 0/3] soundwire: debugfs support for 5.4
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 12-08-19, 18:59, Pierre-Louis Bossart wrote:
> This patchset enables debugfs support and corrects all the feedback
> provided on an earlier RFC ('soundwire: updates for 5.4')
> 
> There is one remaining hard-coded value in intel.c that will need to
> be fixed in a follow-up patchset not specific to debugfs: we need to
> remove hard-coded Intel-specific configurations from cadence_master.c
> (PDI offsets, etc).
> 
> Changes since v1 (Feedback from GKH)
> Handle debugfs in a more self-contained way (no dentry as return or parameter)
> Used CONFIG_DEBUG_FS in structures and code to make it easier to
> remove if need be.
> No functional change for register dumps.
> 
> Changes since RFC (Feedback from GKH, Vinod, Guennadi, Cezary, Sanyog):
> removed error checks
> used DEFINE_SHOW_ATTRIBUTE and seq_file
> fixed copyright dates
> fixed SPDX license info to use GPL2.0 only
> fixed Makefile to include debugfs only if CONFIG_DEBUG_FS is selected
> used static inlines for fallback compilation
> removed intermediate variables
> removed hard-coded constants in loops (used registers offsets and
> hardware capabilities)
> squashed patch 3

These looks good but failed to apply. Please rebase on soundwire-next
and resend

Thanks

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
