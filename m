Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC5E49B147
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jan 2022 11:25:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25B6F281D;
	Tue, 25 Jan 2022 11:25:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25B6F281D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643106357;
	bh=0+aOms5Nvf71uva22FMN1OUg14vB/MdFCk/0gC3mHHw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hDjoIAq/d1OjWkrDva2WlIKOKGRxoZtwqVkQCmvDV+lqzq7At64LsI5p1VblcEBsO
	 B3NKc7/26jj4mSrlCmL8+JM2qlfabS0LeG9X0FH00UN0dglr9V78kRzIXZozN1Pnjs
	 MOurzXiCO1cVI7b7Vx5OmRSThWJp+gk8ckQ6u354=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6AA3F80587;
	Tue, 25 Jan 2022 11:20:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40EBCF8057C; Tue, 25 Jan 2022 11:20:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80CF5F8055B
 for <alsa-devel@alsa-project.org>; Tue, 25 Jan 2022 11:20:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80CF5F8055B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sHucB4Fc"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7A7C161638;
 Tue, 25 Jan 2022 10:20:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68D93C340E0;
 Tue, 25 Jan 2022 10:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643106046;
 bh=0+aOms5Nvf71uva22FMN1OUg14vB/MdFCk/0gC3mHHw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=sHucB4FcoZrvpPF7ljb8+c/o5Or0qh4NnbFBAxhjxAQxCsazNijxpNYY/y45tXPkE
 VCdu1at6O2FgYXcdPloCmrLRENyfj7/eaaVMgPVDHwAJmSxL5kbVRyTv95sIUkIaRY
 vy9Tqijv+su5kVI4tBffnnoD9Bsmv8uOqt8NjD9BsjeONyiVsZf97BG2bkh4rXD8Ve
 3MRWHqAF2Xuwjj+7111tTPYmKEr7KkWQYiE8M8LDXiQjDZUc84ClP4CxaX0k+mjLEV
 Lxb2U9JJeknjawDZGAxWnGyuLaBzwkQJwbszQucwwJGmg0e/2+GSi3mgfrIKYpdGPz
 qbLiPsITr+rNA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Robert Hancock <robert.hancock@calian.com>
In-Reply-To: <20220120195832.1742271-1-robert.hancock@calian.com>
References: <20220120195832.1742271-1-robert.hancock@calian.com>
Subject: Re: [PATCH v3 0/6] ASoC: Xilinx fixes
Message-Id: <164310604415.74844.5269237550048804822.b4-ty@kernel.org>
Date: Tue, 25 Jan 2022 10:20:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
 lgirdwood@gmail.com, tiwai@suse.com, maruthi.srinivas.bayyavarapu@xilinx.com,
 robh+dt@kernel.org, michal.simek@xilinx.com
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

On Thu, 20 Jan 2022 13:58:26 -0600, Robert Hancock wrote:
> There are drivers in mainline for the Xilinx Audio Formatter and Xilinx
> I2S IP cores. However, because of a few issues, these were only really
> usable with Xilinx's xlnx_pl_snd_card top-level driver, which is not in
> mainline (and not suitable for mainline).
> 
> The fixes in this patchset, for the simple-card layer as well as the
> Xilinx drivers, now allow these drivers to be properly used with
> simple-card without any out-of-tree support code.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: xilinx: xlnx_formatter_pcm: Handle sysclk setting
      commit: 1c5091fbe7e0d0804158200b7feac5123f7b4fbd
[2/6] ASoC: xilinx: xlnx_i2s: create drvdata structure
      commit: 5e46c63ca22278fe363dfd9f5360c2e2ad082087
[3/6] ASoC: xilinx: xlnx_i2s: Handle sysclk setting
      commit: c47aef899c1bb0cbda48808356e7c040d95ca612
[4/6] ASoC: simple-card-utils: Set sysclk on all components
      commit: ce2f7b8d4290c22e462e465d1da38a1c113ae66a
[5/6] ASoC: dt-bindings: simple-card: document new system-clock-fixed flag
      commit: e9fed03aebacb8873dee8e2edfbce96f27f6c730
[6/6] ASoC: simple-card-utils: Add new system-clock-fixed flag
      commit: 5ca2ab4598179a2690a38420f3fde9f2ad79d55c

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
