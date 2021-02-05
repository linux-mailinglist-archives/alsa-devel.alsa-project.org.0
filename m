Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F02310CC9
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Feb 2021 15:59:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0810F1681;
	Fri,  5 Feb 2021 15:58:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0810F1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612537143;
	bh=PCALSjwqf7yNWI8NKKIEwNbQyxyIhsuNPI9i7gwxoc4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h5tXcNYXHizTtmkJPe2uFA1QWwOCOICRzRLHTakjqL3tpVyYYGvLl2m1QT6jPqzKC
	 3+DNeMmPjZNheMH1e6V9/iKatrFnSEiGzI7V4v8ITHnegSU0uEldKDyJa1XP0/O3UF
	 8uYMaDDAb/F84RfWJYPIJx3yHkOVJjHWRsEawC9M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA541F8023B;
	Fri,  5 Feb 2021 15:57:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2A44F801DB; Fri,  5 Feb 2021 15:57:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 464EBF800C0
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 15:57:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 464EBF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IrsD3Vlx"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 82FF46509A;
 Fri,  5 Feb 2021 14:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612537035;
 bh=PCALSjwqf7yNWI8NKKIEwNbQyxyIhsuNPI9i7gwxoc4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=IrsD3Vlx2hHRJDBBZqVQFm//igTj6KHyAUXvdmqgjIIsNTefSXLzUdZKkKed0niyh
 ba9WUx3Bo+Mg8tIkkibK2KzB3oLGCc3gBq0bSLODkR/7bb5yAbMe8yGG7J5rskyg7d
 /wKN/bHxadyyxBjIlYygtwiiaG1EGLgj3t6O7HV5/aS9DLzux1H+1BiiX3HMz8/Hxm
 Tn3FtKzX2qc9RjDS+QjtIW9lCWKGJpQlxY4BxWbpJ4IbXCs3X+vwUPyoDcGYDhr2xv
 Tx/qMxcHR0jxx3yj9zPr2VYNBaUqENI7LBWNX4Uzaow5OK4xxzyGEPuM+Gp+K2U4yl
 C40sC18u2lBew==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20210204203312.27112-1-pierre-louis.bossart@linux.intel.com>
References: <20210204203312.27112-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: (subset) [PATCH 00/14] ASoC: SOF/Intel/SoundWire: add missing
 quirks and DMIC support
Message-Id: <161253697741.30888.12875121497911209127.b4-ty@kernel.org>
Date: Fri, 05 Feb 2021 14:56:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

On Thu, 4 Feb 2021 14:32:58 -0600, Pierre-Louis Bossart wrote:
> HP Spectre x360 convertible devices rely on a mixed SoundWire+DMIC
> configuration which wasn't well supported. This lead to the discovery
> that we missed the TGL_HDMI quirk on a number of Dell devices, the
> addition of DMIC autodetection (based on NHLT tables), the addition of
> new component strings needed by UCM, and work-arounds due to
> problematic DSDT tables.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/14] ASoC: Intel: sof_sdw: add missing TGL_HDMI quirk for Dell SKU 0A3E
        commit: 5ab3ff4d66960be766a544886667e7c002f17fd6
[02/14] ASoC: Intel: sof_sdw: add missing TGL_HDMI quirk for Dell SKU 0A5E
        commit: f12bbc50f3b14c9b8ed902c6d1da980dd5addcce
[03/14] ASoC: Intel: sof_sdw: add missing TGL_HDMI quirk for Dell SKU 0A32
        commit: 45c92ec32b43c6cb42341ebf07577eefed9d87ec

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
