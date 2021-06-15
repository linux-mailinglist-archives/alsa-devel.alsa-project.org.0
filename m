Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0845E3A8793
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 19:31:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79547169B;
	Tue, 15 Jun 2021 19:31:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79547169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623778312;
	bh=G9e09QWzx1MRxXb9RBiiGNL1fTJFC8HemQb4EYYQhc4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SE2tg/sompUzpj1yIC5YZDGO6YG0bZBK+709XttR45DtUwpNBjfp7aqnPpC16eSfL
	 gw1AxnIzIShGKK6gX9XNJos7ZF36WHskGYpYg8vfCTZO0RhPUh1Ba6OWH7fZoBO6B+
	 OhkBfRcdhkAHqVCgsRfXd7zucwmFVpb3BY75UHh0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE026F80165;
	Tue, 15 Jun 2021 19:30:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BF8AF804D1; Tue, 15 Jun 2021 19:30:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B9ABF8016D
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 19:30:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B9ABF8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Ya2eZp3J"
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC35F61410;
 Tue, 15 Jun 2021 17:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623778196;
 bh=G9e09QWzx1MRxXb9RBiiGNL1fTJFC8HemQb4EYYQhc4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ya2eZp3JhJS3pUFakebcLkiPKLSAHw0OYQN1lT3E19/RroIOBrCO1dA7H8jQG7mL+
 ABO0CWidRifZ4O12H0tH1DtfThLp05JgeLZui2Nf+iG6caCoTg1hHmQtLKC54PT7wY
 EoqSlJOMAh6Z+Etq8ACjc9jAPzxDU4DL1WaSP7JKpRIAupAPaIMci+W5nbYJbqTcEZ
 Y93i00fSIpIIievJMJ0BGSiNNUyj+F81OlKFp/quohqolPldcEElz9TSA1+uRKzGEY
 SLljnn/V+0GTq0yzd2yccqINFQIDjbAjpC6suZFpanhcWZvI3KDsbTX6OcM88XNvA5
 /8gn7htN3hQ1w==
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@linaro.org,
	Gabriel David <ultracoolguy@disroot.org>
Subject: Re: [PATCH 0/4] ASoC: qdsp6: Add Quinary MI2S ports support
Date: Tue, 15 Jun 2021 18:29:21 +0100
Message-Id: <162377763944.21612.14888112602907087469.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210605022206.13226-1-ultracoolguy@disroot.org>
References: <20210605022206.13226-1-ultracoolguy@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

On Fri, 4 Jun 2021 22:22:02 -0400, Gabriel David wrote:
> Various devices(such as the Motorola Moto G7 Power, codename ocean) use
> the Quinary MI2S ports for reproducing audio. Add support to them in
> kernel.
> 
> Signed-off-by: Gabriel David <ultracoolguy@disroot.org>
> 
> Gabriel David (4):
>   ASoC: q6afe: dt-bindings: Add QUIN_MI2S_RX/TX
>   ASoC: qdsp6: q6afe: Add Quinary MI2S ports
>   ASoC: qdsp6: q6afe-dai: Add Quinary MI2S ports
>   ASoC: qdsp6: q6routing: Add Quinary MI2S ports
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: q6afe: dt-bindings: Add QUIN_MI2S_RX/TX
      commit: 099ab4fcf3752a1bc721138632d28aa6685b1cee
[2/4] ASoC: qdsp6: q6afe: Add Quinary MI2S ports
      commit: d0293e2aa6c1cfc29c7e571721036650b4f656eb
[3/4] ASoC: qdsp6: q6afe-dai: Add Quinary MI2S ports
      commit: 98e80779ff9a03b913e59850d55ac00f3eec9cdd
[4/4] ASoC: qdsp6: q6routing: Add Quinary MI2S ports
      commit: 35f78d0277fc522028e9504454c555d9b0f53bec

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
