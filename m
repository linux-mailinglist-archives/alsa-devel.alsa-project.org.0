Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3F859EB78
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 20:52:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 507211658;
	Tue, 23 Aug 2022 20:51:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 507211658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661280751;
	bh=vSBPSWktQo339pkIi8McYAVl1PooCqqMXTz8M9y5zjk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pZKS2r2+p2+dbA+kfRx9u/EVw7sLqQuVt194pHunu013PZkkIPNc/ISDlNs+Ny3cN
	 JD+DZihT4mQTCNL3zyLUB11cjLUXEBTKMd/AZP2CCbuPRQqyzbyG6citYPveNr6Lzy
	 yWm7E0ojZ2K0Kp+t5DmLRAVUSRncIjZyXd8p2UoU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50B79F80557;
	Tue, 23 Aug 2022 20:50:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CCCCF80537; Tue, 23 Aug 2022 20:50:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1E1FF8053A
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 20:50:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1E1FF8053A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qiqzwk66"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9857E61704;
 Tue, 23 Aug 2022 18:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DA19C433C1;
 Tue, 23 Aug 2022 18:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661280610;
 bh=vSBPSWktQo339pkIi8McYAVl1PooCqqMXTz8M9y5zjk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=qiqzwk66NjxXTGtTLKaDcjS5LdPJe1yxK/hpogdt9Eyd93miCWMY8YNgxBC3H/Krl
 GhAsyUdg7pjCK00aOasOCGfaJxwOAMvXc81wzhCbCF0yq2S0Vj6eZ/U+xEKoE0gzRd
 xeG2sGykSQa3qTuDQIl1jA0NTwPh7fz5HwX1KYidb8iKg8XA/Jrb03d4AJ15CQcy/n
 gEAVY7YQU6A5by+NQ14UuJqmHA60kREn3azJpSNTNF7+XMXRRqXjukcxVVHPVJCXC7
 ZZALHNvX33piLCjRPnuhcJEPijUeiog/VYiap2Vqt+JUTd+VvtQnKjjynMXyrQOT1F
 YMsKzY2PNrP+w==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com
In-Reply-To: <20220712125734.30512-1-peter.ujfalusi@linux.intel.com>
References: <20220712125734.30512-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: Intel: hda: Correct Firmware State
 Register use
Message-Id: <166128060822.1031684.2773867441979666235.b4-ty@kernel.org>
Date: Tue, 23 Aug 2022 19:50:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, rander.wang@intel.com
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

On Tue, 12 Jul 2022 15:57:31 +0300, Peter Ujfalusi wrote:
> The FSR (Firmware State Register) holds the ROM state information, it does not
> contain error information.
> The FSR itself is a bit more complicated as well as the state depends on the
> module currently in use.
> 
> The error code from ROM or the status code from the firmware is located at the
> next register.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: Intel: hda: Correct the ROM/FW state reporting code
      (no commit info)
[2/3] ASoC: SOF: Intel: hda-loader: Use the FSR state definitions during bootup
      commit: 43a03d247091e1fcd3065dae3407b959e8921c16
[3/3] ASoC: SOF: Intel: hda: Drop no longer used ROM state definitions
      commit: 8613753a681e7a5c63313dea9b04bf103d601368

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
