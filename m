Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62101283DE0
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 19:58:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E335D1797;
	Mon,  5 Oct 2020 19:57:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E335D1797
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601920704;
	bh=GoTAxJOmaaCg6ov+6K3bl1sgNs5+H5zxvRggKa3ufkc=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZspwsBcSvtTtDP1/IitG0woQKGLiZ0tGkgHRkrPNx9u0gqeSYDln3iVBKBsklFEmq
	 AWBBTd+mjE/7MVCubECqdGxa1j7dyF0pPlIVul4j0fy7tisHFwzsU0Lr1ROZ71hljH
	 Ev5pwVajfFECeS4d5Igie8p9VbVfuEI9ZTHyGOwk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 882EFF802E0;
	Mon,  5 Oct 2020 19:55:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32601F802DF; Mon,  5 Oct 2020 19:55:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F500F802D2
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 19:55:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F500F802D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aS5Y3YXq"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0CCDE2083B;
 Mon,  5 Oct 2020 17:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601920509;
 bh=GoTAxJOmaaCg6ov+6K3bl1sgNs5+H5zxvRggKa3ufkc=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=aS5Y3YXqQGDpw+vG/NKtPZnp8IRP/oJULKXy4058439GIqe/IXCU5ZXBS6B3N+8Ae
 sJ6zL1dJDhpPPSdul1mXZrfGbLpDZawJy8OVPWBgClKsnpAazfDbBHiopH4Lf43D8N
 cgtEYsAUX6IsgcOM0DQJ7e9qBYDssW2Vn4+HezMM=
Date: Mon, 05 Oct 2020 18:54:06 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20201004090609.29066-1-cezary.rojewski@intel.com>
References: <20201004090609.29066-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 1/4] ASoC: Intel: bdw-rt5650: Mark FE DAIs as nonatomic
Message-Id: <160192043040.23051.5533408178513935644.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, tiwai@suse.com, lgirdwood@gmail.com
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

On Sun, 4 Oct 2020 11:06:06 +0200, Cezary Rojewski wrote:
> PCM operations for DAI links connected with DSP platform component
> involve communication with DSP firmware by IPCs. As IPC protocol may
> cause thread to sleep while waiting for a response from DSP, propagate
> that information to ALSA core by marking all FE DAIs as nonatomic.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: Intel: bdw-rt5650: Mark FE DAIs as nonatomic
      commit: 4cc62da459aeee438a1fcf009e6101292025476f
[2/4] ASoC: Intel: bdw-rt5677: Mark FE DAIs as nonatomic
      commit: fc5c8729c1ef78d54432d68216c1b13791248bb1
[3/4] ASoC: Intel: broadwell: Mark FE DAIs as nonatomic
      commit: 727d7d84f74744a6f8d583eb5034e926aecc78e7
[4/4] ASoC: Intel: haswell: Mark FE DAIs as nonatomic
      commit: dc155ad5fa6ef7d48fb3c3cc30497b492da0749e

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
