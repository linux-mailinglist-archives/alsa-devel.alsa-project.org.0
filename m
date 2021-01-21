Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C242FDDB0
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 01:12:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 574311825;
	Thu, 21 Jan 2021 01:11:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 574311825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611187930;
	bh=fJmBuuQz1f9NwhONIikUc47J0yR0liG2Nz8foWUbmEk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sd5vQLs9BgXAwuAQbp/JhxF3tEyQqQ9+V1XMxtrF2bA3Cfkrc+LgL+jQVet3Gnf6r
	 DVhL9CA8noJ1PjQfDk0ql1tvw+m3Br49YW6jnT2nsbf3lPHeR5tqFAn/FExq9jEdxc
	 fdKCzQNvxR2CPEbXlFyNHI1th/3Ef9i9hakYCqx8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72FB1F8051B;
	Thu, 21 Jan 2021 01:07:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DE48F80518; Thu, 21 Jan 2021 01:07:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9D11F80516
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 01:07:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9D11F80516
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SnPsPXl1"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 51FDC2371F;
 Thu, 21 Jan 2021 00:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611187648;
 bh=fJmBuuQz1f9NwhONIikUc47J0yR0liG2Nz8foWUbmEk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=SnPsPXl1tiPS+azOKnNIvzhGrwT4/YsQ63jr5C1n3T4hL4SWX9mRhcHx7O8HIS0uQ
 2ImssWH4HdpuYfd2hgF303mSaC7eaysm/WVETJ8oUQxa7TSZbhArcaQ9zOASmwi/OF
 FIqqiIuWIFPj7RTk1wpJpInHK4HnF3xD6FepnjxTVZoJvA+r66T3SIRKetAYy9Jvpu
 iOIrcef9mu29soIhGZnGLNJIV/1NaHCiWa2doZWPI1Md5gMC9n7+hr44VEOQDcgj+n
 Rwl/KVAL/OXdRN+2ZujJdbJenTeB8dUsBvPxnZtCvPXmsrl/lJCNrFBV+rqwI/Ztxo
 TASnIVbV6hD/w==
From: Mark Brown <broonie@kernel.org>
To: Yu-Hsuan Hsu <yuhsuan@chromium.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20210115075301.47995-1-yuhsuan@chromium.org>
References: <20210115075301.47995-1-yuhsuan@chromium.org>
Subject: Re: [PATCH v7 1/2] cros_ec_commands: Add EC_CODEC_I2S_RX_RESET
Message-Id: <161118753483.45718.10581891654341693206.b4-ty@kernel.org>
Date: Thu, 21 Jan 2021 00:05:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Guenter Roeck <groeck@chromium.org>, Prashant Malani <pmalani@chromium.org>,
 Pi-Hsun Shih <pihsun@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@chromium.org>, Cheng-Yi Chiang <cychiang@chromium.org>
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

On Fri, 15 Jan 2021 15:53:00 +0800, Yu-Hsuan Hsu wrote:
> Add the new command EC_CODEC_I2S_RX_RESET in ec_codec_i2s_rx_subcmd,
> which is used for resetting the EC codec.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] cros_ec_commands: Add EC_CODEC_I2S_RX_RESET
      commit: f4d3bd8be4f2bc43e4b13490cbc9969d15c2f058
[2/2] ASoC: cros_ec_codec: Reset I2S RX when probing
      commit: 7f1f7ae102ea082745e320b3c8c003f43c063edf

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
