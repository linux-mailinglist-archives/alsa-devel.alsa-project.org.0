Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF68E638C29
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 15:29:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 498C5174A;
	Fri, 25 Nov 2022 15:28:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 498C5174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669386546;
	bh=JKtC7qtcSxIuqkmHYKE7URD9FuSd5HE3xVKxSH1HLmI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D3r4ZGZzuDQmMgXYjLUIBtl7bvPGxGqAAesoUk8mKm5X7Y2ty4VTxToLbb/35VIhV
	 UnOyUni4FInxoIftLmqd2htEav5MHiGsYXu3lPndLy+vMFhZlgrBH+XEL0XK6tT8RG
	 xv1E5+8KUCAMB3y9l/8DGDafecQhZ/cwEJUdtv1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0CFEF80568;
	Fri, 25 Nov 2022 15:27:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0778EF80563; Fri, 25 Nov 2022 15:27:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6BBAF800B6
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 15:26:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6BBAF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="boEIeSQ6"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 84EFA62478;
 Fri, 25 Nov 2022 14:26:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1007C433C1;
 Fri, 25 Nov 2022 14:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669386415;
 bh=JKtC7qtcSxIuqkmHYKE7URD9FuSd5HE3xVKxSH1HLmI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=boEIeSQ60G4VOhUzILoGxqAFKjsRD3RAa89jJdeEiMtSsb5jtOkjlljXyeoUjrwaC
 rVJFj3zAkyPfLGc3KD5KThRNL3ilM/lYEXKlKcprXpX5mtBV+/xj+gewBL4JX+ikTf
 s/GcOZ4EF7jjYnPhoGa+ZMYFDSw+4zqYQfVoEKF/id5m5tAFJZjO6iPkZXG6UqtvYr
 xCH3+wrJahNDLiiSG2sE3/JCOgfsnbTQ3a5ygBzBVi/yDtXdP6bLgfgHpyJDp7ViEb
 qlEX/8df2nk/Hb9uCTlD9Qj+XSWBRn2C8dA4OdWa2xxv3Jl84jQ4a2YpIPv+KeZ/1p
 77AwQzFJdGxzQ==
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, angelogioacchino.delregno@collabora.com,
 nfraprado@collabora.com
In-Reply-To: <20221124023050.4470-1-jiaxin.yu@mediatek.com>
References: <20221124023050.4470-1-jiaxin.yu@mediatek.com>
Subject: Re: [PATCH v2] ASoC: mediatek: mt8186: Correct I2S shared clocks
Message-Id: <166938641371.506633.11848933919826451690.b4-ty@kernel.org>
Date: Fri, 25 Nov 2022 14:26:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, chunxu.li@mediatek.com,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, ajye_huang@compal.corp-partner.google.com,
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

On Thu, 24 Nov 2022 10:30:50 +0800, Jiaxin Yu wrote:
> In mt8186 platform, I2S2 should be the main I2S port that provide
> the clock, on the contrary I2S3 should be the second I2S port that
> use this clock.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: Correct I2S shared clocks
      commit: 248579fc9a4f3bf36e7cfe9f6a354cee0f9848dc

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
