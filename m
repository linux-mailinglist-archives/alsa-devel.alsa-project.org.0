Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AED239AA57
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Jun 2021 20:44:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FA10172A;
	Thu,  3 Jun 2021 20:43:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FA10172A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622745884;
	bh=aKL4P90UklmZRmziqJ/4jcRmInWRC0xeazGe6Lr2jnI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LdcFYmFwqLiBLQJTYdse+j5SJ9fawgeBQ7Ear4ttoLPyNrVXIN7RzB6apu3K02HJH
	 dXj/j/lPReiotM9QmhVdkKSP/Dk4nlHrf0Lc+mRzS8sTuQRT8OikQvK/fbynpVbS1K
	 FpEYoxT5N3gDkjE38J+5vZ926TpifF3gKWIcleLs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A182F802E7;
	Thu,  3 Jun 2021 20:43:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 404D0F804AF; Thu,  3 Jun 2021 20:43:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA396F80100
 for <alsa-devel@alsa-project.org>; Thu,  3 Jun 2021 20:42:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA396F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gCFuQkJ8"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 80F45613F8;
 Thu,  3 Jun 2021 18:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622745776;
 bh=aKL4P90UklmZRmziqJ/4jcRmInWRC0xeazGe6Lr2jnI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gCFuQkJ81vzUEtnrRDrzXadZrf0q7YjMasCaVD30QD5waYSlkzz7Gp9XqlCf4WW1p
 53ZYMO5SzDVoqBQy0Pvvi2xBWpSyvfXp75MCEy4MNPCKGdd1qKfTnAwm6m/2PksaA2
 /9OCyjB1D/sHKE/BIPQkFGClsam8tVih6netE2WQ+qNl5QTq8MrYRvOaUsQSuFx1dL
 zOIwKWFDYim+LkEZhWgIgQ4R4vBPbm+Xl69Uu5SA2kdlRKhtboVFS9/aG0qoq4entZ
 lkJ1NhUMy01y5grIdP+xi7O/phdyev9u2lnOmPLaoou1jduKopebM/uQCj/bbbMnn2
 hK8n4N5fTDM9A==
From: Mark Brown <broonie@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2] ASoC: dt-bindings: Convert imx-audmux binding to json
 schema
Date: Thu,  3 Jun 2021 19:41:59 +0100
Message-Id: <162274557552.14795.1322019660591642626.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210531064752.8809-1-o.rempel@pengutronix.de>
References: <20210531064752.8809-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
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

On Mon, 31 May 2021 08:47:52 +0200, Oleksij Rempel wrote:
> Convert the imx-audmux binding to DT schema format using json-schema

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: Convert imx-audmux binding to json schema
      commit: 14aa731dbf464f7272bcc2f0c4f32f6de28cbe8c

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
