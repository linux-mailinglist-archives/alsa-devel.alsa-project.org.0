Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CC739BD41
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Jun 2021 18:34:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B7101737;
	Fri,  4 Jun 2021 18:33:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B7101737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622824466;
	bh=VVDwBOYJlwtQ+NvG+nh6ewV59zoduApWF+wXmmPHwX4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SSq4Lm4ENVp/JASEj+TpCnPe8cHPyDLE1mUmIBJsoi09leo7PrNyWFP+1z9xTm3Cn
	 1V13PcXkFgdkRoKlcO9C9DEnAjwaAKFrrm2PE6LHx1LrszmOJP9R3435G6JdJqUScT
	 nvXxaqOPrvRLOFDc4LE5Kfx0kfh31g1r4854wjio=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90E34F80425;
	Fri,  4 Jun 2021 18:32:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83912F80424; Fri,  4 Jun 2021 18:32:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E50EF8016D
 for <alsa-devel@alsa-project.org>; Fri,  4 Jun 2021 18:32:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E50EF8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="s0oIRGE6"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6782F61153;
 Fri,  4 Jun 2021 16:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622824369;
 bh=VVDwBOYJlwtQ+NvG+nh6ewV59zoduApWF+wXmmPHwX4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=s0oIRGE6/X4aG2o5pEbogpEBFp5m+ztFKFdbZPKQ5vhn55nUarK87MJoOH2UY7Tqj
 sUnQ9quZsatXGL5Dt2pwMYWVnpXIOLU2Y6MRsSDaLr7jdJS/vwmLSHkV6MedXtj8rZ
 zdcRfL7tJ8iSOEENJVaQFllTnhqIWH8nE2kr7Hib1hke/EnL/rFdDlisQ2or5pvhEI
 UIwXiIKGoHvV2uPupDhgjk9vxwIc7BO6EBtPLxPVi8UHuLD+AwjIFGYtX2gEGMuBlO
 Z0IBlGppsCTgvFjYhzgzNETH5cTu6uWcZOsRoVjGyFgQ2P/ECBnBSsv1aRQs95ld7O
 MiMD0SvkAG+oQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, alexandre.belloni@bootlin.com, perex@perex.cz,
 Bertrand Jacquin <bertrand@jacquin.bzh>, srinivas.kandagatla@linaro.org,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com
Subject: Re: [PATCH] ASoC: snd-soc-lpass requires REGMAP_MMIO
Date: Fri,  4 Jun 2021 17:32:27 +0100
Message-Id: <162282419357.38836.17547225118877457445.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603221816.2642402-1-bertrand@jacquin.bzh>
References: <20210603221816.2642402-1-bertrand@jacquin.bzh>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

On Thu, 3 Jun 2021 23:18:16 +0100, Bertrand Jacquin wrote:
> With CONFIG_SND_SOC_LPASS_RX_MACRO=m and CONFIG_REGMAP_MMIO undefined,
> build fails with the following error
> 
>   make -f /var/tmp/portage/sys-kernel/stable-sources-5.12.8/work/linux-5.12.8-stable/scripts/Makefile.modpost
>     sed 's/\.ko$/\.o/' modules.order | scripts/mod/modpost   -E  -o modules-only.symvers -i vmlinux.symvers   -T -
>   ERROR: modpost: "__devm_regmap_init_mmio_clk" [sound/soc/codecs/snd-soc-lpass-rx-macro.ko] undefined!
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: snd-soc-lpass requires REGMAP_MMIO
      commit: e78f36bc13591e8d23948996ab6d195f1efa8f40

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
