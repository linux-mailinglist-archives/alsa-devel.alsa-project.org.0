Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3B762F5C9
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Nov 2022 14:17:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0325216BE;
	Fri, 18 Nov 2022 14:16:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0325216BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668777448;
	bh=gpCT5FSTUmlSu11h+XlXNlMymRufzonSlfQb87vroaU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eJjRHMGYbBolkB8rtr7RUZYdjpCkbLcW0XiLZ1n05JgC+/4BlJ0kMj2m1eqWQRwuh
	 oxYluVFxXQIFLzdXPfu1nwzZXkkSnf3pz0RFXHKG0vUr28BXnQKQNMH/daESZXNIpw
	 AnH+Ru3dlEMsCnLnPE2b6c3YnbibT4fs8es2Ti1Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E8D7F800B5;
	Fri, 18 Nov 2022 14:16:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A578BF801D8; Fri, 18 Nov 2022 14:16:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86019F800B5
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 14:16:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86019F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OfIaVNcH"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E290862506;
 Fri, 18 Nov 2022 13:16:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CDD7C433D7;
 Fri, 18 Nov 2022 13:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668777366;
 bh=gpCT5FSTUmlSu11h+XlXNlMymRufzonSlfQb87vroaU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=OfIaVNcHmbKTXiKhv2pX7zdvw11paqrnoEeOaRkjsMtrlwZcupRipyeudTCeSlxW1
 g5qfnKqIrSGbLqjVBs76F7jOqMlttCA0ryVnKMgbkZdev0AoPz82BVicEqZ1VkX7xK
 VfdIL/9fM680Ud7fBV4lu6tMdE4O0BhuobXEVy2qcPlvPWjqfPVNFiOvh1C6Td6bKo
 JvwXgbhMuF15ltJX9rC0FLuzeRNFBgC/98eEOIfbgP5RBaVQdozndDOqZSgPSTR5nw
 +sh6mEmurVEknBoEPaiUPmorJAfbwaSpKTnbr1DWVgSGBc/TrRbhPDr+OA2vWfJRA3
 VUl2FsutsaB8g==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20221117232120.112639-1-pierre-louis.bossart@linux.intel.com>
References: <20221117232120.112639-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: dai: move AMD_HS to end of list to restore
 backwards-compatibility
Message-Id: <166877736394.779720.8141737391920673538.b4-ty@kernel.org>
Date: Fri, 18 Nov 2022 13:16:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: tiwai@suse.de, V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
 Basavaraj Hiregoudar <basavaraj.hiregoudar@amd.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

On Thu, 17 Nov 2022 17:21:20 -0600, Pierre-Louis Bossart wrote:
> The addition of AMD_HS breaks Mediatek platforms by using an index
> previously allocated to Mediatek. This is a backwards-compatibility
> issue and needs to be fixed. All firmware released by AMD needs to be
> re-generated and re-distributed.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: dai: move AMD_HS to end of list to restore backwards-compatibility
      commit: f5f8ad3fcdc49e4d794973007525ed864f93f3fb

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
