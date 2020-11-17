Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ECB2B71C1
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 23:40:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6632117DB;
	Tue, 17 Nov 2020 23:39:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6632117DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605652842;
	bh=JomUOrKOnqPHlPsPd61Zm+b963yBxA6emdmm5X3mM+s=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DAliGA7C+xHjTGkbKOBEsEVDegAUSwShB/Dq2kGNzszjuxb8zhK9Q5mJElPjGZsW2
	 loLIo7BZK5qmBRHJtYdPjV9cCDJ9LesR3XwmMOZ4ieWfZWnw8W6jZwOnt3Fpu+RX57
	 ot1/6ZCF6JUCWeGuRs9/p2fhakeCZKKTOw+Mm28s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82C23F804B1;
	Tue, 17 Nov 2020 23:38:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C2BDF804C2; Tue, 17 Nov 2020 23:38:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E50D5F804B1
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 23:38:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E50D5F804B1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="zcIGSbyN"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 62F3D20709;
 Tue, 17 Nov 2020 22:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605652694;
 bh=JomUOrKOnqPHlPsPd61Zm+b963yBxA6emdmm5X3mM+s=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=zcIGSbyNvBScj/TIwOoPxCx7Q6MsgtTQ9TPqKlOu87uFVRll6s/pl+oiZd3/IwZ/g
 wWBYILidTcFUDw0BL10II/DS9mcYZsqeOC56yH5t9KwfGxdYzc95wSIKtK0uPeoHRL
 vHmjrfg8vy3eBzMFcg9mUIgUfcOpOHSqIdKX0/0I=
Date: Tue, 17 Nov 2020 22:37:55 +0000
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Alexandru Ardelean <alexandru.ardelean@analog.com>
In-Reply-To: <20201110152213.37811-1-alexandru.ardelean@analog.com>
References: <20201110152213.37811-1-alexandru.ardelean@analog.com>
Subject: Re: [PATCH] ASoc: adi: Kconfig: Remove depends on for ADI reference
 designs
Message-Id: <160565265704.23689.695597438692063700.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: bogdan.togorean@analog.com, lgirdwood@gmail.com, tiwai@suse.com
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

On Tue, 10 Nov 2020 17:22:13 +0200, Alexandru Ardelean wrote:
> Audio ADI reference designs are also used on some ZynqMP boards, and can
> also be used on Intel FPGA boards and also on some more complex FPGA
> combinations (FPGA cards connected through PCIe).
> 
> This change removes the dependency on Microblaze and Zynq architectures
> to allow the usage of this driver for the systems described above.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoc: adi: Kconfig: Remove depends on for ADI reference designs
      commit: e1ade4c55ae3559b082faf9f5207cc6caba1c546

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
