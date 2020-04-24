Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAFD1B73C5
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Apr 2020 14:22:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1C0E16CC;
	Fri, 24 Apr 2020 14:21:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1C0E16CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587730926;
	bh=5WEt3s7TOfHVS6lKtXjDHjr86ZoVXaSFyuNlxEmzUhg=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PNIC+ftbUIQX/WmTKkgqhhCgztrc6D/CunW7U/jmSy/0pf8Fgy3Cvs+ZeKKiSK31+
	 j1bTpJMPczELwa94u3WTKn6EQ0lbS+9cFtbazmKxArajN7Sg+CWermkZJfWO5cDi/M
	 nVD9C8AMlPJTAD777x3dys5Nox/r67yFTlSJ8UNc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13F79F8023F;
	Fri, 24 Apr 2020 14:19:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF749F800BE; Fri, 24 Apr 2020 14:19:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B1AEF8020C
 for <alsa-devel@alsa-project.org>; Fri, 24 Apr 2020 14:19:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B1AEF8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="03+gRZgk"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 232BA20700;
 Fri, 24 Apr 2020 12:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587730776;
 bh=5WEt3s7TOfHVS6lKtXjDHjr86ZoVXaSFyuNlxEmzUhg=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=03+gRZgkT/SrRkLTBtpirAo7oL/seJDtnoX/7nOVMpPcv524ZDRMDUKyJ2OYkGLXt
 dv9B/RisUHn5aDw9mc6Q6AUkn7DDXVlW/TDuUhNp7EkqNFsaqeDr0bSz0DhFoOaiUe
 s3CGudvVjQrIUup7xeeL6JHmJJb0mgJWU5Qs5RWM=
Date: Fri, 24 Apr 2020 13:19:34 +0100
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Rong Chen <rong.a.chen@intel.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, alsa-devel@alsa-project.org,
 Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20200424005437.3941-1-rong.a.chen@intel.com>
References: <202004201540.vYPhhYMs%lkp@intel.com>
 <20200424005437.3941-1-rong.a.chen@intel.com>
Subject: Re: [PATCH v2] ASoC: soc-compress: avoid false-positive
 Wuninitialized warning
Message-Id: <158773076811.21878.3256404080318528635.b4-ty@kernel.org>
Cc: kbuild test robot <lkp@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

On Fri, 24 Apr 2020 08:54:37 +0800, Rong Chen wrote:
> gcc-6.5 and earlier show a new warning:
> 
> sound/soc/soc-compress.c: In function ‘soc_compr_open’:
> sound/soc/soc-compress.c:75:28: warning: ‘component’ is used uninitialized in this function [-Wuninitialized]
>   struct snd_soc_component *component, *save = NULL;
>                               ^~~~~~~~~
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: soc-compress: avoid false-positive Wuninitialized warning
      commit: 3e645a4add53eec22f3818c9da01c19191525096

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
