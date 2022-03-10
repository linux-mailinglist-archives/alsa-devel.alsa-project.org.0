Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D624D45D5
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 12:37:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8331C18DD;
	Thu, 10 Mar 2022 12:36:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8331C18DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646912269;
	bh=TWvMPTJzJ27GVP5gpFDJ0b1Mu0lLmlwPszikGKU7gBE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GeuTOH7aYQIhb6+sZSpty4UqVNHw4a5Z+K5umQUFCPLuIWhNaI0HCDsaXNkcr06r7
	 Pyv/BGaTe7afg14ussbLwaqMYImRWBK+8OXBDc4dPHaLlc1Wbei7/M27NN/cUNjZVO
	 CK296VWOcCFM5fIlBt/PfBpQ9urm6NEgzKl1H9BE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C43D7F8052E;
	Thu, 10 Mar 2022 12:35:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35294F80524; Thu, 10 Mar 2022 12:35:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3FB0F8051A
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 12:35:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3FB0F8051A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SjxVeEe3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A3D1C61585;
 Thu, 10 Mar 2022 11:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0DF3C340E8;
 Thu, 10 Mar 2022 11:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646912120;
 bh=TWvMPTJzJ27GVP5gpFDJ0b1Mu0lLmlwPszikGKU7gBE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=SjxVeEe3tindzUNM1tmZ9KNYMK0v6ASZA/EP3CEWuJevKVaibwyTz/JylOfKN49Ch
 vajwUmReDfpo9oUzy9cmeuD+ZjDuZxo7PIms1b7lgKWNYjMVIZmjqmnE7VUoTpHJH4
 bV1dVMg0luDW1Z0EetyLJUBmzsmxbeZROjO60vCEY7MOedZWPk2SfmdYMR4AVVkty6
 2h3faUwC0+5+bX2jWGgq8KqNwANm25FAu6kpFp88VEzrCPXvaJZfx+onlYqDkdC2WB
 b0bogAhhXetSurArqeFqRRSR3pm/ygoB8LYRyke36XtQFUX5h/brgWkwt50zcSMfi/
 ezbFSUgwrivRw==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, perex@perex.cz,
 tiwai@suse.com, nicoleotsuka@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>,
 alsa-devel@alsa-project.org, festevam@gmail.com, lgirdwood@gmail.com
In-Reply-To: <1646822293-26965-1-git-send-email-shengjiu.wang@nxp.com>
References: <1646822293-26965-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_rpmsg: Remove SET_SYSTEM_SLEEP_PM_OPS callback
Message-Id: <164691211764.13798.1783261167562942909.b4-ty@kernel.org>
Date: Thu, 10 Mar 2022 11:35:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

On Wed, 9 Mar 2022 18:38:13 +0800, Shengjiu Wang wrote:
> For sound need to be continuously output at suspend with rpmsg
> sound card, so need to keep the clock always on at suspend,
> then suspend & resume callback is not needed.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_rpmsg: Remove SET_SYSTEM_SLEEP_PM_OPS callback
      commit: 8b1d3b733f3e6acaab6c6bc9968ee0e058900a7e

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
