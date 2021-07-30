Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5373DBEB3
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jul 2021 21:05:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7174209B;
	Fri, 30 Jul 2021 21:04:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7174209B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627671928;
	bh=hkqfv6sJdtnHPzxPPHnYYbnkJm2RGiriUAzYIGvGsns=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qw9SGvutGX0g53XxnCxOt9jmBObSgaRICJS25B/ISOJMokI9VBIT35hvcCZJxKmQe
	 R3nZbqfn1ui98y+bQ+MR4RsByBpf4N0sV0KJyuVIuXxrJyDWRDN4q7K8V2JxymIS8l
	 rg+a9QNKrVD7FifxQBx2SQ1caMRoDh2kD4v5qCJQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8138EF8019B;
	Fri, 30 Jul 2021 21:04:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92394F80253; Fri, 30 Jul 2021 21:03:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D25FF8019B
 for <alsa-devel@alsa-project.org>; Fri, 30 Jul 2021 21:03:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D25FF8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HMn5sF4M"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9CC4E6052B;
 Fri, 30 Jul 2021 19:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627671832;
 bh=hkqfv6sJdtnHPzxPPHnYYbnkJm2RGiriUAzYIGvGsns=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HMn5sF4M2IUwTdUiUIQAHuGynwsMQNgENkgiM5CaAbyPYO4eu59pwKBSJEPU2Xhg1
 /H+sSZ5+lE2vEiOIwTCzQkjjlC8B6gcQyB+95e7TpQAaW+cPqn0KbrjFf+ybVkGTbQ
 O8arudqyHGCxiczN5Ms9aq6dWlrJvSrPNHlPRAiZAqYWj0gIh0HaSMAWkw6nHins4+
 NrpBroPGmEVWT5oPIFXf1DpJl1hx2cznCdFq8656IiOJfAZDg0qtrQm/f61rOGJ8mQ
 qSUMxdzxh6P15PxVFDYeaw4D8JkAKIybFQ/75ARNITInNjvb80JN0VmtFosB0Dk3gk
 cycW6nVbBgH1Q==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: intel: skylake: Drop superfluous mmap callback
Date: Fri, 30 Jul 2021 20:03:34 +0100
Message-Id: <162767143674.56427.3985254573502264402.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210728141930.17740-1-tiwai@suse.de>
References: <20210728141930.17740-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On Wed, 28 Jul 2021 16:19:30 +0200, Takashi Iwai wrote:
> skl_platform_soc_mmap() just calls the standard mmap helper, hence
> it's superfluous.  Let's drop it.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: intel: skylake: Drop superfluous mmap callback
      commit: 9398a834700e124027e73874450e6aa35fae479e

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
