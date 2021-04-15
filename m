Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F353361238
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Apr 2021 20:36:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B73921679;
	Thu, 15 Apr 2021 20:36:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B73921679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618511817;
	bh=DIjc359eJQvUuEAXonYp4ayJobMO/jbmR85gSygggvg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G3AWH7mbBGOsuszhqj+hVU1wEPnxCp0dPp0S0BAq1Pq+C2JstzNm0r7BfIlxsBzBe
	 18/242ybKVI8Gj2UVuoTbG1nopPPN6kFIyttUf70BnNhPvxi65r4psTarCdQxvXD4Y
	 fiUqI40zqKaSASJh+CvL8RWjME1CoYS1aNxMTB1Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3934AF80424;
	Thu, 15 Apr 2021 20:34:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BB9BF80424; Thu, 15 Apr 2021 20:34:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23975F8021D
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 20:34:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23975F8021D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cFf1N+RA"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 280D6611CD;
 Thu, 15 Apr 2021 18:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618511667;
 bh=DIjc359eJQvUuEAXonYp4ayJobMO/jbmR85gSygggvg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cFf1N+RAHcgMOxD7jOIxal/ixnnS9l8SrlF482aXeUDCq6/ssN2O1HVN9d3H6l77q
 IH3i1gCkMqiix+Bpi/LuoeJ3teu0jkl/GTuDODfgUZCsFtYfRXBZ+uDb8JSDwtD5j3
 WlGqlbjoy9D8EJQcRNHOlyiyI/u5lqt6tL8mTKRQcnguBA88fhaHUOoaoE9ie7xptm
 d8zncHj/UbVZyKSVIxz3jJVUpeZrDh3xY+9ikVWKy5yLh2nbYrYxzkE2LxWtl6uB3Q
 fze2RyRxGVXNOQPexxf30iInvksiop9UOO5kzg4UU8Va9B3h6VI0nybNmCYp0yIMZ7
 kPaxQZW3hjZQg==
From: Mark Brown <broonie@kernel.org>
To: Lukasz Majczak <lma@semihalf.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Harsha Priya <harshapriya.n@intel.com>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>
Subject: Re: [PATCH v1] ASoC: Intel: kbl_da7219_max98927: Fix
 kabylake_ssp_fixup function
Date: Thu, 15 Apr 2021 19:33:46 +0100
Message-Id: <161851148785.23061.12027153189842499464.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210415124347.475432-1-lma@semihalf.com>
References: <20210415124347.475432-1-lma@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 upstream@semihalf.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

On Thu, 15 Apr 2021 14:43:47 +0200, Lukasz Majczak wrote:
> kabylake_ssp_fixup function uses snd_soc_dpcm to identify the
> codecs DAIs. The HW parameters are changed based on the codec DAI of the
> stream. The earlier approach to get snd_soc_dpcm was using container_of()
> macro on snd_pcm_hw_params.
> 
> The structures have been modified over time and snd_soc_dpcm does not have
> snd_pcm_hw_params as a reference but as a copy. This causes the current
> driver to crash when used.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: kbl_da7219_max98927: Fix kabylake_ssp_fixup function
      commit: a523ef731ac6674dc07574f31bf44cc5bfa14e4d

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
