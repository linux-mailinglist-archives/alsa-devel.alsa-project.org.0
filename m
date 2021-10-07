Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9FE425F5C
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 23:42:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 098311670;
	Thu,  7 Oct 2021 23:41:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 098311670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633642953;
	bh=4TP2znbdwj0H4YvHogb8ZrGweVg56RD4YiI0IW4v1e8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rY4R/JVeB46eEocNmEeWjiZEUipXkGGmQbPGfwND7QOTiO2tg4LdioDTi9E+d4G7D
	 jMFeYEgwfZYqFTAnicPRD9CTQ6YCUOGlG601UZy0NQ8HZSvwOiXW9aElmqoF2bIW8y
	 e4BhgvXD220sAqitFKaKKNBYzRUEz+RiV144WhmU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F512F80529;
	Thu,  7 Oct 2021 23:38:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28D6CF80525; Thu,  7 Oct 2021 23:38:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1274F80511;
 Thu,  7 Oct 2021 23:38:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1274F80511
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ptLS1W8B"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C371961212;
 Thu,  7 Oct 2021 21:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633642688;
 bh=4TP2znbdwj0H4YvHogb8ZrGweVg56RD4YiI0IW4v1e8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ptLS1W8BTb9pfQqTxETwpsqQZdqJZ0FG2SPbnpFoiMvY5qENhgokCN7g/NcddRD17
 jl2qoveZamrSVsK8OncuOrNQmhS18xGB1kB7IXDtUJV4CFDZYuLzDIxk3HgNk3XE1F
 H3N7wB0Ax05E5kT3s1dkoXthtkCESYryURJD8VEkuYckLh1n4rlGz9iM0sr40K7ENm
 rP9+RhFtUz5f3TmDyAMcXwYX4A5pU/Z+3yNhEj7WSXqTppTUfGUtm04qp/mcavEeFi
 MwCgH0UiyrXdsMXc4M9DVRrJkpKDnr4GNjW6tmb26a8+eDR8ipcrXjkFtyG97ehyzf
 8NCrcda73htjw==
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH 0/4] Introduce new SOF helpers
Date: Thu,  7 Oct 2021 22:37:33 +0100
Message-Id: <163364264608.649699.787228689014334103.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211004152147.1268978-1-daniel.baluta@oss.nxp.com>
References: <20211004152147.1268978-1-daniel.baluta@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, Daniel Baluta <daniel.baluta@nxp.com>,
 yang.jie@linux.intel.com, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, Mark Brown <broonie@kernel.org>,
 ranjani.sridharan@linux.intel.com, budliviu@gmail.com,
 peter.ujfalusi@linux.intel.com, sound-open-firmware@alsa-project.org
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

On Mon, 4 Oct 2021 18:21:43 +0300, Daniel Baluta wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>
> 
> This patchseries adds new helpers in order to reduce code duplication
> and prepare for compress audio support with SOF.
> 
> Bud Liviu-Alexandru (1):
>   ASoC: SOF: Make Intel IPC stream ops generic
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: SOF: Introduce snd_sof_mailbox_read / snd_sof_mailbox_write callbacks
      commit: f71f59dd450813684d838e0c1d6602186b7d2d8f
[2/4] ASoC: SOF: Make Intel IPC stream ops generic
      commit: 97e22cbd0dc318f1cedb3546d2047403506bdc2d
[3/4] ASoC: SOF: imx: Use newly introduced generic IPC stream ops
      commit: 40834190aa81270c52104fa9c82a1cae4bd1d359
[4/4] ASoC: SOF: Introduce fragment elapsed notification API
      commit: 858f7a5c45cacbf9965c4735330ee34baa0728f4

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
