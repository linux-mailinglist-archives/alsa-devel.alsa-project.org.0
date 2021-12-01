Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F41A465582
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 19:33:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F109D25F2;
	Wed,  1 Dec 2021 19:32:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F109D25F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638383607;
	bh=7qhygDHX4J1BeJlKqGRQ1ZZF1wSu4J7V9n4jarp8HOI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eLVISGHYoBFeDxLp7whp/F84xsmPRCgq85pzSPt7d4/Yy/aQ+03bnN5hjSlTf0P44
	 HJ91x0LIWnYesgBdNuEIi+FI/CW3McagvAg+vjS5QZAItGUd4e/svjzeJFUEdxKLNq
	 vOCKBx9N05QhONZp5QVKA4ZYj/Wqg1xo/NkPtf74=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68E90F80256;
	Wed,  1 Dec 2021 19:32:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B21C0F80246; Wed,  1 Dec 2021 19:32:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59D1FF80217
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 19:32:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59D1FF80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fA3Rscm+"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id BEAA7CE1DE5;
 Wed,  1 Dec 2021 18:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 312DFC53FAD;
 Wed,  1 Dec 2021 18:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638383517;
 bh=7qhygDHX4J1BeJlKqGRQ1ZZF1wSu4J7V9n4jarp8HOI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=fA3Rscm+Zo8Tu5O8KbUZDiMyF/Na5hEy0DoyxyYkFXD50PkuN86AfvwqMj3wJetCk
 bO141OVMndGgrGBAur5hfdUOYhr7T9CZKzp2UzrRP+v2JiQe4Qsw9L2ooekc922YiC
 RcgM4FnUqQaZnELYB0/3DhpS/qOdTzFyQoSlzVQpZ1SaYSPwLBp0RE4OdDcX1wGTdl
 7luZNt1Ts3YL6Q3MBxMhPzdwHvofLGmOc9qlyYvHMRG5MJKOs9j2lDL4OqttjdfEvu
 AU2NIlv5XlriBbBC5swsofXtQk1QkQCxvN8LK+iHJhaKFvBzK9hwNsV0m6KgG+1A7I
 qQ6IiU0QIoB4A==
From: Mark Brown <broonie@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>, Takashi Iwai <tiwai@suse.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20211124210655.288108-1-frattaroli.nicolas@gmail.com>
References: <20211124210655.288108-1-frattaroli.nicolas@gmail.com>
Subject: Re: [PATCH] ASoC: rockchip: i2s_tdm: Dup static DAI template
Message-Id: <163838351490.2179725.16335234667243038624.b4-ty@kernel.org>
Date: Wed, 01 Dec 2021 18:31:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Wed, 24 Nov 2021 22:06:55 +0100, Nicolas Frattaroli wrote:
> Previously, the DAI template was used directly, which lead to
> fun bugs such as "why is my channels_max changing?" when one
> instantiated more than one i2s_tdm IP block in a device tree.
> 
> This change makes it so that we instead duplicate the template
> struct, and then use that.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: rockchip: i2s_tdm: Dup static DAI template
      commit: 53689f7f91a2ab0079422e1d1b6e096cf68d58f4

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
