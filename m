Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D4E5124FF
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 00:05:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 465CE9F6;
	Thu, 28 Apr 2022 00:04:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 465CE9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651097118;
	bh=0qUH1yz/MZ2iG2Pren6XMnLpsO2x2mXD9T1OMWEWdtE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KO664s81sgJbC2tmBmDaoNO/FKHVoZVshSMXgNQN1jLwyy4KF3cnRg24D4bZrxqeN
	 FirLsk9lrONh/TUYYNceDiOFz492fqxxAs/PsC52ROuiN4W7WLBpNgXgxXxEvQ2CnW
	 0RZDgok01tdeqhNo6VcNTN7w9R1ehO8Ps29x+PBo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22D42F80529;
	Thu, 28 Apr 2022 00:02:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7ECBBF8050F; Thu, 28 Apr 2022 00:02:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFFEDF800AE
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 00:02:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFFEDF800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="InrIzcFd"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 39CF961E0B;
 Wed, 27 Apr 2022 22:02:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 168E5C385A9;
 Wed, 27 Apr 2022 22:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651096964;
 bh=0qUH1yz/MZ2iG2Pren6XMnLpsO2x2mXD9T1OMWEWdtE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=InrIzcFdyXeDhCjM8TZUApiy3wyTwU/wGsseUIGoUpiPkgh4WDV1xFg43IAvtw0o9
 e/p6J8NmvMHVh3yzPC5ffLeukLUuyDH1LFEqy8+tfotEGBVkrb8cGXbMJwuHOWh4mf
 ByTXkqX7BezGi6IVTkmn3zVwNbSXNMoshG2bTDiT3EZ4h3XTB2dveTJYMQTRzN/5UA
 AzhTCd9RcS6iO1Wmt0oubawC00Vg6K17eMkjT0Ng3fOcBlLFGvEiZI4XOJSzQcv9LK
 JX6FTy5dEwzNe2S9/IuJC0ME+ovdDfbtuJJyUAW/7LbUZqPNfx2U2SIdC9pOv2g5fY
 21sG+DrslthQw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, amadeuszx.slawinski@linux.intel.com
In-Reply-To: <20220426200539.894010-1-amadeuszx.slawinski@linux.intel.com>
References: <20220426200539.894010-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH v2 1/2] ALSA: hda: intel-nhlt: Move structs out of #define
 block
Message-Id: <165109696281.498174.11920821240282779023.b4-ty@kernel.org>
Date: Wed, 27 Apr 2022 23:02:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 cezary.rojewski@intel.com, tiwai@suse.com, lkp@intel.com
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

On Tue, 26 Apr 2022 22:05:38 +0200, Amadeusz Sławiński wrote:
> As functions prototypes regerdless of CONFIG options as well as some
> code depend on structures defined in sound/intel-nhlt.h header, move
> them out of #define block. This allows to compile code depending on
> mentioned header with "depends on ACPI || COMPILE_TEST" in Kconfig.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ALSA: hda: intel-nhlt: Move structs out of #define block
      commit: 2d3694fdeef599ef5a1352b699bdd493a51ab8cb
[2/2] ASoC: Intel: avs: Drop direct ACPI dependency
      commit: 79fc62d6b2c278bffafc24a22fa4638edcae1aa9

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
