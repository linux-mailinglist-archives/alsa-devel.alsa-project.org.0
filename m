Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 073BC976EF5
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Sep 2024 18:43:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30DE5846;
	Thu, 12 Sep 2024 18:43:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30DE5846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726159411;
	bh=Dy1qB/XUHzJb3yDZ0ZEhR9UA1RtJzn1qcAKojgpMbkA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VH6CoKySyZdyc/2jsI9MM8c9vpGdjJzLCu/3o/r3l3MRmO5rDgosUDM3r+4WKiLBH
	 qf/IwTQ6emFD0kwOzg3uMq/UxB9HIxG/cXAkAKP4oy/smeyVDcwZLHcCnJ3U1o7ksO
	 PxIA/IKFLpV785A8QLoSgTxD/aKCntE6AunByCPs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 008F7F80272; Thu, 12 Sep 2024 18:43:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71482F805AD;
	Thu, 12 Sep 2024 18:43:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D6C1F801F5; Thu, 12 Sep 2024 18:43:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42F8FF80107
	for <alsa-devel@alsa-project.org>; Thu, 12 Sep 2024 18:43:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42F8FF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=foLVDVI9
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9FD6EA41A13;
	Thu, 12 Sep 2024 16:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9D61C4CEC3;
	Thu, 12 Sep 2024 16:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726159379;
	bh=Dy1qB/XUHzJb3yDZ0ZEhR9UA1RtJzn1qcAKojgpMbkA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=foLVDVI9AfPDYA7d331pQScZys3QViy8YFispaPcU94eac/Sgv2vXRAHw1aa91TmF
	 WqmhP/DSK9gYpPMhCwzb24+r3ZEk0YWgFaxwHD+gwLtfcEuBLJwH2tCvzC6pmxGpSg
	 Fzbd4DFAE1jEALXiXBT9009s153vbvLb5qKnTLTKYS84ufgQ704/AGduQm58TD/Buc
	 9hqsFw1kI8SKNNBS8KyZSpldbBrIuauznVrnWSzOcloDRxmheGB7v3YqqbbqNPJ2b7
	 kXs2AFn32HeLqtabc1MkSrtqVxTFd4rtD2mqzHiFOtINLZcq5lXxwasLg+QAhlfnri
	 Po/AkqBgaKd2A==
From: Mark Brown <broonie@kernel.org>
To: claudiu.beznea@tuxon.dev, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 Andrei Simion <andrei.simion@microchip.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240911122909.133399-1-andrei.simion@microchip.com>
References: <20240911122909.133399-1-andrei.simion@microchip.com>
Subject: Re: [PATCH 0/3] Improvements for mchp-pdmc
Message-Id: <172615937761.64859.1968686198308301512.b4-ty@kernel.org>
Date: Thu, 12 Sep 2024 17:42:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: EKHP5FFNKU5UOWNH7GIZGC2VK5KMKAFI
X-Message-ID-Hash: EKHP5FFNKU5UOWNH7GIZGC2VK5KMKAFI
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EKHP5FFNKU5UOWNH7GIZGC2VK5KMKAFI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 11 Sep 2024 15:29:06 +0300, Andrei Simion wrote:
> This patch set is intended to enhance the functionality and maintainability
> of the mchp-pdmc driver:
> - Enhances performance by refining maxburst logic.
> - Introduces a name for better identification and management.
> - Ensures controls remain intact when streams start/finish,
>   returning -EBUSY if the controller is busy.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: atmel: mchp-pdmc: Improve maxburst calculation for better performance
      commit: 8f0280c84607afe122788e508a171ba163d71be6
[2/3] ASoC: atmel: mchp-pdmc: Add snd_soc_dai_driver name
      commit: e6b95bdc1e333e14e4fdf71fd4e8962429d9b6cd
[3/3] ASoC: atmel: mchp-pdmc: Retain Non-Runtime Controls
      (no commit info)

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

