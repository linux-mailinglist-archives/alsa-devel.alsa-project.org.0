Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D5459E671
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 17:59:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAB4015E2;
	Tue, 23 Aug 2022 17:58:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAB4015E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661270353;
	bh=SUC+lByAZGgqLU/3Cl0PMwl2vVOmjw7akh8B3lf9yTs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J6xYq51YpTNz+p0VFg7TyIp40rC+0p0bcS8rGwaoXW/yxjf0qt5g+bNpCV5YP9sMz
	 tVcN9AHXbhQFCE2NGbrwWGQ8g+V8b9ELm8j0QJnrN2MPxfAbxc3Afb/Q6R6kyaOK6e
	 mK2krQdzY6VYprt9ovx15kpFBJkcV9LHGkGj4Rek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47669F8014E;
	Tue, 23 Aug 2022 17:58:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9531AF8020D; Tue, 23 Aug 2022 17:58:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A0B3F800A7
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 17:58:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A0B3F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ElfF6JCi"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E05FC615DD;
 Tue, 23 Aug 2022 15:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B71AEC433D6;
 Tue, 23 Aug 2022 15:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661270285;
 bh=SUC+lByAZGgqLU/3Cl0PMwl2vVOmjw7akh8B3lf9yTs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ElfF6JCiI2kve4i5kiT/diqWECRFKWTZzcPSh0nUVuVAmygRWK14Re9Y9ilZdNM/P
 2VCuSE+y9eHW/khYM4+kHDStvtoKqj/YBbHhWFEbGZvZxIvaiUVvipq85E05PXPmMW
 yBv1CsfE5dkYRxFC2u5017TASKisvUTf5PEE2Kzzhxlxr0hRSLin0lJYtcps7HyRnj
 J4TTMSWE4YxlXNOagR32DAuAfuTaoJFTMXzHdk0rDwGzz6AM/bCWWqeNbd3znuEU1p
 ECMGMk3/NLdtVHl2Rmv9CRCpybYO/aXIM6HK8K6t+CQodHZo6nhaaefDjTNafRjdfm
 NwAwuWihbUKQg==
Date: Tue, 23 Aug 2022 21:28:00 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] soundwire: qcom: remove duplicate reset control get
Message-ID: <YwT5COjQAvFUB+LA@matsya>
References: <20220814123800.31200-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220814123800.31200-1-srinivas.kandagatla@linaro.org>
Cc: amit.pundir@linaro.org, alsa-devel@alsa-project.org
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

On 14-08-22, 13:38, Srinivas Kandagatla wrote:
> Looks like adding clock gate flag patch forgot to remove the old code that
> gets reset control.
> 
> This causes below crash on platforms that do not need reset.
> 
> [   15.653501]  reset_control_reset+0x124/0x170
> [   15.653508]  qcom_swrm_init+0x50/0x1a0
> [   15.653514]  qcom_swrm_probe+0x320/0x668
> [   15.653519]  platform_probe+0x68/0xe0
> [   15.653529]  really_probe+0xbc/0x2a8
> [   15.653535]  __driver_probe_device+0x7c/0xe8
> [   15.653541]  driver_probe_device+0x40/0x110
> [   15.653547]  __device_attach_driver+0x98/0xd0
> [   15.653553]  bus_for_each_drv+0x68/0xd0
> [   15.653559]  __device_attach+0xf4/0x188
> [   15.653565]  device_initial_probe+0x14/0x20
> 
> Fix this by removing old code.

Applied, thanks

-- 
~Vinod
