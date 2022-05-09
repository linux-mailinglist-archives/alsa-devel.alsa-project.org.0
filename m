Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2707952042C
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 20:07:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 660501683;
	Mon,  9 May 2022 20:06:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 660501683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652119642;
	bh=XBXSA2sw3mrQpJSKqJ9XNceqpmgmJxCHCn28EwPITvI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RJZq6NCilcaKwzNsFq3N5tONX1+M9NXeOAHnv1Zs87CjQ0z+VETHmY8FacmmskdsG
	 iO9pNnnPhEwBBnXgf4x4Oe3VMIFOW5urTKwkKMJarALqOy2ii9EOAZtqhUtPwJGtNp
	 729wlo76gLsUc1iU4qctgrGWv9rqVMvJ+8p5uShg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A283F80510;
	Mon,  9 May 2022 20:05:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77B2EF8025D; Mon,  9 May 2022 20:05:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86336F80237
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 20:05:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86336F80237
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jGoRYK2J"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AAA11B818E1;
 Mon,  9 May 2022 18:05:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7E22C385B4;
 Mon,  9 May 2022 18:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652119534;
 bh=XBXSA2sw3mrQpJSKqJ9XNceqpmgmJxCHCn28EwPITvI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jGoRYK2JvJ8X7muMC5jItXhoU6lXKZc2ndqY5ze6I2AUV810lSi0ScNauAktbK0AE
 hrAS006L6ivVdl4ri9RDFGHklW4X6zeHCZSO4Hp/Oq1XZ+KkfCxZ2FUIx2OW39obKe
 7Pl3k05uEWjiMI/V9DJuML4MLfor0cVZC5gd807yWKw0RcchtH3h9WLLkX3gJNkUNb
 FtQ5XGBNpT+HxtdpqQsp3TWMpeWH5Ch1H5EdJ0C1yJh4yQP6nfz8bXK/TxvJxyjYVk
 o/MLEIfAJxiBWp2l2iC5fgENoaqA9coSftUXu75MprcHZjmev1EuqJuRoKBittjbf1
 uaBUnKTtW3Nhw==
From: Mark Brown <broonie@kernel.org>
To: lukma@denx.de, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220509121313.31216-1-lukma@denx.de>
References: <20220509121313.31216-1-lukma@denx.de>
Subject: Re: [PATCH 2/2] doc: dts: Add device tree information regarding
 wm8940 codec
Message-Id: <165211953261.1181242.4154346698218256883.b4-ty@kernel.org>
Date: Mon, 09 May 2022 19:05:32 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
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

On Mon, 9 May 2022 14:13:13 +0200, Lukasz Majewski wrote:
> This commit provides documentation entry for wm8940 codec.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/2] doc: dts: Add device tree information regarding wm8940 codec
      commit: 29e87c4f62e2e688c1c91da9f8d54d0f042cb75e

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
