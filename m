Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 294F56678C0
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 16:13:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FA9A9159;
	Thu, 12 Jan 2023 16:12:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FA9A9159
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673536399;
	bh=mmzqSII9T6D59c5Rwcmo14SU+6iZlSmcHeRTkXTcRWM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SiNZPPg/TiCiFSmbaRpVy3jNt8rgp1sCUImR6cwnQsmlr8qaArafzZOT/oD9A2uoT
	 Nl9zson6N1krHx4Eu3DkLRAusVY6bRze49ELyIx+Egk99VRfpk/xPrh4b4XBucPckE
	 yCGhha1p79VjlBS6ofRnSXl7WHDBvErhV/IApbR0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24FE5F8053D;
	Thu, 12 Jan 2023 16:12:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD50AF804DD; Thu, 12 Jan 2023 16:12:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F05DCF8016E
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 16:12:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F05DCF8016E
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=blWMyYT7
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 61B3762053;
 Thu, 12 Jan 2023 15:12:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D281DC433EF;
 Thu, 12 Jan 2023 15:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673536333;
 bh=mmzqSII9T6D59c5Rwcmo14SU+6iZlSmcHeRTkXTcRWM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=blWMyYT7NqCfzvbtYA6V4krkw93hhaNVMC9tnemHst0C+qnUKn+r4VpAE7JwwNi7w
 ioRl0DtWoG37Vye44GVSUAYduAYTy4vDt3TUjae0EN0mXyaPKgImGCcTwmUzCQcuM6
 F7nVYeofr09KYtwkCsOqA66M95w/MI9nMPpbsWaYD38dt/LexMqwtFNHOqxZMhYUrV
 R+myls/ZNOut3ws5TU/IoXvCTLPpBBcGhYmzl2qI5op5/fa1zMEKhT64a19u7CqmNs
 X8OWjCIFM0hM9KyHtkO29/TbLNXXchXxBt8YBzfMP6mlPXn9W5xKTm86P2ymupl9xz
 Mg3AcH04GxuNQ==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jai Luthra <j-luthra@ti.com>
In-Reply-To: <20221230132644.6398-1-j-luthra@ti.com>
References: <20221230132644.6398-1-j-luthra@ti.com>
Subject: Re: [PATCH v2] dt-bindings: sound: tlv320aic3x: Add optional clock
 and port properties
Message-Id: <167353633135.2136827.959588025464826190.b4-ty@kernel.org>
Date: Thu, 12 Jan 2023 15:12:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-8b3d1
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

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

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
