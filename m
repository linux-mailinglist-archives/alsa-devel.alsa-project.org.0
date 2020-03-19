Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 095DE18AD3A
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Mar 2020 08:15:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C52B1757;
	Thu, 19 Mar 2020 08:14:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C52B1757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584602109;
	bh=nGwFrB1PzqeUqXfvl6pxCdc1NBj97fWXvdQEAtR0opc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UJNaGjawAsVHSjEePkxjcfbVMNjuUq0ng+vhn3FX5p376OUJYR/zDZ5ZSYNb1lxAF
	 5uIxbSTHUDHllPS42p8ko/MGHZcrFWCwb9YVhFG4zg/uNTCfqYpL+ybcyT/NUi2a/+
	 CiKvWeDwLkOTDxMJxzFQNvPt0+mUuHX1ICU/nHUI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79F77F80232;
	Thu, 19 Mar 2020 08:13:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CF7AF8022B; Thu, 19 Mar 2020 08:13:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A50DF800DD
 for <alsa-devel@alsa-project.org>; Thu, 19 Mar 2020 08:13:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A50DF800DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZLC6xwLt"
Received: from localhost (unknown [122.167.78.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8F51B20724;
 Thu, 19 Mar 2020 07:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584602000;
 bh=nGwFrB1PzqeUqXfvl6pxCdc1NBj97fWXvdQEAtR0opc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZLC6xwLtb16a3HMBrddm/hJSPfqqaUjJmMgTpxMw7qVd9/tbhV2DxqBuE4qWTo/jV
 QVqs2eayqeu3/FwVGVENAKy+o7xP9WbAXbT3ovM/V23ymQq0p7VET8WYEA9vwy+MCZ
 MY5rQtsrWUGioLaprb+nBPY1G5uUXYVny3yZ95bY=
Date: Thu, 19 Mar 2020 12:43:13 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2 00/17] SoundWire: cadence: add clock stop and fix
 programming sequences
Message-ID: <20200319071313.GX4885@vkoul-mobl>
References: <20200317163329.25501-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200317163329.25501-1-pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

On 17-03-20, 11:33, Pierre-Louis Bossart wrote:
> To make progress with SoundWire support, this patchset provides the
> missing support for clock stop modes, and revisits all Cadence Master
> register settings. The current code is for some reason not aligned
> with internal documentation and hardware recommended flows,
> specifically for multi-link operation.

Applied, thanks

-- 
~Vinod
