Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF1465917F
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Dec 2022 21:26:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CAA01DA;
	Thu, 29 Dec 2022 21:25:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CAA01DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672345561;
	bh=ETuogk7ACYxYQV9uzj4PmKQpxDQ3mxpqHb49NYgVa5U=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BjfVW6kzQrbd+fXSbq4qjqrJpMJYmKxpNkYDCKSHl5pYFWWFtmT15ZWkmuIEASnaw
	 /oZxBHYp5TNTnR2qJXRBZg47ygg36Th2aMZMXdM/RcVviDjj6Rc+IsmuV1goJ18F97
	 mGBdZ7nZhOg+m47bt2Hh3MdN3jpxTalLGarGym4g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 119FAF804E7;
	Thu, 29 Dec 2022 21:25:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22E0FF802A0; Thu, 29 Dec 2022 21:24:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B57F9F802A0
 for <alsa-devel@alsa-project.org>; Thu, 29 Dec 2022 21:24:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B57F9F802A0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jDjpE5mI
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 16D51617E3;
 Thu, 29 Dec 2022 20:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9475FC433D2;
 Thu, 29 Dec 2022 20:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672345492;
 bh=ETuogk7ACYxYQV9uzj4PmKQpxDQ3mxpqHb49NYgVa5U=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jDjpE5mIfycRAMFRF5PXuWGu+Wm+D4yjbQRpRtMnYPV5iP75n6NeyrDgtwgXs4Xvj
 KwKuW5/TL6hk0hYJDPzkWnbkYb5A4oFEUmmjGpsyL/Ay4jVEnJUHieya8e9cF6D0F7
 BgSlvWjR0uEeisdRgvsWSjjqfgHf8qC/Ds2AoHjPEXSLMgmFtdrNHEhyT6NLUSZd8l
 QjoFB6b6UnyDSOJnDYbmUCv7ueQp4nDx+rNqr3Y9megkYbZp+Nqa4i127kPnUhOxl/
 pdgtLuW9/jygdy71PSh2O9Xczuz3z0YVo1A53D/KLob5sRVMUYvsHhxYbKW5HIaknm
 ABHqiXd2rOZzQ==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>
In-Reply-To: <20221228115756.28014-1-allen-kh.cheng@mediatek.com>
References: <20221228115756.28014-1-allen-kh.cheng@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8186: Add machine support for max98357a
Message-Id: <167234548928.88546.3169179138497536747.b4-ty@kernel.org>
Date: Thu, 29 Dec 2022 20:24:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-69c4d
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 28 Dec 2022 19:57:56 +0800, Allen-KH Cheng wrote:
> Add support for mt8186 with mt6366 and max98357a.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: Add machine support for max98357a
      commit: 8a54f666db581bbf07494cca44a0124acbced581

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
