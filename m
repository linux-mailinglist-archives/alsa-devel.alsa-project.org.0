Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FE1546A01
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 18:00:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6837518F2;
	Fri, 10 Jun 2022 17:59:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6837518F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654876805;
	bh=GDubMMqKX5ziyi7uxi0ZmYERIwl7N131vwqlSO+EgJc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JWbJYdmyWMHhxOfhF5My2c82/3hLL2rU6wpyjZZd9qVTUlYPbwLeuSa+PHu5wM9Gb
	 ov53Tu2TxEOghvfOumMK9lVx79XH0wOC37c2RrKzlXxgR13cdHsZBGbP6g/pmKnvD7
	 j3flqivVy/4Qs/r3q67yupHGpDsqyoftZpSKqY/U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E633BF804E7;
	Fri, 10 Jun 2022 17:59:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48F61F80515; Fri, 10 Jun 2022 17:59:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9E6CF800E5
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 17:58:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9E6CF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Cb6qvF2W"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5883262000;
 Fri, 10 Jun 2022 15:58:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C84C34114;
 Fri, 10 Jun 2022 15:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654876727;
 bh=GDubMMqKX5ziyi7uxi0ZmYERIwl7N131vwqlSO+EgJc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Cb6qvF2W0lCY6kSjtH0jA0xSmnhSAnMUWMGvz0HpazJEipNdgIwQoPd1Vmhd+h8sO
 wI3dGE9CUlMBN0Jb14yHn5QCv/KulBspetBlFXgVXFN/SsQH9RWPXYFvnaEaQlwlXj
 wyJI2H6JQ2V/1uBzya4Powx00zSivPq6dzrXgfjN33X7MXmfgBN1QyyOn6+1gg9Ktt
 2Rs498gkau1LilfMgFJ0AFGnMQHFXq2dIKT3vrddswIE3yToaEyvhReKUGB1m+r6Vi
 T8U9mpNUNj/SEMj1qnA2hteO2bJP8HBfKetqriBByXUTsH/Zd6QvQ9dbp28i39VOZP
 VJXQTCj8z8csw==
From: Mark Brown <broonie@kernel.org>
To: krzk+dt@kernel.org, povik+lin@cutebit.org, tiwai@suse.com,
 lgirdwood@gmail.com, perex@perex.cz, robh+dt@kernel.org
In-Reply-To: <20220606191910.16580-1-povik+lin@cutebit.org>
References: <20220606191910.16580-1-povik+lin@cutebit.org>
Subject: Re: (subset) [RFC PATCH v2 0/5] Apple Macs machine/platform ASoC
 driver
Message-Id: <165487672494.1755957.15170830453341675210.b4-ty@kernel.org>
Date: Fri, 10 Jun 2022 16:58:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, kettenis@openbsd.org, sven@svenpeter.dev,
 marcan@marcan.st, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
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

On Mon, 6 Jun 2022 21:19:05 +0200, Martin Povišer wrote:
> This is again RFC with a machine-level ASoC driver for recent Apple Macs
> with the M1 line of chips. This time I attached the platform driver too
> for good measure. What I am interested in the most is checking the overall
> approach, especially on two points (both in some ways already discussed
> in previous RFC [0]):
> 
>  - The way the platform/machine driver handles the fact that multiple I2S
>    ports (now backend DAIs) can be driven by/connected to the same SERDES
>    unit (now in effect a frontend DAI). After previous discussion I have
>    transitioned to DPCM to model this. I took the opportunity of dynamic
>    backend/frontend routing to support speakers/headphones runtime
>    switching. More on this in comments at top of the machine and platform
>    driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[4/5] ASoC: Introduce 'fixup_controls' card method
      commit: df4d27b19b892f464685ea45fa6132dd1a2b6864

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
