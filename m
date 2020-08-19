Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BC4249DA1
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Aug 2020 14:17:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EFE11846;
	Wed, 19 Aug 2020 14:17:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EFE11846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597839472;
	bh=zgqO4dt8oDjrOVT4/c1Xvgcktui1wNIAoIAn1aAlAEY=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ocDzLFOuskdwA2f3XP5Sq0CrkCcy8CEw9hkOa4eoBqdHjcDkuz6D8YJARqeFFI1vK
	 iJxkI+Zt588YHummSMhiqB9X7QwzgD/PSEzMqEktsq1VhU/uJeq3kIlgEvNuOYYSfS
	 uyHFcOleS1RegcjSwiCl9yx3Aka2LsSvPgZFaqqY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2367F8011C;
	Wed, 19 Aug 2020 14:16:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FB1FF80218; Wed, 19 Aug 2020 14:16:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1772F800D3
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 14:15:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1772F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="efaVO3WJ"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A05B1206FA;
 Wed, 19 Aug 2020 12:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597839356;
 bh=zgqO4dt8oDjrOVT4/c1Xvgcktui1wNIAoIAn1aAlAEY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=efaVO3WJCaG9BaPttCL8jMRBOA31XsXEJaCMkZ4lY1wL87sOaTuVFsUBgaJ98LxWg
 afHJExSfN1wnl3Zg1JIDBUPhWbCbFu9MoBL7K2Pv1ln2RLR1C9r4Oxjw+It6gQqA8o
 Pb+JnsWixqPz2axn7rjZIIbNAWiOo0vX+dv9vWs0=
Date: Wed, 19 Aug 2020 13:15:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Anson Huang <Anson.Huang@nxp.com>, robh+dt@kernel.org, lgirdwood@gmail.com,
 shengjiu.wang@nxp.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
In-Reply-To: <1597712771-32433-1-git-send-email-Anson.Huang@nxp.com>
References: <1597712771-32433-1-git-send-email-Anson.Huang@nxp.com>
Subject: Re: [PATCH V2] dt-bindings: sound: Convert NXP spdif to json-schema
Message-Id: <159783932455.55025.17846366989004171430.b4-ty@kernel.org>
Cc: Linux-imx@nxp.com
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

On Tue, 18 Aug 2020 09:06:11 +0800, Anson Huang wrote:
> Convert the NXP SPDIF binding to DT schema format using json-schema.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Convert NXP spdif to json-schema
      commit: c5040fec3d550e27d0a49f05564204da6c90d10b

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
