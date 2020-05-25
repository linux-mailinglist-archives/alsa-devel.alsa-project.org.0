Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 248D61E111F
	for <lists+alsa-devel@lfdr.de>; Mon, 25 May 2020 16:58:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D3771723;
	Mon, 25 May 2020 16:57:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D3771723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590418727;
	bh=KUD5v/8iqTQSgXiFTVlORVRzIUIUeWtTUfR97FkOp4o=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HPOEW5PM3NP+vAKykQlzjCwBEWO5AS3mC4QGlVloZ1xDyprcTtsjPUJeEzzBcaa1i
	 VNWdT0Cku35gxynR3lTN3aoasKMFncB/xRLfzFC9OwOSTVX3I5vNQjjaHeanBN8wSW
	 XcHfl8he6K+GMsOjV/WDaAjlZiMFW7d1T1tAgADk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FF22F8014E;
	Mon, 25 May 2020 16:57:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1168F8016F; Mon, 25 May 2020 16:57:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42D78F80149
 for <alsa-devel@alsa-project.org>; Mon, 25 May 2020 16:57:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42D78F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sYlkYugr"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 17ACD20888;
 Mon, 25 May 2020 14:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590418619;
 bh=KUD5v/8iqTQSgXiFTVlORVRzIUIUeWtTUfR97FkOp4o=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=sYlkYugrMQR3OWNSa97SKssOXXYqYuOLQr8joG3XafpgIC01C7WBJ8bZugzAQ7raI
 tSSMJsvBAS/U2tuE7YeMlWZ3dGkStLhB/v9HNW2wKzLKvzr92NRfKYCeA2UqGoLhPS
 j4ejl8KUyFcQg2XXrq/hw0ure62xD9z3E8lr1jf0=
Date: Mon, 25 May 2020 15:56:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org
In-Reply-To: <20200520165911.21696-1-kai.vehmanen@linux.intel.com>
References: <20200520165911.21696-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH 0/5] ASoC: SOF: extended manifest support for 5.8
Message-Id: <159041861697.1370.3489834756209033478.b4-ty@kernel.org>
Cc: pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com
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

On Wed, 20 May 2020 19:59:06 +0300, Kai Vehmanen wrote:
> extended firmware manifest is a method to retrieve capabilities
> directly from the firmware file instead of routing the information via
> the DSP and reading it back via IPC (latter mechanism still supported
> but will be deprecated).
> 
> This feature was briefly merged to 5.8 with the series sent on
> 2020-Apr-15, but due to a regression hit with exporting uapi headers,
> the patches got dropped.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: SOF: loader: Adjust validation condition for fw_offset
      commit: 523773b9ea9f430810332aa117ea48f8feafce9a
[2/5] ASoC: SOF: Introduce extended manifest
      commit: a80cf1987a6e728b4d5c8e5041132d46e89c7a45
[3/5] ASoC: SOF: ext_manifest: parse firmware version
      commit: 3e2a89d3ee052ef5346ba933e557c807333ced11
[4/5] ASoC: SOF: ext_manifest: parse windows
      commit: 8d809c15acf23bb2863ec08578ab72de860b3abc
[5/5] ASoC: SOF: ext_manifest: parse compiler version
      commit: 4c4a975178ef06324c80baef0e95209f431645a5

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
