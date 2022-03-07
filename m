Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D84B94D08A0
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 21:41:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7067D1768;
	Mon,  7 Mar 2022 21:41:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7067D1768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646685719;
	bh=y3xTSCOAcDKIY8/TSo/4DU7Lm7NXIZjNrsfIiWP4fcQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gBDuO4Z9+cPkFAt4Zyt6RNfiNs+dVhsaYHycB2/IFozNEAzK6tYm+nRYO7AVsOByg
	 asNUlqtqLaN6KYHwbQiPX/l2dFAWkPc0/muTqj1bG3dpkvaYGlHfW88hyX/2cc+u1j
	 FqdHzW+0X7PNf0jP5IsEmG5cu7Hly45AUj1l2bK8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70000F8052D;
	Mon,  7 Mar 2022 21:39:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B6D5F80524; Mon,  7 Mar 2022 21:39:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F98AF8051E
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 21:39:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F98AF8051E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uNAzrzla"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1C65DB81719;
 Mon,  7 Mar 2022 20:39:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5B7C340EF;
 Mon,  7 Mar 2022 20:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646685550;
 bh=y3xTSCOAcDKIY8/TSo/4DU7Lm7NXIZjNrsfIiWP4fcQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=uNAzrzlaVuyW8l2r13Ja+vlzcJJsmeJf/xihcqojGkyG+IUB+eV7tsB5MXlVIyGK1
 ZfXZLiiCjZucWolj7Hz/ZPXnrlLNGN5TU62kX0KnMZZjmt9rwa1IgOzti7Sv8y5bF2
 e7yxT0M1CdLCb8zeu+FifurlaXkomVsWv7YaDK/lmm/nz3Yk2SNCgfagV/yIExoPvn
 FgwkFfvBTjo2FNf5faaR5R5xrgtiFZrimq3zywDZSQiHUEZEzmCj/l3wXN8v9KHkRi
 /c4nH99RslKJOvrbqasVsiO5+mxdRIljkhNqmCKA8NsH2AqDlz0JMeBdcAD8L/fiAx
 3pZ5PpxbpQRrA==
From: Mark Brown <broonie@kernel.org>
To: Simon Trimmer <simont@opensource.cirrus.com>
In-Reply-To: <20220303155016.122125-1-simont@opensource.cirrus.com>
References: <20220303155016.122125-1-simont@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm_adsp: Expand firmware loading search options
Message-Id: <164668554896.3137316.16631599995013598455.b4-ty@kernel.org>
Date: Mon, 07 Mar 2022 20:39:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
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

On Thu, 3 Mar 2022 15:50:16 +0000, Simon Trimmer wrote:
> The parts supported by this driver can have product-specific
> firmware and tunings files. Typically these have been used on
> embedded systems where the manufacturer is responsible for
> installing the correct product-specific firmware files into
> /lib/firmware. However, the linux-firmware repository places all
> available firmwares into /lib/firmware and it is up to the driver to
> select the correct product-specific firmware from that directory.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm_adsp: Expand firmware loading search options
      commit: b6b62d942bbc4d926bcf3799ea3bcaeb105fd04f

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
