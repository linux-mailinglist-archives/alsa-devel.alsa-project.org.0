Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF625A15BC
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 17:29:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B7F21630;
	Thu, 25 Aug 2022 17:28:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B7F21630
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661441386;
	bh=tQWGFhVvmwiIylyTB+mN9NpSEl/M7BY0JbIVV60nJlo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pg7uQYnhDFuQi+g+79jcf45QFs9fRHPSi8tTtiUJmOJWGCUZc51GKoTonCqAY0RFj
	 KK8tp0lrhi627JmNMkyHL+X90vZhMjuKOiORCOsul+C9tF6lNUXLGLx+MMfSyjUpav
	 nCMZhMysPm6NP4XZglCZCq1BgEFTNynJK2Lxqnak=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A4E1F804FD;
	Thu, 25 Aug 2022 17:28:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0DC8F80506; Thu, 25 Aug 2022 17:28:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B602F8025A
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 17:28:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B602F8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="p2/k2n3t"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id E4A66CE28DF;
 Thu, 25 Aug 2022 15:28:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 171C9C433D7;
 Thu, 25 Aug 2022 15:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661441297;
 bh=tQWGFhVvmwiIylyTB+mN9NpSEl/M7BY0JbIVV60nJlo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=p2/k2n3t2NusXB/mMXR36VkEbFi1NSsN0LfyUFY80h3jfsDzX7RYJED4dCwnDdTSk
 SqTXz7uf/Sfvnk4SZnOF9GUVRtIA0T4jui+lEQ604JTXiFCAb8ZMRQ25Bls/dDYEq/
 uYC9akkLYxXaXp9JKNO0kowcq8n/JRLfSVkPI1J7MLpWmSa6E3z4WSp48a2g1k9iiz
 2LGy/bsC/Kwj1+DMLIaMMFHZYIASkdjTLIUB35OB+fpirsdwc5IC4nsfsr4W7kYYzU
 ssXjEe6phpMNF4wANWthAgyzCpzAe3uIF09gXsQALoqhp5LjLlXKDqYROPLQnQG+rs
 plD447l54U17g==
From: Mark Brown <broonie@kernel.org>
To: p.zabel@pengutronix.de, krzysztof.kozlowski+dt@linaro.org,
 sven@svenpeter.dev, marcan@marcan.st, povik+lin@cutebit.org,
 lgirdwood@gmail.com, robh+dt@kernel.org
In-Reply-To: <20220824160715.95779-1-povik+lin@cutebit.org>
References: <20220824160715.95779-1-povik+lin@cutebit.org>
Subject: Re: (subset) [PATCH v3 0/4] ASoC platform driver for Apple MCA
Message-Id: <166144129265.526663.12769625949004805936.b4-ty@kernel.org>
Date: Thu, 25 Aug 2022 16:28:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 asahi@lists.linux.dev, alyssa@rosenzweig.io, linux-kernel@vger.kernel.org
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

On Wed, 24 Aug 2022 18:07:11 +0200, Martin Povišer wrote:
> sending what should be the final touches on Apple MCA driver. It most
> likely goes without saying but please do not merge the DT additions
> into the ASoC tree.
> 
> Martin
> 
> Changes since v2:
>  - fix Mark's style nit
>  - order compatibles in schema
>  - redo the DT additions for t8103
>  - remove stray unlock in mca_be_prepare (and rename the locking patch)
> Link: https://lore.kernel.org/asahi/20220819125430.4920-1-povik+lin@cutebit.org/T/#t
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/4] dt-bindings: sound: Add Apple MCA I2S transceiver
      commit: 6ed462d1c1167506479089e655355b3c123fee89
[3/4] ASoC: apple: mca: Start new platform driver
      commit: 3df5d0d972893d3c0df5aead8152fe1ad48ef45c
[4/4] ASoC: apple: mca: Add locking
      commit: 4065f0b25b7b30ba4dd4665deb5305ead1c0db25

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
