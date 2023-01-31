Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10871682F5F
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 15:35:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91CBA82A;
	Tue, 31 Jan 2023 15:34:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91CBA82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675175703;
	bh=64JB2TqJHzbLRcbZWFRXHWsvB96LNMCT5mLL4Q289KM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=fsXHb7dLum0PaxKvWQ3ACYHMB6Tb/nh8NNZLOgPtzk09Wdr0dic5Z0UkI+RiQfPQe
	 IkseI0eSJ+Gjnr1GDmsWTjigeFL0w0fwUOgu4yhRBwgtZhw3YDK3lgnspDD7dN+01h
	 8Kd4W6KCr5JUPPLUMwep8WwPd3MrzXFe9rDFRU1I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05D76F8055A;
	Tue, 31 Jan 2023 15:33:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 253B8F8055A; Tue, 31 Jan 2023 15:33:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A45FBF804E2
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 15:32:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A45FBF804E2
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HdOdDy41
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2E589B81CE4;
 Tue, 31 Jan 2023 14:32:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35A2DC4339B;
 Tue, 31 Jan 2023 14:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675175552;
 bh=64JB2TqJHzbLRcbZWFRXHWsvB96LNMCT5mLL4Q289KM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=HdOdDy41bNSQS0D13xoGvq2nqSCY58YUlYwSBwkqpU5VesgzTW02x4/oVKsRqZA29
 ZF0KpYVcSzC7zEqj/rIukYg6cKMQW/vvnCE5W6Mefi3hZ+6ldLimiV19BA9BWN3kyu
 IVMJwGwG/kXJ5u0noasMfcfV5KO//nwJL62AsGAOaUFI+iTmQw9K+0t6Zs/empjRqB
 r22fg4OcfhLMZJFb5AZoJAWpF9c8vKzCbRkfbQKPtUTnfGi06axPUwuwnbgF2LK5Z9
 c+CdJg2pzje64YtAQwfAcOQ4eaHdIVNh5Y8kQtLtHhX2Oy8XRRPcawMx90TCP+4drh
 9mzl+Rugp5Wqg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Herve Codina <herve.codina@bootlin.com>
In-Reply-To: <20230126085137.375814-1-herve.codina@bootlin.com>
References: <20230126085137.375814-1-herve.codina@bootlin.com>
Subject: Re: [PATCH v3 0/3] Add the Renesas IDT821034 codec support
Message-Id: <167517554994.691025.8617744298241053162.b4-ty@kernel.org>
Date: Tue, 31 Jan 2023 14:32:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-gpio@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 26 Jan 2023 09:51:34 +0100, Herve Codina wrote:
> The Renesas IDT821034 codec is four channel PCM codec with on-chip
> filters and programmable gain setting.
> It also provides SLIC (Subscriber Line Interface Circuit) signals as
> GPIOs.
> 
> Based on previous iteration,
>   https://lore.kernel.org/linux-kernel/20230120095036.514639-1-herve.codina@bootlin.com/
> this v3 series mainly:
>   - Fixes _put() methods
>   - Introduces and uses idt821034_2x8bit_write()
>   - Removes the '#if IS_ENABLED(CONFIG_GPIOLIB)' conditional
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] dt-bindings: sound: Add Renesas IDT821034 codec
      commit: 545679837eef1819aee3868fbb9dfced9a56de02
[2/3] ASoC: codecs: Add support for the Renesas IDT821034 codec
      commit: e51166990e81754d2cd30593558c3ff47fa49f15
[3/3] MAINTAINERS: add the Renesas IDT821034 codec entry
      commit: e60259f77c46a6b4733b20f1fb44547d67302c67

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

