Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15256521631
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 15:02:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5E69857;
	Tue, 10 May 2022 15:01:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5E69857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652187732;
	bh=4aegVx1bOMbLneDfROhebeBKe1d5jbRdV2Z+Zar+nNI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EOLC+UroUnd3IBVfmoTYUsJUWbeE8m4IEOkwNytCtLFwG+Wff2J58ylQKZpgL3A9m
	 kUQXcTnCuD1Dh9b0O/DEqwUhU/mvriQ3M33nN3zpc9noz5ocVYc+Y6Pfo2eYZPF6EH
	 clqM/YNVEfku0ZJ0hORzyBneNJIQtmpwMCIBEX8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96B5DF80153;
	Tue, 10 May 2022 15:00:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E672F8050F; Tue, 10 May 2022 15:00:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D998AF80153
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 15:00:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D998AF80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ryn/8gTl"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C398E61405;
 Tue, 10 May 2022 13:00:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0DF0C385A6;
 Tue, 10 May 2022 13:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652187641;
 bh=4aegVx1bOMbLneDfROhebeBKe1d5jbRdV2Z+Zar+nNI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ryn/8gTlGyzSBiHX7d023CICVL2MkYdLHKt+8cgyidnnTBre2caYVMd63vhG+q7Ud
 /SOTwoXmTsoZg4F2buLSYAnsz1jlrYlPkDMkDhGpB8Qhna418/PtS7aytkpKBRSOAQ
 KOm2VXzevc5NKSYfhgIoerpoCzx26nRY4mEMv+1eB83r6NHD0B+fsI28xBdjoe9huC
 oYZWctMEVmTJrhaGaBz3eweuSbhi0ZRnogujPN4nCeYrSrsfYaaxfo5XBCA+msdDiI
 E3MWMP51H6fcIq4sNBFdI04S16Ac55g+ctjcQ8GKUcvd/9kVpjRg0bc4o4W5LsbBHV
 JOsedRqsWuISA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, zheyuma97@gmail.com, lgirdwood@gmail.com, perex@perex.cz
In-Reply-To: <20220509085925.1548328-1-zheyuma97@gmail.com>
References: <20220509085925.1548328-1-zheyuma97@gmail.com>
Subject: Re: [PATCH] ASoC: tlv320adcx140: Register a callback to disable the
 regulator_disable
Message-Id: <165218763970.65921.14217933077833683707.b4-ty@kernel.org>
Date: Tue, 10 May 2022 14:00:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Mon, 9 May 2022 16:59:25 +0800, Zheyu Ma wrote:
> The driver should register a callback that will deal with the disabling
> when it fails to probe.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tlv320adcx140: Register a callback to disable the regulator_disable
      commit: e1c9f68aa23a8bf98e956e92e61293ef51bd6282

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
