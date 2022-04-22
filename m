Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB5F50C48F
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Apr 2022 01:19:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFE911742;
	Sat, 23 Apr 2022 01:18:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFE911742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650669555;
	bh=N8mMOYgvRIc+xlA4Iq4/K7jL6q9OmPW524Yfd8ZIn+g=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GlDwVjxwC96UhoUhuoKnY6Ms2Vno5E05zBV/dCS/ktWFXPwFmUob+JD16Yk4wg9VF
	 fq2R9bwkwD1JYx0WXy5wcyurqT72p2pJbNxzpMEeiwebtOz60PpuIYTg8NgFD3xLCU
	 nY3NjpiueUEnrCEwTFnCAtOUlrQvyw8fPNK6SOcM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE9E1F8032B;
	Sat, 23 Apr 2022 01:17:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DAB8F804FE; Sat, 23 Apr 2022 01:17:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA221F8027C
 for <alsa-devel@alsa-project.org>; Sat, 23 Apr 2022 01:17:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA221F8027C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LidYdUnY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2CD5F61802;
 Fri, 22 Apr 2022 23:17:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A228C385A4;
 Fri, 22 Apr 2022 23:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650669447;
 bh=N8mMOYgvRIc+xlA4Iq4/K7jL6q9OmPW524Yfd8ZIn+g=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=LidYdUnYRs8NjOj54/gg4QkJ6uc+aJOajB5adT1DmSRDAhkqfdLDXKbp0X2R23IX3
 skjGO/DNTyt5IwXHQEIZ2p1YqQY1+PRcSGS/gbq11nLAm457DSzaAZXzt4MlsaaPZE
 XEgCnbwq/ATepXCSB39hS57uWiCZZvz/ZVGk+1GeYUF80CGGSZXnghGFTVyL97QUua
 Kpu/vJgubCsNxWtczTGM2V6Z3RKtjZUYYO38aJ85Cv+24zygJyXZXZkO8ZZRM1tYQR
 Od9uzpnNEX/6153PrQDHuqRBEUACZN2SCQrzrmgJoZOeLvKvGVYg6wn2+L7naypY4a
 EynIkra/xT8ug==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com
In-Reply-To: <20220421162505.302132-1-pierre-louis.bossart@linux.intel.com>
References: <20220421162505.302132-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: soc-core: remove always-false path
Message-Id: <165066944608.12937.10047682660069113499.b4-ty@kernel.org>
Date: Sat, 23 Apr 2022 00:17:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, rander.wang@intel.com
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

On Thu, 21 Apr 2022 11:25:05 -0500, Pierre-Louis Bossart wrote:
> cppcheck throws the following warning:
> 
> sound/soc/soc-core.c:2773:6: style: Condition '!num_widgets' is always
> false [knownConditionTrueFalse]
>  if (!num_widgets) {
>      ^
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-core: remove always-false path
      commit: 8ad0b83e0079564989ccbe5b864cc265a0f5a14d

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
