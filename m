Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 144C4568674
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 13:10:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C4D716F4;
	Wed,  6 Jul 2022 13:09:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C4D716F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657105848;
	bh=BZCKP5tZSxu06QM9jLVz19aqimTq9g4sT3WFL7FeJ4E=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CPTgPOmuAp4C1BgB/dThiH72tBCjCVJbNOXX7sZSx0pAwNJpN53YXrRDC8Lid+/I1
	 vRemM+gS/Tu9KHPRMuBK7kgQ8suJkWeHc9yJoFNwos4sr6k8fniUIaWGizQs8stJF5
	 Vl99vNdldmfxr4Lg6B5U07d9np8EE+DS5s4w5feI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7CFFF80563;
	Wed,  6 Jul 2022 13:08:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB78BF80557; Wed,  6 Jul 2022 13:08:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 818DBF80549;
 Wed,  6 Jul 2022 13:08:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 818DBF80549
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="O/7alNDv"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4651C61E82;
 Wed,  6 Jul 2022 11:08:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96D17C341CE;
 Wed,  6 Jul 2022 11:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657105684;
 bh=BZCKP5tZSxu06QM9jLVz19aqimTq9g4sT3WFL7FeJ4E=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=O/7alNDvspGn+ZqprEjuMKPkSKP26SZSop292NkkrTG8BsJx5GMSdUjndI/d1X7ZQ
 Ycz/B4nBUt9dBclWPJmC7QlzEsPRcWrSyDnwfdyTYBUxd0SkODNAX2Ig1EPUu3FNOi
 2Xq/0pBw5ft+FMxg/YujRFrE9TpOvWlyKfO/4AILfzhOHdaWnuR1Nqos7QTTnBAAk6
 T6pO++OEfDcVUorOvziBsXRn9ks3qxLyz5yCiRqCdwCCD265bGGB4tKhb4n6EUciNw
 Tx2L9yE4z7ZYKo73ICdTCKMrJFEd5Me+HvUf+bgO9m3o5EBR1os8F0bDO9s9/qog8N
 AJ2C6Qu+NeqHA==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, peter.ujfalusi@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 andriy.shevchenko@linux.intel.com, sound-open-firmware@alsa-project.org
In-Reply-To: <20220705161102.76250-1-andriy.shevchenko@linux.intel.com>
References: <20220705161102.76250-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/2] ASoC: SOF: Intel: bdw: remove duplicating driver
 data retrieval
Message-Id: <165710568133.237380.11160938064727349127.b4-ty@kernel.org>
Date: Wed, 06 Jul 2022 12:08:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

On Tue, 5 Jul 2022 19:11:01 +0300, Andy Shevchenko wrote:
> device_get_match_data() in ACPI case calls similar to acpi_match_device().
> Hence there is no need to duplicate the call. Just assign what is in
> the id->driver_data.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: Intel: bdw: remove duplicating driver data retrieval
      commit: 0d356c186ffd6d4c3e10abb283379d09a93d2515
[2/2] ASoC: SOF: Intel: byt: remove duplicating driver data retrieval
      commit: 65b6851d243ff54cbd4adfb887a8af9d04b7f286

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
