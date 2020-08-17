Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3292624660C
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 14:10:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A013C16C8;
	Mon, 17 Aug 2020 14:09:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A013C16C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597666238;
	bh=TocOjnaqa2TbaSJHcqyENljI//WPudw/4XS9bdbhXC8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PCtRE8UduvQ79xFnG0pwo5JcskRl37QGEBLVe5tfjd9OKlm2kZ7tF9ClEtwLGEwbX
	 rz5EEwUg5ORdN093OPnlWfECQM9ETfkSbDEtngDMtJRixkaqyW02rfv0V+FyH4UGe1
	 yiIbNI5b0PbeZl8wt+f+Wyz90/D+Gvb3nW/Dq/2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7CC1F800EF;
	Mon, 17 Aug 2020 14:08:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E5BFF800F0; Mon, 17 Aug 2020 14:08:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 884DFF80216
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 14:08:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 884DFF80216
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="11Bg5V99"
Received: from localhost (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1B2C82072E;
 Mon, 17 Aug 2020 12:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597666127;
 bh=TocOjnaqa2TbaSJHcqyENljI//WPudw/4XS9bdbhXC8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=11Bg5V99Vtxexq4TbAPee6betJmt3dUihsnlpEPZWErE3yPfSe3yGZqWvSVgWPGIJ
 4TMH6JKh/WLd5m8rC7cAn/fBI29MvVvTXOAWFbcc/9x9vaeyvum5afv2Bqb/vn/3qX
 ygVSINDm/pHUL9wky5E4FTf5wYDXof94yS6PfSi8=
Date: Mon, 17 Aug 2020 17:38:41 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 00/13] soundwire: intel: add power management support
Message-ID: <20200817120841.GQ2639@vkoul-mobl>
References: <20200721203723.18305-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200721203723.18305-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

On 22-07-20, 04:37, Bard Liao wrote:
> This series adds power management support for Intel soundwire links.

I had applied except 3 & 9 (few skipped in middle due to conflict while
applying), BUT I get a build failure on patch 2 onwards :(

drivers/soundwire/intel_init.c: In function ‘sdw_intel_cleanup’:
drivers/soundwire/intel_init.c:72:4: error: implicit declaration of function ‘pm_runtime_disable’ [-Werror=implicit-function-declaration]
   72 |    pm_runtime_disable(&link->pdev->dev);

I suspect due to missing header? I was on x64 build with allmodconfig

So only patch 1 is applied and pushed now

-- 
~Vinod
