Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E0D6248CB
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 18:57:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B46B81673;
	Thu, 10 Nov 2022 18:56:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B46B81673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668103034;
	bh=uV0gS8Zym8itzBA6jauOP1PQV82pLKsM1MencwuTk4s=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X121delelwHnuabFgX2b9yGAuTNCJg4+hzyz2uAMfsO9pZoIyJ8e8/coWEcQiYdmQ
	 r7FTaPaYij705Jrkl7lhZiQJ/MwJs0+QgRY6cXyaWnklpsse5jSJZSxBlyA0Kk6XVA
	 iyRmGkzVm1S0pUYVC8Bj0f92tez1sc9sK8YwezVk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47A44F80557;
	Thu, 10 Nov 2022 18:55:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54ED6F80163; Thu, 10 Nov 2022 18:55:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7EA1F80114
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 18:55:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7EA1F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Z7DtR/W6"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 54F76B822A4;
 Thu, 10 Nov 2022 17:55:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FD9BC43470;
 Thu, 10 Nov 2022 17:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668102929;
 bh=uV0gS8Zym8itzBA6jauOP1PQV82pLKsM1MencwuTk4s=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Z7DtR/W642sNyhHLYsGF9t6PWbPia5GkKB4yquzhZFYAvCBEnTcYcisLNDHz9Bm63
 OTf+hyTDdcTBydtqHGAogg+cRonEAQGpoD4mTzw6wCOXzR0yjB/6ZKcMpZXi42Mbyn
 rANmyW37gYKhH6RrxflwttID57nm9PwgFtphiXGERDsfT8sxydKAd5r+vP7TTHIy7C
 Qzo4XmmpN0Ad/ebklnZr0Gng49ivNjEmDGJ0CXENDqgHpgYmnJ8v99neDo7/nihMGZ
 Soglp8CY1c9ue1w5rdnoosLUs8pL8D++mN2+t8w6PxPD6BzKdOu00cUf0KbyFwR+kn
 J45ZAFyZv45vA==
From: Mark Brown <broonie@kernel.org>
To: Nícolas F. R. A. Prado <nfraprado@collabora.com>
In-Reply-To: <20221104212409.603970-1-nfraprado@collabora.com>
References: <20221104212409.603970-1-nfraprado@collabora.com>
Subject: Re: [PATCH 1/2] ASoC: mediatek: mt8183-da7219: Register to module
 device table
Message-Id: <166810292583.959181.9972965736235328683.b4-ty@kernel.org>
Date: Thu, 10 Nov 2022 17:55:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, Akihiko Odaki <akihiko.odaki@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Miaoqian Lin <linmq006@gmail.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-mediatek@lists.infradead.org,
 Tzung-Bi Shih <tzungbi@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

On Fri, 4 Nov 2022 17:24:07 -0400, Nícolas F. R. A. Prado wrote:
> Register the compatibles for this module on the module device table so
> it can be automatically loaded when a matching device is found on the
> system.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: mediatek: mt8183-da7219: Register to module device table
      commit: b5e004b0e5b57d14ac7804875878cdfdb31c9288
[2/2] ASoC: mediatek: mt8183-mt6358: Register to module device table
      commit: bc63a806acdcfca201c68c820731d74185118789

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
