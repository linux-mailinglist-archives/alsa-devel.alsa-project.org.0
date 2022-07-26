Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6F25813E3
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jul 2022 15:09:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CC431622;
	Tue, 26 Jul 2022 15:08:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CC431622
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658840979;
	bh=dSmDXJUqNOMAFilZ+Yo373MXwK4W8pbN9LFwqUL7CpY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=esPgsneR5TvP7whUPZ61xBt227ta+yHi7AfIEvk8V8e9+Evu0DxVnswb/VkjDIgue
	 xm88ZLxkUGEshaUr59VvK66vGo3Tye0ZfHsE1kex1asvZUVqVr1UiRVvQRiapWV4tw
	 2R1vY3Wp42yHZAxABjVcDbOVvFLxzi6d2kpHZwMc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3C9EF80544;
	Tue, 26 Jul 2022 15:08:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71C3FF8025A; Tue, 26 Jul 2022 15:07:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD1C2F80238
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 15:07:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD1C2F80238
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="V+y6d0yY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7E71D6155C;
 Tue, 26 Jul 2022 13:07:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E9DC341C0;
 Tue, 26 Jul 2022 13:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658840867;
 bh=dSmDXJUqNOMAFilZ+Yo373MXwK4W8pbN9LFwqUL7CpY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=V+y6d0yY1brKzbMHRAgS/myYzJM3MMpRVCLp5QM0nAH5G2UQDH2gi35JOqJ1NIBRt
 VHKcpK+snUJvj75Mc6mRedfatsrfR1QunsVSp4Qo4MsiDYMUwYM3HUnMaHBhX1gDYP
 R4xaDLawkgL/bg3C6D/JLPAzHYT2Pmb6Vqq/RmgBRovpRmL+TOqh3Ayq7Re3I7BvHZ
 2MMIgsgG5NxoyGDFkEFGNV90iRtf4jN468YZaKOeLx8uYY3iqBtpuwLN8hwLnRe/76
 HePniEUJtFYpp8guZ1LHdc4WkCeK08XVtg+r8AkjLH3QZX0U4qn8Jd5PONP5sY4BNa
 sJOeUNWhE/tyg==
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220725180539.1315066-1-nathan@kernel.org>
References: <20220725180539.1315066-1-nathan@kernel.org>
Subject: Re: [PATCH] ASoC: amd: acp: Fix initialization of ext_intr_stat1 in
 i2s_irq_handler()
Message-Id: <165884086589.21705.8710449314865501400.b4-ty@kernel.org>
Date: Tue, 26 Jul 2022 14:07:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-c7731
Cc: alsa-devel@alsa-project.org,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

On Mon, 25 Jul 2022 11:05:39 -0700, Nathan Chancellor wrote:
> Clang warns:
> 
>   ../sound/soc/amd/acp/acp-platform.c:117:19: error: variable 'ext_intr_stat1' is uninitialized when used here [-Werror,-Wuninitialized]
>                           if (stream && (ext_intr_stat1 & stream->irq_bit)) {
>                                          ^~~~~~~~~~~~~~
>   ../sound/soc/amd/acp/acp-platform.c:97:35: note: initialize the variable 'ext_intr_stat1' to silence this warning
>           u32 ext_intr_stat, ext_intr_stat1, i;
>                                            ^
>                                             = 0
>   1 error generated.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: Fix initialization of ext_intr_stat1 in i2s_irq_handler()
      commit: d81677410f172c2b946393c09b46ff9e8dc1b6ec

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
