Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D5C2A0ED4
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 20:43:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E33ED166D;
	Fri, 30 Oct 2020 20:42:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E33ED166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604087002;
	bh=6APAouS5gTipcXWfVkIabBDcftgnh4LjNXjLSb8L+3Q=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l3d4DL6717A1wrKPvJoQmASTIuF4aNAmcqX7CiWRq6gobC2bVtTe5uQ/5+u3H2vHk
	 m9PYzXsaDUM6sK98m9QDaydfOoq7Te4Uu709QBtFVG+XO8RBLHiphszVLQJ+P0T/dX
	 qMi65at4wzM0v0PjVd0FxRssh7dbDhTASeo5Q9Sc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88945F800C0;
	Fri, 30 Oct 2020 20:41:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C30FF80272; Fri, 30 Oct 2020 20:41:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81882F80107
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 20:41:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81882F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EiRFCM8k"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EE76820739;
 Fri, 30 Oct 2020 19:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604086894;
 bh=6APAouS5gTipcXWfVkIabBDcftgnh4LjNXjLSb8L+3Q=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=EiRFCM8k8ht84bI9je+gxuuqS1xxj9UReHpl8DG7oDaMD9NFD9ryzM+koPnR1JAwt
 SWA+uenTovAUvAka7GgmBntTLIZvYAqKDbmIHVWnq+cgfMJ90b512IV9duTXkNCWLR
 AAiG2waZw5dXLwpc04+lk2nQY6FrCNH8YncVdmGI=
Date: Fri, 30 Oct 2020 19:41:27 +0000
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Brent Lu <brent.lu@intel.com>
In-Reply-To: <20201030170559.20370-1-brent.lu@intel.com>
References: <20201030170559.20370-1-brent.lu@intel.com>
Subject: Re: [PATCH v2 0/2] Add rt1015 support to CML boards
Message-Id: <160408688150.11950.1006967503782392855.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jason Yan <yanaijie@huawei.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Fred Oh <fred.oh@linux.intel.com>,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
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

On Sat, 31 Oct 2020 01:05:57 +0800, Brent Lu wrote:
> First patch adds tdm 4-slot 100fs DAI setting to avoid jitter of using
> 64fs on CML boards. Second patch is a DMI quirk for HP Dooly.
> 
> Changes since v1:
> -Add comment on Dooly's DMI quirk
> 
> Brent Lu (2):
>   ASoC: intel: sof_rt5682: Add support for cml_rt1015_rt5682
>   ASoC: intel: sof_rt5682: Add quirk for Dooly
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: intel: sof_rt5682: Add support for cml_rt1015_rt5682
      commit: 35249a5684fd01377bb40e20b8a604774cb073d8
[2/2] ASoC: intel: sof_rt5682: Add quirk for Dooly
      commit: bdd088ce5bfd32b95ab1bd90b49405e7c1f1fff5

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
