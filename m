Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5916659331C
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Aug 2022 18:25:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0086161D;
	Mon, 15 Aug 2022 18:24:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0086161D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660580718;
	bh=YipuA8xpMD2cZk8ply93QvmLbz3xg3Y7+lnuxBQXklI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WlmjocyOjkFRAzjGn9Zf+suQFMAbrj0gxgngUJzqej/vSMBdvdenJ3I/5oIRezngz
	 7vulhT4xHuzLPlzKz7siXBsbSP3+Oum9qqXt1EC+joeAHRjR8VpoGFFMKeqcnsUiXf
	 X7XqADJCvjnwy7r1fK3pGM6ThTAygmdO+JMk6mys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BB17F80566;
	Mon, 15 Aug 2022 18:23:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C418AF80563; Mon, 15 Aug 2022 18:23:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45051F80558
 for <alsa-devel@alsa-project.org>; Mon, 15 Aug 2022 18:23:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45051F80558
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UQzwbZro"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B920BB80EA5;
 Mon, 15 Aug 2022 16:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EDF5C433D7;
 Mon, 15 Aug 2022 16:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660580584;
 bh=YipuA8xpMD2cZk8ply93QvmLbz3xg3Y7+lnuxBQXklI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=UQzwbZrooVjpbDPace0kLOhxBm3O3DWQtQW7YGvpCe+OBpnNQI6Uu3D7FCGAFtnQf
 7VTWS2+uph5eR43mbHEIK8Li/bJGBYONAgjpTJZnMhETjzwrgD9L0fcl58QZQa5Eeo
 FrSjI2I7BHLaJxOsHOF+qyFOhajKha8bumoQUWoiTjiwi6ZF2khOBv834iXtl6ADKp
 OmC7lsD1L32zfD8RLhlhv0jHGvtwuumkNqwKB4TNL0CjSqxOCNfHcrsBRYuGrbPs+p
 yJymnvCQHRo1rlWLCbZhJV4TVpIE2wpCeI7Qy6P25GnQK13VrwLW5gzxRYbSxOUThK
 RlkaJWCMdPVgw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, nicoleotsuka@gmail.com, shengjiu.wang@gmail.com,
 alsa-devel@alsa-project.org, 
 Xiubo.Lee@gmail.com, tiwai@suse.com, festevam@gmail.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, perex@perex.cz
In-Reply-To: <1659495748-10876-1-git-send-email-shengjiu.wang@nxp.com>
References: <1659495748-10876-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] ASoC: imx-rpmsg: Support configure sysclk for codec dai
Message-Id: <166058058210.769843.13008464133060260888.b4-ty@kernel.org>
Date: Mon, 15 Aug 2022 17:23:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

On Wed, 3 Aug 2022 11:02:28 +0800, Shengjiu Wang wrote:
> Some codecs need to configure the sysclk even with slave
> mode, otherwise it may not work properly with some case.
> 
> wm8960 is the one that need sysclk be configured, so add
> late_probe() to call the snd_soc_dai_set_sysclk() of codec
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-rpmsg: Support configure sysclk for codec dai
      commit: 088f115c6ff664c8afe003bd542e1e662a72aaed

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
