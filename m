Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CADEB3D2AD8
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jul 2021 19:12:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 504381704;
	Thu, 22 Jul 2021 19:11:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 504381704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626973937;
	bh=+rD2PKxj01stiGTanUKjIRztANneYKa/SZ3LruXgchc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OaB5U0CmyvZ2vmyBgwnVKwY+/dUx0a2BjKvzdLU+gfVRDhahBHY68SyFN+clGKxGv
	 mm8KM04uFhMWYPdrKaXwNMhMYuJzy17fNX+eiwQHTDD/zmb8nakap+DOTM9sQqquoh
	 UjN0k7iT0Cs38iuxF3rmbglQC5C1c9EhiqVy1Y7Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A59AF804BB;
	Thu, 22 Jul 2021 19:10:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30C98F8049C; Thu, 22 Jul 2021 19:10:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 482C1F80218
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 19:10:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 482C1F80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="icYx9b0s"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1CDAA610CC;
 Thu, 22 Jul 2021 17:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626973830;
 bh=+rD2PKxj01stiGTanUKjIRztANneYKa/SZ3LruXgchc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=icYx9b0swGiJQNxMBllLxkWlkhl++ExfWLPz5vQOGR9WLXdxQAY02thuCHIfRVy2v
 gXqWAbdIQXqcTlMfcYUuhAmvynD5aXJXIAGPwl2rDX2xSCSumgaAJU7Kj9xIKosw2w
 6ocfM7krt4dYE0PCoOUcl4yEYApADuYyIt5rIz8Jq036axqDSZEIXSlL5ypQ1ILKvE
 LzEQC/CZCb4dnscCSgMUUJHX3c+tlMmtcOX2fZSySbR3zFzRBBlxMd5YiN4uOs3COu
 G5mh0+mQfDc7tg4n14iXreSByLHP7dUMtpWa8w9JWKMDyc3JBlQ05cdoWtotz1AdIN
 lwKVMjej/wt6Q==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH] ASoC: amd: enable stop_dma_first flag for
 cz_dai_7219_98357 dai link
Date: Thu, 22 Jul 2021 18:10:02 +0100
Message-Id: <162697068327.1747.17528885369683390221.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210722130328.23796-1-Vijendar.Mukunda@amd.com>
References: <20210722130328.23796-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Sunil-kumar.Dommati@amd.com, amistry@google.com,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Chuhong Yuan <hslester96@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Alexander.Deucher@amd.com, nartemiev@google.com
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

On Thu, 22 Jul 2021 18:33:15 +0530, Vijendar Mukunda wrote:
> DMA driver stop sequence should be invoked first before invoking I2S
> controller driver stop sequence for Stoneyridge platform.
> 
> Enable stop_dma_first flag for cz_dai_7219_98357 dai link structure.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: enable stop_dma_first flag for cz_dai_7219_98357 dai link
      commit: 5434d0dc56bce4510109a431a7eb71ec5131ef0f

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
