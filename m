Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C242B51F48B
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 08:31:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47B101888;
	Mon,  9 May 2022 08:30:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47B101888
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652077908;
	bh=DXieFXLBq4ieE8RkkoZNSW7FjctpJuOTdLRbxH7qdmU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XQLJDuCE/5Z/XWtbftIOqAKOHj17UzE/EyOBQLMKrOmn+WcsroJcp1urPmUiXBIlZ
	 mWpRDbyYRSEBv6cg5MXGebFfhXYoGJt2Gy5w4sR05Gm6EGOffgj7OQXvbhvJRbtFTY
	 GpC41neWlJwucjCE4G3XoKKGdx4H3P2q3SRYAG3o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2277F800D3;
	Mon,  9 May 2022 08:30:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2164CF8014C; Mon,  9 May 2022 08:30:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAC87F8014C
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 08:30:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAC87F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JhehAjvy"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5F22560F24;
 Mon,  9 May 2022 06:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B594C385AB;
 Mon,  9 May 2022 06:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652077836;
 bh=DXieFXLBq4ieE8RkkoZNSW7FjctpJuOTdLRbxH7qdmU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JhehAjvyCcEicKiJYLuxM7jPXqRXdGrDQ7YZxKRrouELMebcz7yCCBUice324qwyw
 Rtuw+alC+f5y6hO4rLt3/aEMUNzSA0nsL0Ec3D8YAaapVa8uB6cO1n7txMmJPSItyk
 v68AKRI2x4bc98kxfcR3Ea+XijDESyg1xQUXnrQR2hdztrkqMPAGmlAPQkowRlGhNH
 6QZm7MYN+sUCL1mAPqreqyfJI/M365LdiTl3Dsh4/nCGKbIknaHd9zEiVRHBZnnTv4
 6M3jmnZvrev9JhCcVhJc05QjwCr5s4/qLUpJZm3z8wv7U4WaT3w+gcBZt9aWg3YwnQ
 Je4iUr+fKIT7Q==
Date: Mon, 9 May 2022 12:00:32 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: cadence: recheck device0 attachment after
 status change
Message-ID: <Yni1CKb20D99kAce@matsya>
References: <20220420023039.14144-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220420023039.14144-1-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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

On 20-04-22, 10:30, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> This patch adds a status check after device0 attachment to solve race
> conditions observed during attachment with multiple devices per link
> 
> The sequence is the following
> 
> 1) deviceA attaches as device0
> 
> 2) the hardware detects a device0 status change and throws an
>  interrupt.
> 
> 3) the interrupt handler schedules the work function
> 
> 4) the workqueue starts, we read the status
> slave0 = cdns_readl(cdns, CDNS_MCP_SLAVE_INTSTAT0);
> slave1 = cdns_readl(cdns, CDNS_MCP_SLAVE_INTSTAT1);
> 
> we deal with the status change and program deviceA device number to a
> non-zero value.
> 
> 5) deviceB attaches as device0, the device0 status seen by the
> hardware does not change.
> 
> 6) we clear the CDNS_MCP_SLAVE_INTSTAT0/1 registers -> we will never detect
> deviceB!
> 
> This patch suggest re-checking in a loop the device0 status with a
> PING frame, i.e. using the real device0 status instead of information
> on status changes.

Applied, thanks

-- 
~Vinod
