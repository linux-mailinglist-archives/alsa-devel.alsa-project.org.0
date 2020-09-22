Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 023BF274436
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Sep 2020 16:26:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F15571729;
	Tue, 22 Sep 2020 16:26:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F15571729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600784814;
	bh=BjcEs/cyjGNFH4+Iv6NV3gAcUsMvzMLKmIq/2ekfuaQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uBaD+FgVTcXnE06Xu1rpk38cJjpPqkk2LBSyjLUUZOLt8sNx4yqU7Gnxgh2kXECWh
	 kF1PpTeMnPErf9WU9i/uKA6VslBNAStjHSZnRITbGI+pIwkiZcyoPblEw6F/OuclGu
	 sXheTyjzTp+qE9JG1TY4hWc5+Myfrj2IFL6RANN0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 160EDF80256;
	Tue, 22 Sep 2020 16:25:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD50DF8023E; Tue, 22 Sep 2020 16:25:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22775F80229
 for <alsa-devel@alsa-project.org>; Tue, 22 Sep 2020 16:25:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22775F80229
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="b+zh2DI3"
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4659220C09;
 Tue, 22 Sep 2020 14:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600784716;
 bh=BjcEs/cyjGNFH4+Iv6NV3gAcUsMvzMLKmIq/2ekfuaQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b+zh2DI3qvzE0CrDPaxWv1J4MDNlht5urMzZMCMsvYshQYFJf+FQXsNH27lu4xRcB
 f3cuz90yMYI+GgorDpgyxeX5rvT478Fr5iw2La3MMmh253JrUav8jT6zDe5gU1jQMV
 aU3Ffy4uZW/7goLBmKO7llVuQZEKM9l17TLr9pJY=
Date: Tue, 22 Sep 2020 10:25:15 -0400
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.8 03/20] ASoC: wm8994: Skip setting of the
 WM8994_MICBIAS register for WM1811
Message-ID: <20200922142515.GN2431@sasha-vm>
References: <20200921144027.2135390-1-sashal@kernel.org>
 <20200921144027.2135390-3-sashal@kernel.org>
 <20200921150701.GA12231@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200921150701.GA12231@sirena.org.uk>
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, stable@vger.kernel.org
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

On Mon, Sep 21, 2020 at 04:07:01PM +0100, Mark Brown wrote:
>On Mon, Sep 21, 2020 at 10:40:10AM -0400, Sasha Levin wrote:
>
>> The WM8994_MICBIAS register is not available in the WM1811 CODEC so skip
>> initialization of that register for that device.
>> This suppresses an error during boot:
>> "wm8994-codec: ASoC: error at snd_soc_component_update_bits on wm8994-codec"
>
>This is pretty much a cosmetic change - previously we were silently not
>reading the register, this just removes the attempt to read it since we
>added an error message in the core.

Right, the only reason I took it is that error message - I find that
bogus error messages have almost the same (bad) impact as real kernel
bugs.

I can drop it if you'd prefer.

-- 
Thanks,
Sasha
