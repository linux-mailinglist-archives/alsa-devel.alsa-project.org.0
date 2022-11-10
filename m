Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4146248D0
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 18:58:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C7541688;
	Thu, 10 Nov 2022 18:57:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C7541688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668103111;
	bh=nT8Rei7szj8IWbgeHq2VZPxMg0sBm/lpJSJSRA5PJtY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YS/k6enuXRPkko+NNflAPFBCOvrEJuMluDt9vHX0U/C991d8FE21AgfHusy+QkwZ3
	 T8e1nZuHcZfdeZX4PxV/SD+B2bMAQVygEdDE1AwoAuMWFQgZwNDAi3Kt6OsLtCHikj
	 eoQe9DqbmPVH0XD9YiYImLbPLD6j4nR2D/Imb2LE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 261AAF8058C;
	Thu, 10 Nov 2022 18:55:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32BB6F80589; Thu, 10 Nov 2022 18:55:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38650F8057D
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 18:55:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38650F8057D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZiKvSEBQ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F36A961DC6;
 Thu, 10 Nov 2022 17:55:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56558C433D6;
 Thu, 10 Nov 2022 17:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668102940;
 bh=nT8Rei7szj8IWbgeHq2VZPxMg0sBm/lpJSJSRA5PJtY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ZiKvSEBQ8Mtc8icLaRod5bwT/MyvAjuwz3760nmImR4z36J09KVVvnCqkD+eI30+V
 5sDFhdOPLXwlx+KZuBQCN9BV4yjkMqUn1jvGFEhgvgbx9Sk9YbyJ7NH0MN3RcJ6zfC
 9soHNgRs5ogxOJ2TiXHjtwjgk/yGxQhugdWt2mV2U6VNdTD5QEgppXkjnyl9YeEYvJ
 AkwN1uD4p8Gy9NtlZtkC8SA9vf/ALt5xst/+NjgFym3j7a71U8oGmuJDS/js6jfOd4
 jBHTWHxax5w2QejB3x+8HT9S9pxh1UaCC9/cUBi7NF9mwMyKg860wfLfVnOrdKamX/
 Y5rNK4fgJCA1Q==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221107164154.21925-1-pierre-louis.bossart@linux.intel.com>
References: <20221107164154.21925-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: Intel: update D0i3 registers for MTL
Message-Id: <166810293907.959181.18240549996831243592.b4-ty@kernel.org>
Date: Thu, 10 Nov 2022 17:55:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: tiwai@suse.de
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

On Mon, 7 Nov 2022 10:41:51 -0600, Pierre-Louis Bossart wrote:
> MeteorLake relies on a different register for D0i3 configuration, add
> a platform-specific callback to abstract the differences.
> 
> Rander Wang (3):
>   ASoC: SOF: Intel: add d0i3 definition for MTL
>   ASoC: SOF: Intel: add d0i3_offset in chip_info
>   ASoC: SOF: Intel: set d0i3 register with d0i3_offset
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: Intel: add d0i3 definition for MTL
      commit: 09e3c1d398bec1c9684f91563e82a2f455548448
[2/3] ASoC: SOF: Intel: add d0i3_offset in chip_info
      commit: f8632adc53e25501c74f25794cddac4dbe3f1c59
[3/3] ASoC: SOF: Intel: set d0i3 register with d0i3_offset
      commit: 57f93492410942355b5a6eacbbe977176ffe5110

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
