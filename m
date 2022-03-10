Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EF84D47DF
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 14:15:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88D581901;
	Thu, 10 Mar 2022 14:14:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88D581901
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646918137;
	bh=t2XbWwQwvFMkiF2+x62xGVRkeCafGaXLEBPkGZlDV0E=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eDK8GhJVes3YFOSgWmk3otgcDj0+dOjmSwinuemq4Wlpwm58Ho0sq0RMI5RIvaTwF
	 PKiUDZtE1bep9xu+IQEmNvDZrNrwP3PmcNoOpvPIq4n8MuH3VNXVpOqw/SNe+o2OSb
	 xAtsevhKmtA9CW9262bhDYWQW6fl0MqvrsWCPlTk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAF6BF8051B;
	Thu, 10 Mar 2022 14:14:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE9CFF8051B; Thu, 10 Mar 2022 14:14:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 192FCF8012C
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 14:13:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 192FCF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Kd3PDT/W"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D8AAD61A34;
 Thu, 10 Mar 2022 13:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D35C340E8;
 Thu, 10 Mar 2022 13:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646918035;
 bh=t2XbWwQwvFMkiF2+x62xGVRkeCafGaXLEBPkGZlDV0E=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Kd3PDT/WHiC0r1y03Q9M9UNClYYdwsirULQWFXWuwXuGjnNLph6HgKPPd/A8QeImb
 EinmR0G3aeTUv1e9T3mu4l9gFOM8zVDD/eF+2pbBvdOuewP8bI4espTABMiHg6CGzF
 FPBMA6BuWGslBd0AOh1pO1+Fn+IupyZRzK/Cm4wsUZ3WtZi97iN+Cb8B6xmEczAxDc
 isEuU5Vqg1F60Jud761jRazT83SfiDMiyQ7MKCk5MUUX71un25KK7XpFETsY9m/3bA
 t/OcZ5PgchwWdbxi+JDpaOHXPiDtMgDXxukd0wCWnXDzWY34OWm+P0PQYz0esItPiV
 3OKywL0t0lepQ==
From: Mark Brown <broonie@kernel.org>
To: s.hauer@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 shawnguo@kernel.org, linux-imx@nxp.com, tiwai@suse.com, xobs@kosagi.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 Wang Wensheng <wangwensheng4@huawei.com>, nicoleotsuka@gmail.com,
 shengjiu.wang@gmail.com, festevam@gmail.com, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, perex@perex.cz, kernel@pengutronix.de,
 Xiubo.Lee@gmail.com
In-Reply-To: <20220310091902.129299-1-wangwensheng4@huawei.com>
References: <20220310091902.129299-1-wangwensheng4@huawei.com>
Subject: Re: [PATCH -next] ASoC: imx-es8328: Fix error return code in
 imx_es8328_probe()
Message-Id: <164691803138.2018412.9652252221395822627.b4-ty@kernel.org>
Date: Thu, 10 Mar 2022 13:13:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: xuqiang36@huawei.com
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

On Thu, 10 Mar 2022 09:19:02 +0000, Wang Wensheng wrote:
> Fix to return a negative error code from the error handling case instead
> of 0, as done elsewhere in this function.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-es8328: Fix error return code in imx_es8328_probe()
      commit: 3b891513f95cba3944e72c1139ea706d04f3781b

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
