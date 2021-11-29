Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A605461C16
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Nov 2021 17:47:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C64241F39;
	Mon, 29 Nov 2021 17:46:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C64241F39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638204447;
	bh=N4ZsljVphFQ5StDB/sEhAMzkAq4w3lBf222fINgc9tE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M3N1h8ALQN8hN/llYYhsN50JRxLRzUWgSxpQQxtiLlSpKsYmDR2lCdLs2yb4vRvcy
	 YHbwlC7VtxhMjUIW9/yQxqOapXf5Qe+DK9UxWlqAkjgSbUfloRA0JFKukW3mNbeKpA
	 rIHSTmbXLRuJZExQzZsLkT5wa6iyhkEmhA/kEhQU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28604F804FF;
	Mon, 29 Nov 2021 17:45:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C53EF804FD; Mon, 29 Nov 2021 17:45:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44286F804F2
 for <alsa-devel@alsa-project.org>; Mon, 29 Nov 2021 17:45:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44286F804F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XMiY1W5y"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0F246B80E60;
 Mon, 29 Nov 2021 16:45:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59C47C53FAD;
 Mon, 29 Nov 2021 16:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638204339;
 bh=N4ZsljVphFQ5StDB/sEhAMzkAq4w3lBf222fINgc9tE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=XMiY1W5y76QmZfECOYoQ8nyKVg/eBDxnhSwgmYRf5bqpvItsCFYwEq+c/uOY8xMXq
 dPcRYqVi6MogqXQuHGnCwZsUqoDd+rgYmv98wT0wftZEXPqf52+40CICYcJA69JLLV
 FkaSKJ6UgS/FEmXUg5y2nE/xQBGdE6ib9OBBzuD+mdKCRE7cnzOf78PK5hm+GPNQxV
 bxe4nLFv/oKzAOQC1G1bbTXKxzz8EvlOUDLGvaT9N0b2NVEzt1cHmxQkLcmXJYuHru
 ySg0jheIiMe8r9TyGrd7lFS+X5qLXo8cGNH1Id8CItdHPnIkdybFxKy/MA1UhL6S0X
 feot23CSRpXFw==
From: Mark Brown <broonie@kernel.org>
To: lvzhaoxiong <lvzhaoxiong@huaqin.corp-partner.google.com>,
 lgirdwood@gmail.com
In-Reply-To: <20211123024329.21998-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20211123024329.21998-1-lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: Re: [PATCH] ASoC: qcom: Add support for ALC5682I-VS codec
Message-Id: <163820433805.1716750.13484199254785400045.b4-ty@kernel.org>
Date: Mon, 29 Nov 2021 16:45:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: judyhsiao@google.com, albertchen@realtek.com, alsa-devel@alsa-project.org,
 derek.fang@realtek.com, linux-kernel@vger.kernel.org
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

On Tue, 23 Nov 2021 10:43:29 +0800, lvzhaoxiong wrote:
> Qcom machine driver adds rt5682s support in this patch.
> Card name can be specified from dts by model property, and driver makes
> use of the name to distinguish which headset codec is on the board.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: Add support for ALC5682I-VS codec
      commit: 425c5fce8a03c9da70a4c763cd7db22fbb422dcf

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
