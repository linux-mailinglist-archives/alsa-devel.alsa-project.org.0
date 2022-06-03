Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C45B853C94D
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 13:30:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6629A17F1;
	Fri,  3 Jun 2022 13:29:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6629A17F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654255811;
	bh=/oL3L0OBazgj3LDtq29j/fp994lk3tQDa86GHQ4cVEE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=anU44lVw9eDKE8RYFIP5yHdtuEyiftndpCyNhuWC4E1OsT6DFy13dW4Kim9z3Er7A
	 h1VlgH0R+YtE3ryPuoGDnLHMrYaM82y6YtZbfjIh/pHxSHnP1UODoiodg2yLt1Q4pY
	 iE9FjaX1/FL4fQiB3fZDKpDvSeL4rBZSewbQGhEY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D46C3F804D1;
	Fri,  3 Jun 2022 13:29:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D5A1F804CC; Fri,  3 Jun 2022 13:29:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23D5FF80089
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 13:29:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23D5FF80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="avUZKNn9"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 702156133B;
 Fri,  3 Jun 2022 11:28:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5E76C34114;
 Fri,  3 Jun 2022 11:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654255738;
 bh=/oL3L0OBazgj3LDtq29j/fp994lk3tQDa86GHQ4cVEE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=avUZKNn9J7evYn5IHsokkhCD6kgE1eOjXVvCeUk68ZRVKR1INvHnTn1jG5Wt7aWFV
 8CvMGNIDXVC1WZx+Y8/YoPwEu/5UL4kMNL41AMmOWlocg1vXqKQk1Fmr6nY7f8sU1y
 CGlwOveRtzFmrAxFGW0YNAOIifN7rJKqWmFJGDixQ19WwRbQm7ucFLMsGnsWZfL2nj
 sBLf7TBcvGqKp4f6ATNqWxJhNXb6l2bmH5rn2lS0WxCsJe/9A+Dl7LxXKwTMR7XwJI
 tULxB6AJnhIGdLShrRK+y1gOvcX34oNiHoZOkzALIQQzmkIcG90XBadAdTwE0wrfJO
 COjMh5fxL7T9A==
From: Mark Brown <broonie@kernel.org>
To: ckeepax@opensource.cirrus.com
In-Reply-To: <20220602162119.3393857-1-ckeepax@opensource.cirrus.com>
References: <20220602162119.3393857-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 0/6] Fixup Cirrus SX control usage
Message-Id: <165425573673.3864268.13153479722172115782.b4-ty@kernel.org>
Date: Fri, 03 Jun 2022 13:28:56 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, david.rhodes@cirrus.com, james.schulman@cirrus.com,
 linux-kernel@vger.kernel.org
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

On Thu, 2 Jun 2022 17:21:13 +0100, Charles Keepax wrote:
> Mostly the usage of the SX controls seems to match the lowest gain
> value + number of gain levels expected. The one notable exception
> there being cs53l30 as David noted. However, there are a couple of
> other places where the minimum value/TLVs are slightly incorrectly
> specified.
> 
> There are two I couldn't quite work out yet, any input on these
> greatly appreciated:
> 
> [...]

Applied to

   broonie/sound.git for-linus

Thanks!

[1/6] ASoC: cs42l52: Fix TLV scales for mixer controls
      commit: 8bf5aabf524eec61013e506f764a0b2652dc5665
[2/6] ASoC: cs35l36: Update digital volume TLV
      commit: 5005a2345825eb8346546d99bfe669f73111b5c5
[3/6] ASoC: cs53l30: Correct number of volume levels on SX controls
      commit: 7fbd6dd68127927e844912a16741016d432a0737
[4/6] ASoC: cs42l52: Correct TLV for Bypass Volume
      commit: 91e90c712fade0b69cdff7cc6512f6099bd18ae5
[5/6] ASoC: cs42l56: Correct typo in minimum level for SX volume controls
      commit: a8928ada9b96944cadd8b65d191e33199fd38782
[6/6] ASoC: cs42l51: Correct minimum value for SX volume control
      commit: fcb3b5a58926d16d9a338841b74af06d4c29be15

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
