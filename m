Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 868F7313DB9
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Feb 2021 19:40:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E5551697;
	Mon,  8 Feb 2021 19:39:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E5551697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612809638;
	bh=SJZ0NVTsr2Wlxcsv1fv1kCF7qQH9E81Nonfp1RQf2jc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kIUtfHCY9Uy3T6QptCyxQJSMxlaEivgN3NaMnMi28wPBSJvGj+ZNPwQKr0jSjVESS
	 NIUiQNZUDRHvWZLRPiZYHH5shr+EH4kyoxpUerN6hx0G49YTw0CGnL5KxFvo9GPBOn
	 XCzzrMHoXOrbRhZigxnFno32nWwCJaEd9oOD7SgY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 622D8F80169;
	Mon,  8 Feb 2021 19:39:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE617F8022B; Mon,  8 Feb 2021 19:39:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E13DCF80114
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 19:38:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E13DCF80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aKgHoLgs"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B47A760C3F;
 Mon,  8 Feb 2021 18:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612809535;
 bh=SJZ0NVTsr2Wlxcsv1fv1kCF7qQH9E81Nonfp1RQf2jc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=aKgHoLgsSGyJMiXx+Ih+Tk1rC/2eMKt2fZf5+Sx31/ElTclR/w2bWqwtCygNbuWfj
 Yj4FV7LzG+aY+XAg//9s83baQAdpuEHLct4DpQyoyrF1NxO8ikj1i3vSemmIz55rcF
 KYDTVM1vcWpw66bXt7A1jTuj2M7bGRjf23/9FC6strvhdxFvbbZ2AbYrlO4owsSy1m
 xxqGkD7bWvBRQ3T/3HIOMseF7m0M7utgOvqpi4qz3ZM+3IBGkb4Arh4EjPyqiWo6xd
 rz90DTRAEU5TZ8/mmYFsmIZX8BA/aZWB5tBZTfyTdoZFmo1fteGJI+ch/wEloUKCcg
 0N8WQPz3D1i8g==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20210123140958.12895-1-paul@crapouillou.net>
References: <20210123140958.12895-1-paul@crapouillou.net>
Subject: Re: [PATCH 1/3] dt-bindings: sound/ingenic: Add compatible strings
 for JZ4760(B) SoC
Message-Id: <161280948305.10741.16478273980568461792.b4-ty@kernel.org>
Date: Mon, 08 Feb 2021 18:38:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, od@zcrc.me,
 Christophe Branchereau <cbranchereau@gmail.com>
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

On Sat, 23 Jan 2021 14:09:56 +0000, Paul Cercueil wrote:
> Add the ingenic,jz4760b-codec and ingenic,jz4760-codec compatible
> strings.
> 
> In the process, convert the previous compatible strings to use an enum
> instead.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] dt-bindings: sound/ingenic: Add compatible strings for JZ4760(B) SoC
      commit: 45a90d4aba1781aa382d4aeedebcac7cc78e1927
[2/3] ASoC: codec/ingenic: Depend on MACH_INGENIC
      commit: bad929b81ce25bba1c3e9d91848ffdc166974256
[3/3] ASoC: codec: Add driver for JZ4760 internal codec
      commit: d9cd22e9c87cb61488d00f7279cfb2abf5238879

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
