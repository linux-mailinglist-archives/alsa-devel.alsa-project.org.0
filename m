Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC8A57227E
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 20:23:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE4A516CF;
	Tue, 12 Jul 2022 20:23:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE4A516CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657650239;
	bh=tA2KEabdZaF1/1dZxyIE604Bt7CeRJxcabknbBYNrNA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BcKF++hGDCcx8ZTl7uQjfkAUQ1Hsq47ARRfP8dTQ49kRtlA8ahBv4f9fsV7TNY3G9
	 ZYH1HRgJ0667CGaJPbyj/mXu0+kqJUyMK8U6LWhmsjtKIkqx+9y7i+YQp1y7SuUxUS
	 yIhLn2HKuyfZBnR9afVe+FKhzhx1qCgGCuMUdbSE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 837D6F80549;
	Tue, 12 Jul 2022 20:22:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4BF9F8023B; Tue, 12 Jul 2022 20:22:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5508BF8023B
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 20:22:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5508BF8023B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bxITZaXx"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B362CB81BAE;
 Tue, 12 Jul 2022 18:22:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13C3FC341C0;
 Tue, 12 Jul 2022 18:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657650144;
 bh=tA2KEabdZaF1/1dZxyIE604Bt7CeRJxcabknbBYNrNA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=bxITZaXxAnZLhiim1PghMkrRsfi8gRcPMtbAMbDdB1gbyOV4GqDZM2lcJYUFZYrcK
 20Q54nEdSh8x7B/ByYyV4MG4zyLqZhGqP0ROvvr4IFkx8szyJA0ZDWwtCq5o9qqu96
 a086Gy25TuBusSK6zbgnO98ucTiz/wzT9uxc/a5gw5vGgnaxceSt8yjbIOkd/7A+eR
 cL3BpmZ3vCQVwGET3z4/BwqsmobpXE9aWF5DbfFqWUlstlORT4SURE+a15OA1s1+/S
 8vvjLbMy9h0XOfiZNF589/wE8QYU2TtyEOy0cnCVjh4bO1zZQu7mkRVjPkd/9kiRH7
 bAcTO2n6yVF2g==
From: Mark Brown <broonie@kernel.org>
To: peter.ujfalusi@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com
In-Reply-To: <20220712125734.30512-1-peter.ujfalusi@linux.intel.com>
References: <20220712125734.30512-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: Intel: hda: Correct Firmware State
 Register use
Message-Id: <165765014280.502248.4234269481946367650.b4-ty@kernel.org>
Date: Tue, 12 Jul 2022 19:22:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, rander.wang@intel.com
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

On Tue, 12 Jul 2022 15:57:31 +0300, Peter Ujfalusi wrote:
> The FSR (Firmware State Register) holds the ROM state information, it does not
> contain error information.
> The FSR itself is a bit more complicated as well as the state depends on the
> module currently in use.
> 
> The error code from ROM or the status code from the firmware is located at the
> next register.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: Intel: hda: Correct the ROM/FW state reporting code
      commit: 15d8370cf6d5b3316ad58954086433301363be67

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
