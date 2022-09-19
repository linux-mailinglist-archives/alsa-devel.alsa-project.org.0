Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3B55BD7FD
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 01:15:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 561EB165D;
	Tue, 20 Sep 2022 01:14:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 561EB165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663629345;
	bh=hJVCV38OsTD8Qec8wIU6hogxK5tFSOL11311yWaypDc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iSVzIZikS2H1EAR0zXTnhJnNmRHXDBczleKnW5oDUUvG1WPuKlTXno8hMBYf1AI7x
	 XhxXNEyM/PCgMD+KPFMycZJlL0WvHSyIy0tOXGMHHc89Ry0XqY9IFlt4NuFJMp80I3
	 jZ0Cx7dZfjwSFQmlXfqGGBCiuHnqJOxKj4OdeSHM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7ADC8F805D6;
	Tue, 20 Sep 2022 01:10:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC88BF805D6; Tue, 20 Sep 2022 01:10:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, PRX_BODY_26, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45C8DF805C9
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 01:10:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45C8DF805C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BPQaqEOG"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B14CC620F4;
 Mon, 19 Sep 2022 23:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D50C7C433C1;
 Mon, 19 Sep 2022 23:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663629038;
 bh=hJVCV38OsTD8Qec8wIU6hogxK5tFSOL11311yWaypDc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=BPQaqEOG9yS8rppRTCAingKPT1rEggTJ5D56NivgIp7wBLgAs7QYGp+bqL66YZu6F
 Cl3Q52oIbUkmbRxwoIVpGaTXc8pqXwgy4aKDML1nD2XpiXUZTFCDAnTTrrAwPs+S38
 2GroimWVRGEG1kV72qj2vSK9cDgRWS4TcFtIrdx1KrrmLYSGL46SUFJpnkvryI1CXX
 mr8rD3s0MEENx0CNpKFjh4mWuRJv0nUc8CBY9lUA/sWO/xU2H4A2++rcLj+vfLUb08
 lU82OZS1Dp3SwfPjT+asQd1J85TIMY+lWswlMHRCS9JbUpOfqPmT8JS5pip8hjsemL
 +ingF7hWzTetw==
From: Mark Brown <broonie@kernel.org>
To: Ban Tao <fengzheng923@gmail.com>, tiwai@suse.com, jernej.skrabec@gmail.com,
 perex@perex.cz, wens@csie.org, lgirdwood@gmail.com, samuel@sholland.org
In-Reply-To: <1662965133-9232-1-git-send-email-fengzheng923@gmail.com>
References: <1662965133-9232-1-git-send-email-fengzheng923@gmail.com>
Subject: Re: [PATCH v10 1/2] ASoC: sunxi: Add Allwinner H6 Digital MIC driver
Message-Id: <166362903557.3419825.16271698266966070815.b4-ty@kernel.org>
Date: Tue, 20 Sep 2022 00:10:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: alsa-devel@alsa-project.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Sun, 11 Sep 2022 23:45:33 -0700, Ban Tao wrote:
> The Allwinner H6 and later SoCs have an DMIC block
> which is capable of capture.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/2] ASoC: sunxi: Add Allwinner H6 Digital MIC driver
      commit: 9fc2c8ed923d8ec8a49cf5b5076c84867126ca69

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
