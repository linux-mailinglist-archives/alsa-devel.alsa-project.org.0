Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC44B4F2973
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 11:32:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D25CB176C;
	Tue,  5 Apr 2022 11:31:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D25CB176C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649151130;
	bh=L/0Q71877NZ2dI0wBiiMHZiv88UEejC3hMOyoQIhhOM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WNiy8QxgxIvasEEr7f9RFigwc/KGYGlBAuz5BA8XsVcEXwViErFBJwgtjfUsmlswV
	 kuDOpQsHGFvrga/T0GV9MLF4Qj1nSYIz5ZzWMT6dyVt9WwsLlnsBzvjbBggntVygYP
	 57nRT47MLKr20ySSjbLSwzEE3Jp2MTqsOQyvDOCs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C545F8016B;
	Tue,  5 Apr 2022 11:31:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9C1AF8016B; Tue,  5 Apr 2022 11:31:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB49FF800D2
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 11:31:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB49FF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AgDJjONY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 10F7261368;
 Tue,  5 Apr 2022 09:31:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81866C385A0;
 Tue,  5 Apr 2022 09:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649151061;
 bh=L/0Q71877NZ2dI0wBiiMHZiv88UEejC3hMOyoQIhhOM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=AgDJjONY1wQTxOWX0xahtmDF9bEXicjJL27tCntdMedb4VNO9KYvVoiAWMZPjA7Lj
 5NnZrRhEeZ9zt6Pa0v0rHidk3XSkliXvAN+6REZapyLd168aFSyhQUMPoT5KUlGiX9
 ePo3rAwYd/Yl29hQUC1h1tC6GjJf5RFlNwriiPrAo8/j8ff3cJBV/w39v07IR114oQ
 AdcExNHquO/rGrr82eqJTDlim0QeYHEdOWUdYFS6eulDqg16E2wPB1WyIxiN3IHc3u
 9Bk+i9XHTAC2gT9z5/hqWISvs0kDF3NYSuEWlES2a11NSIwETChz3aEgX1Ye5jeVGr
 AoigEHcyZE+IQ==
From: Mark Brown <broonie@kernel.org>
To: quic_plai@quicinc.com, srinivas.kandagatla@linaro.org, agross@kernel.org,
 judyhsiao@chromium.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 quic_srivasam@quicinc.com, robh+dt@kernel.org, swboyd@chromium.org,
 tiwai@suse.com, bjorn.andersson@linaro.org, alsa-devel@alsa-project.org,
 perex@perex.cz, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <1647965937-32203-1-git-send-email-quic_srivasam@quicinc.com>
References: <1647965937-32203-1-git-send-email-quic_srivasam@quicinc.com>
Subject: Re: [PATCH] ASoC: codecs: Fix error handling in power domain init and
 exit handlers
Message-Id: <164915105825.276574.11537900689104070957.b4-ty@kernel.org>
Date: Tue, 05 Apr 2022 10:30:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: quic_potturu@quicinc.com
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

On Tue, 22 Mar 2022 21:48:57 +0530, Srinivasa Rao Mandadapu wrote:
> Update error handling in power domain init and exit handlers, as existing handling
> may cause issues in device remove function.
> Use appropriate pm core api for power domain get and sync to avoid redundant code.
> 
> Fixes: 9e3d83c52844 ("ASoC: codecs: Add power domains support in digital macro codecs")
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: Fix error handling in power domain init and exit handlers
      commit: 1a8ee4cf84187bce17c76886eb6dd9389c3b99a8

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
