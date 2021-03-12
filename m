Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21114339848
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 21:27:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFD3718B4;
	Fri, 12 Mar 2021 21:26:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFD3718B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615580855;
	bh=8REJj3Y9QOcOPMWgnj7DTjSfqgT3/WHmgg80wudwrUY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jn72f6qPLtfEwoSYjXqR3NJ0Ub48hOkGtfM0C3Jpy1uEMBe2Pr2hH2zKrX10itFQH
	 Pq1Oo86Cdgo15YzUs/V8LMPt3fTYriKYcRUY/eL14BBmu7sqG26hvqdRGme2mCETux
	 KMJPVHV+/DMcxU3feoBzxzv15zb3LkyryspeGAGM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B3EFF800AB;
	Fri, 12 Mar 2021 21:25:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6994CF80425; Fri, 12 Mar 2021 21:25:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74337F800AB
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 21:25:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74337F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rCogVS0l"
Received: by mail.kernel.org (Postfix) with ESMTPSA id EF8AB64F77;
 Fri, 12 Mar 2021 20:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615580714;
 bh=8REJj3Y9QOcOPMWgnj7DTjSfqgT3/WHmgg80wudwrUY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=rCogVS0llx+MNZSr0Q5l92YWncdktECXO2bi8AqxfxIhSDf6D7DgZYdJn2K1f5a52
 qKF+y8nMjWldGaZlFJeAPzZ8or2020LN+Nd6oq5NoU1Hkmqamgzfgqkf/gzK4pX5iC
 kNdlbfC/lzfhw3YMTTfoSDNoMCjtmJEKmwQrK10kUlCS8qdgn/UZEY54njb8CIAgLU
 KDmCr/wTXhjUPvPIFxE37wlysdLErAUahyIpBeWJoTNJOPi/VRBee2oTXXAgNIDlI+
 As9FzL39rlHzQGfoqgeK5OpZNo3F6zx77XdzhtVhN3T85sAY+GcqYI6Fq+owYvbT56
 e3pPk2b6O8K0A==
From: Mark Brown <broonie@kernel.org>
To: Jack Yu <jack.yu@realtek.com>, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, lars@metafoo.de
In-Reply-To: <949671bd00c14b6d9aa5e85cc14be5d4@realtek.com>
References: <949671bd00c14b6d9aa5e85cc14be5d4@realtek.com>
Subject: Re: [PATCH v2] ASoC: rt1015p: add acpi device id for rt1015p
Message-Id: <161558062957.11113.13025947723315918621.b4-ty@kernel.org>
Date: Fri, 12 Mar 2021 20:23:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, , kent_chen@realtek.com,
	kent_chen@realtek.com, "[陳建宏]"@alsa-project.org,
	shumingf@realtek.com, Derek@alsa-project.org,
	Shuming@alsa-project.org, 方德義@alsa-project.org,
	derek.fang@realtek.com, 范書銘@alsa-project.org,
	"Flove(HsinFu)" <flove@realtek.com>
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

On Fri, 12 Mar 2021 02:45:15 +0000, Jack Yu wrote:
> Add acpi device id for rt1015p.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1015p: add acpi device id for rt1015p
      commit: 464b489a7885d6a89b0dfa7b7f1f56e2db80700d

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
