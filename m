Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB456682F57
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 15:34:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D30B84B;
	Tue, 31 Jan 2023 15:33:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D30B84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675175653;
	bh=Myx6v5SJEcsB0wkZzd7rJQDeP+AJ6PDc3yMAvTekZBc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nMrBNpSYQJD2gqhUsx1V5eyDBMeC/CbuZ2bwMBxG+Ogy5FvB3o6kZhAV7NchmOEzG
	 OIL66wc87hbFq9n7+MrqKm+jLcdiP4qMgIGWg5ZEPyp6D6erhCndftGt0aXKv0fOpm
	 aSJCJagr3UZxiwZPquCmgREMjynOQh1Fk5SO1AVs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53C50F80552;
	Tue, 31 Jan 2023 15:32:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B823F80552; Tue, 31 Jan 2023 15:32:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CA76F8053D
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 15:32:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CA76F8053D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CVXXfXiZ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ACB31B81D1D;
 Tue, 31 Jan 2023 14:32:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1A71C4339B;
 Tue, 31 Jan 2023 14:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675175559;
 bh=Myx6v5SJEcsB0wkZzd7rJQDeP+AJ6PDc3yMAvTekZBc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=CVXXfXiZ+f+yjeAM8M75Kv/1Tl3+rGz8zihNviJpLldcuaRcz4Lm0pALojNtarrcs
 QM8gmRmpERp/OvXL6coCfT6szg3KqT4q/S3scAflRUXo2Ss+MOgfkOUyMJ0xbb11Xz
 A9QDN9C8EkbD6ffG+rSTpQnHAmwxZENCLes91ef3oaPDFKKxJtvzrBDNumA7o7YUFn
 ZjKQbY71fYwv1gDTaYyJ88IR51lO7BYrdMUNv2IyZ4CNFd6qObwV5pFE3GOq4ixLvV
 15suKFwuM6Cq+ELH3RJTq+rfURtCVXtRCXbss8k1uOmUYZ7mjhvbb2SknGtzF+Ftbt
 wG5y8NTlw6E7w==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kiseok Jo <kiseok.jo@irondevice.com>
In-Reply-To: <20230131050946.14385-1-kiseok.jo@irondevice.com>
References: <20230131050946.14385-1-kiseok.jo@irondevice.com>
Subject: Re: [PATCH] ASoC: dt-bindings: irondevice,sma1303.yaml: Fix about
 breaking the checks
Message-Id: <167517555771.691025.14607561012664314039.b4-ty@kernel.org>
Date: Tue, 31 Jan 2023 14:32:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Rob Herring <robh@kernel.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, 31 Jan 2023 05:09:47 +0000, Kiseok Jo wrote:
> Fix the bindings checks like syntax error.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: irondevice,sma1303.yaml: Fix about breaking the checks
      commit: 1c24d12b68fa85fe51184ac64f446b27a4ccfaec

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

