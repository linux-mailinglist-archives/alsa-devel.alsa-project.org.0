Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0B65811FD
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jul 2022 13:32:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0D3A843;
	Tue, 26 Jul 2022 13:31:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0D3A843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658835138;
	bh=CuKVHLTsrfP4RuoS+xQOvvQp2NiCHeHx4Cgj1DXuw8M=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RPW67f0jE2MbIgNwROpP8cSKBmfyyqdnpQzrqlnHnO4r/+VhmDxTPdayJ+uqc3gOn
	 JzVL8lQpHX29Ic1YXp7BJT50eHGxa3OZimC+DxW4SvYeI4KEgzsHlN+jeT5KHD9s2r
	 T2jrbZo0YT30Cg6EGRjVCWuXxSJBPPl2IlypDbcs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7295BF80539;
	Tue, 26 Jul 2022 13:30:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E630EF80155; Tue, 26 Jul 2022 13:30:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DD82F800FA
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 13:30:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DD82F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Tgli/tZL"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E6641B81608;
 Tue, 26 Jul 2022 11:30:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECB94C341C0;
 Tue, 26 Jul 2022 11:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658835040;
 bh=CuKVHLTsrfP4RuoS+xQOvvQp2NiCHeHx4Cgj1DXuw8M=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Tgli/tZLWdwbA9DowozRItw+Sx1zKhTM8Ky7SJDqTb3sKIL4Z7sLL6K96fjdPo/r3
 6YR5o8NvLzCqBVR3F9FsuSgstW+uSPMRSyAaPaIXcLlmINN3GWc0XXrFasx6dkgbsc
 hq/r1LJ9ZKw7t9l9gXXB97T0peVJqocWZA/mBRHtbNc+fHxyJXKkVUlFgYIFQoJ4a2
 n+vJ+B+PsJCAfiFfVSzdju+buvj+KPc/AmGIaMky8g37eW3YlULhMlhmlDc1TmZ0f0
 +8lpl3DhntwPA3q/t18KEJhPRkVEP4gvzju/ujtX9UfhtdxKgg7IeqrhL5prk5Uqis
 zadiZQDFre0Ww==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20220725195343.145603-1-pierre-louis.bossart@linux.intel.com>
References: <20220725195343.145603-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: minor updates for 5.20
Message-Id: <165883503969.86475.6560928147582916261.b4-ty@kernel.org>
Date: Tue, 26 Jul 2022 12:30:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-c7731
Cc: tiwai@suse.de
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

On Mon, 25 Jul 2022 14:53:40 -0500, Pierre-Louis Bossart wrote:
> One sanity check for SSP index reported by NHLT/BIOS and two updates for
> Mediatek and Intel Chromebooks related to already-merged firmware
> changes.
> 
> Ideally this should go in 5.20, time-permitting.
> 
> Brent Lu (1):
>   ASoC: SOF: dai-intel: add SOF_DAI_INTEL_SSP_CLKCTRL_MCLK_AON bit
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: Intel: hda: add sanity check on SSP index reported by NHLT
      commit: e51699505042fb365df3a0ce68b850ccd9ad0108
[2/3] ASoC: SOF: Add cont_update_posn to platform parameters
      commit: d95610a1832993c539be22f0ec3ea8e34a29acff
[3/3] ASoC: SOF: dai-intel: add SOF_DAI_INTEL_SSP_CLKCTRL_MCLK_AON bit
      commit: af468aadf00485a2f5e804fe97db4731bc7a9c24

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
