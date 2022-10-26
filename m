Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCA960E6FB
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 20:08:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6127228EC;
	Wed, 26 Oct 2022 20:07:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6127228EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666807711;
	bh=aS3y2hj0qAA32nRil1TjWq+Q9qUMZLHzDbupV1MaL7k=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hLkJhVPfkF6oycR7M+YQndJp7FCvbF4gazv4hF1hr1k3ttiZ2rYiHTQU8NP2NIFek
	 2+Jw31GbwgqrZpNNj1fseeeLbSQmCKxSBjZae1xb69J7StQL0fxX1/MSl6FhbayyvB
	 TgqiqnNhCEpkUyn846DB8K6qnefAnSgbfzVKY648=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC57DF80271;
	Wed, 26 Oct 2022 20:07:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00CEAF8016C; Wed, 26 Oct 2022 20:07:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79E20F800BB
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 20:07:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79E20F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pJmc2uzk"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CD1EC61FE7;
 Wed, 26 Oct 2022 18:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 830ADC433C1;
 Wed, 26 Oct 2022 18:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666807648;
 bh=aS3y2hj0qAA32nRil1TjWq+Q9qUMZLHzDbupV1MaL7k=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=pJmc2uzkZeg7jBopkf0grvMUWTzmWU1xxY0DGnlAyZH2fHpzGsI5SiKA4tpxvnHGJ
 6iyYVV8HX7BBbQmZBzgFDvTo2PUghf8sUtnS3oBKTFpN0Q1l0EHmmqtu39hZp98FG0
 9QAX2DZG7CfIGeTSP8CfZwVQDvJmOlbSP1dlHMM41SBnnP0Guwbp/24HcSDqcxmWjX
 YQIbNy7amPmrQYgcFtz2p8PWN5rKqrd6z6mHcbJH4XSjj9DLszIRTpJ7vHIbF+D5xY
 v9TXRdYv7zNGSc/ZmsGJgZiolM2NuhCYqbYtlzZNV+gx7OYpp2AWyFCZZU9tGeuamE
 ssB5p6xvr+Iwg==
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
In-Reply-To: <20221025024929.2652134-1-tzungbi@kernel.org>
References: <20221025024929.2652134-1-tzungbi@kernel.org>
Subject: Re: [PATCH v2] MAINTAINERS: update Tzung-Bi's email address
Message-Id: <166680764725.867857.9897811859196525874.b4-ty@kernel.org>
Date: Wed, 26 Oct 2022 19:07:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, wenst@chromium.org
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

On Tue, 25 Oct 2022 10:49:29 +0800, Tzung-Bi Shih wrote:
> Use kernel.org account instead.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] MAINTAINERS: update Tzung-Bi's email address
      commit: 69d1abc0214e944dff1d30e201f8fc332a1adf1a

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
