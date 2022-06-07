Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A698053FC90
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:58:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6FCB1AD7;
	Tue,  7 Jun 2022 12:57:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6FCB1AD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654599507;
	bh=RhcTZ2u3lCTolhaZ4JjXcHWZ41VHKMhWO0IcuEOS2jg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k7E8djQWuunzOttN4rAENkfq+gEin1N/leiCIwcKAqz0vARJjPiPw3bxnyCHeZBfp
	 CBQoUsV7SJMtF4DWEv8ojO8LZqioi8jJd0xk3HJBP8vmSuS37dFXG/Q9j8HZHM3lrX
	 mSmwVrKRRJZTiGogrC4kAl+4Kcb+gRlopKkvvdU8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D168F80566;
	Tue,  7 Jun 2022 12:55:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAC32F8056F; Tue,  7 Jun 2022 12:55:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61EA2F8055A
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:55:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61EA2F8055A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gTfaMfjM"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BABE061563;
 Tue,  7 Jun 2022 10:55:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96358C34114;
 Tue,  7 Jun 2022 10:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654599309;
 bh=RhcTZ2u3lCTolhaZ4JjXcHWZ41VHKMhWO0IcuEOS2jg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=gTfaMfjMEXNLx6cz/l6LPqkCyy6Z4EJytgnAoqzKJ/EdxAQsNZCs6PqXDp5ys7kA+
 6FNeqHRUq+qUdOZsD03Pn4wVaWIHmCMBuKbhj9JmEtJwU1nkcCZ6Gw+Ut3futShXRf
 fFC1VrKpGNgEPebRLJ4qWaPiPRhVi9fE4KpZc385ZAnroARDiId1/0TUmDS65ds+T6
 NZnB3wq4PrbJMntte6F+qbqOYSeABTa6xxUHtM9UQfthlh/MrSAWv24kepUBq7aZpG
 idmLNOl2fi54pNS6L2EE78FidIRZBobjPmGll3yD7XFZOKucCj/STFcO66LCQi05iO
 0Qhr7ASDQYpPA==
From: Mark Brown <broonie@kernel.org>
To: vishwas.a.deshpande@ti.com, mr.swami.reddy@ti.com, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>, lgirdwood@gmail.com, support.opensource@diasemi.com
In-Reply-To: <20220603140513.131142-1-u.kleine-koenig@pengutronix.de>
References: <20220603140513.131142-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 0/4] ASoC: Drop some i2c noop remove callbacks
Message-Id: <165459930733.399031.7142294682184566357.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:55:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, uwe@kleine-koenig.org, kernel@pengutronix.de
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

On Fri, 3 Jun 2022 16:05:09 +0200, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <uwe@kleine-koenig.org>
> 
> Hello,
> 
> I intended to send this after -rc1 was cut, but found a few spare
> minutes to prepare this series. All four patches were sent already
> before based on v5.18, but there were some conflicting changes added in
> the merge window. This series contains the four patches on top of
> current linus/master and so bases on a tree including the conflicting
> changes. Expecting no more sound changes in this merge window, this
> should apply cleanly on top of -rc1.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: ak4642: Drop no-op remove function
      commit: 60391d788a221f1866492a71929483790b772676
[2/4] ASoC: da7219: Drop no-op remove function
      commit: 8a291eebeb633316edad2e80537a3c7df83ee8dc
[3/4] ASoC: lm49453: Drop no-op remove function
      commit: 3cce931a5e4487f7339be559e2ea032478be021a
[4/4] ASoC: da732x: Drop no-op remove function
      commit: fb68cb963bb78380166a98beea593d20b956e4c3

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
