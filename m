Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9562A4E30
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 19:17:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 945BC169D;
	Tue,  3 Nov 2020 19:16:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 945BC169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604427439;
	bh=5UltucK6s2A1DMaA85HSo+6/+RGCiSN47Y1rerLA9wQ=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fJDfPCH9ODeyJfRnCjy71hWA6Z4eU/iuoFhKJO0cgdduCQqpuGOuTNU/LJzwv00E9
	 zwSV6esHhGqFUY47khBJBK/QK8vQ84ye1ahU/M/B4TMGnnBi8liW5woUYVxldXQHJH
	 b7fcGxANsQRuHXUFvwv6Euvevx/KA0/NxBuQjpp4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26808F804C2;
	Tue,  3 Nov 2020 19:15:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD694F804C1; Tue,  3 Nov 2020 19:14:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BEADF804BC
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 19:14:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BEADF804BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QmFbZigE"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7B114207BB;
 Tue,  3 Nov 2020 18:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604427295;
 bh=5UltucK6s2A1DMaA85HSo+6/+RGCiSN47Y1rerLA9wQ=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=QmFbZigE6zpz66C8ex8lIelJQhfdgOP38AZUWug+EFvW5K7tioEDKs7Z9aMNs9QD+
 hyPOj75RdUH6f+byu0qv704PemX1jqDZqa9xYv8IMUJgQolgFf62i2fFsoQvCxulOj
 b72m0x0McSZ7Sbjm65m19X6vzPc/aXRjvtnpnWZo=
Date: Tue, 03 Nov 2020 18:14:45 +0000
From: Mark Brown <broonie@kernel.org>
To: spujar@nvidia.com, jonathanh@nvidia.com, perex@perex.cz,
 "trix@redhat.com" <trix@redhat.com>, thierry.reding@gmail.com,
 lgirdwood@gmail.com, tiwai@suse.com
In-Reply-To: <20201101172412.2306144-1-trix@redhat.com>
References: <20201101172412.2306144-1-trix@redhat.com>
Subject: Re: [PATCH] ASoC: tegra: remove unneeded semicolon
Message-Id: <160442726962.14840.14493047027283567209.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
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

On Sun, 1 Nov 2020 09:24:12 -0800, trix@redhat.com wrote:
> A semicolon is not needed after a switch statement.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: remove unneeded semicolon
      commit: 0246c6cb246f36ffcac0b843da179ab6510e139b

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
