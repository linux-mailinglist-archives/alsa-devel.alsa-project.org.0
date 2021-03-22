Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0507343D3E
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Mar 2021 10:52:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1438D950;
	Mon, 22 Mar 2021 10:51:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1438D950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616406764;
	bh=v3Tth3ndoH1aZrtHBP4lGMYM2A95xDjWf4wrzL8cw68=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B2SXTVxhX5zfVRNTDu459yXUMWNS642JMzSvqEsqG7tLnX/n4l4k5jp+foTrE+qY3
	 PyMLzGf3+OdErprr9rjENRIKb15ts21fH8f75oMf84Odx5cXUp5YJjwW+2gC3xkNVF
	 b4+NRqf8Jpb6FEKTjEn7kyzXZAtQ5PX9BP/YE5dI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61203F801D5;
	Mon, 22 Mar 2021 10:51:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE802F8012F; Mon, 22 Mar 2021 10:51:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F31EEF8012F
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 10:51:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F31EEF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tww3xJb8"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 294DD61924;
 Mon, 22 Mar 2021 09:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616406661;
 bh=v3Tth3ndoH1aZrtHBP4lGMYM2A95xDjWf4wrzL8cw68=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tww3xJb8jMY9GK4TkrCLINyD+DB8pwGFiwNkLkD4Oa1uOlSsdQU4Hr6WBHuiolSe8
 pQH8gWcff7mUXbjfyf1Sre5my5XdFSbXnLoF5O3RzzLHn19v5gEplxy/H0lVFmy4CY
 dnUWhwvK0GCJLpW9OYhI2j/qfWVIHzCAv35ljAtQgwtbhnlpxFfgXKUC+arsW/cFY9
 xGSASImkhGyNGgKOwQRBHrY1WoF9H9U8xpuyGm1Dy1jgn15+vnJhUVzwx0BaVCEVUI
 gQ97arAY6UCOccVMo9mGxWevPGqvaGZt8eXXL4pj39j3i0izdRHxRxxNWn7Ka8c6Ti
 GzkRRFOMQoebw==
Date: Mon, 22 Mar 2021 15:20:56 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2] soundwire: cadence_master: fix kernel-doc
Message-ID: <YFhogCA4moKNm4Lg@vkoul-mobl.Dlink>
References: <20210301174714.117172-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210301174714.117172-1-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 01-03-21, 11:47, Pierre-Louis Bossart wrote:
> v5.12-rc1 flags new warnings with make W=1, fix missing or broken
> function descriptors.
> 
> drivers/soundwire/cadence_master.c:914: warning: expecting prototype
> for To update slave status in a work since we will need to
> handle(). Prototype was for cdns_update_slave_status_work() instead
> 
> drivers/soundwire/cadence_master.c:976: warning: expecting prototype
> for sdw_cdns_enable_slave_interrupt(). Prototype was for
> cdns_enable_slave_interrupts() instead

Applied, thanks. Please do mention changes in v2 in the patch (after the
sob line)


-- 
~Vinod
