Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F24C2593311
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Aug 2022 18:24:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 784F5163F;
	Mon, 15 Aug 2022 18:23:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 784F5163F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660580670;
	bh=txviIWtgKTn8W5exAoYk95kSN70u4fkOZHI4CSdKYT8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SZ8rc2O1mBZn6pqKLPfIzwVuPwHyVtNRVYUG/o6o+n7WLtBDhtoPfIDZnRsTonCwg
	 fnM9QUpC4+DBvztvFzPR6RLb7i0TSRTmHhBySRF943qLmO+cSCmaoht8k+pprJi/7i
	 7NVayOe9gJFlkRHeBJBUTMZdIdzhsvhKHgJN3gfY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65859F80549;
	Mon, 15 Aug 2022 18:23:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F070FF8025A; Mon, 15 Aug 2022 18:23:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F0FAF80125
 for <alsa-devel@alsa-project.org>; Mon, 15 Aug 2022 18:22:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F0FAF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Cg3MlLbK"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A40B2B80FAE;
 Mon, 15 Aug 2022 16:22:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F04EC433C1;
 Mon, 15 Aug 2022 16:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660580577;
 bh=txviIWtgKTn8W5exAoYk95kSN70u4fkOZHI4CSdKYT8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Cg3MlLbKmC3avMOv0ogKD3gV6WtTd0JHOptirGE/1EP4DR4rU92emDbPnaE8MIBqM
 LaNLN0RRIjl6jWU3Ruvv5ptdqHalrK5y88utWRDS0cE1NQzHcDfwCVtGWxx07lWeXi
 d/BzYj3bMA6f48KwrPw4NiLqPhHGkOwSbfxX22eeoQYqublqmmFebixnQjXisP3oGP
 iW1Je/RRWEXO+fdAFUrS8CoAg+sCVPntu+1pEsz892H20anFL9K1eMMO3YmYpU4umk
 W58vjGVXX6ryhDGlAXXVYVgzSi41DwOzmzYolMKochsWadAnkT0A1EPyhVl+SLc9fB
 ZZeze+B6qVPDQ==
From: Mark Brown <broonie@kernel.org>
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 Brent Lu <brent.lu@intel.com>, xliu <xiang.liu@cirrus.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220801094034.3927841-1-sbinding@opensource.cirrus.com>
References: <20220801094034.3927841-1-sbinding@opensource.cirrus.com>
Subject: Re: [PATCH v3] ASoC: Intel: cirrus-common: Use UID to map correct amp
 to prefix
Message-Id: <166058057529.769843.6686706298009723312.b4-ty@kernel.org>
Date: Mon, 15 Aug 2022 17:22:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On Mon, 1 Aug 2022 10:40:34 +0100, Stefan Binding wrote:
> Since the order of the amps in the ACPI determines the device name,
> and the ACPI order may change depending on hardware configuration,
> use UID to dynamically compute the dai links, allowing dynamic
> assignment of the name_prefix.
> 
> The UIDs for these amps in ACPI are fixed, and map to a name_prefix,
> where:
> UID 0x0 -> WL
> UID 0x1 -> WR
> UID 0x2 -> TL
> UID 0x3 -> TR
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: cirrus-common: Use UID to map correct amp to prefix
      commit: 1ca726424a12962f2c2656cc9cdd0b8668117e8f

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
