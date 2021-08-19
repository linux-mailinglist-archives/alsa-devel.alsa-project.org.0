Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8712D3F208A
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Aug 2021 21:24:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D48F168A;
	Thu, 19 Aug 2021 21:23:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D48F168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629401044;
	bh=5nD+NxhHJqubpk1hmDTlASfSl9wCtYPZQgvo9y0BqQ4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qX4v2pF+UruJiDdE36TU8/WJe9yTYLjmtD9zYhfOgxpJ6P+mSdRj6cjQ/7RaSduao
	 qocedasqcz3SyU0E1vSOEe3jdBmnnpqTPxMhracJeShapKis6VFFfK7opncRQjSb+9
	 cZ30BjowRKvQje9sY+MeexzgOBJoFlqC5z5HlfD0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 554DBF801EC;
	Thu, 19 Aug 2021 21:22:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF5FEF80272; Thu, 19 Aug 2021 21:22:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 734DBF801EC
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 21:22:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 734DBF801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="X7qpYVrZ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B8AF060F39;
 Thu, 19 Aug 2021 19:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629400959;
 bh=5nD+NxhHJqubpk1hmDTlASfSl9wCtYPZQgvo9y0BqQ4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X7qpYVrZi9jpExJW+0EhR4myp+16GytmRKQ5pS0h7qBh2ulj6B+bibLMALhG+GA1D
 6GBChkCKmULVqOSkTXhIfLV59owoafNoQyxZrerc85XE73SXFjxmBJaqrLOxtXg+sq
 RA7DTbYt5CMafK9nisU5gsAtthp93Nn2qZ+wCIHhIYUzPsHek77C/+wn5MGUPRu7/K
 VTB0/+/0i3YOTXJqL/rO2hA/4qQdfXGE3u7MV/4mItIVvQ4oqqJsEpjg2WdakmSdVK
 MiR2nkpaSXOrz5yPXGnZa/zakYuD3ClJlEdHOL3SpMB7RfTT8ZRM+sJ3IqAPqcq0kE
 si0WTWlU7B6dg==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3] ASoC: sh: rz-ssi: Improve error handling in
 rz_ssi_dma_request function
Date: Thu, 19 Aug 2021 20:22:09 +0100
Message-Id: <162940023650.48070.12049950686133021944.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210818101450.15948-1-biju.das.jz@bp.renesas.com>
References: <20210818101450.15948-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>
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

On Wed, 18 Aug 2021 11:14:50 +0100, Biju Das wrote:
> dma_request_chan() returns error pointer in case of failures, but
> the rz_ssi_dma_request() checked for NULL pointer instead.
> 
> This patch fixes the issue by checking for ERR_PTR() instead of
> NULL and sets the DMA pointers to NULL in error case so that ssi
> can fallback to PIO mode.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sh: rz-ssi: Improve error handling in rz_ssi_dma_request function
      commit: 4b14f17912052a6963580dfba04781cfe6ccba02

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
