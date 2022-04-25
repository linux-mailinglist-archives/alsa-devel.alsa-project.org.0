Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5850650E73C
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 19:28:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEE651831;
	Mon, 25 Apr 2022 19:27:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEE651831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650907694;
	bh=wR6QwiYHfKAcBGUMoPjP37+zT0CNZmW2bzNlKdAnf3c=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qzp6AZnkviisKaQqy8N+YcVPTvJz51DI+l1kRPvqRy7SUSZoHZGLQb0YE9ng8rScH
	 wb9YBNpdgt2MFsE/eLi1nRFbm192BR3QjMA7gumsiUwVN+56eA8PS3tfC+1xx62Y7C
	 Xpz5krFtNVW1+rwR/83Xk8hvEbknI+FHgTEfdzP8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42CCDF80549;
	Mon, 25 Apr 2022 19:24:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 500CEF8053B; Mon, 25 Apr 2022 19:24:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00258F8052E
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 19:24:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00258F8052E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="A00jWK36"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DD6FD614C1;
 Mon, 25 Apr 2022 17:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0FFC385A9;
 Mon, 25 Apr 2022 17:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650907470;
 bh=wR6QwiYHfKAcBGUMoPjP37+zT0CNZmW2bzNlKdAnf3c=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=A00jWK36DDeuaoE2AbqqeRgIuxEP96TCZNIBcviBUay0V0bB8WthOusz2FyFGhXR7
 GSWeLJeqMxQ3KJpm0aoZx4LU3bVq/qoYDVNCm/TSRCkm1T1/MCYPXk/RUO9oQCHUPu
 hMYcNydcyuVpj2cJGL6D7QBh9kht/A2bM6ry55Mm8J1wEel0+5kQMpghPUptzZP9y9
 TVH6v4urd4S+x89ebiJHPVPIv8R7AtTb4yctgoqG2eRYK0STYplzy6scAnn4rQf2n1
 ih+COAC0h70nmA7Af70hTbCRfWmeXJpJXHOrxKCLOKoB9jy3XDtxeNIjsv50G5+J2z
 +6Dzu6cwbj4Ww==
From: Mark Brown <broonie@kernel.org>
To: rf@opensource.cirrus.com
In-Reply-To: <20220425125012.3044919-1-rf@opensource.cirrus.com>
References: <20220425125012.3044919-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH v2 0/2] ASoC: Add macros for signed TLV controls with
 callbacks
Message-Id: <165090746914.583823.3259652116452681676.b4-ty@kernel.org>
Date: Mon, 25 Apr 2022 18:24:29 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On Mon, 25 Apr 2022 13:50:10 +0100, Richard Fitzgerald wrote:
> This adds SOC_DOUBLE_R_S_EXT_TLV and SOC_SINGLE_S_EXT_TLV macros for
> signed TLV controls that need custom get/put callbacks. These will be
> needed by future Cirrus codec drivers, but are not particularly exotic
> so could be useful for others.
> 
> Only change from V1 is sign-off on patch #1.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: soc.h: Introduce SOC_DOUBLE_R_S_EXT_TLV() macro
      commit: cf51406ccb083941102fc101718d4c0a25b17917
[2/2] ASoC: soc.h: Add SOC_SINGLE_S_EXT_TLV macro
      commit: 5349c0c93d15dff27d99fec12fc82040fab340bd

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
