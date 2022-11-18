Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD9362F93D
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Nov 2022 16:26:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A50116AB;
	Fri, 18 Nov 2022 16:25:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A50116AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668785209;
	bh=/XzbCsA/7MpvokWg1tz3z62uDOQXn3+sAi9aw/PhfKc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M2owv5U5wR3CnRYkl3Anx5jrFYturH64hdAB6uSbfbjlP8XZw4S3mT7VLgNf5wE7c
	 plJkHGYwpZmhgNJJpZ3dsJb+EjUs7d0e5XsA4gvXd/qwPGmG7Ot7WqGzqwh4nEzQrC
	 lOp8nO5/LDFZvzAFZ4YCA+IBi3/XebhKpFrdmbp4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFE67F804AC;
	Fri, 18 Nov 2022 16:25:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03CF6F8020D; Fri, 18 Nov 2022 16:25:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2535F801D8
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 16:25:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2535F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dbBUKYLv"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 358B4B82434;
 Fri, 18 Nov 2022 15:25:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59C41C433D6;
 Fri, 18 Nov 2022 15:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668785122;
 bh=/XzbCsA/7MpvokWg1tz3z62uDOQXn3+sAi9aw/PhfKc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=dbBUKYLv4Y4eooasqNx1u0FhrLnsEPKatambdbtxQC+2TDsNQjY+5EZG+4h3vD4BU
 70URA/sTXSSq912Qc751zv6Uu3WDc0JFqighqK1aUn7k5/EuDe8YjUZ09t0ReqDNgT
 nrw5kVVw5nVa+m1DhpYW6gS+IoQRBAk16HERAts3d6TMEkduWCmcyODAfBhDSQyhGY
 TC6FbyPmoFjxXEKQCkZC3nriPGU8laMWu0uV/qDg2anzpeqGkwIQXJlB6bi10cwH4F
 GMlR7y/L9R3v7Hpg4kxCIXNg/5TyIdzWZo9tKPDL+ZS9NRVoQE9TMTd2llWcWcQqxr
 ZwrQZ9YxYDDdA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20221118113052.1340593-1-cezary.rojewski@intel.com>
References: <20221118113052.1340593-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH] ASoC: Intel: avs: Initialize private data for subsequent
 HDA FEs
Message-Id: <166878512000.955590.4095144613199197260.b4-ty@kernel.org>
Date: Fri, 18 Nov 2022 15:25:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: hdegoede@redhat.com, tiwai@suse.com, pierre-louis.bossart@linux.intel.com,
 amadeuszx.slawinski@linux.intel.com
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

On Fri, 18 Nov 2022 12:30:52 +0100, Cezary Rojewski wrote:
> HDAudio implementation found in sound/pci/hda expects a valid stream
> pointer in substream->runtime->private_data location. For ASoC users,
> that should point to a valid link stream which is assigned when BE
> opens.
> 
> As BE borrows its runtime from FE, the information may be lost when
> reparenting comes into picture - see dpcm_be_reparent(). To support the
> DPCM reparenting functionality for HDAudio scenarios while still
> fulfilling expectations of HDAudio common code, have all FEs point to
> the same private data.
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: avs: Initialize private data for subsequent HDA FEs
      commit: f38d4c72cb2d68e73d3e54feb68febd6b7c4bfd2

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
