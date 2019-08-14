Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D058CA20
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 06:14:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 095D41690;
	Wed, 14 Aug 2019 06:13:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 095D41690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565756085;
	bh=VfIe0b793ycZOJfgkUQUos1E5zScKebu2CmHcnqFGnY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lazv02y6kwofbJNNFqu+1RTm/14EmFe6Wes0MJbWdn6feUGNVoX97U7RI7etvSH6m
	 y8FlPH/qh0ZVp+ZtDmBB7ZHqUhz91Jyk1dWSJ7VgBnvPmsBmFxXgUHgNYZqV+33+La
	 GnP0X3J5B0j1bIoMzMX0GTUdY+W2zWH7JWiHZaSI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BC80F80214;
	Wed, 14 Aug 2019 06:13:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5B48F8015B; Wed, 14 Aug 2019 06:12:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F2B0F8015B
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 06:12:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F2B0F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LkmFK38c"
Received: from localhost (unknown [106.51.111.160])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0805420843;
 Wed, 14 Aug 2019 04:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565755974;
 bh=x6L4Ab4GwkfFv2tLx6IooKohLXKZx+ziOKbXCdycO7M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LkmFK38c+er/rP52PMhS4hw6QCvPGjZyyffDgJ0aVE1zfuzPs5dnwYMCujuh9Ds7d
 Z3vnCjGD+GZ9Gp3AM+ew8qiZHciwxlQ1KCngNeYhVGmdcJxHbXa8h0g5dcMEfUCgDx
 07kpERkuYqgxYsz9qxTl9ISxAGBAkrOlwHdVftls=
Date: Wed, 14 Aug 2019 09:41:42 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20190814041142.GU12733@vkoul-mobl.Dlink>
References: <20190813083550.5877-1-srinivas.kandagatla@linaro.org>
 <20190813083550.5877-4-srinivas.kandagatla@linaro.org>
 <ba88e0f9-ae7d-c26e-d2dc-83bf910c2c01@linux.intel.com>
 <c2eecd44-f06a-7287-2862-0382bf697f8d@linaro.org>
 <d2b7773b-d52a-7769-aa5b-ef8c8845d447@linux.intel.com>
 <d7c1fdb2-602f-ecb1-9b32-91b893e7f408@linaro.org>
 <f0228cb4-0a6f-17f3-fe03-9be7f5f2e59d@linux.intel.com>
 <20190813191827.GI5093@sirena.co.uk>
 <cc360858-571a-6a46-1789-1020bcbe4bca@linux.intel.com>
 <20190813195804.GL5093@sirena.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190813195804.GL5093@sirena.co.uk>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 lgirdwood@gmail.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v2 3/5] ASoC: core: add support to
 snd_soc_dai_get_sdw_stream()
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

On 13-08-19, 20:58, Mark Brown wrote:
> On Tue, Aug 13, 2019 at 02:38:53PM -0500, Pierre-Louis Bossart wrote:
> 
> > Indeed. I don't have a full understanding of that part to be honest, nor why
> > we need something SoundWire-specific. We already abused the set_tdm_slot API
> > to store an HDaudio stream, now we have a rather confusing stream
> > information for SoundWire and I have about 3 other 'stream' contexts in
> > SOF... I am still doing basic cleanups but this has been on my radar for a
> > while.
> 
> There is something to be said for not abusing the TDM slot API if it can
> make things clearer by using bus-idiomatic mechanisms, but it does mean
> everything needs to know about each individual bus :/ .

Here ASoC doesn't need to know about sdw bus. As Srini explained, this
helps in the case for him to get the stream context and set the stream
context from the machine driver.

Nothing else is expected to be done from this API. We already do a set
using snd_soc_dai_set_sdw_stream(). Here we add the snd_soc_dai_get_sdw_stream() to query

Thanks
-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
