Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3250E2B0E65
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Nov 2020 20:42:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88A11185D;
	Thu, 12 Nov 2020 20:41:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88A11185D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605210129;
	bh=AU2I/thexqfB6jugRUIouoI9IlSPnUfAAPESndAfJqI=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZRCYK4RJpNENs0Wg8zCIzeS/evyEYoV8usremJUk6ROMWCZoQc3Y8KoEHcZ8Uxihx
	 k9rFK4kkUJ9/nDCwzaj/yqD2EkpMqsldghm2YWtgGyFCZNKlI8o1MdyBjrecXwcIbS
	 KhgGPG6dO21U3bXA5Zrfu8D94/d2eOsp0PCHkYzw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73906F804E0;
	Thu, 12 Nov 2020 20:39:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED356F804DF; Thu, 12 Nov 2020 20:39:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A858F804D2
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 20:39:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A858F804D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ro+omBgw"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EF6A22223F;
 Thu, 12 Nov 2020 19:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605209947;
 bh=AU2I/thexqfB6jugRUIouoI9IlSPnUfAAPESndAfJqI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=ro+omBgwFHy8FNiGg6tz36AaxUjppBjjWbqyYaiLao8XwswlzmXg2P+M95oSdQWzM
 WvhScbd4bF+ppjxz88YobmlAFMJN6PlSksncu/DPi3gfWktfuo54rrm5YN6sc9cu2d
 Htn7YuncCKtdJV0wEkxdMnjwWe9X05iqfygGpb84=
Date: Thu, 12 Nov 2020 19:38:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20201110203937.25684-1-festevam@gmail.com>
References: <20201110203937.25684-1-festevam@gmail.com>
Subject: Re: [PATCH 1/6] ASoC: wm1133-ev1: Remove unused driver
Message-Id: <160520990388.38586.2289127557936760602.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: nicoleotsuka@gmail.com, shengjiu.wang@nxp.com, alsa-devel@alsa-project.org
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

On Tue, 10 Nov 2020 17:39:32 -0300, Fabio Estevam wrote:
> Since commit c93197b0041d ("ARM: imx: Remove i.MX31 board files"), the
> MACH_MX31ADS_WM1133_EV1 non-DT platform is no longer supported,
> so get rid of its machine audio driver too.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: wm1133-ev1: Remove unused driver
      commit: 9c9fd07eb481cbfc89efa7820b3bb2b4a55eb303
[2/6] ASoC: mx27vis-aic32x4: Remove unused driver
      commit: 3fbb01fb583fd3ddd319f5a547bf10e322301a3f
[3/6] ASoC: phycore-ac97: Remove unused driver
      commit: 440534a0ecfd20235a091fb2a98c2c3adf86834e
[4/6] ASoC: imx-mc13783: Remove unused driver
      commit: 83e7e2278680207f1650949db11ba0e1b6fbc3f5
[5/6] ASoC: fsl: eukrea: Remove the SND_SOC_IMX_SSI selection
      commit: ffc64110b7e988b2fba5f68b82e18214524ac432
[6/6] ASoC: imx-ssi: Remove unused driver
      commit: c31da0b196f99c7d95c69bab96e709b72a30f509

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
