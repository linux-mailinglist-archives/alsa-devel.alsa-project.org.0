Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D05C3EBB7E
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Aug 2021 19:29:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14CF31866;
	Fri, 13 Aug 2021 19:28:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14CF31866
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628875746;
	bh=X9xb+srgjuPKAtDJ5/bKUFQSGy3Rv+wh5CECPkydDlY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X6VtsdiF38C83pXrnpqqTGZnlBe6IR8nPoL5yqU018gx1lJ3o9ggNic1Pqcofhd/+
	 CBM5+l+6GabrfMnliCkZ3fl/5wjzdCx11MbVELQj/oG8sw+Urs2Fsv1diPAkOhDEli
	 ud7laSyYYDwZx6aruOuEg+hVU8QoSafYTsf9Fvns=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAE6BF804E2;
	Fri, 13 Aug 2021 19:26:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 647C1F804B4; Fri, 13 Aug 2021 19:26:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9765F802D2
 for <alsa-devel@alsa-project.org>; Fri, 13 Aug 2021 19:26:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9765F802D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="h7Kghsdb"
Received: by mail.kernel.org (Postfix) with ESMTPSA id DB82860F51;
 Fri, 13 Aug 2021 17:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628875593;
 bh=X9xb+srgjuPKAtDJ5/bKUFQSGy3Rv+wh5CECPkydDlY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h7Kghsdb/NIatsLWDLD9RCuCKGPmX0EjBlq1iR6UdxokZ/+kFCBspuJQhzkkRGRWN
 cYM8feeKcgqHBcPkZKE4Crw8NO1OfVw/fpfLACkXC0SG7OdzQOh6LGjTXXBnOuLTcZ
 q3/7P74CwITSoDyMy0E7vSyhDs4KMS6wwGZaa/U7/Pj7FleGSzgUB0Tc6hhyzjic8t
 iiNIpN9npBWtrp7/PODL9h8IU66/0zTzjaEJchkZdAdPF9D7s5Rv5meeQiCpt9hYTt
 SzezYGslPayeuJAJBCRwb51vh6w0gCUiLpND2OktkKiaeco55pEp5AcUamb9aGY+Uc
 wFlqDVLXF8Lmg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2 0/4] ASoC: SOF: Intel: DMI L1 power optimization for
 HDaudio platforms
Date: Fri, 13 Aug 2021 18:26:03 +0100
Message-Id: <162887455324.19744.15113340723624817120.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210812231940.172547-1-pierre-louis.bossart@linux.intel.com>
References: <20210812231940.172547-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Mark Brown <broonie@kernel.org>
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

On Thu, 12 Aug 2021 18:19:36 -0500, Pierre-Louis Bossart wrote:
> This patchset provides an optimization that result in significant power
> savings on Intel HDAudio platforms using SOF (Sound Open Firmware).
> 
> We previously prevented the Intel DSP from enabling the DMI_L1
> capability to work-around issues with pause on capture streams. It
> turns out that this also prevented the platform from entering high C
> states in full-duplex usages such as videoconferencing - a rather
> basic use case since the start of the pandemic.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: SOF: Intel: Kconfig: clarify DMI L1 option description
      commit: 6f28c883b7ba8c611a842b4701eb4fb8bd76b70b
[2/4] ASoC: SOF: Intel: hda-stream: remove always true condition
      commit: d2556edadbf2929dd7b04de59daeb0a571dc0349
[3/4] ASoC: SOF: Intel: simplify logic for DMI_L1 handling
      commit: 5503e938fef3f66240670d28f7d5db7f2dc8f35a
[4/4] ASoC: SOF: Intel: make DMI L1 selection more robust
      commit: 246dd4287dfbaaddc1511c744893621814618bc8

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
