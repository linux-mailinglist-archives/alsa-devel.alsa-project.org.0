Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A19C75BEF32
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 23:34:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 496D386F;
	Tue, 20 Sep 2022 23:33:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 496D386F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663709686;
	bh=AX/yelOqwhpeDy7Xlfs/74mI+JflsXOsHUQPbEy6MZw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vQ3ND0iHCOANq2suGf6NihNVnMDYsugbaxtczUMGLRWhEvwJXXvuGtCbvcJbROKte
	 wGeq+6X1yTCK+bdDkGVhVU1UEeRbssAnQ50OZ/b657AtNPYse3PrY8/m0Lgm33KpWG
	 nNDsM8fmeCnLbMHXHBfks4e78ecOh2+ILWNme8Ws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A1B5F804DA;
	Tue, 20 Sep 2022 23:33:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5F20F800C9; Tue, 20 Sep 2022 23:33:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76744F800C9
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 23:33:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76744F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HbxCo4vR"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E228862E24;
 Tue, 20 Sep 2022 21:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E015DC433D6;
 Tue, 20 Sep 2022 21:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663709590;
 bh=AX/yelOqwhpeDy7Xlfs/74mI+JflsXOsHUQPbEy6MZw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=HbxCo4vRM7wR+SNdDIjO/WfJCG0vHVMyAtOWPE40B9BYFz1C2yU4hsq6jrkGiazJI
 Ir+PDliOtynmcDGS/1Y70MvVVpXsC2IAM9Csa6CcL/xJ3tuImKy/ZklTuOWm70rkqd
 IXvb2pWC6kpD6mMtksrpTHfV1JFqaA7S8k/cmREiWdEb9HHBAu4/xP7n/7Ed7HsADQ
 kgYBXPZTbAcgWZ68EbaWGJ3aVPujAiTH7USSp16lfKuf2aIeZPTpo+mztBJrCEWd88
 +GyngoJy4JzwcYgjqTAoQI8+Q/MslkeR9CLgEDON9/FzCUAKaTlK0dvyTIdG3LvLDv
 HhO7sObE2cP2g==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220920074617.10300-1-pierre-louis.bossart@linux.intel.com>
References: <20220920074617.10300-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: soc-acpi-intel-rpl-match: add
 rpl_sdca_3_in_1 support
Message-Id: <166370958862.476248.15987573091770204357.b4-ty@kernel.org>
Date: Tue, 20 Sep 2022 22:33:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>
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

On Tue, 20 Sep 2022 09:46:17 +0200, Pierre-Louis Bossart wrote:
> From: Bard Liao <yung-chuan.liao@linux.intel.com>
> 
> Add rpl_sdca_3_in_1 match information.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: soc-acpi-intel-rpl-match: add rpl_sdca_3_in_1 support
      commit: e7ff7307bb9aaf157d6bea5807a58673dee94a61

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
