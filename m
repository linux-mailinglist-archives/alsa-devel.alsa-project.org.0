Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8A71B73C4
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Apr 2020 14:21:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C339916C3;
	Fri, 24 Apr 2020 14:20:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C339916C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587730879;
	bh=v4Wkb61I3GAFJWdNX/2z2spkJ9EdzvizSv/i0EDffmE=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vXoVtvxiz5IiS0QewZX7IJ6FEh6vq2kh8XmRoHrd4cla1hvIMtzTWZEpejUkq4u93
	 CXebNNSUa+oQg2Hu+uP7NB3c2U3vi9zMw+V++OR59SudZ6c6rrF3y7kSh8QEehxtq+
	 gWKf+tBlT2SZv9kZkRepJty2thxXsjDrNJbTqEjY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9BCCF80117;
	Fri, 24 Apr 2020 14:19:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F6D3F80142; Fri, 24 Apr 2020 14:19:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 064EEF800BE
 for <alsa-devel@alsa-project.org>; Fri, 24 Apr 2020 14:19:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 064EEF800BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uT/kEZTD"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3600620700;
 Fri, 24 Apr 2020 12:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587730770;
 bh=v4Wkb61I3GAFJWdNX/2z2spkJ9EdzvizSv/i0EDffmE=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=uT/kEZTDgmc9s1QnZZQABvTRIpFhViBjaq7eAlt+cACmVWabqxkbRHVp3Ssx0SWTX
 Rw7r9KFyJIeIGFvBYE6SH+k91wkSwyzwD7BTqSjCIdxdk7lJWjMSXkx/M5Pd+TE+d1
 QGnmCBnN1PMZXcijEX8kotpqAZaxsX+Me8BsJU34=
Date: Fri, 24 Apr 2020 13:19:28 +0100
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Rong Chen <rong.a.chen@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>, alsa-devel@alsa-project.org,
 Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20200422073543.1671-1-rong.a.chen@intel.com>
References: <202004201540.vYPhhYMs%lkp@intel.com>
 <20200422073543.1671-1-rong.a.chen@intel.com>
Subject: Re: [PATCH] ASoC: soc-compress: avoid false-positive Wuninitialized
 warning
Message-Id: <158773076811.21878.6316435664619684333.b4-ty@kernel.org>
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

On Wed, 22 Apr 2020 15:35:43 +0800, Rong Chen wrote:
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
