Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1822C8A1B
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Nov 2020 17:58:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 621ED1739;
	Mon, 30 Nov 2020 17:57:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 621ED1739
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606755500;
	bh=bt05pStDnlS1AD36pvpBBu0/w+xPehwfuoghLTDmq8k=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AzrKX5fWQf5jYrUSUEcdfs5ABJA2d4mNWho+cuEsI20kkx0w1U3TwpcCgp05I6ror
	 486I3xyQLMJx+siUTDFFkoN4s8Vds2Zk5qdxqXGZPMK00yff4dUID6F9b+NhbyKwQl
	 1pxF7NXssxSUZPX2YPgSr+Tpvoy00CwpF/pa7IQg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EE97F804BC;
	Mon, 30 Nov 2020 17:56:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB0D8F804AB; Mon, 30 Nov 2020 17:55:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1275F8025F
 for <alsa-devel@alsa-project.org>; Mon, 30 Nov 2020 17:55:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1275F8025F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="E+NIjiL7"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5779A207F7;
 Mon, 30 Nov 2020 16:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606755348;
 bh=bt05pStDnlS1AD36pvpBBu0/w+xPehwfuoghLTDmq8k=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=E+NIjiL7c/Mccgffu/O0eK6scRBbebV3RXVJwuTFGJ4nBR5lxfOLhHszJWvdb9FL1
 QgvssScDV/elyzp8x2ztIecjyaPNtJjdg+SJTguW6nQMIrLWWZ61z+yCEyS8uacY2Z
 vLotaIiG78pOq6PfUg4frq32JirCeaX+o9QMfQMo=
Date: Mon, 30 Nov 2020 16:55:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20201127143200.16272-1-tiwai@suse.de>
References: <20201127143200.16272-1-tiwai@suse.de>
Subject: Re: [PATCH 0/2] ASoC: amd: Minor fixes for error handling
Message-Id: <160675530955.30326.15066131330909396381.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 alsa-devel@alsa-project.org, Akshu Agrawal <akshu.agrawal@amd.com>
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

On Fri, 27 Nov 2020 15:31:57 +0100, Takashi Iwai wrote:
> this is a set of patches to address the errors appearing on the
> machine that has no I2S DMIC on AMD machine but probed.
> 
> 
> Takashi
> 
> ===
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: amd: Downgrade print level for invalid ACP mode
      commit: 2509bb342e476e740db448cce09c19b92905194e
[2/2] ASoC: amd: Return -ENODEV for non-existing ACPI call
      commit: ab5893fdc0693e4f747ef26194b6bbf628bdb044

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
