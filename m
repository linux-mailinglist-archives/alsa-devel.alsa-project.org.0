Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 682B45E733A
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 07:05:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E91813E8;
	Fri, 23 Sep 2022 07:04:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E91813E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663909501;
	bh=PHDr+wDiM2EHB4+LpuPtHojr+ixo/WuKiAKue3B1Nfo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HrgxLiW8j9pak7dvfUtslebDtGH2FkMyNmcZDuZ4HDKRNu+U625OY1+SJLANct+6x
	 gPgO67yHeiiu9ufD3XaovPmSyxCXhPdYBVIIdBDB66z6pTTJL7POy+6VtkV7VNo/zB
	 TTB0CrqMOHcLAKb+1xhT2fDEM009BgGTEiRigK58=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F001F80124;
	Fri, 23 Sep 2022 07:04:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6788AF80269; Fri, 23 Sep 2022 07:04:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A39EF80124
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 07:03:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A39EF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Ya1OHf3/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BE08DB82841;
 Fri, 23 Sep 2022 05:03:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0D20C433D6;
 Fri, 23 Sep 2022 05:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663909435;
 bh=PHDr+wDiM2EHB4+LpuPtHojr+ixo/WuKiAKue3B1Nfo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ya1OHf3/RA+A8h42XFYRJphF4JmKCzrDQkXDrHhrDiGzlqT5iYI5c0ykeQk4EpOSy
 ybbRVf2BEbAIMLdh8wnG5qPJgRoNnanTkb6Eb4aUZwGoNHatXt1K93cKbna0b21Ray
 Ajt4d713ZczqW52OZH+Z8EKjCkVSEpSwCA6HKv2Ri5IXexFTiUoGh/SUStQ2gHWgMn
 H/tWvjGriRsgsyc6aPIRQSYyjtu44u7shF/LYFP/0btftWWeGEa/DSMULezfbZdFfU
 /LzDvUWHBAup7Xoii7IGMxuEmSZZnkZMIxBFEu6V9f9nq0IBmTB5FZp7vQ0+DUAHSW
 /EsRfFQ/6FEtg==
Date: Fri, 23 Sep 2022 13:03:51 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8195-mt6359: Use snd_soc_pm_ops
 instead of custom ops
Message-ID: <Yy0+N13mJlGZE9E4@google.com>
References: <20220922103502.49981-1-angelogioacchino.delregno@collabora.com>
 <YyxGXXSp2JD9a6ah@google.com> <YyxjZ9nCBdVovkVs@sirena.org.uk>
 <ce4a6e7f-dee3-c260-bd42-bc77927916e8@collabora.com>
 <978af4cc1a8bfa92675bb201947cfdac1e5429f1.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <978af4cc1a8bfa92675bb201947cfdac1e5429f1.camel@mediatek.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

On Fri, Sep 23, 2022 at 12:39:54PM +0800, Trevor Wu wrote:
> On Thu, 2022-09-22 at 16:10 +0200, AngeloGioacchino Del Regno wrote:
> > Il 22/09/22 15:30, Mark Brown ha scritto:
> > > On Thu, Sep 22, 2022 at 07:26:21PM +0800, Tzung-Bi Shih wrote:
> > > 
> > > > snd_soc_pm_ops[1] sets some more fields.  I'm not quite sure
> > > > whether
> > > > it would introduce any side effect or not.  Perhaps Trevor could
> > > > provide some suggestions.
> > > 
> > > If it does it should be to fix isues rather than introduce new
> > > problems - I suspect the other operations just don't work
> > > currently.
> > 
> >  From my upstream tests, this didn't introduce any issues, that's why
> > I've
> > sent this patch.
> > 
> > In any case, let's check with Trevor, just as to be extremely sure,
> > but please
> > use an upstream kernel for eventual tests, as there are quite a bit
> > of changes
> > between 5.10 and current upstream.
> > 
> > Cheers,
> > Angelo
> 
> I think it's not a big risk if Angelo already did the test and
> snd_soc_pm_ops is also used in MT8186.
> I can help do more tests on 5.10 when the patch is back to chromium in
> the future.
> MTK also have a plan to support complete suspend/resume functionality
> in MT8195. If Tzung-bi has concerns about the patch, I can help submit
> the patch at the time.

I have no further concern as long as you guys are also aware of the change.
