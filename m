Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4FE42FC64
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 21:44:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44BFC1890;
	Fri, 15 Oct 2021 21:44:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44BFC1890
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634327091;
	bh=F/qhtQq884fDhoH6bClRl635RI5UPxO4klw1oW2Avd4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jUmU60RBaAJPLhnOiumIPZ5ahmMjr4X2yT3iIvHAZZLeFa/YZ2vpt8Ik5V/IBZsiR
	 iW5dtyl+FD6JCSNDVOmadaNCUKK0WQhYGBoDj0DA6tzci/0GPP/hxsTey75uznE72e
	 DXUrPFAz0HPja8CJUo57AhYxZQcsjzQpHrXRq414=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57826F804FB;
	Fri, 15 Oct 2021 21:42:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3F5DF80423; Fri, 15 Oct 2021 21:42:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E95D9F8028D
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 21:42:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E95D9F8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Z1fGPf/i"
Received: by mail.kernel.org (Postfix) with ESMTPSA id DB25461181;
 Fri, 15 Oct 2021 19:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634326936;
 bh=F/qhtQq884fDhoH6bClRl635RI5UPxO4klw1oW2Avd4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z1fGPf/iD9Yt34acPBNN0wz3lnqB1pa1NyvXU39zOD4BWEEhxYB1F/omV0s+hiEf0
 V8M+DMJU+I/ysApG1kqHzOS7nT6eWdTUksVKtWkwkorXcTDkUlfAOlh12gLbjG/R7V
 TsTnDIiHV5FgLjfhQOrNY3tPGNaEoaRFNtjoZm/+b5wuHK+y63udXCe7J+tto97JQf
 sfNNDatk5pjQ1oAE/GqJI8x2N4TflWpH8Fz+nnpxikY46ELTjICjEj14e6XgY3XPNC
 +P0CaNaRroce6aa5k2nkAY27d1yqEc9BCg3MTsbjzFUgiImakoFAa2GYCgthNTtu6e
 989nFUZWMY7mw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH V2 1/3] ASoc: amd: create platform device for VG machine
 driver
Date: Fri, 15 Oct 2021 20:42:02 +0100
Message-Id: <163432688461.1314975.2857186739241189327.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211014071714.836410-1-Vijendar.Mukunda@amd.com>
References: <20211014071714.836410-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 wtli@nuvoton.com, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Alexander.Deucher@amd.com
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

On Thu, 14 Oct 2021 12:47:08 +0530, Vijendar Mukunda wrote:
> Create platform device for Vangogh machine driver.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoc: amd: create platform device for VG machine driver
      commit: 832a5cd2d3d9e195af2fe272999af8948383ce9b
[2/3] ASoC: amd: add vangogh machine driver
      commit: 34a0094b9ff7b7544591a6841f9b61747033f292
[3/3] ASoC: amd: enable vangogh platform machine driver build
      commit: 96792fdd77cd19fcf2368e7c19bb8b78557ae425

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
