Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F074C2B98
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 13:23:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0ECAC18B3;
	Thu, 24 Feb 2022 13:23:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0ECAC18B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645705438;
	bh=NjJEwmunyMuChTLzBx9Ed3jmV9nFpHwi4w4OJohVL+U=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kLswq0dDu4qJpVsfPzy+SaOI8lZe3DPY6Ghtcz0bG+w1VCxeiJM5NCtGB856Ybr4f
	 rASzaHFn6+9/eslRyZrpiXcYLM9Xo2AH11Z8yqIaEsyR3FSBDZFocO/km4/EKQFYs4
	 ksMazt0eEYsmFAEJyDgJKb2DDGtkphEccrIrLo6E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92DCFF80516;
	Thu, 24 Feb 2022 13:22:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDA18F804FD; Thu, 24 Feb 2022 13:22:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 668F7F804CF
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 13:22:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 668F7F804CF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GP3ckcpb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1D701618F2;
 Thu, 24 Feb 2022 12:22:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51BEFC340E9;
 Thu, 24 Feb 2022 12:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645705339;
 bh=NjJEwmunyMuChTLzBx9Ed3jmV9nFpHwi4w4OJohVL+U=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=GP3ckcpbATBtEK4ya4ljypFdC7U2g3UFmapHtsH1T8l8Os8cw9E5hyhTwO5FhNNBz
 GeBTLTF0zHanj6khT1Gt5w3MZrLgEfEXozRI/JLOIPUWccmkmHJV8pMzGwJrJIAgJr
 YgdjtCoxOWblcNemTEQVzsJrlAcRg3f9vXuZZ9SDF514W4k6dL7qajND3FnRdL6/N6
 wzyuD35xzzRh0O5sMdwV0yQOD/AQ87AoJVmpM23Qq8lkvsgjbcqb3QgZ24CzUIVonw
 QErmZcYrX+KSGP+7gGBQaKDwgkfLpljiTxAFBtCGJgDJrCyVvhcoJEoB6n/ncjLe/o
 asnyPK/aTYxiA==
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>
In-Reply-To: <20220223135237.731638-1-hdegoede@redhat.com>
References: <20220223135237.731638-1-hdegoede@redhat.com>
Subject: Re: [PATCH] ASoC: Intel: soc-acpi-byt: Add new WM5102 ACPI HID
Message-Id: <164570533806.1194769.288548639875856850.b4-ty@kernel.org>
Date: Thu, 24 Feb 2022 12:22:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Wed, 23 Feb 2022 14:52:37 +0100, Hans de Goede wrote:
> The Lenovo Yoga Tablet 2 1050F/L tablets use an ACPI HID of "10WM5102"
> for their wm5102 codec, add this to the list of HIDs for the wm5102 codec.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: Intel: soc-acpi-byt: Add new WM5102 ACPI HID
      commit: 7e1d728a94ca78f8759ba14068932075ecdc562d

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
