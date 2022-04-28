Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7195C513A4C
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 18:48:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06CF3163A;
	Thu, 28 Apr 2022 18:47:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06CF3163A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651164504;
	bh=+RKLk9K6/GT4CyUUwj9j7R0islPDkWCMgjT+jFXMSDQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UmqSTBGF20xiR3LttUkXcFZ54gFZd3/HeXygweno6o1OP8E6/KC+2lzc5oJHGa50F
	 xWy4gr9X0IZKx9yx2c5Dmc4O7VqzE0WMx4qJlLENJHj3Y4tBqZRYArhzRxU4QCxUw/
	 tqJ9U6X0tEhmCbgugWZEtBuL15/zCWbRSvw0elUM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DF2EF804FE;
	Thu, 28 Apr 2022 18:47:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76492F80506; Thu, 28 Apr 2022 18:47:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D520FF804FD
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 18:47:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D520FF804FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="P7mbsYTw"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 27B9F620D8;
 Thu, 28 Apr 2022 16:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0496CC385AA;
 Thu, 28 Apr 2022 16:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651164421;
 bh=+RKLk9K6/GT4CyUUwj9j7R0islPDkWCMgjT+jFXMSDQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=P7mbsYTwr8FAZSziLNTBYcHxEL0bwO1N5uSk0kLF0pB7j//Nmqo61SzGkoXAOpv7P
 Qh2pKMSZsG/UkD2/AHBby+wT2L/6sosdsGaSFrNKWhHDtX2h+1ktHYky6Kkz1FPHzW
 PNkC1ik45wdhBq5BuwUf0wOwaaHZOw6YeW0vC7LiZc+WYqJwg2B3vsqvmCEu+hIoo4
 AzoHCn8aZ94fzIy7YwaG41y02Id0iq8smbd23r57+HmqkP2iAg92xACXm/J+YQnobu
 bDx7X8du13fAzjn4f/KxmItkVb/i+pjaY8XURDboQLCNPNrsok6IJaLSF0C7MdgMIm
 z+atlvl9BKwVQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, nick83ola@gmail.com, lgirdwood@gmail.com, perex@perex.cz
In-Reply-To: <20220427212916.40145-1-nick83ola@gmail.com>
References: <20220427212916.40145-1-nick83ola@gmail.com>
Subject: Re: [PATCH] ASoC: wm8960: Add ACPI support
Message-Id: <165116441974.4067540.12774509625457137042.b4-ty@kernel.org>
Date: Thu, 28 Apr 2022 17:46:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com
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

On Wed, 27 Apr 2022 22:29:16 +0100, Nicola Lunghi wrote:
> HID made of either Wolfson/CirrusLogic PCI ID + 8960 identifier
> 
> This helps enumerate the Waveshare WM8960 WM8960 Hi-Fi Sound
> Card HAT on the Up2 platform.
> 
> The scripts at https://github.com/thesofproject/acpi-scripts
> can be used to add the ACPI initrd overlay.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm8960: Add ACPI support
      commit: 7e0bdbae446ff8a752484f6bcbcd7157e7484158

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
