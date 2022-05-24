Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F1C533066
	for <lists+alsa-devel@lfdr.de>; Tue, 24 May 2022 20:26:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1C831657;
	Tue, 24 May 2022 20:25:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1C831657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653416790;
	bh=IsSqmCDUURr9/5xQZSxVskm0kP7w7Lk6OXH98DkMxv4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PvKBHbiIasygT6J73pNw5RnV+NhXYx1/ksMHNR/hDYh3Fw899ljLs7QFo/W1fUvbC
	 OThiTmPZi6s7l6tbrYIXJn9daFYlHzYGmWWKkED7YIvV/M+ElwrCDqhSclwQAl+Fqg
	 333UJTLPDgjL2tKzgx/BszAwrlVTNKQaQQN1qI8s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12B2DF804D6;
	Tue, 24 May 2022 20:25:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14131F804D1; Tue, 24 May 2022 20:25:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEF51F80100
 for <alsa-devel@alsa-project.org>; Tue, 24 May 2022 20:25:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEF51F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IRVqMZMQ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C1832B81A99;
 Tue, 24 May 2022 18:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 200AAC34100;
 Tue, 24 May 2022 18:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653416725;
 bh=IsSqmCDUURr9/5xQZSxVskm0kP7w7Lk6OXH98DkMxv4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=IRVqMZMQYCBDCqMfRZHNB4oBMjtiMmAOnh2oO2C3JU3X6R3KV4Eoc7nxv6wY2I5zE
 KWpsOjPpSv2/PsIotxxsSodb80eyhiv2ruoXAN9ZoS8XYdWmbbHt+1khksFF0oByGd
 ES+3MycjpJXHEgHOEVJRdoUmbWJEe5XHtUSPku79MBb02/bGgjHS2zrrmA5SeMdmCW
 llgH5TQzJnesP0StWWrAnVpWDKElevgGxahS88yFGkfjyPvkPJeBERiusVBp500GxJ
 3kPMg5pV4BykiFDsWEwPzyTyCUBbl5OSfSb+Onrx0yNWFeiTWwwa/BMA6xF3Zso5Vw
 Jo0qji14Bp7xg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, ssabakar@amd.com
In-Reply-To: <20220523112956.3087604-1-ssabakar@amd.com>
References: <20220523112956.3087604-1-ssabakar@amd.com>
Subject: Re: [PATCH] ASoC: SOF: amd: Fixed Build error
Message-Id: <165341672284.1497256.4768954734853451749.b4-ty@kernel.org>
Date: Tue, 24 May 2022 19:25:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Sunil-kumar.Dommati@amd.com, lkp@intel.com, ajitkumar.pandey@amd.com,
 lgirdwood@gmail.com, Basavaraj.Hiregoudar@amd.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, Vijendar.Mukunda@amd.com
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

On Mon, 23 May 2022 16:59:53 +0530, Syed Saba kareem wrote:
> Add linux/module.h in acp-pci.c to solve the below dependency
> 
> All error/warnings (new ones prefixed by >>):
> 
> >> sound/soc/amd/acp/acp-pci.c:148:1: warning: data definition has no type or storage class
> 148 | MODULE_DEVICE_TABLE(pci, acp_pci_ids);
> | ^~~~~~~~~~~~~~~~~~~
> >> sound/soc/amd/acp/acp-pci.c:148:1: error: type defaults to 'int' in declaration of 'MODULE_DEVICE_TABLE' [-Werror=implicit-int]
> ...
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: amd: Fixed Build error
      commit: 803a1f7272797faa15a7879cdc70f9adaf3fdcba

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
