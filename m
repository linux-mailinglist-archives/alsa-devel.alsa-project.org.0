Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC38210E5D
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 17:06:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 717801686;
	Wed,  1 Jul 2020 17:05:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 717801686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593615967;
	bh=hjhEj1kmt32ON01AiaQ46U1TlOLLBrgSiID3pKEF4Ww=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a3b8wuvEQNT6Ovz6AyhGHoUnismrE1bQSc99fkBy79li4Pg9tcyTXBUwoOQbiFtFU
	 475Ca+wxQoMUi/QQhtUenOc60tsjunrMzG8S3YrYLAJBaD5f877HlrHcHjFHWy9Pm6
	 0ESRgbt2qp6UaH1vv03XTSTIkYBKrFTe3X3wjiKE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90156F8020C;
	Wed,  1 Jul 2020 17:04:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C0ABF80217; Wed,  1 Jul 2020 17:04:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEDE8F801D8
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 17:04:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEDE8F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="0d5o1da3"
Received: from localhost (unknown [122.182.251.219])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5C42420702;
 Wed,  1 Jul 2020 15:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593615856;
 bh=hjhEj1kmt32ON01AiaQ46U1TlOLLBrgSiID3pKEF4Ww=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0d5o1da3fLwEiMclM/eWi3jgM7r4JKqDohkZXx+8IBbCn5CoDZhw/VYem/vlOxWzR
 Q5z6bLbTTb1h4nKrjEff2GI5zs/zuzsqDe1Ak1P27ebiCBhnasykBTdv+hhWIiJZUa
 6Om3t8BS2MQQoyi8YUufZF6UAIzhhrRBh8QRqZLA=
Date: Wed, 1 Jul 2020 20:34:12 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v5 3/3] ALSA: compress: fix partial_drain completion state
Message-ID: <20200701150412.GC2599@vkoul-mobl>
References: <20200629134737.105993-1-vkoul@kernel.org>
 <20200629134737.105993-4-vkoul@kernel.org>
 <20200701142032.GG71940@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200701142032.GG71940@ediswmail.ad.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
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

On 01-07-20, 14:20, Charles Keepax wrote:
> On Mon, Jun 29, 2020 at 07:17:37PM +0530, Vinod Koul wrote:
> > On partial_drain completion we should be in SNDRV_PCM_STATE_RUNNING
> > state, so set that for partially draining streams in
> > snd_compr_drain_notify() and use a flag for partially draining streams
> > 
> > While at it, add locks for stream state change in
> > snd_compr_drain_notify() as well.
> > 
> > Fixes: f44f2a5417b2 ("ALSA: compress: fix drain calls blocking other compress functions (v6)")
> > Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> 
> Worth noting I haven't actually tested the gapless, but keeps all
> the compressed capture stuff happy.

Thanks for testing and review Charles. 

Btw Srini is adding support to fcplay so that we can do gapless testing
without using HALs/players. Now that we have an public board (RB3) where
compress works out of box, we should build more things on top :)

-- 
~Vinod
