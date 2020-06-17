Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B926A1FD5AE
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 22:01:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 587FF167D;
	Wed, 17 Jun 2020 22:00:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 587FF167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592424062;
	bh=DNCwG4y0Kw5QEMGp8suxAsvaUaP9puZTO2j2ki8x3Hg=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LdX1YFKVIJPjG4ObCWwRoWrj1g6kDqQzXBby+NpZ6GovHWehXKE0c+6srOchSh8Gg
	 CbZpxoQumKX7ElOTobmg+XU29xeDbuLELXZgh0JRRMz5X73oUfvnWcQ0quG5X4kkPN
	 ksYYEH2PQVX9wgR0/wAqX0wjT/e/l6RDFwe77s4U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51536F801D9;
	Wed, 17 Jun 2020 21:59:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FEF7F80171; Wed, 17 Jun 2020 21:59:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4BF9F80116
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 21:59:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4BF9F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="idiEN6O0"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 99C73208B8;
 Wed, 17 Jun 2020 19:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592423947;
 bh=DNCwG4y0Kw5QEMGp8suxAsvaUaP9puZTO2j2ki8x3Hg=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=idiEN6O0VGId+/5n8ZpcA8IJj22U3gjpcnQgum5h8SezhvwCSFfdTG9ZGoCtscZcR
 hkpkMR//HAmgRqbfBiNxYO5uVdpJ3Ehh47sTcd+w32upuxyhfUuXAjoXFY49PI/NoM
 Kr+DNKXvh14r3pssPyQdmP78rKrv9J5gf4g55FfY=
Date: Wed, 17 Jun 2020 20:59:04 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20200617164144.17859-1-pierre-louis.bossart@linux.intel.com>
References: <20200617164144.17859-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: hdac_hda: fix memleak with regmap not freed on
 remove
Message-Id: <159242394493.17586.8615014903058308406.b4-ty@kernel.org>
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Daniel Baluta <daniel.baluta@gmail.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

On Wed, 17 Jun 2020 11:41:44 -0500, Pierre-Louis Bossart wrote:
> kmemleak throws error reports on module load/unload tests, add
> snd_hdac_regmap_exit() in .remove().
> 
> While we are at it, also fix the error handling flow in .probe() to
> use snd_hdac_regmap_exit() if needed.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: hdac_hda: fix memleak with regmap not freed on remove
      commit: a94eaccefea1186947c5c5451fcae2245dd7e714

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
