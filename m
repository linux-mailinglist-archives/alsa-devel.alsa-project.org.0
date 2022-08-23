Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF3459EB71
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 20:51:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C38031686;
	Tue, 23 Aug 2022 20:51:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C38031686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661280715;
	bh=mtEmXoG1/qwtxZCLtpWfBQdyoqhvKwZ1HGbxl8n0VV4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qCpXdj/bWWNGa5HzXZz7ReQUpvdz8P7toRocj+ONtxTMCpCYFTtsUevBCMnyequAx
	 DC8VyBNVG4FregUaD66WIR0riKKmRflAnnilS8kK35goRMaeDTXeBbrzGsJQHM/ViP
	 n/rXSUJh2XFi1OF1cdRKDka8OIt2Pe3Ct/mA2m3I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CC4CF8053B;
	Tue, 23 Aug 2022 20:50:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B8B6F8053D; Tue, 23 Aug 2022 20:50:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDF4EF800A7
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 20:50:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDF4EF800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mP9deo43"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BEC8A61720;
 Tue, 23 Aug 2022 18:50:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E92FFC433C1;
 Tue, 23 Aug 2022 18:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661280605;
 bh=mtEmXoG1/qwtxZCLtpWfBQdyoqhvKwZ1HGbxl8n0VV4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=mP9deo43+f6dw1Q3G2HmJkMvJ9R7mrHyPm8bllirJQoA6bgw/Gri1EXTSDz0QqPhe
 hwsZd6c9WiabbUhdQbMJkNMNXAPhHpEVEnowsmEqTNFoyGo2tQ40CQmB/M5ccLLI8X
 QV28o3A21I/GYSkYmIdTRmvLQJPGaU4DB+zSsvyI0hj51BZE2glDe3h3+rx999f99N
 ajeG7ZPVlZ33SSKG5SQztcpftURZdIkQ5tKtMucloAJiamBQSnhGqdK6jbQXcodpda
 fkrDMx5aMt14gG+b5Qr8r1RmthU1jeLOweT4P6apqPh7PrjajbbCDOAS6kSpXshoU+
 Eb6uQAJToLKVg==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, cgel.zte@gmail.com
In-Reply-To: <20220823075335.209072-1-ye.xingchen@zte.com.cn>
References: <20220823075335.209072-1-ye.xingchen@zte.com.cn>
Subject: Re: [PATCH linux-next] ASoC: atmel_ssc_dai: Remove the unneeded
 result variable
Message-Id: <166128060268.1031684.14434690087050758502.b4-ty@kernel.org>
Date: Tue, 23 Aug 2022 19:50:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
Cc: alexandre.belloni@bootlin.com, alsa-devel@alsa-project.org,
 ye xingchen <ye.xingchen@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>,
 nicolas.ferre@microchip.com, lgirdwood@gmail.com, tiwai@suse.com,
 codrin.ciubotariu@microchip.com, claudiu.beznea@microchip.com,
 linux-arm-kernel@lists.infradead.org
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

On Tue, 23 Aug 2022 07:53:35 +0000, cgel.zte@gmail.com wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Return the value from asoc_ssc_init() directly instead of storing it
> in another redundant variable.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: atmel_ssc_dai: Remove the unneeded result variable
      commit: 62bd431bac942c90d908b1681d04f0c577f6c70f

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
