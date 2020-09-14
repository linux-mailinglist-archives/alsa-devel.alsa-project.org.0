Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C72F268E6E
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Sep 2020 16:54:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FE15169C;
	Mon, 14 Sep 2020 16:53:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FE15169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600095275;
	bh=1qKTCFyAmrhl/DWjwf+6VgDKAdfgJ17CixfdpPZvgzg=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=miiBHF3h6+p3oiaCBGUtjR5W5vrnnOXmer6DGd4GdBt6JF+x8B58qSL+S0QoJFagx
	 vai9Ti1AyvUUWr98WMX3A1swJakyylS5ozC9aR0pwhFQIxvha5NuXhnxmiXxo7az20
	 IAiFApxcxMfIhXQw1IZYgPVVwPE23uO5/GXGA7s8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B910F8015D;
	Mon, 14 Sep 2020 16:52:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D384FF802C3; Mon, 14 Sep 2020 16:52:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82A49F80105
 for <alsa-devel@alsa-project.org>; Mon, 14 Sep 2020 16:52:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82A49F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="xK9lRKLu"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ED2A020936;
 Mon, 14 Sep 2020 14:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600095123;
 bh=1qKTCFyAmrhl/DWjwf+6VgDKAdfgJ17CixfdpPZvgzg=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=xK9lRKLus8ZTZ5sP7mazOB8h5jM837B0pptkzyLD7irDdWvrqWKnFOsSh1FQKxzaG
 SD9XV4grMNOZdvog2Y5Jgr/u+ynVWIydfGDhPRSTjw5deRqvotddJbb0lVL9IaRBB1
 pyqgJpp/UhbMLVVR5MGBbR/5ktLTsFN23YwgzodY=
Date: Mon, 14 Sep 2020 15:51:15 +0100
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 lgirdwood@gmail.com
In-Reply-To: <20200910124110.19361-1-peter.ujfalusi@ti.com>
References: <20200910124110.19361-1-peter.ujfalusi@ti.com>
Subject: Re: [PATCH v2 0/2] ASoC: ti: j721e-evm: Support for j7200 variant
Message-Id: <160009506911.439.3955483489656494834.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
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

On Thu, 10 Sep 2020 15:41:08 +0300, Peter Ujfalusi wrote:
> Changes since v1:
> - Suffix the 2359296000 constant with 'u' to silence C90 warning
> 
> When j7200 SOM is connected to the CPB, the audio setup is a bit different:
> Only 48KHz family have clock path, 44.1KHz is not supported.
> 
> Update the binding documentation and add support for the j7200 version of CPB
> to the driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: ti, j721e-cpb-audio: Document support for j7200-cpb
      commit: 18790b1b514a202bae2863a4206b731d95302c85
[2/2] ASoC: ti: j721e-evm: Add support for j7200-cpb audio
      commit: 18c140f4a2de8fa674d52fe522a47133bc124f81

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
