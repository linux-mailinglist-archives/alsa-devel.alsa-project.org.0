Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D53AF3D25B0
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jul 2021 16:26:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 666FE16EA;
	Thu, 22 Jul 2021 16:26:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 666FE16EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626964010;
	bh=c/Ys/hpnBH4d69fBDHfMsfkITtHR3CBpaqSOrsNHHxg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oY5B5iTKnYPHWdeTaSTHIw8vW8VWH4ixbrgWBSqDUttbx4X4QulTELLo7An9uGsJK
	 8orFLP9BbuXUzaxnp//BHzLDZfB76g75yWP0EwymJnaCmQXiv/5c3R/tJLXYAzenl/
	 m8niFifG4VHgCBhkGq0zqRgFlJcPoGBWJqIqR+EQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4829AF8032B;
	Thu, 22 Jul 2021 16:25:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89F2FF802E0; Thu, 22 Jul 2021 16:25:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41A25F80218
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 16:25:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41A25F80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dVErfNob"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A848561264;
 Thu, 22 Jul 2021 14:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626963952;
 bh=c/Ys/hpnBH4d69fBDHfMsfkITtHR3CBpaqSOrsNHHxg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dVErfNobTt33zsXPdXm/Vfj8yOOe3/mJ86IF/qtmIyDuDujjJdRJuErrSjJ5s6oNu
 uUAVKzbftKcEqgfvopNe0exwGiJPxUJnRXUguz75Qz6yIp0NQxIU+ePVAvqpXoqm+j
 ilIG8ta2hbsW07XhPs2vv5+JF6VYHIAnBIkKkyjQ/oP4AGRt+eHPjz3Ccu+0xQhrnj
 jjYUdZ/OJJr6Dppoip5QZzO/6MDqcZMJnMqw/CCybrtUEhx590+HgcsjuMt7n0lPfd
 SGNzIDRcv89L6VI5ao7TUKYKkw2b2ZcrMARxxKVYWNSnJkpL9hwx2+Ui+6TMcngRc0
 ZfFgZLaujCwoQ==
Date: Thu, 22 Jul 2021 19:55:48 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: bus: update Slave status in
 sdw_clear_slave_status
Message-ID: <YPl/7LtAzElmrFah@matsya>
References: <20210714033609.11963-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714033609.11963-1-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

On 14-07-21, 11:36, Bard Liao wrote:
> Call to sdw_update_slave_status() needs to be added to sdw_clear_slave_
> status() to ensure Slaves are informed of the new status via update_
> status() callback.
> 
> This will enable codec drivers to reset their internal states and make
> sure the register settings are properly restored on pm_runtime or
> system resume

Applied, thanks

-- 
~Vinod
