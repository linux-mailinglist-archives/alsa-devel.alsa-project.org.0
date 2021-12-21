Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A5747C742
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 20:14:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7FEE1816;
	Tue, 21 Dec 2021 20:13:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7FEE1816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640114060;
	bh=28xw1paPaQH1pBeUDYRXDi5qVPT/FFxg4uLC0xY2BHA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vgSfUxpFdZPNuz6w8brRtNNFTBhyyH+dCxds+mj9bEDqR6vcmiby3w3cN4VCUxG+T
	 gTtKaz9cmXHzPLCVMwmoB+qr16AgjehE4nQ9UZqlrURbeEJInnzAmqBJCPx9z2lk3k
	 uhuRRmWXnu2od/Sh8txXylwnII2rp4ajTBJDxjpQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71F02F804E2;
	Tue, 21 Dec 2021 20:12:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2068DF80125; Tue, 21 Dec 2021 20:12:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82DDAF800B5
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 20:12:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82DDAF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RGip1+Nw"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4EF04B81110;
 Tue, 21 Dec 2021 19:12:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D64C7C36AE9;
 Tue, 21 Dec 2021 19:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640113952;
 bh=28xw1paPaQH1pBeUDYRXDi5qVPT/FFxg4uLC0xY2BHA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=RGip1+NwbqNfWugiUGnKC8FCIadMj6QzrowdC408+HVxMSsXihk2QH+lYs68A6qte
 5J1bfFzp7HrreV/MGtEKwL9OPLlDbIV/ADkRZGte0/nhGQxv14oE7zf7v4GC+KdTyK
 WqVCqNcRZlQc78sQzHjbYg3FTNx536TlMdGcFvavLoVhdp+5tZVQEbuwBeM3Cmx19M
 dS5xUsUd/c2IvWFT8sWDF2J5NTBuVPponKp5gpQEwkHMz3/zeHMqbfrwhGySJV9uVl
 98gc/Gug5TYR9ZQPm+LviuduZ6n1b5SLfzb5SfEiZyzO5LQJR49b+UVjmuPZgOcUqY
 Snk3KKEi44LZA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
In-Reply-To: <20211221171912.237792-1-AjitKumar.Pandey@amd.com>
References: <20211221171912.237792-1-AjitKumar.Pandey@amd.com>
Subject: Re: [PATCH] ASoC: amd: acp: Remove duplicate dependency in Kconfig
Message-Id: <164011394960.93163.1701020272761890274.b4-ty@kernel.org>
Date: Tue, 21 Dec 2021 19:12:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Sunil-kumar.Dommati@amd.com, Geert Uytterhoeven <geert+renesas@glider.be>,
 Arnd Bergmann <arnd@arndb.de>, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Vijendar.Mukunda@amd.com,
 Alexander.Deucher@amd.com
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

On Tue, 21 Dec 2021 22:49:10 +0530, Ajit Kumar Pandey wrote:
> Remove duplicate depends on statement in Kconfig file.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: Remove duplicate dependency in Kconfig
      commit: 15443f6cab25762272312373226d3fd2a742404f

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
