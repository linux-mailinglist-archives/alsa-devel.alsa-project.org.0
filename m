Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C77B2602A29
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 13:30:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 671949C34;
	Tue, 18 Oct 2022 13:29:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 671949C34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666092613;
	bh=2czOyIDBUB3CqMOzovdj6UL0X06QQPgmsW5la3PM4HY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dbjc80mHZENQPBQIBJz/xunvoPLQI1Om6KMdwlEB6xUf3AbsdfvGuB6Qa0ypWkSuB
	 O4D4uR7NREErEpcyrEWKFWbUadgNCzvIlzmCCdUdX0FQuR6dQ/T0WbEPj9map/ufiX
	 HLD+7xdGyaBQNzhIWUgkjyA2HyovvqY+4FGhgdmY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85A9CF80552;
	Tue, 18 Oct 2022 13:28:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71B39F80549; Tue, 18 Oct 2022 13:28:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E7CDF800E5
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 13:28:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E7CDF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PARvKbJC"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 83BD06152D;
 Tue, 18 Oct 2022 11:28:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E67C433D7;
 Tue, 18 Oct 2022 11:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666092498;
 bh=2czOyIDBUB3CqMOzovdj6UL0X06QQPgmsW5la3PM4HY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=PARvKbJCr2B9vqFO9qnriu1DL9JcO9i02A/Q1PdcxaTJgm3oPxGT2aUFlFoQcpbut
 +tT7jjZCRWAHL81E3rNybcUnqt4j1ATy/p4VU6hfJwOjw/BjdRDtD41lWF7qnJhHVH
 WOQ/XUZB9E2v8PWurOAWr7sxUgMFyZxWBEpM2/2hjUHuIoAxZqjujZUNFoYhHleAa0
 pWaM4D2Y8AWiOqEPg+cF0PNbbA3lVMTb9xN9SstZTdc1vEOj19EldZlSkgLqEawmsL
 kLyUc8UrZSZ+AScO6hJ/aunjFkGPm2V5DQjG11yfmUWFjqaFb/1R4USvWcN0dSbibr
 ZGlOb8vbpAojQ==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com,
 linux-kernel@vger.kernel.org, perex@perex.cz, 
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, viorel.suman@nxp.com,
 p.zabel@pengutronix.de
In-Reply-To: <1665664611-21350-1-git-send-email-shengjiu.wang@nxp.com>
References: <1665664611-21350-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: ak4458: add optional reset control to instead of
 gpio
Message-Id: <166609249692.155136.3225600630322648338.b4-ty@kernel.org>
Date: Tue, 18 Oct 2022 12:28:16 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: shengjiu.wang@gmail.com
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

On Thu, 13 Oct 2022 20:36:51 +0800, Shengjiu Wang wrote:
> From: Viorel Suman <viorel.suman@nxp.com>
> 
> Add optional reset control instead of GPIO to manage codec
> PDN pin.
> 
> As there is reference counter for reset control, so need
> to remove one ak4458_reset in runtime resume to make the
> reference counter balance.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ak4458: add optional reset control to instead of gpio
      commit: 8a0de73cf9dc044d65ad40112fd00025e225bc83

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
