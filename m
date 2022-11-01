Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB002614B3A
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Nov 2022 13:54:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F33A1694;
	Tue,  1 Nov 2022 13:53:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F33A1694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667307286;
	bh=ssrjw0PdeZf+FjcUuVM0bn20nuahEAU+1IE+6PgcWnA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RPTF1Oznd/1jcqNYuXYq4a4e99w2QytHZQo+HGLU3lV6l71yrCxpRmjjlq8lTLDzA
	 ivyzk2OpWXq//xr+RXyuJ4Yc0DVlS+STXbWtD92O9zFN6PDLt/R88HUk7voSV6XkQT
	 IDHvrxGpnHCrHbYam6E7sRW/zGeOc3K3c22U2XKI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88C75F804AB;
	Tue,  1 Nov 2022 13:53:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C902F80423; Tue,  1 Nov 2022 13:53:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D998FF80249
 for <alsa-devel@alsa-project.org>; Tue,  1 Nov 2022 13:53:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D998FF80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GT21kV1O"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E67CAB81D2C;
 Tue,  1 Nov 2022 12:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 419C3C433D6;
 Tue,  1 Nov 2022 12:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667307225;
 bh=ssrjw0PdeZf+FjcUuVM0bn20nuahEAU+1IE+6PgcWnA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=GT21kV1OvpLF3LWoJYL3bGex3+y4Qw91Tl3qYAIcBKFvgujCmYEMPElDIBA1zTNu0
 kPBXRNrDBbY2uCtYliLWsYjsT6ugSaQZAdYYC21muzKkIpNwquVuuPd+nLAb4nLaNt
 aPen64BxLm1WcKc327Exqt96UW5Jqtddy6XJgqKWWdhhiIY4vHzLbhtoYyDRWYVYVy
 yV6RWx+VIcfmnFK2B+TJ/fixc0KfdqgdkNsERUdxSORqVilJM3QIXcXMXZj5vPPGCK
 ZdiBXrYz4AXuOpzvvCJaKP2YWs+u3GH5rZ+u1SJBMHI61hoo6fPbg3MDG9ePnDi4Bd
 iQqm9acgIE/Yg==
From: Mark Brown <broonie@kernel.org>
To: rf@opensource.cirrus.com, james.schulman@cirrus.com,
 ckeepax@opensource.cirrus.com, 
 Peter Bergin <peter@berginkonsult.se>, tanureal@opensource.cirrus.com,
 david.rhodes@cirrus.com
In-Reply-To: <20221031203723.168177-1-peter@berginkonsult.se>
References: <20221031203723.168177-1-peter@berginkonsult.se>
Subject: Re: [PATCH v3] ASoC: cs42xx8-i2c.c: add module device table for of
Message-Id: <166730722298.177758.3834028239345965105.b4-ty@kernel.org>
Date: Tue, 01 Nov 2022 12:53:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
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

On Mon, 31 Oct 2022 21:37:23 +0100, Peter Bergin wrote:
> When trying to connect the device with the driver through
> device-tree it is not working. The of_device_id is defined in
> cs42xx8.c but is not correctly included in cs42xx8-i2c.c.
> 
> Move of_device_id table to cs42xx8-i2c.c. Get cs42xx8_driver_data
> in cs42xx8_i2c_probe() and pass as argument to cs42xx8_probe(). Move
> error check if no driver data found to cs42xx8_i2c_probe().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42xx8-i2c.c: add module device table for of
      commit: e5afc8677c0d9be4bea5ef5ab01719e190450943

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
