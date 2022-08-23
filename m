Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2658359EB7A
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 20:52:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE46020C;
	Tue, 23 Aug 2022 20:52:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE46020C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661280772;
	bh=koJ6rzVdomfaX6woLpwAmnTIiggmEx7bd6R+PBkBeJE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fkrMiGSMY9Rc1HUEY7XUJ7JVuQ3Frdmv/BiwE6xP2n+Og+UqlNqvSgDmFRv3hPxd+
	 3O42q+kL+NIz+gwIvKgsQZjJxVByhNQKCq4prg2wBa9eB767jIZiLr8K2yj3ejx/uu
	 qMvkBkeKXvpv23s2WQHdNsNx3o8ldFExBUcMy3KY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02FF5F80563;
	Tue, 23 Aug 2022 20:50:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF2AAF80559; Tue, 23 Aug 2022 20:50:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7216F8054A;
 Tue, 23 Aug 2022 20:50:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7216F8054A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="khbOK72X"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BFD7FB82061;
 Tue, 23 Aug 2022 18:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87473C433D6;
 Tue, 23 Aug 2022 18:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661280614;
 bh=koJ6rzVdomfaX6woLpwAmnTIiggmEx7bd6R+PBkBeJE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=khbOK72XLBDeOqniHglLFaV9Rzz0QuCWnvInfb0uyGxyUXuf/RCp8P5YfsklJMw4C
 z756LyMUOdLbx0TKYbJbq+EAtASfSMDA5q3TV3qESe+0D8+SedqoZOrg+dpmmJbfbb
 tT6IS3vKh5Tw1malONmOwDlqkpbw68RrlG+tAtRjUOhbgsLYq1zKg/7ygMsxIoO2d0
 hlzoraEm+x/x1KkGuYan1Apc0mu+ZnRGhBC56pBlpikNMEfGgkGEKeL+nT9V2p61TX
 GaPi55rpu705WVW/mkjtvXBA6ItQ7SZhtJZCbk7ipamdTPjUB6dllq6WfPyBleDzjh
 yFh8wx/mM8+iw==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, peter.ujfalusi@linux.intel.com,
 daniel.baluta@nxp.com, 
 angelogioacchino.delregno@collabora.com, lgirdwood@gmail.com,
 Chunxu Li <chunxu.li@mediatek.com>
In-Reply-To: <20220805070449.6611-1-chunxu.li@mediatek.com>
References: <20220805070449.6611-1-chunxu.li@mediatek.com>
Subject: Re: [PATCH v2 0/2] Introduce sof_of_machine_select
Message-Id: <166128061023.1031684.5884182401063110421.b4-ty@kernel.org>
Date: Tue, 23 Aug 2022 19:50:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
Cc: alsa-devel@alsa-project.org, tinghan.shen@mediatek.com,
 linux-kernel@vger.kernel.org,
 project_global_chrome_upstream_group@mediatek.com,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
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

On Fri, 5 Aug 2022 15:04:47 +0800, Chunxu Li wrote:
> From: "chunxu.li" <chunxu.li@mediatek.com>
> 
> Change since v1:
>   - remove the callback of_machine_select defined in sof-priv.h
>   - move sof_of_machine_select to common code, and called in
>     sof_machine_check
>   - rename .board field to .compatible in structure snd_sof_of_mach
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: Introduce function sof_of_machine_select
      commit: 6ace85b9838dc0162b474dbbbb6b388e7561f6a7
[2/2] ASoC: SOF: mediatek: Add sof_mt8186_machs for mt8186
      commit: 2dec9e09e955dfc4b7843fa4f9c09e7ee8931b1d

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
