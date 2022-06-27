Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6706F55BC0A
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 22:48:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB3631688;
	Mon, 27 Jun 2022 22:47:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB3631688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656362891;
	bh=L4YuvpMGrnXrS3Vp6XV56Nv9k75SEE7cHPVHrCuYlII=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YTLN+d9vsETRMxnbPTDLnWlkSoiHabtXHe9wu6xQM/aaUqF5eQX3Wo0euece3iDxR
	 UWbc7tu8c313c/bAmCOnm8C8jFuqoVjPPpu5hWhZ2xsNVLsb87Lwm9jGPzTz9wBotw
	 qxOfdHhwyIM29r++iG/HH1Qyl+NFyICp5u5Hbp/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB4B5F804FB;
	Mon, 27 Jun 2022 22:46:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F5F9F800E9; Mon, 27 Jun 2022 22:46:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3BB4F800E9
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 22:46:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3BB4F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TyLYdBD8"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 86E0A6179C;
 Mon, 27 Jun 2022 20:46:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBEA3C341CD;
 Mon, 27 Jun 2022 20:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656362795;
 bh=L4YuvpMGrnXrS3Vp6XV56Nv9k75SEE7cHPVHrCuYlII=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=TyLYdBD8uFSiH32EAQH7pTl9RjQK83mjPiWyJPjZ+sjQ6Lw46+RCTesAM+RnnuyBm
 45xHgMVAJ3JL57Cpu64+xAQpOei35Y9+BcWG7JX8XcirQ5S4Mj3vGxKyejayatmT28
 NwT53ohmPbmqQneyO+Pu7V6vkaBR27kh3efZa6hMpNLjSTfbicOJP3rWP/w44qYbce
 S7woXG/i9qmxDMXSDo/PgQqSvYe5Ox97L2qA3+oAdo5bVPWOhg2gGIUGat4mGpPRuw
 dSeUNxZ2GIzSsG4KnQnmrU/kiJN7Njn532INOAQMwPffQlKEh+ghj9MA8Md5EMzuEn
 4KX1D572G2/hg==
From: Mark Brown <broonie@kernel.org>
To: ckeepax@opensource.cirrus.com
In-Reply-To: <20220627094335.3051210-1-ckeepax@opensource.cirrus.com>
References: <20220627094335.3051210-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: samsung: s3c24xx-i2s: Fix typo in DAIFMT handling
Message-Id: <165636279349.4185952.15017228946920740997.b4-ty@kernel.org>
Date: Mon, 27 Jun 2022 21:46:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, jrdr.linux@gmail.com
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

On Mon, 27 Jun 2022 10:43:35 +0100, Charles Keepax wrote:
> The conversion of the set_fmt callback to direct clock specification
> included a small typo, correct the affected code.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: samsung: s3c24xx-i2s: Fix typo in DAIFMT handling
      commit: ccb0bbe3e93efa1c794176200785737ba65b0131

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
