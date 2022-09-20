Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C41575BEEB9
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 22:48:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D64F857;
	Tue, 20 Sep 2022 22:47:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D64F857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663706888;
	bh=izigipFMIh6xUe1qWd5aM7ceqVZov0+NQEtHgafPAzY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QYCMG/JTwhLxu2iQSE6QBrDy/gYZReXKrreYI7n1znhUCEza7sQVaznHacCggvNH8
	 HYfz+DTmDbn1QjMWoQxWNBDZdpJYvlxiCgt8Vur/pVVcEh7nl+NR/TTA+nODKcpTK5
	 MOW7Afwjmpkz7bj6Gm55tbyWddXVu+kaNuFYkdmc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 858E9F800C9;
	Tue, 20 Sep 2022 22:46:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24680F80538; Tue, 20 Sep 2022 22:46:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C05CF80538
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 22:46:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C05CF80538
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mBHUdPoS"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 6ED8ECE1B7A;
 Tue, 20 Sep 2022 20:46:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6BC5C433B5;
 Tue, 20 Sep 2022 20:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663706795;
 bh=izigipFMIh6xUe1qWd5aM7ceqVZov0+NQEtHgafPAzY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=mBHUdPoS5k5Vhwe7nzgg3HDveZnKVKE9f9EKdYczdTv+vHVrZ+gG3vcb3tBIcd8z3
 kJJiPwcwkuH4nY6Y+DXDMgX/Ipxjl9fazX8zOmGQhlee4JRf1tHFk3z7xGYVGaKoCr
 Y33ixdJvX5EOeiHYMBOBZiQLipnJoIO6FbvRTvJSU5P60wQ8+o7fUERW6DmbZogaJu
 WUc4qbq4ob0/oCi8McqiJom4rEky0uijkNCOsbKf6ZAClc7y4vrqRV8USLRCrZ3+5H
 fJZx9zmzdvIbljI6MUUbHZHaqUnmCaKp2QNLbxRiJJZCwvCI/A9/TCJSzIyIEoDxu3
 JkUPiqop8vLkQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220919115350.43104-1-pierre-louis.bossart@linux.intel.com>
References: <20220919115350.43104-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2 0/4] ASoC: SOF: Intel: override mclk_id for ES8336
 support
Message-Id: <166370679353.361668.16848211000357289920.b4-ty@kernel.org>
Date: Tue, 20 Sep 2022 21:46:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: tiwai@suse.de, Cezary Rojewski <cezary.rojewski@intel.com>
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

On Mon, 19 Sep 2022 13:53:46 +0200, Pierre-Louis Bossart wrote:
> This patchset solves a known issue with ES8336 platforms wrt MCLK
> selection. Most of the devices use the MCLK0 signal, but some devices
> do use the MCLK1 signal.
> 
> The MCLK is defined in the topology, it would be a nightmare to
> generate more topology files just for one MCLK difference. With a
> minor extension to the intel-nhlt library, the MCLK information can be
> found by parsing the NHLT table, and we can override the mclk_id at
> boot time.
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/4] ASoC: SOF: Intel: hda: refine SSP count support
      commit: 9ccbc2e12e01b39b804774c3207d2474dd992d95
[2/4] ASoC: SOF: add quirk to override topology mclk_id
      commit: d136949dd8e2e309dc2f186507486b71cbe9acdb
[3/4] ALSA: hda: intel-nhlt: add intel_nhlt_ssp_mclk_mask()
      commit: 72176fccd5de1d9cf61e42771bb00567723f3353
[4/4] ASoC: SOF: Intel: hda: override mclk_id after parsing NHLT SSP blob
      commit: d9252772cdc811beedabbcf21ef856d09b87d1dd

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
