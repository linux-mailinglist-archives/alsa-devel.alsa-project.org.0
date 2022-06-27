Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB24255BBF5
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 22:21:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8970916C7;
	Mon, 27 Jun 2022 22:20:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8970916C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656361270;
	bh=+oMVcAo3/DJCNjq6cv5dBPqjaPJsplwyRFcbzoAqNag=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kj8nAuMCjfG3em1UbsJnEYY5oCBbPzEVp4Q2zx25ieKyMjkqwKBYkYitzEO1gIoyT
	 mXU2ORQW6fB6B9iyduPQDm6YJPeuIMYshXZfMs5TiF8pAnvoloP9p1UShEuXhGwusJ
	 O2AKJu9ehjEXV0Jcrg5scFh3knVjkr9+tKZpEYNE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18B7BF8053C;
	Mon, 27 Jun 2022 22:19:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AE2FF80537; Mon, 27 Jun 2022 22:19:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 154CCF8028B
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 22:19:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 154CCF8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KNTTObgN"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DC93261750;
 Mon, 27 Jun 2022 20:19:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A30EBC385A5;
 Mon, 27 Jun 2022 20:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656361154;
 bh=+oMVcAo3/DJCNjq6cv5dBPqjaPJsplwyRFcbzoAqNag=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=KNTTObgNBFkHnY1iAE6uBi3tcPzO7S+rsafCt2DVAntrkXz41fv8y8RAEYnB7C0ic
 VadK6HP5QAvr4UDfmAbiuJAX2Xg7foPTazwhmx+xfK8Wp7K4SOveW/QrTHVPRaaTTM
 gATyKYTETbnKBQsvhaEuft0RqWEeDh4FWTGMJWBdGcscP9z3iM/REKpzvrsnhlepjT
 oyqX1S178G1cBVd70pUB8NTmyWLJkxxBGCpamve7N5MZuriDeUf9G+GeJOdeA/CW2K
 /XDiVK15hpmmvAKZwH1mPkoyctGQYFuj5hJpCtey1Z5Yo/KBQ+d7Mj8KdLVes3beMZ
 KfntMVNbUZ4sA==
From: Mark Brown <broonie@kernel.org>
To: ryan.lee.analog@gmail.com, daniel@zonque.org
In-Reply-To: <20220624104712.1934484-1-daniel@zonque.org>
References: <20220624104712.1934484-1-daniel@zonque.org>
Subject: Re: (subset) [PATCH 0/8] ASoC: max98396: Some assorted fixes and
 additions
Message-Id: <165636115333.3997797.6298161546515778991.b4-ty@kernel.org>
Date: Mon, 27 Jun 2022 21:19:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org
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

On Fri, 24 Jun 2022 12:47:04 +0200, Daniel Mack wrote:
> This is a series of some patches that I collected while using the
> max98396 driver is a TDM mode setup.
> 
> They correct BSEL and PCM mode configs, add support for power supplies
> and add some bits to the documentation.
> 
> The code is tested in TDM-16 and TDM-8 mode with 32 channel width.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: dt-bindings: max98396: add voltage supplies
      (no commit info)
[2/8] ASoC: dt-bindings: max98396: Add #sound-dai-cells
      (no commit info)
[3/8] ASoC: dt-bindings: max98396: Document adi,bypass-slot-no
      (no commit info)
[4/8] ASoC: max98396: add voltage regulators
      (no commit info)
[5/8] ASoC: max98396: Improve some error prints
      (no commit info)
[6/8] ASoC: max98396: Fix register access for PCM format settings
      commit: cf5c888539f353cb10e127d3a8754554cacd293a
[7/8] ASoC: max98396: Implement DSP speaker monitor
      (no commit info)

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
