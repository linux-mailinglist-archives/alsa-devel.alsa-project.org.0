Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E2546649F
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 14:42:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A45602699;
	Thu,  2 Dec 2021 14:41:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A45602699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638452528;
	bh=vx6hdCe/4wgrzwpQ2Hj0Hewq51BjCl83piJc+BwakoQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M3V7zi1LI2KNvo2HUCx/19TSax7vdhtobydm+0T+3eEVya3E6sEdAy65zFvnNzR88
	 CzBx4Cnuy8l6MgCUJvxkDXT+Q9h5s4aFc9wyTSYNxAoQJwqBdondk3EtF4A5J8oFn8
	 HBMJhLCZ2qCPfuSgMb0bOGf/DG4NQMsMUpQnmq4M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E62CCF80290;
	Thu,  2 Dec 2021 14:40:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B0F5F802E0; Thu,  2 Dec 2021 14:40:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06F26F800EE
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 14:40:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06F26F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="b5+cz057"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 65F7DB823A7;
 Thu,  2 Dec 2021 13:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE84C53FCC;
 Thu,  2 Dec 2021 13:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638452441;
 bh=vx6hdCe/4wgrzwpQ2Hj0Hewq51BjCl83piJc+BwakoQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=b5+cz0573r0c4WYX1NbIPuE1ylkNQjKQ/EktPk6gNaTKhD2EWhmmgukeLOGcnLZ4J
 U7GLekVVQokWU+uHNd+9PgnMHcZDuWk/2XDdNr44RxuZuizNaJkkWFaJTNid57OIro
 g7o75m4gUMyMcEqhOU6QMwKh3uHZ8RxvcJtLbf6JTxvrwQz8wYLON8lxK0QEs75nSz
 lBM5eOKMVyWbpW2cZdSO2hkZ5gzKf5dxo1bZR+ixOvIXlrQQbjC3ckyG8BLvDs/Q0L
 fszl/guAvzVzu4p2XSASfl0JpmMk/L5NfDpimFnmHCAf7PS+4FnaGm4Zbw1PdsBOZv
 1F+05/LryH7mQ==
From: Mark Brown <broonie@kernel.org>
To: Lucas Tanure <tanureal@opensource.cirrus.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Len Brown <lenb@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20211201180004.1402156-1-tanureal@opensource.cirrus.com>
References: <20211201180004.1402156-1-tanureal@opensource.cirrus.com>
Subject: Re: [PATCH v2 1/2] ASoC: amd: Fix dependency for SPI master
Message-Id: <163845243916.1057742.7617064791622054401.b4-ty@kernel.org>
Date: Thu, 02 Dec 2021 13:40:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org
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

On Wed, 1 Dec 2021 18:00:03 +0000, Lucas Tanure wrote:
> Set SPI_MASTER as dependency as is using CS35L41 SPI driver
> 
> Fixes: 96792fdd77cd1 ("ASoC: amd: enable vangogh platform machine driver build")
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: amd: Fix dependency for SPI master
      commit: 19a628d8f1a6c16263d8037a918427207c8a95a0
[2/2] ASoC: cs35l41: Fix undefined reference to core functions
      commit: 0695ad92fe1a0bb7697eb92c6a145a73c5ab0e24

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
