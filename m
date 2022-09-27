Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B52585EC10B
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 13:21:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5571982C;
	Tue, 27 Sep 2022 13:20:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5571982C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664277702;
	bh=46E4hEqTXKtt3oYNYZmUQp96STvltVuR/8PwPOxvs5M=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=abDUGRMdOHUlS2n0AaKMhesXpTxVAcx7TCo/OSNtVQtLWcisXgzosiyn685SImHyb
	 iME0gEzWIdLCe1d30RtRUJP7jIfh1Mwj/kYorVzR2bDdJt+iQLOsFnnTSC7xFc3jUv
	 O4Fj0pQVO7iH5GH6FNAcMbYyE0A5IDk0cPM++EX0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37860F8053A;
	Tue, 27 Sep 2022 13:20:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE2C1F80508; Tue, 27 Sep 2022 13:20:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86990F80508
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 13:20:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86990F80508
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="F/BZt7oX"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 509AA61834;
 Tue, 27 Sep 2022 11:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA1BC43470;
 Tue, 27 Sep 2022 11:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664277613;
 bh=46E4hEqTXKtt3oYNYZmUQp96STvltVuR/8PwPOxvs5M=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=F/BZt7oXeXYKGeuTfx4diaRQDTewf7FAdiLUQZZX/uKSP6z+ukj2P4rBJHo+w2dPg
 LaJ8U8n7bLXfCCL34Gx7JJF6lRC6oxB/no+5QU7FrWZgoNISSUY+cOySe2elXG8EB7
 AnBl5J4jSS3U1nsYDrVS3A8+CfwWhXFSQYji8obIjBxpZiRcBOroWS0QjeiukA/mKJ
 EKaokeougXAVuQZrHVTnM7jwGqhnA2gpY+GHMsNmW12/fDFTgBIs35eSlL1v1dAZUW
 /zQ8cD4AcPlpWkkqitb6mbypZmydtQKrOrVjy7R6iuNuseFPG9kuhTz8h1Z7DIkNwG
 I3XVesSYafT/w==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@quicinc.com>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20220923203140.514730-1-krzysztof.kozlowski@linaro.org>
References: <20220923203140.514730-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RESEND] ASoC: MAINTAINERS: add bindings and APR to
 Qualcomm Audio entry
Message-Id: <166427760891.294040.2558313442791079333.b4-ty@kernel.org>
Date: Tue, 27 Sep 2022 12:20:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: Bjorn Andersson <andersson@kernel.org>
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

On Fri, 23 Sep 2022 22:31:40 +0200, Krzysztof Kozlowski wrote:
> Extend the Qualcomm Audio maintainer entry to include sound related
> bindings and the Qualcomm APR/GPR (Asynchronous/Generic Packet Router)
> IPC driver, which is tightly related to the Audio DSP.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: MAINTAINERS: add bindings and APR to Qualcomm Audio entry
      commit: 2b381b4a91e94bd1d328de6e66cf97dec13bb40c

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
