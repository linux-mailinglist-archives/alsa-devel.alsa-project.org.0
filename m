Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B36C6756F5
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 15:22:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D76F532D9;
	Fri, 20 Jan 2023 15:21:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D76F532D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674224544;
	bh=OzqkOWe+GX45jl34R/pYv9s2VnU3gO/7GdQELKZWks0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=EG18nKA+V6yxTYbJyuAYH0gLApyi9x6S5gKucS4DfcGgS6vE0F8nlWGAyov4hIIPC
	 7EZhGYqX5GlXxEKTRIQSWJjDdrdAsq51wyEkDPxBk6tMg340hKPjUyQR9/OZaU6Z43
	 Up7cDif2SmgKA70caVpiM2R65M13Y5bkWl7MvtNM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56428F800F0;
	Fri, 20 Jan 2023 15:21:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0FDAF800F0; Fri, 20 Jan 2023 15:21:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0710F800F0
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 15:21:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0710F800F0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fTZXdfxL
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BF86161F75;
 Fri, 20 Jan 2023 14:21:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE6EC43445;
 Fri, 20 Jan 2023 14:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674224481;
 bh=OzqkOWe+GX45jl34R/pYv9s2VnU3gO/7GdQELKZWks0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=fTZXdfxLC1wVnOH0mJpQPV2+aegUb8OzZ2l4pMeYMsRJAbkJw375wydCWsW2c6E55
 idsMtV+2sT5o15JUlOdfkzdFnag42IYOHTarnqCBhxJCbac6uWTwD/HnG37JAYgwUK
 bZE69XhvJYXT9ubST/NxSIdbP/rATG6xuoQLad4AgRBrzPPZ+Sg1Hxy8gsgaKUo3Ov
 xakKqnvYj47RUmhu16lLGkK5HqOfn0dYmoyJh1LMS//QR7txTZHd4NczusShX3Hn+R
 ljCr51CGX0iFmm8OkPEu5KX9nNfNS859OVTrpLNT+wOHE7udKkA8ztscYAOTz6Qwhk
 DBgsNsuEd13fQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20230119163459.2235843-1-kai.vehmanen@linux.intel.com>
References: <20230119163459.2235843-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: Intel: set dpcm_capture for amps
Message-Id: <167422447892.1273927.10648144665692801773.b4-ty@kernel.org>
Date: Fri, 20 Jan 2023 14:21:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-77e06
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: pierre-louis.bossart@linux.intel.com, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
 lgirdwood@gmail.com, daniel.baluta@nxp.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 19 Jan 2023 18:34:55 +0200, Kai Vehmanen wrote:
> This series addresses problems with echo reference devices
> reported in:
> "[BUG][ADL-N] Kernel panic when echo reference stream is opened"
> https://github.com/thesofproject/linux/issues/4083
> 
> Pierre-Louis Bossart (4):
>   ASoC: Intel: sof_rt5682: always set dpcm_capture for amplifiers
>   ASoC: Intel: sof_cs42l42: always set dpcm_capture for amplifiers
>   ASoC: Intel: sof_nau8825: always set dpcm_capture for amplifiers
>   ASoC: Intel: sof_ssp_amp: always set dpcm_capture for amplifiers
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/4] ASoC: Intel: sof_rt5682: always set dpcm_capture for amplifiers
      commit: 324f065cdbaba1b879a63bf07e61ca156b789537
[2/4] ASoC: Intel: sof_cs42l42: always set dpcm_capture for amplifiers
      commit: e0a52220344ab7defe25b9cdd58fe1dc1122e67c
[3/4] ASoC: Intel: sof_nau8825: always set dpcm_capture for amplifiers
      commit: 36a71a0eb7cdb5ccf4b0214dbd41ab00dff18c7f
[4/4] ASoC: Intel: sof_ssp_amp: always set dpcm_capture for amplifiers
      commit: b3c00316a2f847791bae395ea6dd91aa7a221471

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

