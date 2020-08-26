Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E26572534C1
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 18:22:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 816FC1772;
	Wed, 26 Aug 2020 18:22:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 816FC1772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598458979;
	bh=ebWQh3nk8D4zG1syvCLitTt388shKB71c0Otl//ugiw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pflwlu6lp0PsNOXjEaircksFiX6IsFXyEqLx/420XXToV86E/pa1NXk/SAIij6Ewd
	 Y5gioH0NWCIR1qUe3b6pdfi06Nc51QqWGIaaNWVZSlYc3MmCXg8XzjSCM4nxWCKCTp
	 yaCEwd9AH+Y+KaiiQHAdusIy3kHCfKwQ7LWpobfU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4A08F801EC;
	Wed, 26 Aug 2020 18:21:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36214F801D9; Wed, 26 Aug 2020 18:21:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80137F80143
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 18:21:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80137F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="yGu5Q+kQ"
Received: from localhost (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 169DF214F1;
 Wed, 26 Aug 2020 16:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598458865;
 bh=ebWQh3nk8D4zG1syvCLitTt388shKB71c0Otl//ugiw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=yGu5Q+kQSKFQr3D2q9p/nApUJtOTWpsSyz3viYF2MAAYVGxjQ4bli5amwCn5mFqyG
 e8g5Qi36QC8yHasloS/dMD6HuHvN3n+kL3dYpx97hnfzCccSQ9+zutGq1UtHSZp4/o
 NMoGWAnNHFqIFID7MIj+FXmU+1c8CzIHasu90ZHw=
Date: Wed, 26 Aug 2020 21:51:01 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 4/4] ASoC: rt715: Fix return check for
 devm_regmap_init_sdw()
Message-ID: <20200826162101.GE2639@vkoul-mobl>
References: <20200826122811.3223663-1-vkoul@kernel.org>
 <20200826122811.3223663-4-vkoul@kernel.org>
 <e71ba625-ec1e-1adf-9e4c-b65a91562d9c@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e71ba625-ec1e-1adf-9e4c-b65a91562d9c@linux.intel.com>
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Shuming Fan <shumingf@realtek.com>
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

On 26-08-20, 10:09, Pierre-Louis Bossart wrote:
> 
> 
> On 8/26/20 7:28 AM, Vinod Koul wrote:
> > devm_regmap_init_sdw() returns a valid pointer on success or ERR_PTR on
> > failure which should be checked with IS_ERR. Also use PTR_ERR for
> > returning error codes.
> 
> Do you mind changing these two additional codecs that were missed in this
> series? Thanks!
> 
> rt700-sdw.c:	sdw_regmap = devm_regmap_init_sdw(slave, &rt700_sdw_regmap);
> rt700-sdw.c-	if (!sdw_regmap)
> rt700-sdw.c-		return -EINVAL;

Yes missed this one
> 
> --
> rt711-sdw.c:	sdw_regmap = devm_regmap_init_sdw(slave, &rt711_sdw_regmap);
> rt711-sdw.c-	if (!sdw_regmap)
> rt711-sdw.c-		return -EINVAL;

And somehow patch series is messed, I have two 2/4 but no 3/4 which
patches rt711-sdw.c, will send v2 with these fixed

-- 
~Vinod
