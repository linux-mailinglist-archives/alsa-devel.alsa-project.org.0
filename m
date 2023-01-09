Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C45C662AC2
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 17:05:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DB97AE81;
	Mon,  9 Jan 2023 17:04:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DB97AE81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673280311;
	bh=nC+zu23SLcFaISxH4vAQngXlax29OJipYbg1EhlYNpk=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=fKodJ13ye7pQVdRK4az0GW7MVSH+USHpGkzY7xnvE5YcjnalbBZdqk0os3ObKq50H
	 tbZMoRTSBMzu1/K5XLG+Sy9bM3CCg9JwryB7mmUvz9ATecAdO9g+WFy2cIRtEYx/GC
	 eFLGZlrEITmvq++UQBboiA3/00x0FZjlR5iBdp7M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 176F7F80245;
	Mon,  9 Jan 2023 17:04:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55E6FF8030F; Mon,  9 Jan 2023 17:04:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 974E4F80245
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 17:04:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 974E4F80245
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SkpyqOUA
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 86EC960FD4;
 Mon,  9 Jan 2023 16:04:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DC61C433F0;
 Mon,  9 Jan 2023 16:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673280251;
 bh=nC+zu23SLcFaISxH4vAQngXlax29OJipYbg1EhlYNpk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SkpyqOUAa09AuTie9kZS7sHMraNnh15/nx0txMROb4VZqnejwDxSApQAp/vSFBnxw
 N2iz1UkjvSUf80eEEZucj5JynkFOCjRtiOPQFDRbrTjlXyBzb/8o7FXZzkiia8ETj2
 hsFT+gCUDcwPRJw9PKzUKG5zYvowvI8H+T0dJDkAIdBW6Eed5ICC3PxwTJ4vYTxbKB
 4q3jT2aKtbQCWcI/WdjIUuJVD5dE8+9Yg4VJnSWjaLIrb81Zd5Z2qcDP/f6Cnleh0V
 kyE33RbS0/6WY+GRw9kOJ7yp1iysgziaWcVMkXGDiPcBh1bX7KisvPDjmduUQIvIkl
 aovvReV2aH+5w==
Date: Mon, 9 Jan 2023 21:34:08 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: intel: remove DAI startup/shutdown
Message-ID: <Y7w6+HMSn8M1OwHt@matsya>
References: <20221215085436.2001568-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221215085436.2001568-1-yung-chuan.liao@linux.intel.com>
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
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 bard.liao@intel.com, pierre-louis.bossart@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 15-12-22, 16:54, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> The only thing these DAI startup/shutdown callbacks do is play with
> pm_runtime reference counts.
> 
> This is not wrong, but it's not necessary at all. At the ASoC core level,
> only the component matters for pm_runtime. The ASoC core already calls
> pm_runtime_get_sync() in snd_soc_pcm_component_pm_runtime_get(),
> before the DAI startup callback is invoked.
> 
> None of the SoundWire codec drivers rely on pm_runtime helpers in
> their DAI startup/shutdown either. This adds to the evidence that only
> the component, or more precisely the device specified when registering
> a component, should deal with pm_runtime transitions.
> 
> Beyond the code cleanup, this move prepares for the addition of link
> power management in the auxiliary device startup/resume/suspend
> callbacks. The DAI callbacks can by-design assume that the device is
> already pm_runtime active.

Applied, thanks

-- 
~Vinod
