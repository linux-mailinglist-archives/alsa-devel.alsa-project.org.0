Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B730259EB6D
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 20:51:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 489A21699;
	Tue, 23 Aug 2022 20:50:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 489A21699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661280704;
	bh=4m1byrsQRJLm/cJqTDuKbmUd4hieFD6ic0Yp5Uh7iUc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MKvyPrnCF9FDyoIMzIvbo5CLimIzRbZsbgZAN2touOt8b0jcVKdQDsbGNu65RX5K3
	 rKH5i8b01oLkTdOuMjIyoiLI/XIxAI+cyp0zg1OZn8L44lcBNkl+LXRdDXMyEg3Xez
	 TnKYoT4Y7EFTYzLc0y+4pje/erS3oJNm/e2hBXBU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75524F80533;
	Tue, 23 Aug 2022 20:50:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74104F80528; Tue, 23 Aug 2022 20:50:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 146F0F800A7
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 20:50:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 146F0F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EDc86ypg"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6F6EB6170D;
 Tue, 23 Aug 2022 18:50:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEF26C433C1;
 Tue, 23 Aug 2022 18:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661280599;
 bh=4m1byrsQRJLm/cJqTDuKbmUd4hieFD6ic0Yp5Uh7iUc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=EDc86ypg0C2gWgwtP6WdeRwdjj9VXBXXmzAlmXTqPS+ZnvMuKTuWWtA3Skt8qjmYs
 xMcuhlMKFYbNfML6QXJoG3MajtPomjOL2Cs7al+pVh3opxshqlZpdgPgGF+zwBOaC3
 REhYwJNqCmbGhxu4MJT64qzUgrWDW7pqPLiFKT0C+Gsa2cTHJ9EaIZW5Z62a4SSF+e
 gbMKe+16XyJvtVgpn/J64oZ9T42RSEG6tWfNrWdjht5y7+ooCEdhDjAp+926oI4v4p
 kN976afNmOnPjjR2LqACAdonfxeQN2rzQefUXHDPnq4Qo0zZsC4yeshTJPBEA9H+al
 /lKVlOpdI8vgQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20220822174937.254873-1-daniel.baluta@oss.nxp.com>
References: <20220822174937.254873-1-daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH] ASoC: SOF: compress: Remove dai_posn variable
Message-Id: <166128059751.1031684.6362088791172112373.b4-ty@kernel.org>
Date: Tue, 23 Aug 2022 19:49:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
Cc: pierre-louis.bossart@linux.intel.com, kernel test robot <lkp@intel.com>,
 yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 ranjani.sridharan@linux.intel.com, Daniel Baluta <daniel.baluta@nxp.com>,
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

On Mon, 22 Aug 2022 20:49:37 +0300, Daniel Baluta wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>
> 
> dai_posn is set but never used. Initial intention was
> to use dai_posn to shorthen one code line but it looks fine
> without it too.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: compress: Remove dai_posn variable
      commit: d45f552a1e44e2885c4b7551564241959d8138be

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
