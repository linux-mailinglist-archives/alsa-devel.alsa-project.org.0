Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B51FC45DB3F
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 14:38:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 537B118A5;
	Thu, 25 Nov 2021 14:37:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 537B118A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637847528;
	bh=amtopp9RHl/TvQxvYXr20cIuv/ZoExLoTxclzPSkcBA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FuITs65MSboBYKg9tVcu8Q0cBnIjB/PkZ7xOSYS8FECXjSOr/vDjk92gF/D+y3EFB
	 Ww6ngJdev1UH68nJalCXVUqpVPFBps0rtSUpSpiS2G4GDZkGAsXIceLADn7Q3kw8uL
	 +0Jo72+l8BxIXEIe+YmviHuLszrwtpgn6W5lZcqg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FD48F80087;
	Thu, 25 Nov 2021 14:37:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 991A8F804EB; Thu, 25 Nov 2021 14:37:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7895FF804BC;
 Thu, 25 Nov 2021 14:37:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7895FF804BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lry3K083"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B206861074;
 Thu, 25 Nov 2021 13:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637847421;
 bh=amtopp9RHl/TvQxvYXr20cIuv/ZoExLoTxclzPSkcBA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=lry3K083Ck3VPN/+LLXeWeHs2U+6WlSBURFxscS5dAQiy0xcwcFsvBKrxoSAAtTsf
 TIDPXhj8KZ5TzwwoSXHyolDqZY8H62XgSCGyuWLhkmNgYY/c1UMbC/CJUww31ZdpWP
 s0drXYg0jUIqsHk74MHC3f9i2xehyXP+PSDLsfTwq65PfUSfVF2tQS2i+44OZE4G2b
 xueUahted9G0xy3dYpCqa5Y5skyWfO/0LVuNx7mCuMhu1iX419TL7CODcj7ZlA20n8
 Wn1Piw8/UjguGL+ngDkhz9Ed2ec/tGKjLxkKoq/ug0ndWRoX04XEFDLN8ySdqhEhnb
 NQeboRWUHoHcA==
From: Mark Brown <broonie@kernel.org>
To: sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 alsa-devel@alsa-project.org
In-Reply-To: <20211125071608.3056715-1-yangyingliang@huawei.com>
References: <20211125071608.3056715-1-yangyingliang@huawei.com>
Subject: Re: [PATCH -next] ASoC: SOF: mediatek: Add missing of_node_put() in
 platform_parse_resource()
Message-Id: <163784741946.3101847.9704540045126980062.b4-ty@kernel.org>
Date: Thu, 25 Nov 2021 13:36:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: daniel.baluta@nxp.com, yc.hung@mediatek.com
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

On Thu, 25 Nov 2021 15:16:08 +0800, Yang Yingliang wrote:
> The node pointer is returned by of_parse_phandle() with
> refcount incremented in platform_parse_resource(). Calling
> of_node_put() to aovid the refcount leak.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: mediatek: Add missing of_node_put() in platform_parse_resource()
      commit: fc6c62cf1cbf24c81ccb1d248120311336d5f3cc

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
