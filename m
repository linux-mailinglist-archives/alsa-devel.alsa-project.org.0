Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E7298C4DC
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 19:54:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB8EAB65;
	Tue,  1 Oct 2024 19:54:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB8EAB65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727805262;
	bh=bbZoAyvXIxNMuJ9OQ/XRQbNu6LdQ7bQgd2zv46meGJE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W4SqI7p8GgpWlT2BdMwPhMwHA4ae31uGe11K3qQh6YbAN1QZi4MrUqWMwJjkoPbtJ
	 ZF/IPGPyCBR9nAfI3v1OaUobBA10CI4hR+6WfiUoeCMq/z3AC9NnYCVp9jiMuX9AuB
	 gyR+56l4elcaDjkSLoEZuJHo/G9AwHZWjMRT4Dpg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1334AF805E8; Tue,  1 Oct 2024 19:53:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F41DF805FE;
	Tue,  1 Oct 2024 19:53:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C8C4F80517; Tue,  1 Oct 2024 19:53:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F2802F80107
	for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2024 19:53:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2802F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=r57J77hX
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A6FBC5C2783;
	Tue,  1 Oct 2024 17:53:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BF54C4CEC6;
	Tue,  1 Oct 2024 17:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727805193;
	bh=bbZoAyvXIxNMuJ9OQ/XRQbNu6LdQ7bQgd2zv46meGJE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=r57J77hXdFirG1aq5RkV/Gl/E1coUgID2M5wS5A77z9/kuSnXS4o2APuq/b7LtZXb
	 AGPkuctWSYbgwlHT+cTAN7VQ8PUE2eZzOgc+8TkoLjoZHsAaxGYesRpWzjhb/jO9Mb
	 QTndUJyGoMWGZDIZ2yy1I+rsr1UYeNUuHtRTAxAzFYWkkTatOw8vnXXkgMtHOL1hUm
	 g3D49g/Nzt6zYgOnkL8U6qauw074YlzkEBX/APOt4Uq2ZLWtNc6/jEsWoM1SvUQQTz
	 UuxRgGduhV4jMVELIhg4fKRAKOtti4SxoMAD3qG/v1qL3arn0AzqYlmxyyLgAV8vzi
	 hpZaXnj4hnCNA==
From: Mark Brown <broonie@kernel.org>
To: claudiu.beznea@tuxon.dev, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 Andrei Simion <andrei.simion@microchip.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240916131910.22680-1-andrei.simion@microchip.com>
References: <20240916131910.22680-1-andrei.simion@microchip.com>
Subject: Re: [PATCH v2 0/2] Updates for Atmel SSC DAI
Message-Id: <172780519017.2298697.15357043212367234961.b4-ty@kernel.org>
Date: Tue, 01 Oct 2024 18:53:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: 4I6E7JAS62SGZHKON5ERNLGMKSO4WN3H
X-Message-ID-Hash: 4I6E7JAS62SGZHKON5ERNLGMKSO4WN3H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4I6E7JAS62SGZHKON5ERNLGMKSO4WN3H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 16 Sep 2024 16:19:08 +0300, Andrei Simion wrote:
> This patch set includes two updates for the Atmel SSC DAI driver:
> - Address the limitation with the S24_LE format.
> - Add stream names for DPCM and future use-cases.
> 
> Codrin Ciubotariu (2):
>   ASoC: atmel: atmel_ssc_dai: Add stream names
>   ASoC: atmel: atmel_ssc_dai: Drop S24_LE support due to single channel
>     limitation
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: atmel: atmel_ssc_dai: Add stream names
      commit: 879c9151572317e8ddb6ab6c57a7689bf580efc9
[2/2] ASoC: atmel: atmel_ssc_dai: Drop S24_LE support due to single channel limitation
      commit: ac8775d7de5a8ccac225a398cbce9fb9fffdbb9f

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

