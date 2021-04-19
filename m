Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6979F36491A
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Apr 2021 19:36:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEC6A1676;
	Mon, 19 Apr 2021 19:35:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEC6A1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618853762;
	bh=sDWUj9habLD/i+iNJ5PqHCdn74WREZM2NfWjpP2MevE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K1/Q2JcB6+os51HRbBplkiQFxK3FJr5YAnlE86DY0OpuaBTz1dXRBt4JDg4rUaElk
	 c6Q3p/nfr3fj0i4QLOxOr81EAUDzwBvoqsL69hjQLLpzJI0HTguuy87VlCYYtEYSSO
	 M/potx1hjl0OFuD1pF/YIziadclQlDMx+GcG5f6E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64245F80256;
	Mon, 19 Apr 2021 19:34:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22947F80256; Mon, 19 Apr 2021 19:34:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13010F800C5
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 19:34:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13010F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Zhm4RO4E"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C8B6961246;
 Mon, 19 Apr 2021 17:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618853664;
 bh=sDWUj9habLD/i+iNJ5PqHCdn74WREZM2NfWjpP2MevE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zhm4RO4Ezt2EL6WeQXNwUpJFyexXIp81UI2WV/XGjZSSMtRbKXK9Bm5CPy1MywAh7
 grgf44F45dSKHaXO1J+F1W5LGTbnNLstkx53e8XwdM39Y3dSJvAYdFtKPfXboPM67D
 QPUM+dfqQWRKi9w3zvN3KLbiBCDHv2tdo39Z0Y0sbwoV8sGTP0jH6GyqVGD39ihati
 l/bjBzKjQtOjQjB8QEdbpfUQ16OMwhA/XlNuoR5pN77ctf2Zxw/gx/d02lGUTGw6Mt
 cLVx35EE5NN+TzH5kZ/JT+PxvSGql5xFh1H2INqtFJHotm1g5ViICp2X/qk8zrXRGn
 9LdhBGXarnbdg==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, Shengjiu Wang <shengjiu.wang@nxp.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, perex@perex.cz
Subject: Re: [PATCH v2] ASoC: ak4458: check reset control status
Date: Mon, 19 Apr 2021 18:33:47 +0100
Message-Id: <161885301896.45150.16197357933362327027.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1618826072-29344-1-git-send-email-shengjiu.wang@nxp.com>
References: <1618826072-29344-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

On Mon, 19 Apr 2021 17:54:32 +0800, Shengjiu Wang wrote:
> check the return value of ak4458_rstn_control.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ak4458: check reset control status
      commit: e86a53fb64ed0a4749eeac2eccc7a6412fd3c920

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
