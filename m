Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B63D045FB04
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Nov 2021 02:32:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 544AD1743;
	Sat, 27 Nov 2021 02:32:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 544AD1743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637976771;
	bh=mdcPkROBkg6g+bcaNVjEFJmr2PWE2x4mGjdd+HKP0EU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ljo5jsmYrZqQChosRLz8oPxHEMXdQT9J2d+EO+OnRmEXdHkBWy9feCyaydmtKEgPk
	 qTA7zNXN0f5wy9KfL8hkuD3mYPWLRsarJkMBlZPEHg64SREf6KGzn/TTiBHOzcsper
	 G6LHtLqSYsNtayeHQCn9/qWVLbV2LCe8gKCcjIFw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB78CF8050F;
	Sat, 27 Nov 2021 02:30:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADBC9F8050F; Sat, 27 Nov 2021 02:30:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED11CF804EB
 for <alsa-devel@alsa-project.org>; Sat, 27 Nov 2021 02:29:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED11CF804EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZMTM9jxM"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 382E7B829B8;
 Sat, 27 Nov 2021 01:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6360DC004E1;
 Sat, 27 Nov 2021 01:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637976596;
 bh=mdcPkROBkg6g+bcaNVjEFJmr2PWE2x4mGjdd+HKP0EU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ZMTM9jxMVLZOo0Vs2eGBhYKOI2tNG4bFm5tdAEyS+K9NNLD/lLvWOLCMhmHV8LqAu
 J0BFSLxe6W1FAsCY57gZJza8++/h/vOsoiL6h43XNzuKW0GBXBeB9iUy5xObZf8fIN
 +HAZrmYvmz0F0RzL6MXSpGrEVTx9XqHi/AAVh2dV4N5HZlLGjFPhuZ54cRwDdwSlnn
 Vur7Zhm64fubEi0D3OAXVhpFaeRzzet4qpF+E/5KX1hjW9cz38IaqFPGm9Y0Z67nw4
 xpSk2zjyGL8/FoUWyRC0MC18tpYAUFiXyigTJkuVFheKwa3SZY9vvQPTxd5arWKzV2
 1xQjfkqIq1+6w==
From: Mark Brown <broonie@kernel.org>
To: cgel.zte@gmail.com, nicoleotsuka@gmail.com
In-Reply-To: <20211110002910.134915-1-ye.guojin@zte.com.cn>
References: <20211110002910.134915-1-ye.guojin@zte.com.cn>
Subject: Re: [PATCH] ASoC: imx-hdmi: add put_device() after
 of_find_device_by_node()
Message-Id: <163797659312.2987942.8864055300904325575.b4-ty@kernel.org>
Date: Sat, 27 Nov 2021 01:29:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, shengjiu.wang@gmail.com,
 Xiubo.Lee@gmail.com, shawnguo@kernel.org, Zeal Robot <zealci@zte.com.cn>,
 tiwai@suse.com, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-imx@nxp.com, kernel@pengutronix.de, Ye Guojin <ye.guojin@zte.com.cn>,
 festevam@gmail.com, s.hauer@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
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

On Wed, 10 Nov 2021 00:29:10 +0000, cgel.zte@gmail.com wrote:
> From: Ye Guojin <ye.guojin@zte.com.cn>
> 
> This was found by coccicheck:
> ./sound/soc/fsl/imx-hdmi.c,209,1-7,ERROR  missing put_device; call
> of_find_device_by_node on line 119, but without a corresponding object
> release within this function.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-hdmi: add put_device() after of_find_device_by_node()
      commit: f670b274f7f6f4b2722d7f08d0fddf606a727e92

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
