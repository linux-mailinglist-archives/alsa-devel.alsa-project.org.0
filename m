Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B597057A5A9
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jul 2022 19:45:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 596E416BD;
	Tue, 19 Jul 2022 19:44:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 596E416BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658252710;
	bh=XvMJP/gyOj9tpLNhHTh9VPOCWAevdFiwah/LQhNP0Uo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FTTXSaWMU8mbjRPEuUfERq9vGb2tnGZXktBuKVRCItYeVWILBtP6O0PbzSLzhZZ3J
	 melbtDb5NuGL6KvGVHWQ2DeZQEd1rocfVkhL6Pw6+TCvFqsOTzLjBfU8ocxMhqDP3D
	 wG8zkmpzwZQxXL076m9SfFwHCqervPXt+RH0lASg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7234F80125;
	Tue, 19 Jul 2022 19:44:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B724DF801EC; Tue, 19 Jul 2022 19:44:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77B46F80169
 for <alsa-devel@alsa-project.org>; Tue, 19 Jul 2022 19:44:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77B46F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="r14b3l2+"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 66398B81C6D;
 Tue, 19 Jul 2022 17:44:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98344C341C6;
 Tue, 19 Jul 2022 17:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658252643;
 bh=XvMJP/gyOj9tpLNhHTh9VPOCWAevdFiwah/LQhNP0Uo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=r14b3l2+VKNrwMqZwxfSffgTihmJos+jbTKbF1331z/AL4QO6Lr8SglBvZi2IB78r
 Iqi/rhMA8XIUiaVXlprdHPREvxnKfUNH9OdXf4OwALmOEdbfVzO5QKfhMpel3ypN85
 4kfvjapaMq9pUAPc3fPOgCJ6hlNGuxld4cgPmjQTtvQjDmCzsmy2SYcPvs1l+gULwI
 xdAak2EoNo/UivuUqxbdzY5YgNNBjH3UExJPXCE10wbbQBD/6uzJqtNOe7tKvTc761
 PD4mCi9lesblFelMfv8JeLR8X0b7oVq6IJBP03fNtNQxoD2deJXxaeCdPMEP+efPuO
 kWKl90uJJ5aCA==
From: Mark Brown <broonie@kernel.org>
To: mario.limonciello@amd.com, Vijendar.Mukunda@amd.com
In-Reply-To: <20220718213402.19497-1-mario.limonciello@amd.com>
References: <20220718213402.19497-1-mario.limonciello@amd.com>
Subject: Re: [PATCH] ASoC: amd: yc: Decrease level of error message
Message-Id: <165825264132.406155.16263788665685551541.b4-ty@kernel.org>
Date: Tue, 19 Jul 2022 18:44:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org
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

On Mon, 18 Jul 2022 16:34:02 -0500, Mario Limonciello wrote:
> On a number of platforms that contain acp3x controller a new ERR level
> message is showing up:
> 
> `acp6x pci device not found`
> 
> This is because ACP3x and ACP6x share same PCI ID but can be identified
> by PCI revision.  As this is expected behavior for a system with ACP3x
> decrease message to debug.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Decrease level of error message
      commit: 393a40b50fe976a121b15752d2dd6151c7a92126

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
