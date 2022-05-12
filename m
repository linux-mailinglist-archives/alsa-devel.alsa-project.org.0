Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D324652529D
	for <lists+alsa-devel@lfdr.de>; Thu, 12 May 2022 18:32:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 642DB1ACB;
	Thu, 12 May 2022 18:32:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 642DB1ACB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652373177;
	bh=CJZwb1Sl9HBHmIsu2oe8lFHpjv+lfimn6XeZUXqaKd4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tGQ0e3n9jlYyBNNXS+ONPvzz8Gc5FpUDZS5hUIKmRyKuuB3yJS/U0SoX4O98DWFeI
	 5xbW9FIdsHXLVzP+e7p9dTSFBvk3jLhnN3G3eZWitLuUhs0Sbh0wZDd8KvlLvctLtC
	 nfXNmIcxCme034k8o3abUa6BUDei3xXva9S6lBMI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6868F8011C;
	Thu, 12 May 2022 18:31:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BC51F80245; Thu, 12 May 2022 18:31:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03385F8010B
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 18:31:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03385F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VqMmtopV"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 68080B829B3;
 Thu, 12 May 2022 16:31:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A0B1C385B8;
 Thu, 12 May 2022 16:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652373110;
 bh=CJZwb1Sl9HBHmIsu2oe8lFHpjv+lfimn6XeZUXqaKd4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=VqMmtopVWZuz56Zfo8/VkhdA/bBAbN+G8HmSzJ7n9ldG3NihkOEeu6NT2YA69ZBaj
 NTXJTOftaXCtM3kIIrW1+Qq2Qb6SOeNfYBhv2zmdmbZ0aSZcDxxqEutQg6s+PUwrN3
 +tvzKB7DPaY9aNWRJeJhS4qrc0BjPcOpFVBni9DsQ/R+HFjKm+8rGWUaZONqxoA/BX
 Ow1ve0a57BR+wQQAC4XZQk8jA3buGCH/HVLuqc3zTt9TQjJvEVwpFTDr9j5WicYEW2
 SAmlo8Eru3hJ+tmgCh3W7hLWZHjxjbHpheGTJQXZWNgK3xqBZKMn2vPl19vC8Eq8e0
 dBFx76EtHay1g==
From: Mark Brown <broonie@kernel.org>
To: ranjani.sridharan@linux.intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20220511171648.1622993-1-ranjani.sridharan@linux.intel.com>
References: <20220511171648.1622993-1-ranjani.sridharan@linux.intel.com>
Subject: Re: [PATCH 0/5] ASoC: SOF: Add IPC4 FW loader support
Message-Id: <165237310907.1053236.13076909214868441868.b4-ty@kernel.org>
Date: Thu, 12 May 2022 17:31:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.com
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

On Wed, 11 May 2022 10:16:43 -0700, Ranjani Sridharan wrote:
> The patches in this series add support for FW loading for IPC4 in the SOF
> driver.
> 
> Ranjani Sridharan (5):
>   ASoC: SOF: Intel: HDA: Set IPC4-specific DSP ops for CaVS platforms
>   ASoC: SOF: Add IPC4 private header
>   ASoC: SOF: Add header for IPC4 manifest
>   ASoC: SOF: IPC4: Add FW loader ops
>   ASoC: SOF: Intel: HDA: Set up sof_ipc4_fw_data for IPC4
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: SOF: Intel: HDA: Set IPC4-specific DSP ops for CaVS platforms
      commit: e3105c0ccc3e706584030159b6fde54cab2f8aef
[2/5] ASoC: SOF: Add IPC4 private header
      commit: 0af829041d3f8e8f585f5692884d9c7402e7794d
[3/5] ASoC: SOF: Add header for IPC4 manifest
      commit: 71cb8ad1a78043ca0eec1686bdd2e65143943b78
[4/5] ASoC: SOF: IPC4: Add FW loader ops
      commit: c62ff366b3c9984dbc30ab032540d1167acdda32
[5/5] ASoC: SOF: Intel: HDA: Set up sof_ipc4_fw_data for IPC4
      commit: a4cfdebdfe62e276f7626eb55b859fe16dcc28ef

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
