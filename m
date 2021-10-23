Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BA94383CF
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Oct 2021 15:36:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC2EA166D;
	Sat, 23 Oct 2021 15:35:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC2EA166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634996159;
	bh=c6mbqREQAVdUOYLddTyyKU8U9FOPcxP20n3Bos7KfK8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PI1yGKHD9N63s/RGMIdVqJvSF3EFn19E5om2YnsVqfSz6a+OLdHHFkEFDXxm9RtRm
	 ZiWsYQKCTTWHoAjHdrEykbn4KLaCMIB9T9FvR78nqVboccgh0tCpWzPtm7pnfyE227
	 O2mH8VOXVzkX/Te8HxUvPcBBIS/n4wrYF0wqARLo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F4AAF8010B;
	Sat, 23 Oct 2021 15:34:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FF49F80246; Sat, 23 Oct 2021 15:34:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02ECCF8010B
 for <alsa-devel@alsa-project.org>; Sat, 23 Oct 2021 15:34:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02ECCF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uqj6H/Sx"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E3C1D60F8F;
 Sat, 23 Oct 2021 13:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634996068;
 bh=c6mbqREQAVdUOYLddTyyKU8U9FOPcxP20n3Bos7KfK8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uqj6H/SxpAKara+yoJ/a3BwexShDACnVCl2nIn260j6AqUfjW0ozdvQOx0XO42U2Y
 Q4OQwjlixvKLRmskmAnfjas2211sqxxLqAEQUkBDwOto1vfJ9t8QXMGF+tQiNynEaO
 BkDgtGFa4ABLzOVilAOncziEinczCqcqrzD+NuNqdUgduRpIynoi6bXhd7h3iLRbLh
 rzKATDr+uPxxdEf2qubGME9jZNW3PxRU5d/dX54rBaasaV81MOOAlyPTTk1EjA3KCQ
 DihNRoS8aF4QhG0Vlus6cJRggGR3mSMKahWiHELLlfmPdjsr9ilevFX4g6dNTU1DHM
 VxW9NLjpkScNA==
From: Mark Brown <broonie@kernel.org>
To: derek.fang@realtek.com,
	lgirdwood@gmail.com
Subject: Re: [PATCH] ASoC: rt5682s: Downsizing the DAC volume scale
Date: Sat, 23 Oct 2021 14:34:24 +0100
Message-Id: <163499605421.842779.6605242080972857028.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211021120303.4601-1-derek.fang@realtek.com>
References: <20211021120303.4601-1-derek.fang@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, albertchen@realtek.com, Mark Brown <broonie@kernel.org>,
 shumingf@realtek.com, flove@realtek.com
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

On Thu, 21 Oct 2021 20:03:03 +0800, derek.fang@realtek.com wrote:
> From: Derek Fang <derek.fang@realtek.com>
> 
> Use 0.75db/step of DAC volume instead of 1.5 to get
> a more smooth volume curve.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5682s: Downsizing the DAC volume scale
      commit: e7ee1ac4ecb5114d60b8ead333b6d52cdcf78862

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
