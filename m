Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAB35BD7DA
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 01:10:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 514D984A;
	Tue, 20 Sep 2022 01:09:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 514D984A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663629038;
	bh=FRt7yOXbPx55xy2i6c/5Bo2W0CUcTVzoZFN5G7CqhSU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kPltw/kjhSSfHfNqIkyc7vqVn1iGQsYNISXxMhuDY0G1YA7wCy0+89UF723nB19l8
	 Mq0aDtCeDC2iV3sxAobW4ZJeuWuwu4gFFEq0kghj91m9JhQ4rjoaOM2eOkVKZNlHOi
	 e+F7h1t+HJoziC5jBDKS2O66Zwv/hoq+ZD3ojkdg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1594F800C9;
	Tue, 20 Sep 2022 01:09:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BAA8AF8023A; Tue, 20 Sep 2022 01:09:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2871DF80134
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 01:09:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2871DF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="P9RROkas"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1E2AE61806;
 Mon, 19 Sep 2022 23:09:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ED60C433D6;
 Mon, 19 Sep 2022 23:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663628972;
 bh=FRt7yOXbPx55xy2i6c/5Bo2W0CUcTVzoZFN5G7CqhSU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=P9RROkas0A+tET/WhREU5Vt/+/p/+zZ45wtEb4pbDJjbCyzqOqQ8LEsjda34UDSKg
 PKnxR49OEIytGbmSglE3ufgLnD1QNgIF1H90YfUG5WPDGUGzxQCl16cAJ4bkuZ2cZ7
 P4+1wV6ufcPF6TUYR4QXKuAs+Zp+VgwV69o1R17DRDdFsSL9kv5uYMbOrPso3M9BM7
 xErku821890ejS9wLPCJjG22cOiC2/colqPwVT6Kjwk9AvfvtZXGX/SiWzd7683HgB
 OzQWWT4ui3pvPM6g8z6Ll3Dq+Y97PBCKK7c/sO/KhhafjTIZSTxZi000qgdOqWuU3W
 Ocu7SiKuvanig==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220919114640.42803-1-pierre-louis.bossart@linux.intel.com>
References: <20220919114640.42803-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: sof_sdw: add support for Dell SKU 0AFF
Message-Id: <166362897091.3419380.6583363911970883523.b4-ty@kernel.org>
Date: Tue, 20 Sep 2022 00:09:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>, Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
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

On Mon, 19 Sep 2022 13:46:40 +0200, Pierre-Louis Bossart wrote:
> Yet another SKU that needs a quirk for jack detection and four-speaker
> support.
> 
> 

Applied to

   broonie/sound.git for-linus

Thanks!

[1/1] ASoC: Intel: sof_sdw: add support for Dell SKU 0AFF
      commit: 4a13c949501902d4e6b59cc693005f4ca352dc15

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
