Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5F2176E50
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Mar 2020 06:04:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF45F1684;
	Tue,  3 Mar 2020 06:03:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF45F1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583211866;
	bh=1QbMXScDoBHGeiga9CbK0y7yvrt3pgJfz3o3lM15WeA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mr/siDGow5AbX1sShi5gMLxxQweapfm6HP9TKh2FZdDKzKqQgQ/VwtIhY9lRbxDyB
	 9dtsSlWCytAq4dyxIok6Xc0AzLGv+Defuebnf39q4DxlJhVxGUbu3jpWJI5s+s1bHS
	 /wFvoFtN/Y3GqXpoZZH5hkZSM7QUmRXuv248ySxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BAAFF80266;
	Tue,  3 Mar 2020 06:02:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A682EF8025F; Tue,  3 Mar 2020 05:59:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B914F8012D
 for <alsa-devel@alsa-project.org>; Tue,  3 Mar 2020 05:59:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B914F8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZGXFKyNd"
Received: from localhost (unknown [122.167.124.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 62FBA20848;
 Tue,  3 Mar 2020 04:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583211564;
 bh=1QbMXScDoBHGeiga9CbK0y7yvrt3pgJfz3o3lM15WeA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZGXFKyNd0xOUOZVcL95og+gk5DsbSRDV98jHlAbr/pwL4wZSa5tYC1aQT7unaX2mC
 AhnHjlS4f7eXV0apaW4Ucv1qlh7BaL1UX1oo1xayKvQyDBsBtie2U2RGuOAOD+z85r
 cnIekMp/w3nWweFfCpusqx1pBheDxZSeeeqHHMxo=
Date: Tue, 3 Mar 2020 10:29:19 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2] soundwire: bus: provide correct return value on error
Message-ID: <20200303045919.GO4148@vkoul-mobl>
References: <20200227220949.4013-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227220949.4013-1-pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
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

On 27-02-20, 16:09, Pierre-Louis Bossart wrote:
> From: Bard Liao <yung-chuan.liao@linux.intel.com>
> 
> It seems to be a typo. It makes more sense to return the return value
> of sdw_update() instead of the value we want to update.

Applied, thanks

-- 
~Vinod
