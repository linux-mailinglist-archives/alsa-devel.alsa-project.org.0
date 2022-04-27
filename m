Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A03512501
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 00:05:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EACC715F9;
	Thu, 28 Apr 2022 00:04:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EACC715F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651097134;
	bh=ZcSvNP1OuNYg03g65F2Ko3oF+vqyczT8FtM58iuDiQI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ko0eHxGoVL7YSUk2RyWkN/10ZjCufwnaGyZAOHT1I8x/cL9ulPgf5ylQRkwfE8iyI
	 4l6DT1uIa5TYX2BtFMw5Yx77TxW/J5jIw9Q+4vLnK1c2ryYHNd2HA1kSgZtu7dDZ9D
	 msFnGKFCirCRDOtbXReJCH/ixTOBcwHywaXRxw8I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A26E6F80533;
	Thu, 28 Apr 2022 00:02:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0ADFDF80519; Thu, 28 Apr 2022 00:02:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AC75F804FE
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 00:02:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AC75F804FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bfYJ2/l7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9221AB82AD2;
 Wed, 27 Apr 2022 22:02:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB6E9C385A7;
 Wed, 27 Apr 2022 22:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651096966;
 bh=ZcSvNP1OuNYg03g65F2Ko3oF+vqyczT8FtM58iuDiQI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=bfYJ2/l7h0U/PBN/RC7Kb5+Qxi0Thy1CEWYCVFdiv4auIGPE/vgq/JWLZFEXOGdIJ
 FclMbHBwu958FLgOnkokSUcOrUpw7r4gMwm6yUKcQIc2AXQu6LBgLeSIUGmaP7nxKB
 t8MsnyLGN0n6UnCFOd1MsP3pY0Ov/4ojilGo2XXewZiI9NMsgnfrhlCWd4lttoB/YR
 epZMX30n1+h0hhEGbKNMmMIuFqnmRooF2k5GGPM/s7+tZ1dS+YhOylF9vL+hBw9LlD
 047Rgwo+o1hs7cH9Fg/G6zE9dLyfxzY+9aOjpye6As6h3iqS3qgymenveonMtEzLyq
 xI26AKTEPBKbw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, dan.carpenter@oracle.com,
 peter.ujfalusi@linux.intel.com, pierre-louis.bossart@linux.intel.com
In-Reply-To: <20220427115159.26177-1-peter.ujfalusi@linux.intel.com>
References: <20220427115159.26177-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: Do not (wrongly) assume positive return
 value in IMR path
Message-Id: <165109696468.498174.10779676150851824896.b4-ty@kernel.org>
Date: Wed, 27 Apr 2022 23:02:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@intel.linux.com
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

On Wed, 27 Apr 2022 14:51:59 +0300, Peter Ujfalusi wrote:
> The cl_dsp_init() returns 0 on success or negative errno on error.
> Replace the 'if (ret >= 0)' checks with correct 'if (!ret)` to check for
> success.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: Do not (wrongly) assume positive return value in IMR path
      commit: fd2cea169c4bc01f88bca84e4f01df48901c4339

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
