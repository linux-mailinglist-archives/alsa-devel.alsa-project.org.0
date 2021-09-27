Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDD7419DA4
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 19:55:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 908F216D2;
	Mon, 27 Sep 2021 19:54:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 908F216D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632765312;
	bh=lo3kLlw5h5aHwdcYgQl4VN4lrcsP1+8zGxGcSHb/GQA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KLuxAmVdC8CVk8hMzC9ZK0HHCD2r8KgUbgydOAw+gdz+QSShB2vKbHM/dszWprnCL
	 5Mn/SICLU5w/qZokvLh4ql53t9v6POKfM/EOAE1fkTwv3EuB1BHohy+944qG9w9DMp
	 Z1Y4fZnZ6EBLkhpCiWCEo3Qsadjhpp5Mt5lysnLc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7A6BF8057B;
	Mon, 27 Sep 2021 19:48:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C370EF8055C; Mon, 27 Sep 2021 19:48:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D09E0F80552
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 19:47:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D09E0F80552
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GXRWUQj/"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C2B9B60F44;
 Mon, 27 Sep 2021 17:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632764877;
 bh=lo3kLlw5h5aHwdcYgQl4VN4lrcsP1+8zGxGcSHb/GQA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GXRWUQj/b3t2srHXAW4Ed6kMTId/0B+ful0yK8Xd8IwtBOW3BKWxERiqMs76VweLq
 1T/4JfH4U/6zpLj0/gIeDfIHJrSp6ZrQ+uLEXjohPQIDLDUb8+kcfOKpWeUl7H3xl2
 BnpWsGnur/yQCfrq4Xm/q17Cw4z2SQUkP0f4z0lF1nQcHgA8mavLJGauD3lIBbig2A
 UBGyI2yklOr1VqHbLsMvdA+vRHOROQHOm3eMcVMls7PJQxM5IBkw3kEf/LNuQJyT6R
 Y4fbfaWx7YNkQsJZ6in8JrEBwsiTmZ5D3RZUCXFUAVRGZ3Hsl9QxtTK/kZvkYWjbkt
 /+v5Vztz4Dukw==
From: Mark Brown <broonie@kernel.org>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH] ASoC: tegra: Constify static snd_soc_dai_ops structs
Date: Mon, 27 Sep 2021 18:45:44 +0100
Message-Id: <163276442023.18200.4951268393685654520.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210922205438.34519-1-rikard.falkeborn@gmail.com>
References: <20210922205438.34519-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-tegra@vger.kernel.org
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

On Wed, 22 Sep 2021 22:54:38 +0200, Rikard Falkeborn wrote:
> The only usage of these is to assign their address to the ops field in
> the snd_soc_dai_driver struct, which is a pointer to const. Make them
> const to allow the compiler to put them in read-only memory.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: Constify static snd_soc_dai_ops structs
      commit: 313fab4820f3b1040bc1bd27cd4c7f69572951e8

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
