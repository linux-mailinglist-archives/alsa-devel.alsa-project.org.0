Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9045BFAE2
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Sep 2022 11:26:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDD2D1651;
	Wed, 21 Sep 2022 11:25:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDD2D1651
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663752387;
	bh=Fm7uUxvGjUpzhdYGBvMLJdPletDumytisj8ycEeYgK0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PbsRrOx30As2DePq+sGo6zN+nHZQkaXOBbEzhz7bw6aK5LCzNlcOxADQYqrLqsB67
	 82NYG9v3yvjNhQAheyHpW68nXBdY1esDa8jQXGFE12ClhjR9UTDHLe334mJ3eiGtAa
	 j6QbvAtuY1stzt72x7C9nbtKT4Hzjc0ra/Drwapg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 622D7F80539;
	Wed, 21 Sep 2022 11:25:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F05A3F804C2; Wed, 21 Sep 2022 11:25:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1C97F80107
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 11:25:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1C97F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gmi20xMW"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D4B38623B2;
 Wed, 21 Sep 2022 09:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA40C433C1;
 Wed, 21 Sep 2022 09:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663752329;
 bh=Fm7uUxvGjUpzhdYGBvMLJdPletDumytisj8ycEeYgK0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=gmi20xMW6hzLrEFOFX0Zy/6ZspTLaKvcpQaB/LpoQz+SiltCIvWuE/Fr3lQc9+ol/
 kX04ba9r4TZqW+5M2/lu8ncSfDW+4qn0yHIUG61xXQs/4DuVIFkf0D5RLpmd+UwG7k
 r0AMfjALX/5NwNJPcyCX9lZoHuAkR7qttBr+WrkuVnkzd7y5FMeO673ZGOEuiIB4xJ
 S2S7giTPqq0gHENd7E5BIHI0zpAXFprt3qLLU6pIWw5k3Fxs56AI8QiBS+qje5py3g
 QBB4pwoIJ7/DT7BvPEjHOcoGi1yUtHGqI3ZetozvY5PDDtwBnVUwUVNWLGKGNSi1TP
 yJa+B2CrPIetw==
From: Mark Brown <broonie@kernel.org>
To: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20220920194621.19457-1-mario.limonciello@amd.com>
References: <20220920194621.19457-1-mario.limonciello@amd.com>
Subject: Re: [PATCH v2 0/2] Add some models into acp6x quirk list
Message-Id: <166375230411.526450.3070541932734238859.b4-ty@kernel.org>
Date: Wed, 21 Sep 2022 10:25:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: Travis Glenn Hansen <travisghansen@yahoo.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Xiaoyan Li <lxy.lixiaoyan@gmail.com>,
 Saba Kareem Syed <Syed.SabaKareem@amd.com>, Sebastian S <iam@decentr.al>
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

On Tue, 20 Sep 2022 14:46:19 -0500, Mario Limonciello wrote:
> Another model from ASUS and Lenovo have been identified that
> don't include anything in ACPI tables to indicate they require the
> ACP6x DMIC driver to be loaded.
> 
> This series adds them both to the quirk list.
> 
> changes from v1->v2:
>  * Both models were independently sent in v1 but touch the same code,
>    so v2 collates them together.
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/2] ASoC: amd: yc: Add ASUS UM5302TA into DMI table
      commit: 4df5b13dec9e1b5a12db47ee92eb3f7da5c3deb5
[2/2] ASoC: amd: yc: Add Lenovo Yoga Slim 7 Pro X to quirks table
      commit: 2232b2dd8cd4f1e6d554b2c3f6899ce36f791b67

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
