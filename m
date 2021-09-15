Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFDE40C847
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 17:26:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA4BC184C;
	Wed, 15 Sep 2021 17:25:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA4BC184C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631719568;
	bh=3ShNs2T5I39S0p3SxP9AwLoQW+1rLFcWivepK75NQNU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aru+uHdgMApBwcPenZg+G8bJpaZEeSqWsS8y6BMeHyfjpR5fRTdqQXnmKlIGPO/hH
	 ZnxnmRB7PqauuMy7cMsFIuAyP2TBlxOYWdrUrF65yuam7rHfx8nFoDEbRjdK3D//Bj
	 UatngGZV1/2FFKj2Rx9lJSvGkidZ7sO4GAmYzT6g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E9D3F80515;
	Wed, 15 Sep 2021 17:23:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A11FF80510; Wed, 15 Sep 2021 17:22:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F362F804FD
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 17:22:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F362F804FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="M9yfEL2t"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D7AEB611C6;
 Wed, 15 Sep 2021 15:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631719372;
 bh=3ShNs2T5I39S0p3SxP9AwLoQW+1rLFcWivepK75NQNU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M9yfEL2teC8hA2DvNGeXr0f44vJ6ulN8XJG2guVPYRySTcFcIay2d7EoNdJFkw4rB
 u2pCoC35xPmluMRHVq5TcsuG8EpzFw9fFPilHdZTGJww3KUFB2lszjdbvybjDTkkUx
 Lmigquln0yCxd9SxlXVnxdK7BV+n6ODJdnJFjbwijCubo+fn8rPru7JGFO2bkgtYxp
 0r06D9pVAyfRkes/HK17tNINrHsT/IIyUgdU31l3m73NgCKKoHJayMUx4zFJsjSFJh
 GIVE4KPf9pH5Tlwmit9GielbaO9FPHSAb89Q48YsGAEZcW5kRDaKp8kASeZNOH+q9t
 aAlOe9gBoUAOA==
From: Mark Brown <broonie@kernel.org>
To: Brent Lu <brent.lu@intel.com>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 0/4] Support ALC5682I-VS codec
Date: Wed, 15 Sep 2021 16:21:49 +0100
Message-Id: <163171901943.9674.3853249840000451457.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210914101847.778688-1-brent.lu@intel.com>
References: <20210914101847.778688-1-brent.lu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Rander Wang <rander.wang@intel.com>, Nathan Chancellor <nathan@kernel.org>,
 Tzung-Bi Shih <tzungbi@google.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 Paul Olaru <paul.olaru@oss.nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, Yong Zhi <yong.zhi@intel.com>
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

On Tue, 14 Sep 2021 18:18:43 +0800, Brent Lu wrote:
> Support the ALC5682I-VS codec in Intel's rt5682 machine driver with
> three board configurations.
> 
> Brent Lu (4):
>   ASoC: Intel: sof_rt5682: support ALC5682I-VS codec
>   ASoC: intel: sof_rt5682: support jsl_rt5682s_rt1015p board
>   ASoC: intel: sof_rt5682: support jsl_rt5682s_rt1015 board
>   ASoC: intel: sof_rt5682: support jsl_rt5682s_mx98360a board
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: Intel: sof_rt5682: support ALC5682I-VS codec
      commit: 9a50d6090a8bbaef1c7a9252c904d85182a6a902
[2/4] ASoC: intel: sof_rt5682: support jsl_rt5682s_rt1015p board
      commit: 46414bc325df42ed0b18a50e2ee707e0424163a8
[3/4] ASoC: intel: sof_rt5682: support jsl_rt5682s_rt1015 board
      commit: 04afb621f9236dcfd7eb322d8554d7af8ce92dde
[4/4] ASoC: intel: sof_rt5682: support jsl_rt5682s_mx98360a board
      commit: e224ef76fa8aa2410731f0df13c93dffa443a970

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
