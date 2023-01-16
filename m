Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C55F66BF82
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Jan 2023 14:17:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AF29560F;
	Mon, 16 Jan 2023 14:16:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AF29560F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673875032;
	bh=29QfTPcs9/gEQmgCKCXaRl7jYtU3HRfzrfTR4DlbQv8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=fTlJ66vCI8/HdpSlUhfuS1+BPc9lRaDiMe8izUfef1NihjToVVF9dfkwFp4i940Z2
	 hAX279eCe4c2ASIGDSKWmOdo/AKrCVjGXEOx6e76TjH0dwc0Oln4+MWbcGXB8R3/Xz
	 H+oPNcqD/Hiii69o2xpxNqX6vL3v1o2k9t7+cPxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD5D4F80482;
	Mon, 16 Jan 2023 14:16:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87A2FF8024C; Mon, 16 Jan 2023 14:16:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93CB9F8023A
 for <alsa-devel@alsa-project.org>; Mon, 16 Jan 2023 14:16:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93CB9F8023A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Rwwmd6He
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8185FB80D2F;
 Mon, 16 Jan 2023 13:16:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19F72C433EF;
 Mon, 16 Jan 2023 13:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673874961;
 bh=29QfTPcs9/gEQmgCKCXaRl7jYtU3HRfzrfTR4DlbQv8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Rwwmd6He0NxJjr4f1ILWqhp9FNFKb4tQ4NS8uikEnEMibnZru5eRe99uMM72gNsju
 cGn2Ss2REDrQgwy/ZolLQ8L6nxfmA+c2J8j8SGlO/QJOslphsntYH7XyFGimQFKRiu
 iryooyKcgNgoakq++RWAswZz0ns7CHHtCE9E8Iiz9V17fxVbX31lBClYjlC6yAZkUT
 EPQIjH0zsMA+9TARs5LtI0wnXJ4qbRAtvbXvJw3bqgsb4NhVDZ5u8OqG2fprc5njDg
 Qn/pccU0lxSfZILJey4qi15/zoNIuFVuh9fsrzVhA03TeyN3rkNNeNnbhbR48dhJnI
 66bGbBL9fqxYA==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jai Luthra <j-luthra@ti.com>
In-Reply-To: <20221230132644.6398-1-j-luthra@ti.com>
References: <20221230132644.6398-1-j-luthra@ti.com>
Subject: Re: [PATCH v2] dt-bindings: sound: tlv320aic3x: Add optional clock
 and port properties
Message-Id: <167387495862.317762.14606265116095883268.b4-ty@kernel.org>
Date: Mon, 16 Jan 2023 13:15:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-69c4d
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 30 Dec 2022 18:56:44 +0530, Jai Luthra wrote:
> Describe optional properties for clocks and ports that were missing in
> the original txt binding, to fix warnings like:
> 
> aic33@18: 'assigned-clock-parents', 'assigned-clock-rates',
> 	'assigned-clocks' do not match any of the regexes:
> 	'pinctrl-[0-9]+'
> 	arch/arm/boot/dts/omap2420-n810.dtb
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] dt-bindings: sound: tlv320aic3x: Add optional clock and port properties
      commit: b6e98cf4ed3baff0c2f7a1c1babf96fde8e129f3

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
