Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B9C317105
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Feb 2021 21:16:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA82C16D8;
	Wed, 10 Feb 2021 21:16:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA82C16D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612988211;
	bh=X1HRLSAszGkdh3lATQv2bUw4+cXGSG1p7K0xQqLcPVQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IJGOAgSq7B9XR4Dpnu4kz16VEOiHBIZoAidTz5Utr5+8/LHkgC6yq7/3eRnFx/SAM
	 poo+jw9crusBoD3pbwC+feguyo/dw9Uq6Ib4OYTvhXMOrt4b4E1snQPFaxyl+SvdU8
	 LP3s/i46jaVpMLkraXcfrDe9YWR7FTupeIi+IsSw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1059F804B1;
	Wed, 10 Feb 2021 21:13:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3F83F80425; Wed, 10 Feb 2021 21:13:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6196CF8032C
 for <alsa-devel@alsa-project.org>; Wed, 10 Feb 2021 21:13:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6196CF8032C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kichIqBA"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8CD0064EDC;
 Wed, 10 Feb 2021 20:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612987981;
 bh=X1HRLSAszGkdh3lATQv2bUw4+cXGSG1p7K0xQqLcPVQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=kichIqBALhDsjjfsuHw/7+1oC5X/Xe9S++IbFUZj+tjABCDPHhDuWsYjQesJOoxbs
 W4iJSp6PneJ531YjKLljn3RTFfOAUaatnXicv2yXS/LirEB2z7TOR9yj5roNDuL2+E
 8O+3k8APhfnEw3kx7MCjOSCrLpP+QMIU6HZNqBSJzfe6wJzTfm93f10s9kxTmNLdtT
 JFyAYWOqpfj3AUN3X3wYoPxgz5PV7/iAcprzIHOZzC8AGKhWSCciLdSxhl0ozAxCn4
 6bjLz8csQAbm/z7wJuzqx6I2+/SDoX8GuicuYpz8ol1t2h5PtWgewbjorRpby68oKI
 YY9H10wwnUQGg==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20210208231853.58761-1-pierre-louis.bossart@linux.intel.com>
References: <20210208231853.58761-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: sof-pci-dev: add missing Up-Extreme quirk
Message-Id: <161298789618.5497.6307898886080250053.b4-ty@kernel.org>
Date: Wed, 10 Feb 2021 20:11:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <bard.liao@intel.com>
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

On Mon, 8 Feb 2021 17:18:53 -0600, Pierre-Louis Bossart wrote:
> The UpExtreme board supports the community key and was missed in
> previous contributions. Add it to make sure the open firmware is
> picked by default without needing a symlink on the target.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: sof-pci-dev: add missing Up-Extreme quirk
      commit: bd8036eb15263a720b8f846861c180b27d050a09

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
