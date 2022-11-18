Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3F862F93F
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Nov 2022 16:27:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD85E16B8;
	Fri, 18 Nov 2022 16:26:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD85E16B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668785230;
	bh=BSCXlPVmpY0FoDKqa/ajgiBBO/IcH6tYlQ0+lVrw+z8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LTouqnyR2r7BxuErkPPW5mg2kjGK+JYfIWETckRDYsi8TZbDzwyliiel8elUcu/3+
	 PYYhzC3J7JyGg6zXEdduJyEas+Urem0alhDvslUDFSjI+H4rMXMpoaYqrRbid001wO
	 61tiv3HKtkLMI5An1cSIkhDytQOiguVr7U+jJs3Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A28EFF80558;
	Fri, 18 Nov 2022 16:25:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39D75F8016E; Fri, 18 Nov 2022 16:25:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5174FF800B5
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 16:25:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5174FF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AKZAuC64"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0072DB8243A;
 Fri, 18 Nov 2022 15:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 034C3C433C1;
 Fri, 18 Nov 2022 15:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668785119;
 bh=BSCXlPVmpY0FoDKqa/ajgiBBO/IcH6tYlQ0+lVrw+z8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=AKZAuC64uZtYcPtUfXAgtpGOks7Cm49yM9UaJCc2T3cLoNKiGgOlLZAzd7Zb9znKY
 tXP0/jpS2LCaRAcwxUTuQ99NZhd2UpWCfXVZpciePUx+HkR9UqKKj+YSz4ckFtLqZX
 I8wF2RR+6wIvwdRIH7+1aCVb95K9l1OaN9YYGp3+8mWZbn8FnozFRbOhjN6AJhhTVX
 Z87+Cw/yO66lmTPZ58mXfjVBrTEPX+RmCtcXd34b5JoMegXAw5sST3j+Kf2pb2tWMc
 vW+ZGQOSf1cvOogYvrkSAIH0EkAsrITox/lJrkxWJGr/dmtgP+j+0QYVw2suIfA/q2
 VIYSwNIeuYpnQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20221118015106.532302-1-yung-chuan.liao@linux.intel.com>
References: <20221118015106.532302-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: sof_sdw_amp: mark coeff tables with
 __maybe_unused
Message-Id: <166878511768.955590.200081679629244191.b4-ty@kernel.org>
Date: Fri, 18 Nov 2022 15:25:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: alsa-devel@alsa-project.org, peter.ujfalusi@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com,
 ranjani.sridharan@linux.intel.com
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

On Fri, 18 Nov 2022 09:51:06 +0800, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> The same file provides two tables used in separate drivers, make them
> as __maybe_unused to avoid errors:
> 
> sound/soc/intel/boards/sof_sdw_amp_coeff_tables.h:163:17: error:
> ‘dell_0b00_bq_params’ defined but not used
> [-Werror=unused-const-variable=]
>   163 | static const u8 dell_0b00_bq_params[] = {
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_sdw_amp: mark coeff tables with __maybe_unused
      commit: 041fe8858475a0337b28404ec5136f4fc583b3aa

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
