Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60345211601
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 00:28:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A7631690;
	Thu,  2 Jul 2020 00:27:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A7631690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593642517;
	bh=iBVt2dwznSpdfmmrhuLy36t4zhkGrZ4KkwP1ObWLwFo=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yj86Tegmlq45JW90A1Kmqs/v9EO0cc83fhW5XX1ZGfN8IxT/Tb+1+jR2YvCya19OB
	 E5bq8hGtxjI3aPjuhMhPSms0pg/kk9NeeI9Mlxsb43dpdbKQK09WiqMDlv+H8IFmQ2
	 4hMSERzPE/V337DRqQ3bxjFxYWHqOLnZE0j5bm+U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C27DDF802FF;
	Thu,  2 Jul 2020 00:23:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30CCEF802FE; Thu,  2 Jul 2020 00:23:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93005F802EC
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 00:23:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93005F802EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Qi8FUN2t"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9088B20780;
 Wed,  1 Jul 2020 22:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593642193;
 bh=iBVt2dwznSpdfmmrhuLy36t4zhkGrZ4KkwP1ObWLwFo=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Qi8FUN2t7oJIPqDlFCPvwtll5bCHtiC2BJGAlQPLp5YTJrOVkgxgOOxyiNbnpkVko
 soEGHQdBhGkpxL3Mm7Sase+VI2iuESiJzsyqrWhUf4HcRFTwH4SFxfRhRrHNFEMqXP
 wQmyzoSIKMbdZMsdjyC7hHMXaagIgMsXW20uz1H4=
Date: Wed, 01 Jul 2020 23:23:11 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Brent Lu <brent.lu@intel.com>
In-Reply-To: <1593596211-28344-1-git-send-email-brent.lu@intel.com>
References: <1593596211-28344-1-git-send-email-brent.lu@intel.com>
Subject: Re: [PATCH v2] ASoC: Intel: bxt-da7219-max98357a: support MAX98390
 speaker amp
Message-Id: <159364215575.10630.52868424630898408.b4-ty@kernel.org>
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jason Yan <yanaijie@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mac Chiang <mac.chiang@intel.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Amery Song <chao.song@intel.com>, Naveen Manohar <naveen.m@intel.com>,
 Libin Yang <libin.yang@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>, Yong Zhi <yong.zhi@intel.com>
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

On Wed, 1 Jul 2020 17:36:51 +0800, Brent Lu wrote:
> Support MAX98390 speaker amplifier on cometlake platform. Driver now
> detects amplifier type in the probe function and installs corresponding
> controls and DAPM widgets/routes in the late_probe function.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: bxt-da7219-max98357a: support MAX98390 speaker amp
      commit: e1435a1feb18e198155d16d3d6b500d46e0625c0

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
