Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBE16721F6
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 16:47:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B27147982;
	Wed, 18 Jan 2023 16:46:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B27147982
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674056842;
	bh=HeJFlbJgTEjmKRxegxuUKiHDC7mS+RaEzO/lzVVy+pM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=E4MZoGmWoldOewa2xB6Fq0B/J/8iHz6hYK0pdj68Xg9KMie5pc520Tr7LxWsCmWLn
	 STaOiK0e9jq9+3KRmAnTWTSfzOvteypNu33URiRAhSVxFWg2U1leXywb8RnVFRAaLf
	 486a79eJI7oBzvos9unev+ROXAXoWpvD4zxqhnF8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59D13F8026D;
	Wed, 18 Jan 2023 16:46:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72C36F80482; Wed, 18 Jan 2023 16:46:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEF5EF8024C
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 16:46:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEF5EF8024C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eWGrB8/H
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 170FCB81D8C;
 Wed, 18 Jan 2023 15:46:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE000C433EF;
 Wed, 18 Jan 2023 15:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674056770;
 bh=HeJFlbJgTEjmKRxegxuUKiHDC7mS+RaEzO/lzVVy+pM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=eWGrB8/HkfTH3h59VMsK4s4GBKnyLCVnZP+EYV6SEsxYN0j7Av3MZThwzfsuIZ281
 wy1M/GHrxqnr0np2ComLyg8PbO0MODNx+B5x8BWJc1RL2ODvplUyIgvl/7c2eTW15/
 X1eLprIydkDATkGMKpRbPQEZepOgpOwf1JLX8tcT2FIQGHMV9m8a1VEUTqLsqI5Upx
 27CmDsLeRgnEjqUm7U2ADV6SLxcASK0cxzl7yrdviu/upKwoiux3I3RStQCQw9PWUd
 tDQBMcyxhDX92rWhcLfBL1+qkDmGuAw2HO6G55IYhBRrcKnrWkihJ/RxMCNuK/jxBh
 UgkJCFqAshKmA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230116125506.27989-1-peter.ujfalusi@linux.intel.com>
References: <20230116125506.27989-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v2 0/3] ASoC: SOF: sof-audio: Fixes for widget prepare
 and unprepare
Message-Id: <167405676616.930478.14281486958909516294.b4-ty@kernel.org>
Date: Wed, 18 Jan 2023 15:46:06 +0000
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 rander.wang@intel.com, yung-chuan.liao@linux.intel.com,
 angelogioacchino.delregno@collabora.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, 16 Jan 2023 14:55:03 +0200, Peter Ujfalusi wrote:
> Changes since v1:
> - patches got re-ordered to make them (hopefully) apply on stable when picked
> - Added stable tag for 6.1 for the patches
> - Added Fixes tag for the swidget NULL check on unprepare
> 
> This series contains one fix (first patch) followed by a nice to have safety
> belts in case we get a widget from topology which is not handled by SOF and will
> not have corresponding swidget associated with.
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: sof-audio: Unprepare when swidget->use_count > 0
      (no commit info)
[2/3] ASoC: SOF: sof-audio: skip prepare/unprepare if swidget is NULL
      commit: 0ad84b11f2f8dd19d62d0b2ffd95ece897e6c3dc
[3/3] ASoC: SOF: sof-audio: keep prepare/unprepare widgets in sink path
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

