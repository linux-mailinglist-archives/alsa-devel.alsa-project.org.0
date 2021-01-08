Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECA52EF5BE
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jan 2021 17:32:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 218F71738;
	Fri,  8 Jan 2021 17:31:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 218F71738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610123524;
	bh=wcMtwzIrYkV0N//ezKy6wESkf9IHM1UZrLFcLkpuC6M=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tjFNdgxP3H25T6fx9gy3luFo7tMknfK8xBOQqq7kpTiOKmKJwQuu9e68glbjrA5VU
	 HLE+GKaPBhG0gkCEwquEzYaQIfgq86FCCKMOUD/diBdK8yIW8fjshwKs4IAtnO8kO8
	 Ksc6U13Rg9D7cAkZ+Ot8TN7sGvThRm63YyLRaINY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A692EF800FD;
	Fri,  8 Jan 2021 17:30:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F502F800E9; Fri,  8 Jan 2021 17:30:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1761BF800FD
 for <alsa-devel@alsa-project.org>; Fri,  8 Jan 2021 17:30:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1761BF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fCPitXXk"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B197A238E8;
 Fri,  8 Jan 2021 16:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610123411;
 bh=wcMtwzIrYkV0N//ezKy6wESkf9IHM1UZrLFcLkpuC6M=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=fCPitXXkUMbOM3eAeVjC+zWBVv5QsraUqy0cND1O++fVskhgSfmghT3afUhmlFO6K
 TjnZOqqH1Tld3Ol2QuiNsU3pjHbB9DRj3gfktm+6oAyF55ywM9JjwdnK4QkAEONZcO
 jBOfLU+FuDVYQyhemTRYSkL3u9JHVfYw7sEtaJnoi0OZ6I9u5WVEGejYxO4JVvbLwB
 2FTg1aQ7fmVSsLCbzyr6pYrQo4BSf9vmRtGYucy/NJFWzG71/OyPRNM76jH+jqCwAU
 Vn3O4br0yS5U7XttIORPf9Ir9DGfa1BQKBEeWn4kwJJL2oyMcSu/br9y7ey4pGKrPr
 Z1qkytWS6x5hw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, alsa-devel@alsa-project.org, perex@perex.cz,
 tiwai@suse.com, kuninori.morimoto.gx@renesas.com, peter.ujfalusi@ti.com,
 Xu Wang <vulab@iscas.ac.cn>, gustavoars@kernel.org
In-Reply-To: <20210108085834.7168-1-vulab@iscas.ac.cn>
References: <20210108085834.7168-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: es8328: Remove redundant null check before
 clk_disable_unprepare
Message-Id: <161012338172.40879.13082564120833365290.b4-ty@kernel.org>
Date: Fri, 08 Jan 2021 16:29:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org
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

On Fri, 8 Jan 2021 08:58:34 +0000, Xu Wang wrote:
> Because clk_disable_unprepare() already checked NULL clock parameter,
> so the additional check is unnecessary, just remove it.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: es8328: Remove redundant null check before clk_disable_unprepare
      commit: 31c51a424f5163ee6f14fcc251f81078457123e1

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
