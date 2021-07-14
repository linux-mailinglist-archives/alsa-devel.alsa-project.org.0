Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6F03C8827
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jul 2021 17:58:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B950D1693;
	Wed, 14 Jul 2021 17:57:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B950D1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626278287;
	bh=qnXD28YHQU7LtRuOJfXxRjF9c52+gT8hSD7CO6ZJDyQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d+hMEiq5DxqiUa+jtOjawALXayY9kt9voqM8hK9b3ebcowbgPY4TQ206dFFa1JGBl
	 vjlFk2qADUHiq6xgqXFyQ5Cqm9Tjil/PRx1lDWBR2H94Ksb1h7RDZVgATv1Rmf6oom
	 6d2RTmcGPLRiUCgEUQWuoixpFKEC91jfRpJmrJD4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 828CEF804A9;
	Wed, 14 Jul 2021 17:56:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D394F80269; Wed, 14 Jul 2021 17:56:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 093CCF8013C
 for <alsa-devel@alsa-project.org>; Wed, 14 Jul 2021 17:56:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 093CCF8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ona/Myj7"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 455B6613C8;
 Wed, 14 Jul 2021 15:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626278174;
 bh=qnXD28YHQU7LtRuOJfXxRjF9c52+gT8hSD7CO6ZJDyQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ona/Myj7MZMvEfnT/6NHEyxZOd7Ly9aOtTe/yREgUW8xV2ljjFwSMmZzwzE2OlZX/
 QdpPmnZo+kFeSxp5iDfQZ+EKIvS/rIItOylQP8L0e6Lh07QuaQDU72vQtgqRtkatzR
 NuMtvftOUiVg73KPb/gHt2tfFd1Q0wxAkaDiv+ddQpUx+u9CCuJh2e6qTwW4nyxZnn
 46dJnhQ5OQb6FCbnBSEc6yEzdA8yD6QAvYN3x2BldLaUjXunbGVQP1oOYbXPNuhTcg
 UT/6lLn42Kf/jB7Cryj1Hf0XP8l1l9QKUXowASnukb5RZWkOK8VuCDSL7w4tj+X7/2
 OPETpV2J8n6/Q==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: codecs: wcd938x: make sdw dependency explicit in
 Kconfig
Date: Wed, 14 Jul 2021 16:55:19 +0100
Message-Id: <162627737185.54838.13473688985790712154.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713140417.23693-1-srinivas.kandagatla@linaro.org>
References: <20210713140417.23693-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
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

On Tue, 13 Jul 2021 15:04:17 +0100, Srinivas Kandagatla wrote:
> currenlty wcd938x has only soundwire interface and depends on
> symbols from wcd938x soundwire module, so make this dependency
> explicit in Kconfig
> 
> Without this one of the randconfig endup setting
> CONFIG_SND_SOC_WCD938X=y
> CONFIG_SND_SOC_WCD938X_SDW=m
> resulting in some undefined reference to wcd938x_sdw* symbols.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wcd938x: make sdw dependency explicit in Kconfig
      commit: 9431f8df233f808baa5fcc62b520cc6503fdf022

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
