Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0E279B58C
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 02:03:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 112E7DF9;
	Tue, 12 Sep 2023 02:02:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 112E7DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694477028;
	bh=1thFA0r6QTXaMMAvmq81qtjuV83w94AXlpxBRNKZhRg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bii7HauZJztclDYlbYE9qFceAPctjAUc2+hYk5+sKnyO7rmrpi2KHj4UkI9nMN306
	 mlVMXE3aou9eBPYSQKah64UrT2iaaQp1MYVwvGFC1ijKGOfZrgsKu+DorI2PQHpRAh
	 el65Uf60LVvlIWuwRmnx2oY/x34aNj78dPq4iUdY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EA0EF80558; Tue, 12 Sep 2023 01:57:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B5A8DF80551;
	Tue, 12 Sep 2023 01:57:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3F2EF8055B; Tue, 12 Sep 2023 01:57:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D097DF80425
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:57:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D097DF80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oMnK1bOO
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 04683B80DAE;
	Mon, 11 Sep 2023 23:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 894F1C433BD;
	Mon, 11 Sep 2023 23:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694476629;
	bh=1thFA0r6QTXaMMAvmq81qtjuV83w94AXlpxBRNKZhRg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oMnK1bOOaNj/ZlVSiaPag3gDM+dMhWPhyFJ3bLpueNd177LZxpcuKcd3t+Konaz03
	 CjqH1fsLDcS7KQY8EICXGiJTA+xHr/IQP2qdc7yxS2QktlSfAKBdZZiLh0wQCJrNca
	 sztsB9hMt3cKLSNr1bHETEO8hZBxJev4BjiKf/qZw+sEGzKrLhPU1nVG1V3JnoN5M5
	 IMj2qi+guOloCkSp9Mb+FPGLQGW3syQRgD1P+8fKjdbRc49rlwUUFbEw1qdnREBZDB
	 XpVU9T8yPhhDyfoaSjWK7V0s+WaINtYrC46O4d4u9Gm4uOmN3ntbWVo5/pum3TKPW1
	 ngwlTE+/ivReg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Walker Chen <walker.chen@starfivetech.com>,
 Xingyu Wu <xingyu.wu@starfivetech.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Hal Feng <hal.feng@starfivetech.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230814080618.10036-1-hal.feng@starfivetech.com>
References: <20230814080618.10036-1-hal.feng@starfivetech.com>
Subject: Re: (subset) [PATCH v3 0/3] Add PWM-DAC audio support for StarFive
 JH7110 RISC-V SoC
Message-Id: <169447662623.2387538.17830103471127363678.b4-ty@kernel.org>
Date: Tue, 12 Sep 2023 00:57:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: JDDBPV5LDBSQDNDLOZDCW7XT2IGOCCDP
X-Message-ID-Hash: JDDBPV5LDBSQDNDLOZDCW7XT2IGOCCDP
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JDDBPV5LDBSQDNDLOZDCW7XT2IGOCCDP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 14 Aug 2023 16:06:15 +0800, Hal Feng wrote:
> This patchset adds PWM-DAC audio support for the StarFive JH7110 SoC.
> The PWM-DAC module does not require a hardware codec, but a dummy codec is
> needed for the driver. The dummy spdif codec driver, which is already
> upstream, is compatible with the one which JH7110 PWM-DAC needed. So we
> use it as the dummy codec driver for the JH7110 PWM-DAC module.
> 
> The third patch depends on tag next-20230809 in linux-next branch.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: Add StarFive JH7110 PWM-DAC controller
      commit: 748c482d032ef8a607cbf696c6d31afd25293bcb
[2/3] ASoC: starfive: Add JH7110 PWM-DAC driver
      commit: d1802d59ab533f5d5fdfa3483c11ca77c5b21fdd

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

