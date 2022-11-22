Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E57A633F55
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Nov 2022 15:51:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9CCA1663;
	Tue, 22 Nov 2022 15:50:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9CCA1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669128666;
	bh=MlQTh6em931scU0vFPD06TgB0Jz9yaEqIUgZxlL+sz4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P30wedHDolsnJ34ZA++YAxy6WbWyBIz4CB9PeHIY9Ewl0B4IkvuerLWNb0+0v0BVM
	 +CfsBEKehPGI/qpJl0sU7i8cYEhBEiXb+3BpXV9p4zjxF/LWRs3pug+eym6Zo6dbRt
	 xtO6ySzklwCcC+aZ9/0r628FtmPaaV0is5qz1uQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B432FF80558;
	Tue, 22 Nov 2022 15:49:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15C25F804E2; Tue, 22 Nov 2022 15:49:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DB5EF80154
 for <alsa-devel@alsa-project.org>; Tue, 22 Nov 2022 15:49:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DB5EF80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="a7qNJGuo"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1852261738;
 Tue, 22 Nov 2022 14:49:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C0E1C433D7;
 Tue, 22 Nov 2022 14:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669128556;
 bh=MlQTh6em931scU0vFPD06TgB0Jz9yaEqIUgZxlL+sz4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=a7qNJGuoTrEFvEMymDtEahkAHd9eUtS2u8IgITQgG7Yy/CcLO/N28qgvuf4gAtAV+
 5ecE+P9usprqibwgKXzL5Jc1P1CQBnIIa+6LgkKsgJT4yoxMydYk/XpEQb0Sl9ctYa
 aoF3XWUcIEdL5Qfw9wDHMLjNiXKYWLZtVfArzJQDwxrwPDfNCj0saiIelG1psctn7h
 vR8PQoi5u7//lpoOld8CnZM22L0MVDwcx1Qhf5hTj3X7bTtr0/uMIGBDu2FlTW38YC
 o6DLxiEno0JaUIA7yhDf5ySj5/pAk7gxezWQZKGKR8bYsASbfOlRB2yQoNmaeuXAld
 3WdBVas9hYBow==
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, tiwai@suse.de
In-Reply-To: <20221122052052.687281-1-yung-chuan.liao@linux.intel.com>
References: <20221122052052.687281-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: sof_sdw: Add support for SKU 0C4F product
Message-Id: <166912855482.213382.5851344342031222379.b4-ty@kernel.org>
Date: Tue, 22 Nov 2022 14:49:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, peter.ujfalusi@linux.intel.com,
 ranjani.sridharan@linux.intel.com, bard.liao@intel.com,
 pierre-louis.bossart@linux.intel.com
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

On Tue, 22 Nov 2022 13:20:52 +0800, Bard Liao wrote:
> From: Gongjun Song <gongjun.song@intel.com>
> 
> SKU 0C4F product supports a SoundWire headset codec, SoundWire
> capture from local microphones and two SoundWire amplifiers.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_sdw: Add support for SKU 0C4F product
      commit: a9248c868c39440369c614598b2465d1a1b1cf62

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
