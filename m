Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A477F47DF36
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 07:58:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34AA716CB;
	Thu, 23 Dec 2021 07:57:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34AA716CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640242682;
	bh=ISmOxWI6u5C+k89d6ZQbgZNWCUXFaswndd35sG+K8z0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JPzRTAHc3Ak6ZEXWpVFsidhFkSrIxgAoSBouWKsMAj2jFiw9kZGnIoSeC/4FKQRgx
	 6aPob53Q88vhBkU5c4XHbMtQlEHTJvjUjD5kbp5POAWHm16xStm/fQ90dWX6B9/+zT
	 j2BIZBxec8jhYeVEncYqPwHJterVnvwiGMnOVYAM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1955F800FF;
	Thu, 23 Dec 2021 07:56:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26931F80105; Thu, 23 Dec 2021 07:56:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CEC5F800FF
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 07:56:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CEC5F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CM5fWh+l"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B79CAB81F77;
 Thu, 23 Dec 2021 06:56:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2AF3C36AE5;
 Thu, 23 Dec 2021 06:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640242606;
 bh=ISmOxWI6u5C+k89d6ZQbgZNWCUXFaswndd35sG+K8z0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CM5fWh+lMBnLGGltiQMXQB7+PEgxoswhmZAuKApX00qzBb3NfFokxD4noPYkg/cVQ
 wgUdYG/RZMTm/zX3xDONpueRwRrrjkR3y/uhpPDaO/GL42wOkRXpQyjLXzaD6w1lMe
 /TmcrIzy6VnFP2YATaKERGFUIDt4mDY9aYDEgYsQUgym9E9HTZf2pR/QBx12kY+ULs
 T9VABz36aSbtnJAxULLUUtmQ8jcf9vN+QXaY23GsRQ5pn4xd9wGChDwnM/dwRfkxJX
 OqKDW4cVI7xR/d1v/rBco8uIQspbDX86T/MRANXjomdMEXbc62kYTKR2FiTQ4y9xXB
 UuCvjuCx+cuwQ==
Date: Thu, 23 Dec 2021 12:26:41 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 3/7] soundwire: intel: improve suspend flows
Message-ID: <YcQdqT6M+W9du8wy@matsya>
References: <20211213054634.30088-1-yung-chuan.liao@linux.intel.com>
 <20211213054634.30088-4-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211213054634.30088-4-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com,
 bard.liao@intel.com
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

On 13-12-21, 13:46, Bard Liao wrote:
> From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> 
> This patch provides both a simplification of the suspend flows and a
> better balanced operation during suspend/resume transition, as part of
> the transition of Sound Open Firmware (SOF) to dynamic pipelines: the
> DSP resources are only enabled when required instead of enabled on
> startup.
> 
> The exiting code relies on a convoluted way of dealing with suspend
> signals. Since there is no .suspend DAI callback, we used the
> component .suspend and marked all the component DAI dmas as
> 'suspended'. The information was used in the .prepare stage to
> differentiate resume operations from xrun handling, and only
> reinitialize SHIM registers and DMA in the former case.
> 
> While this solution has been working reliably for about 2 years, there
> is a much better solution consisting in trapping the TRIGGER_SUSPEND
> in the .trigger DAI ops. The DMA is still marked in the same way for
> the .prepare op to run, but in addition the callbacks sent to DSP
> firmware are now balanced.
> 
> Normal operation:
> hw_params -> intel_params_stream
> hw_free   -> intel_free_stream
> 
> suspend    -> intel_free_stream
> prepare    -> intel_params_stream
> 
> This balanced operation was not required with existing SOF firmware
> relying on static pipelines instantiated at every boot. With the
> on-going transition to dynamic pipelines, it's however a requirement
> to keep the use count for the DAI widget balanced across all
> transitions.
> 
> The component suspend is not removed but instead modified to deal with
> a corner case: when a substream is PAUSED, the ALSA core does not
> throw the TRIGGER_SUSPEND. This is problematic since the refcount for
> all pipelines and widgets is not balanced, leading to issues on
> resume. The trigger callback keeps track of the 'paused' state with a
> new flag, which is tested during the component suspend called later to
> release the remaining DSP resources. These resources will be
> re-enabled in the .prepare step.
> 
> The IPC used in the TRIGGER_SUSPEND to release DSP resources is not a
> problem since the BE dailink is already marked as non-atomic.

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
