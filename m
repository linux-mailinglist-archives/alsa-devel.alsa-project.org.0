Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4244B13AB20
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:30:05 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D8A02BF5;
	Tue, 14 Jan 2020 07:31:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D8A02BF5
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 716F7F80171;
	Tue, 14 Jan 2020 07:30:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF62EF8014E; Tue, 14 Jan 2020 07:30:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB4ACF80121
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 07:30:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB4ACF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VbMtsrVK"
Received: from localhost (unknown [49.207.51.160])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AAEA420678;
 Tue, 14 Jan 2020 06:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578983410;
 bh=I3Npm/q9Ap8kFw8/iit2SOHfjpnmrQRWzSLHCkZfV+4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VbMtsrVKAdiDwRHx4pWUBzvGJtv6RXL4bpLxpWe2cbt+4iRKTDJs2Zzg5e1cfMzVg
 CBSJNaFpDUMOHKrO/aKfTnLRRXl2jGo0gPdW40aJe9sNUEMOErELn8EFbBLB2t5twR
 dC918ntBxf8WQ3VhlSxFHRRwpUIjHrSMtxDNZyLA=
Date: Tue, 14 Jan 2020 12:00:06 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20200114063006.GE2818@vkoul-mobl>
References: <20200113132153.27239-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200113132153.27239-1-srinivas.kandagatla@linaro.org>
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 linux-kernel@vger.kernel.org, spapothi@codeaurora.org,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH v6 0/2] soundwire: Add support to Qualcomm
 SoundWire master
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

On 13-01-20, 13:21, Srinivas Kandagatla wrote:
> Thanks for reviewing the v5 patchset.
> Here is new patchset addressing all the comments from v5
> 
> This patchset adds support for Qualcomm SoundWire Master Controller
> found in most of Qualcomm SoCs and WCD audio codecs.
> 
> This driver along with WCD934x codec and WSA881x Class-D Smart Speaker
> Amplifier drivers is tested on on DragonBoard DB845c based of SDM845
> SoC and Lenovo YOGA C630 Laptop based on SDM850.
> 
> SoundWire controller on SDM845 is integrated in WCD934x audio codec via
> SlimBus interface.
> 
> Currently this driver is very minimal and only supports PDM.
> 
> Most of the code in this driver is rework of Qualcomm downstream drivers
> used in Andriod. Credits to Banajit Goswami and Patrick Lai's Team.

Applied, thanks

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
