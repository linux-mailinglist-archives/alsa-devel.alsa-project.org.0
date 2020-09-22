Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A74273713
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Sep 2020 02:08:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 349F916D4;
	Tue, 22 Sep 2020 02:08:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 349F916D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600733334;
	bh=/qOUpvxGE3onmQMzM4NAqM4FNGOEmpOHoCwvFqYChQI=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C5NuhRQjnikIfmfg0TOOpMA7AkZHBbdmOqtW/FMfL2ivkBLt04t5qWwkegF3FeyBS
	 IzmsshR7WSbhKOWwZWo2uNCK7VUsYo9yRtEfnt/lN61h2RSO4PtpL8VX4WfxHf0+aS
	 T9n5mCfIEADjPX2gvfJewLIrahtYGJhvXMbkkhfY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D8D6F8028D;
	Tue, 22 Sep 2020 02:06:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63C38F8021C; Tue, 22 Sep 2020 02:06:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B20BEF80162
 for <alsa-devel@alsa-project.org>; Tue, 22 Sep 2020 02:06:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B20BEF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PJFNsXh8"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 514C721789;
 Tue, 22 Sep 2020 00:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600733185;
 bh=/qOUpvxGE3onmQMzM4NAqM4FNGOEmpOHoCwvFqYChQI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=PJFNsXh8VjDuLiYyPLj+tG0gHN4IhypvEx+MKA8Ps0IHelXQ9KpZbQKBLf3uKSA04
 QCxjF3Zc0nhGfxYU2N//5/VbfzEkztTH1DsHcnbeBwQrFXbVNirmt37BJiFk7BbkOS
 c1XvpBeOrrPJFI5F8BEheouIsY/Wiv/P/xMTNV54=
Date: Tue, 22 Sep 2020 01:05:33 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20200921110814.2910477-1-kai.vehmanen@linux.intel.com>
References: <20200921110814.2910477-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH 0/5] ASoC: SOF: fix kcontrol size checks
Message-Id: <160073312817.6173.14263034136602358389.b4-ty@kernel.org>
Cc: lgirdwood@gmail.com, daniel.baluta@nxp.com,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com
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

On Mon, 21 Sep 2020 14:08:09 +0300, Kai Vehmanen wrote:
> Series that fixes checks for 'size' in kcontrol get/put ext_bytes methods
> for SOF. The gaps in these checks were discovered via cppcheck warnings
> on unused variable values.
> 
> Pierre-Louis Bossart (5):
>   ASoC: SOF: control: fix size checks for ext_bytes control .get()
>   ASoC: SOF: control: fix size checks for volatile ext_bytes control
>     .get()
>   ASoC: SOF: control: add size checks for ext_bytes control .put()
>   ASoC: SOF: control: remove const in sizeof()
>   ASoC: SOF: topology: remove const in sizeof()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: SOF: control: fix size checks for ext_bytes control .get()
      commit: 3331bcd6a2f2dbe9c1fa764df695422c99e2f1fb
[2/5] ASoC: SOF: control: fix size checks for volatile ext_bytes control .get()
      commit: ec5a97624a8de4f44b090cf53bd48c05458e0b17
[3/5] ASoC: SOF: control: add size checks for ext_bytes control .put()
      commit: 2ca210112ad91880d2d5a3f85fecc838600afbce
[4/5] ASoC: SOF: control: remove const in sizeof()
      (no commit info)
[5/5] ASoC: SOF: topology: remove const in sizeof()
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
