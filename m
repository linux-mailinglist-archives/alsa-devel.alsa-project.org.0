Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C4026171B
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 19:25:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A4A082C;
	Tue,  8 Sep 2020 19:24:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A4A082C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599585943;
	bh=pEej9wdl2o4pGGeWguxQ5u1mZz6PDCU8dgsUAkkSYX8=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QmHIYigZttEmkVUvJ43wO/Nq+13fTk4U073AipvoKzqpUubVfD6yp3r6tm2sYNI6B
	 S959a1Pgn+5nmW5cthAFBrsIwtFOF5TRi6z3AFsk0+pJeZrQsUy2TF3x2opQ02LyUg
	 zzJagsyohcXfaQRmeq2xPEXiN1ynbn3H9v9Og8+4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C61BF802F9;
	Tue,  8 Sep 2020 19:21:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B093CF802F8; Tue,  8 Sep 2020 19:21:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 919DAF802E7
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 19:21:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 919DAF802E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Op1CxB0Y"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3910620768;
 Tue,  8 Sep 2020 17:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599585689;
 bh=pEej9wdl2o4pGGeWguxQ5u1mZz6PDCU8dgsUAkkSYX8=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Op1CxB0YzzQDiytLshJaatvpsapmI4BZt/t2pWs5kq++zp/6Q4KBTdk/wVpnFoUzZ
 NedBBaSfFCkAHYBaxhrxlxAi6+tGZWDd7mjqw7f5NkwYWfcZWXyQzzHAF6UiI6dhEa
 GHZHsba2U4fCmaRRI0xQlnVVqueskANK3p0nJzAo=
Date: Tue, 08 Sep 2020 18:20:45 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20200908092825.1813847-1-kai.vehmanen@linux.intel.com>
References: <20200908092825.1813847-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH 1/2] ASoC: topology: Add support for WO and RO TLV byte
 kcontrols
Message-Id: <159958562063.16576.13216800473027857153.b4-ty@kernel.org>
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Dharageswari R <dharageswari.r@intel.com>, ranjani.sridharan@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 daniel.baluta@nxp.com
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

On Tue, 8 Sep 2020 12:28:24 +0300, Kai Vehmanen wrote:
> This patch adds support for write-only and read-only TLV byte kcontrols
> by checking for appropriate get/put IO handlers.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: topology: Add support for WO and RO TLV byte kcontrols
      commit: 819b9f6002391925b53817ed96638bd40bd1d34f
[2/2] ASoC: SOF: Implement snd_sof_bytes_ext_volatile_get kcontrol IO
      commit: 783560d02dd61aee20d1d00c1c061bcafea30264

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
