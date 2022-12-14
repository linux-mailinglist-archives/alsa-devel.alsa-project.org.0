Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 306F264CCB4
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 15:54:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA1B42A34;
	Wed, 14 Dec 2022 15:54:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA1B42A34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671029690;
	bh=/2OgHoIgbauZY1fQizdroVr0cnittp3W64qoCI3xCjU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BAkYaqaWf9949AFGbtvwXV69IQfKQuWZaTXJ6EVv1MntPSnJdb+riGfWGDNJNA9Vv
	 ZzVoMJYvsNy269ipe96hSSBDd3QqmETrdgnDvhPICcjCOdnsaS0L+OPd/qatvjicaC
	 mPOzwHSyotoUNgWxMiLqtPN4W33HijW7pX8VvJac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5284FF804D7;
	Wed, 14 Dec 2022 15:53:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6348BF804E0; Wed, 14 Dec 2022 15:53:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F71AF80141
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 15:53:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F71AF80141
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Wf+aYlYc
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A2F7961AD8;
 Wed, 14 Dec 2022 14:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2667C433EF;
 Wed, 14 Dec 2022 14:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671029626;
 bh=/2OgHoIgbauZY1fQizdroVr0cnittp3W64qoCI3xCjU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Wf+aYlYcBD5WXAa86ZLmcPEExjNHMwdDMbcMQN16SBHOG61AbICIhM4s6WiyCj2IB
 aVvs8L1hLUADDDcpheyl2SoghQvxLtkigu+7IZ/Gak/4Fu4+SJkBUP+ysS2iAFDhbg
 UWKHxNaHc0Y/HCGD6mccY8Po2Exps6PQMlilA8Z2HkhbLVJ4Affhv6OqskEtVKW059
 uybH36RYz0C3NVBtdGb8dgvEUJq64AbelanyWotMoBFC60zwZLG3UUyqLFRGinwTks
 esSCaXnx09hF5EYhnfiVnkS487AmHgVkK6Ny6nDSIy0BcMbgR1nns8IEyCSSwEWj7f
 MOW5bU+E/8gLw==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221213123246.11226-1-hdegoede@redhat.com>
References: <20221213123246.11226-1-hdegoede@redhat.com>
Subject: Re: [PATCH] ASoC: Intel: bytcr_rt5640: Add quirk for the Advantech
 MICA-071 tablet
Message-Id: <167102962455.215050.1337176640659691899.b4-ty@kernel.org>
Date: Wed, 14 Dec 2022 14:53:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.0-dev-7e003
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Bard Liao <bard.liao@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, 13 Dec 2022 13:32:46 +0100, Hans de Goede wrote:
> The Advantech MICA-071 tablet deviates from the defaults for
> a non CR Bay Trail based tablet in several ways:
> 
> 1. It uses an analog MIC on IN3 rather then using DMIC1
> 2. It only has 1 speaker
> 3. It needs the OVCD current threshold to be set to 1500uA instead of
>    the default 2000uA to reliable differentiate between headphones vs
>    headsets
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: bytcr_rt5640: Add quirk for the Advantech MICA-071 tablet
      commit: a1dec9d70b6ad97087b60b81d2492134a84208c6

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
