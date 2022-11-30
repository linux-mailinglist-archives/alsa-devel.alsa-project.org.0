Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D8A63D5F1
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Nov 2022 13:48:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F379D16DA;
	Wed, 30 Nov 2022 13:47:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F379D16DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669812530;
	bh=gngkS5ETspjG+YGWPy0iQqW24mpGopAARGUY/RS2Ei8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nXaJkSZqlBxWiJaO5Lnjma0BY6Niil1tL8ABNOW6MXXe9/f0k/SYJUmudv12P4INx
	 2ujTSCQzXkD/7l+0puIBO30ONfbHSj9JuyWi670Q2n8cKxnaHRzCD+hwJBfyjJ/hF1
	 exAHPmd7GLBukHqt5nNoO/iZYfidMkE0uiR8LLLY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90FD7F804E6;
	Wed, 30 Nov 2022 13:47:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DFD9F8023A; Wed, 30 Nov 2022 13:47:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E42CF80118
 for <alsa-devel@alsa-project.org>; Wed, 30 Nov 2022 13:47:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E42CF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Fb21QKDb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8FC59B81A9C;
 Wed, 30 Nov 2022 12:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2CDEC433D6;
 Wed, 30 Nov 2022 12:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669812466;
 bh=gngkS5ETspjG+YGWPy0iQqW24mpGopAARGUY/RS2Ei8=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=Fb21QKDbaYD3FZrIaUBTRMh5bW1jKi4SIdo4NzyfqVDzsXmQ2D0l5MmRZV/5qYBZ4
 eCvGBAUMwFu1hLCovqdn+3Ua8fqjoAJzasLp6XkxjYmvZ7sl873i/FNscH8XZYQjaX
 0mtEFYS6yDTL8wluRkmiJuRz3OQdSlTDFF4NTLnepROWfAHNxQ+eZL8rHhxorKt+8w
 Oj1Y3eGlet2HEQZMxdCaCj6aI8INqdd1qSBH09KLheMF49/yMDoTyryffptdePH3gf
 j51ne2aaWvW8NamQkcgZnE9Obc+bnW2g35KpbYLgi+d3a9NEw5P8z8noqunQ1BaoGa
 FJNWQtzouMQoA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Artem Lukyanov <dukzcry@ya.ru>
In-Reply-To: <20221123065820.55159-1-dukzcry@ya.ru>
References: <20221123065820.55159-1-dukzcry@ya.ru>
Subject: Re: [PATCH] ASoC: amd: yc: Add Xiaomi Redmi Book Pro 14 2022 into DMI
 table
Message-Id: <166981246557.67172.14730406412806659837.b4-ty@kernel.org>
Date: Wed, 30 Nov 2022 12:47:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
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

On Wed, 23 Nov 2022 09:58:20 +0300, Artem Lukyanov wrote:
> This model requires an additional detection quirk to enable the
> internal microphone - BIOS doesn't seem to support AcpDmicConnected
> (nothing in acpidump output).
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Add Xiaomi Redmi Book Pro 14 2022 into DMI table
      commit: c1dd6bf6199752890d8c59d895dd45094da51d1f

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
