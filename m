Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 853E8509240
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 23:42:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 283C81B3D;
	Wed, 20 Apr 2022 23:42:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 283C81B3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650490976;
	bh=hJ4Cnh58Gh4Afg8kZfmnguM7Bo4hwgAMX8DV3JNSniw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CD0JJoHtnfmK5MveY/MjpOYK2DxpQNb0rxZeOJ8SukXXngDks6jsJUCJAChCsvQnF
	 k6N8+C/VRqoEHPmozKHCw+O2VZ0Qx1QrZ/jzqiF5zH3ytqzhb0Je64hzIAPRYGlzWx
	 THgnefinCvH0vM4NNl+otxaH9PZZFcbPq+aJ945o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94DAAF80519;
	Wed, 20 Apr 2022 23:41:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15605F804FE; Wed, 20 Apr 2022 23:40:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF8C3F80246
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 23:40:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF8C3F80246
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="R7T8gMSb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D77A26196B;
 Wed, 20 Apr 2022 21:40:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6CC4C385A9;
 Wed, 20 Apr 2022 21:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650490852;
 bh=hJ4Cnh58Gh4Afg8kZfmnguM7Bo4hwgAMX8DV3JNSniw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=R7T8gMSbfivvxJfUlI1y/F6TZeVLsQDOD9tZhN/odCiTjLKcj0kubeSOTHxayi38y
 Q8IEToUsWyI+fLD0hyKFo9DPCD7SYnoybKrzu5I6haKkEJQDa9RVbWr+LGa+jfi060
 e9hGkTrYqPe1Gmzme8DFd3B86eNioisbdqDoUrkOZT5vKnztwKD4fhBOVlIp87GdAq
 76DgI70RBnQCp/GK1OODawTGZRtucDhVzr2Zj3+E0HZJPcaCp+brNgmQrH+N42+QHd
 5iFVS37hScFMzuvFV7oDnDYD+MuQBnnXhNgHpyphlOiGKjIYY5zAJwe4/xrllz+341
 Du4NbuMpxgYFg==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@nxp.com, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <1650251910-8932-1-git-send-email-shengjiu.wang@nxp.com>
References: <1650251910-8932-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: dmic: Add support for DSD data format
Message-Id: <165049085059.138067.16136927619532559711.b4-ty@kernel.org>
Date: Wed, 20 Apr 2022 22:40:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: shengjiu.wang@gmail.com
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

On Mon, 18 Apr 2022 11:18:30 +0800, Shengjiu Wang wrote:
> Add DSD format support in this generic dmic driver:
> DSD_U8,
> DSD_U16_LE,
> DSD_U32_LE,
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dmic: Add support for DSD data format
      commit: 3271be0628917a97d8757b02b5bc40856fd03476

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
