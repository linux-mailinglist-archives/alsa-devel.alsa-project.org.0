Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20220660227
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 15:30:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A40CD14675;
	Fri,  6 Jan 2023 15:29:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A40CD14675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673015425;
	bh=Qvr7MD8G9FmZl4anXDch3jsk6CbjpCfuPfm12VW5+Ic=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DDN35nzABecxPOZAa/um+ZrG1iUoDEDuSvFsxA3KVAM6F/uuMXJX7G1M0oJ8jmCQT
	 RfloNrk/UQL9gj31nCPy/EAhUb34tvur/z/e9d9wdNUMONXKSaqhXi/0E8k7QSHVWO
	 zMTHsGtjRIAoIRpMFJwJoD5YslLhOslZXMMPfeJI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39AAFF800C0;
	Fri,  6 Jan 2023 15:29:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F5A6F800C0; Fri,  6 Jan 2023 15:29:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E98A4F800C0
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 15:29:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E98A4F800C0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=a4JlKq64
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D41E86136C;
 Fri,  6 Jan 2023 14:29:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A3C4C433EF;
 Fri,  6 Jan 2023 14:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673015357;
 bh=Qvr7MD8G9FmZl4anXDch3jsk6CbjpCfuPfm12VW5+Ic=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=a4JlKq64k/lKtjCzWB0pqlmdoXg5kMPeZuuS+tg3MGZXfTuCOiKH0E3+pB+cdResy
 km6mczt+G0UGYU9+VyLVLSwhcuIu5N8/AWbq0apNP0FtFCzspBiPKUjTCInxj55fR8
 1Fb/WGapS/6rHYUlGXZn1U1SC7K30Xu1QLFm6jX0PczPu+o1KH3CWOkdfbX0ttfnQi
 44lUxyYR38vGevkv8hyc5MuX3Q5WipfEFkxHkOHHQIZGN4+NTsRNXdjNBv4JWjn0pG
 UIOB03YvQyKFdsjpFjJRZqwHmAvxvI3bqnwSN5zKMj9UzgTGF9Zff7Mn1XYy8xouBy
 Qq87MKLzNJKjA==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20230104025754.3019235-1-chancel.liu@nxp.com>
References: <20230104025754.3019235-1-chancel.liu@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_micfil: Correct the number of steps on SX
 controls
Message-Id: <167301535488.46037.15431956554804644558.b4-ty@kernel.org>
Date: Fri, 06 Jan 2023 14:29:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-214b3
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 04 Jan 2023 10:57:54 +0800, Chancel Liu wrote:
> The parameter "max" of SOC_SINGLE_SX_TLV() means the number of steps
> rather than maximum value. This patch corrects the minimum value to -8
> and the number of steps to 15.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_micfil: Correct the number of steps on SX controls
      commit: cdfa92eb90f5770b26a79824ef213ebdbbd988b1

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
