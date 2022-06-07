Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D393F53FC84
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:56:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F58A1AA9;
	Tue,  7 Jun 2022 12:55:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F58A1AA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654599401;
	bh=5FKiCveHakJl4BwUcwH2mfyAiPMxZ2UposRW5i2q8jo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d0/lKb4qGdp7JWcIRUJm6Qs199gsFhp9qVR6M6BXul90/JZV31IJY9KPFlNQIeJDi
	 ZJzaxa3GwUuhP5H+SvGqGOZEYpSWgmaPD7LNMNVLB42/Ivp7hk4KpEpN9GXQ3G7yi7
	 HF9Y1kx1cVbK8M4zyoQRQ7Wgo3Onqam1YAiAABKI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EFD7F80539;
	Tue,  7 Jun 2022 12:55:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7654F8052D; Tue,  7 Jun 2022 12:55:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36EADF804E6
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:55:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36EADF804E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kDSQWULQ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9D9C1B81F0D;
 Tue,  7 Jun 2022 10:55:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E22C34114;
 Tue,  7 Jun 2022 10:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654599299;
 bh=5FKiCveHakJl4BwUcwH2mfyAiPMxZ2UposRW5i2q8jo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=kDSQWULQRFCdXJREiPdCuGF5GOcgfhQB5qV+qJ6YNdTdQVCQ2CZTD8ORUXiSTC5hB
 k9eiaEU6tARw6NsaGGupwXMKdkLStvffxYOZh5EeZDxNTSmx0/6ia9J1U6ApEG7gI3
 azlSoKBuPYeD+HgYEdSAx6Enw51SlcwQ6sMOAeReUM4xAR+vVhAa8pcg1Hwmy7MSav
 nwCBlok4Y2BYUmp91TI/ShvfWL5e5ONr6e8rst/7n4fnpiTzm8Rd1Jk7oaVPtMd91Y
 i1ul422Dn7fkjkBxnTw6r5w0aauICYWC2R6Ues0m/cFjqc0me44wPS8+o1vrXMoLY9
 Utckq2A5sy8RQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Vsujithkumar.Reddy@amd.com
In-Reply-To: <20220519055522.1613813-1-Vsujithkumar.Reddy@amd.com>
References: <20220519055522.1613813-1-Vsujithkumar.Reddy@amd.com>
Subject: Re: [PATCH v2 0/2] ASOC: amd: acp: Add Machine driver changes for
Message-Id: <165459929794.399031.2253628174529248686.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:54:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 ajitkumar.pandey@amd.com, Vijendar.Mukunda@amd.com
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

On Thu, 19 May 2022 11:25:20 +0530, V sujith kumar Reddy wrote:
> Add Machine driver support for nau8825, max98560 and rt5682s,rt1019
> combination
> 
> This patch set depends on:
>         --gpio patch
>         --https://patchwork.kernel.org/project/alsa-devel/patch/20220516160619.17832-1-Vsujithkumar.Reddy@amd.com/
>         --https://patchwork.kernel.org/project/alsa-devel/patch/20220516160619.17832-2-Vsujithkumar.Reddy@amd.com/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: amd: acp: Add support for nau8825 and max98360 card
      commit: 0439eb4d94e0fc17c6dd3829fabd88c11773381d
[2/2] ASoC: amd: acp: Add support for rt5682s and rt1019 card with hs instance
      commit: 4dc6737cfe882765d914fcb88b5eaa14551ffddd

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
