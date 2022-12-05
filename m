Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 214E8642EC8
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Dec 2022 18:30:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B64481848;
	Mon,  5 Dec 2022 18:29:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B64481848
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670261432;
	bh=qEvLyHNV7Ss9WZ2ubeO4+eopAKpla3iPV1553qghz4o=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rzc5+SIyNOghbpy5YunXHQZIpA2oHYtnydABGFNiid2sysID8KkZYORmq4gkwIsmS
	 qclwkzFtQ3tIg4in4p3RDWfmEZ8+87gDzJAttnxVbh319fW4E000U5SLQ0S/Z5IOr4
	 gbR88mi57j//Tacyh11SpIMZyazzcJd0WKqsXNjU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8A5FF8054A;
	Mon,  5 Dec 2022 18:29:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19EC3F8047C; Mon,  5 Dec 2022 18:29:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C87C5F800BD
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 18:29:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C87C5F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BWL/d3p+"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0D53CB8118F;
 Mon,  5 Dec 2022 17:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBBF0C433D6;
 Mon,  5 Dec 2022 17:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670261339;
 bh=qEvLyHNV7Ss9WZ2ubeO4+eopAKpla3iPV1553qghz4o=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=BWL/d3p+lHPnnOOSGwKOFAExfqjSlNsa7uTFSPirBXhEJTLWWQSD5zOjMJAIU4P23
 RSVYC41HWAiFZQn0DmPL1F8Vjt7yQqI08QAnSO3smdw5qRSyHNTbQw+aLxDx4P5leb
 Rfj0JMnRvsqGx75rDutGrq58CIpTcL8oWAj2nv/IPehUau4SbXawi2msOdq1Rhojw3
 EWhAZ+bhByjQqcFAxk9sBbM+fSvCiyI/A9FMsP+zcj4MolizM2CeVDt6faXhYXZUEZ
 r1T60gwbI1ofv+rStgaj6SAWyAEcp43Hc3GEhmcGWpiarRtFoVnqJ6sWWd8Vh1J8Ad
 veVGVYvLDi/9Q==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 linux-arm-kernel@lists.infradead.org, Takashi Iwai <tiwai@suse.com>,
 Colin Ian King <colin.i.king@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
 Masami Hiramatsu <mhiramat@kernel.org>
In-Reply-To: <20221202164156.1812971-1-colin.i.king@gmail.com>
References: <20221202164156.1812971-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] ASoC: uniphier: aio-core: Make some read-only
 arrays static const
Message-Id: <167026133758.536379.12650121708842082067.b4-ty@kernel.org>
Date: Mon, 05 Dec 2022 17:28:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Fri, 2 Dec 2022 16:41:56 +0000, Colin Ian King wrote:
> Don't populate the read-only arrays slotsel_2ch, slotsel_multi, v_pll
> and v_div on the stack but instead make them static const. Also makes
> the object code a little smaller.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: uniphier: aio-core: Make some read-only arrays static const
      commit: cb870fdcf1332ee791d7de6bbf350f15fc19c989

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
