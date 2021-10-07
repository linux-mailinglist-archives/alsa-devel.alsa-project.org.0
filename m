Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A06425F49
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 23:39:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78AEB1669;
	Thu,  7 Oct 2021 23:38:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78AEB1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633642772;
	bh=4M2RnkwoHY+VtqkKdQus2Ogl+01q/5pNdV+oU8rItUw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D4Wa7u53e0QL66EiWuI53yVN/motkHcc83+Pe5y6I9tDYkbbvdue+t5Y0Bez8UjQE
	 Fa/xdhQmetJ+t645vlWf/Oe+1hCF7m8pB8zn4GdfZgsV6KCm0++Wov/vvd52gc9KJt
	 xK1wtYbQay4QjIL2Cf2DsCb5MeZTyGS7nIp+pNmA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3822EF804CF;
	Thu,  7 Oct 2021 23:37:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76BEDF8027D; Thu,  7 Oct 2021 23:37:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CED65F80259
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 23:37:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CED65F80259
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="teRmpjXK"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 32743610C8;
 Thu,  7 Oct 2021 21:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633642664;
 bh=4M2RnkwoHY+VtqkKdQus2Ogl+01q/5pNdV+oU8rItUw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=teRmpjXK7nQWqjSF3u0Iu+JmKEKbWNLNixXatIgeNTRkUVamjX4AkIJqmVKpv07Ml
 3zmfTIQ3RusropXDzqJvg1RV8rfAYbKPDIpWdAuh8vTo3RRGtVh11N0P3Cb8qccfyR
 V6+9QJNFypgXyyEIqA9CwybZEWYQYe20grzMC1XX97dAKVA/D70fqkJeflCHp7ZFMv
 OakXBWYZU6ua7R+I8P+N8f0/XZwZ9dj5LzTrBl9ZHgswr+IYMRjyw3z64puAj1E5it
 67DPobgW+e4X8CU79ZTg7exUzrCUbdHXZUJ8CMUOyOUE4+qIhGwAqsVmdkHp1v1SN7
 9APCsk3W/OD2g==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: soc-pcm: restore mixer functionality
Date: Thu,  7 Oct 2021 22:37:24 +0100
Message-Id: <163364264607.649699.9814430784093751468.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211004212141.193136-1-pierre-louis.bossart@linux.intel.com>
References: <20211004212141.193136-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Sameer Pujar <spujar@nvidia.com>,
 Mark Brown <broonie@kernel.org>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

On Mon, 4 Oct 2021 16:21:41 -0500, Pierre-Louis Bossart wrote:
> Recent changes in soc-pcm completely broke basic support for mixers on
> Intel systems: the filters on BE states prevent the connection of a
> second mixer input while the back-end is already active.
> 
> Rather than reverting the changes, which would be problematic for
> Tegra systems, this patch suggests an additional filter which will
> only apply to Tegra systems. This is a temporary solution which will
> have to be revisited - additional issues have been reported with DPCM.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-pcm: restore mixer functionality
      commit: 9609cfcda00771859b2177de3bf0c3da62fe7233

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
