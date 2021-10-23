Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B10D24383D0
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Oct 2021 15:36:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 126E61675;
	Sat, 23 Oct 2021 15:35:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 126E61675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634996184;
	bh=xLPxRUzLKQ4rn5/2l6LyXgKNELhYzrPv2Oduj7+M1JQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jz0KQhJLhs+htKbXKvzQUnIekM+fcKuu8IqM5DoaELpiOeDdfA7PE1yMJ9hTk0zD0
	 z0ZqP/AD7kWefixja68tl7DtnQDyp9PSlnf9egA18ftg4algm3xVgejUjr+cJKRJZU
	 UvdMc1vpXFrsrHiR6qZsGUtwxmxPLAS/HfjUrOEE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 833FBF80256;
	Sat, 23 Oct 2021 15:34:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 256E5F801DB; Sat, 23 Oct 2021 15:34:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65D5AF801DB
 for <alsa-devel@alsa-project.org>; Sat, 23 Oct 2021 15:34:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65D5AF801DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XRXRSbS5"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9AFFB6101B;
 Sat, 23 Oct 2021 13:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634996071;
 bh=xLPxRUzLKQ4rn5/2l6LyXgKNELhYzrPv2Oduj7+M1JQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XRXRSbS5cQz7qDmckPaA0wjEtyZ1TjMo6Ge9Br3KQC207cx7SJurnQdQjwVG5f29C
 8zpWGe36Qk6lAjBexiSZtE9SZeZVVvXgRnSeXSg9jZcJrjKyF/Dc0PB9MT9NUn6Fau
 2e28BLqdenG6Nry9CcLi8BlIHqjs3vhqhcaJ2eTeOmTGV9IlF6EEFNt649STZwwS81
 YPzkYHLuLxYUlbrYB6xbNmgxMtsfpw+nfa1HyaWWZrgN/+lgyr5LrybIyixyZOjC4e
 djNODggOPvdQ0UzYn5laHt6JOaqcnBi5cNDxu3WiN4VAP/+TFjZU9v9jJMSMqtKP+j
 cbfPICzRbHzhA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 0/2] ASoC: meson: axg: fix TDM channel order sync
Date: Sat, 23 Oct 2021 14:34:25 +0100
Message-Id: <163499605422.842779.12859165358802966225.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211020114217.133153-1-jbrunet@baylibre.com>
References: <20211020114217.133153-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

On Wed, 20 Oct 2021 13:42:15 +0200, Jerome Brunet wrote:
> On the Amlogic AXG series, the TODDR FIFO may get out of sync with the TDM
> decoder if the decoder is started before the FIFO. The channel appears
> shifted in memory in an unpredictable way.
> 
> To fix this, the trick is to start the FIFO before the TDM decoder. This
> way the FIFO is already waiting when the 1st channel is produced and it is
> correctly placed in memory.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: meson: axg-card: make links nonatomic
      commit: e138233e56e9829e65b6293887063a1a3ccb2d68
[2/2] ASoC: meson: axg-tdm-interface: manage formatters in trigger
      commit: bf5e4887eeddb48480568466536aa08ec7f179a5

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
