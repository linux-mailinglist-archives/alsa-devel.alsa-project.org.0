Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF4653FBDC
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:47:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 902BB1A42;
	Tue,  7 Jun 2022 12:46:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 902BB1A42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654598839;
	bh=MpaIdGbaKAMBLJfa7jevH3NryJ/FF1rB5km3FqsCypk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=odaeyLbR42SS+PXgtE6pziQHnGDq6oKj0CfHnKDpItG9IgdEp2f01bs8tXwUfGQ4Y
	 an9yhtLw6KKNDndStDHTRku73XdsqdxLg8/+yA2wa7EC72X2D2PHWtO/l8zvf3cl7+
	 GXZe8UwoIRW4IZv0co8NbbNwY4qcFpju57udTiro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52209F8052E;
	Tue,  7 Jun 2022 12:45:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64BFAF80526; Tue,  7 Jun 2022 12:45:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14BF0F80302
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:45:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14BF0F80302
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aWZvLnCX"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 34C75B81F01;
 Tue,  7 Jun 2022 10:45:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FAA3C385A5;
 Tue,  7 Jun 2022 10:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654598725;
 bh=MpaIdGbaKAMBLJfa7jevH3NryJ/FF1rB5km3FqsCypk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=aWZvLnCXNcZk7SwWw2ChEM3DWON75dXOgbPugmTAyNwp7ROOhIZxRO2RQSkV2Kqb4
 uRFokkW1iMplAJjN2TojScugvWjd7nvDluhm+KdNPXmrhB94/P3yFuleLxa3P3ox9K
 rHLJsD7VPK4xP2E22Y5Jekg1UCqMLSlrcDlJPHAAEQDAYAQJHlQdzAtoBs77T46SKG
 7YyWkdty4tRz8t85Jod/xSwFQc04CE5lvdUJ18J+SZo9jhLbb9JV0w8fiB5/Im28pX
 xuPdtLcr9Rs0XIrpiMUVtcvFHEGGKtkP4xT1IRvpbfd9O9vzycEXIZyYnx8u2F15hI
 zkGHTj5Zs0Nmg==
From: Mark Brown <broonie@kernel.org>
To: Julia.Lawall@inria.fr, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220521111145.81697-79-Julia.Lawall@inria.fr>
References: <20220521111145.81697-79-Julia.Lawall@inria.fr>
Subject: Re: [PATCH] ASoC: amd: acp: fix typo in comment
Message-Id: <165459872329.301808.12651579852525968637.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:45:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
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

On Sat, 21 May 2022 13:11:29 +0200, Julia Lawall wrote:
> Spelling mistake (triple letters) in comment.
> Detected with the help of Coccinelle.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: fix typo in comment
      commit: b661a848a50c0cc3e0b79795c74469d7b50ff4ac

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
