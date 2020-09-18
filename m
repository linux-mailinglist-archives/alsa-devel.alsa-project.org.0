Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC9926FC02
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Sep 2020 14:04:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1794842;
	Fri, 18 Sep 2020 14:03:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1794842
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600430665;
	bh=hPQbvKMhsX/VBlMqQXADrTEDn/hz9SyKcPsiDbJyVwM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aMXdg/9gx9KAx/dpeE1581BFx8pKi5brCJBPnHGXFaPvoJtVTB7gqWBFLHl7mCdnl
	 KwrAN0DhmfsshHwwPE94RcvTEA6mOiQVKn/iUkPe4OL+5RwwQ29WQBBiCmaUUR7JUi
	 CTGazSqsmK1pOaLlOTwNU5Q/dd4fw1cDikfAtMMM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 671FFF8015A;
	Fri, 18 Sep 2020 14:02:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D31FF8015C; Fri, 18 Sep 2020 14:02:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A324EF8013A
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 14:02:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A324EF8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HpjNoPkr"
Received: from localhost (unknown [136.185.124.244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0F42420848;
 Fri, 18 Sep 2020 12:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600430553;
 bh=hPQbvKMhsX/VBlMqQXADrTEDn/hz9SyKcPsiDbJyVwM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HpjNoPkrE9MhPcKSNoWS4AFSrH990PR0b+eFy8zWF9xLAN4zp7QfHCeIch2vD1AG8
 zi1nmNt7va/tjAe5q4YzH/APAdXoChNm2WVJvNNjQtSLtM2nQpPhgj4A8cL/lB8+Ba
 hFfzoGmn0sFRmwdfbjPcNF7U0JQBteg0GN0gEGQ8=
Date: Fri, 18 Sep 2020 17:32:29 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v4 0/3] soundwire: qcom: fix IP version v1.5.1 support
Message-ID: <20200918120229.GQ2968@vkoul-mobl>
References: <20200917120138.11313-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917120138.11313-1-srinivas.kandagatla@linaro.org>
Cc: sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On 17-09-20, 13:01, Srinivas Kandagatla wrote:
> While testing Qualcomm soundwire controller version 1.5.1, found two issue,
> Firstly the frame shape information configured vs the bus parameters
> are out of sync. secondly some ports on this ip version require
> block packing mode support.
> 
> With this patchset I was able to test 2 WSA speakers!
> 
> Also I found a regression due to move to REG_FIELD, which patch 1 fixes it!

Applied all, thanks

-- 
~Vinod
