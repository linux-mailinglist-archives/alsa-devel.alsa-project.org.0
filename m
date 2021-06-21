Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C983AF5AF
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 20:52:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C75C16AD;
	Mon, 21 Jun 2021 20:51:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C75C16AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624301527;
	bh=Iubxdx/A0LOWkRzH0XmE/PG82jZyYbybm0iqM02k/K8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f0uUvtEeRvUX7PW6ZIrDDfRZ2KUd1l7vm5DuJPiNyJB0QRa3dhzC6WDhOPaZhAKw4
	 v38JJbr7913QDPi7DFa+dK0i0hrFh1D0nYwgD694W373fvLRy2PKy6t0B1CGzIwoTG
	 th4iu6YBKKMMVydJD+MCBLMy5gXhaYz3kHquI+q0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E35FEF8051C;
	Mon, 21 Jun 2021 20:47:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B647F804E5; Mon, 21 Jun 2021 20:47:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE405F804DF
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 20:47:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE405F804DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iqNceW4J"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A7ED361356;
 Mon, 21 Jun 2021 18:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624301237;
 bh=Iubxdx/A0LOWkRzH0XmE/PG82jZyYbybm0iqM02k/K8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iqNceW4JN57jLG5Cs8HM5C2aCBREYT0iAMSkFQ3FxmKkF8VfhFGk7B/IQqRzuxyTm
 bQorA7OJGw9Oss8sHHun5CHwxxMEoL1ZPNYFwhVrJgXuSwIAjyYTxyrBii37TJRKSG
 y2S2Rd+AnA7W9dK1TkGJCHX0qr210qDIaprrGaU7PO4RFJZ+UbwHARmz9EWhE2d3nT
 LbxBjnYiRsHFINZBN9I/s3t3c1YNRzO2H2j2C+LtF3KUsfT1E5/o/AGybp+d2NoL0F
 kWBuO0XOemln3vP0s71JCwyEkMiw6uCKsDM4ubZhtiGESGZht8Vx7ZGPsJsgcg4836
 wSVPkXW9UdXug==
From: Mark Brown <broonie@kernel.org>
To: Xiubo.Lee@gmail.com, tiwai@suse.com, nicoleotsuka@gmail.com,
 perex@perex.cz, timur@kernel.org, alsa-devel@alsa-project.org,
 festevam@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] ASoC: fsl_xcvr: disable all interrupts when suspend
 happens
Date: Mon, 21 Jun 2021 19:46:06 +0100
Message-Id: <162430055263.9224.18141192734216884293.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1624019913-3380-1-git-send-email-shengjiu.wang@nxp.com>
References: <1624019913-3380-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org,
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

On Fri, 18 Jun 2021 20:38:33 +0800, Shengjiu Wang wrote:
> There is an unhandled interrupt after suspend, which cause endless
> interrupt when system resume, so system may hang.
> 
> Disable all interrupts in runtime suspend callback to avoid above
> issue.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_xcvr: disable all interrupts when suspend happens
      commit: ea837090b388245744988083313f6e9c7c9b9699

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
