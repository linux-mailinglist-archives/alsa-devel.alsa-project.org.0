Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC59D41DCEA
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Sep 2021 17:02:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 527B316DF;
	Thu, 30 Sep 2021 17:01:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 527B316DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633014129;
	bh=Myi37bbes7ETlK+tTGsWiTVP6FIl//3fgtuWHuTBhDw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rFLNsUVm0vTw7lrtTiA7AawI6bfq7/ig3s757hVoT15BLz39SNMgVXYC9yAleJCRb
	 fZ0l44PAHj9goyO1jJSZYt+z2c+b4QRTcfOkKRlv/t/HK7ecEJerwBY3FG8FqE8I12
	 ZLv/T3O1eR43uJckceXanBwTCZ/TadRuXZcO+jaY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1E0DF804DA;
	Thu, 30 Sep 2021 17:00:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1462F804D2; Thu, 30 Sep 2021 17:00:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C16DF80113
 for <alsa-devel@alsa-project.org>; Thu, 30 Sep 2021 17:00:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C16DF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OFFtJpMc"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0067F619E2;
 Thu, 30 Sep 2021 14:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633014000;
 bh=Myi37bbes7ETlK+tTGsWiTVP6FIl//3fgtuWHuTBhDw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OFFtJpMcjNsnftt04Ivbz2T2tRgic6D9Un4vw/o86TzAuw9aJ/aVTnxLUIiw6q8S1
 5N1Wli7R4d/+eV/aLakuxtvB58TpqKU5Ksx7n0Oe+fzVohhFpe9gQLq0wHbjcixAMy
 S64RJCx92qqJyp8NDpP7rivlmJXDq/lVgkeFUoUs/+W30FXMngGBLg8U0nE6sAELcK
 RSeIEBODMRHyFDhb/X5LHRZyWM/seesrrLlaA9/PAT6ozZUZ4nuLbUAjIhxBNn5xCN
 q5zBnzFViNN+x2qr7L+ibzDa6BiJIybpr5EqAzNeEFB9uNFugRxEJ6G2QQeAA8GExu
 lY+F4mWsgq/wg==
From: Mark Brown <broonie@kernel.org>
To: Xiubo.Lee@gmail.com, tiwai@suse.com, alsa-devel@alsa-project.org,
 festevam@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>,
 nicoleotsuka@gmail.com, perex@perex.cz, lgirdwood@gmail.com
Subject: Re: [PATCH] ASoC: fsl_rpmsg: Add rpmsg audio support for i.MX8ULP
Date: Thu, 30 Sep 2021 15:58:53 +0100
Message-Id: <163301248179.43045.2909499493214533743.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1632972413-22130-1-git-send-email-shengjiu.wang@nxp.com>
References: <1632972413-22130-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org,
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

On Thu, 30 Sep 2021 11:26:53 +0800, Shengjiu Wang wrote:
> On i.MX8ULP the audio interface and codec are controlled
> by Cortex-M domain, Cortex-M core provides audio service
> over rpmsg.
> 
> The rpmsg audio function is almost same as i.MX7ULP
> platform, so share same configuration.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_rpmsg: Add rpmsg audio support for i.MX8ULP
      commit: 2cbf90a6d52d52fc017f3caf36f7b516f689150e

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
