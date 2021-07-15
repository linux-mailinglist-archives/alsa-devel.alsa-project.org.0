Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE0B3CAD55
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 21:56:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8FAF1679;
	Thu, 15 Jul 2021 21:55:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8FAF1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626378983;
	bh=OzI5qhsw9AWhl+RWxjpuRTSWtsOMOBgBrux4E7l3Z2I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yu8UV+zzLgzK4Cw9uMeCIGgGI3Uu0heH4G6wKVZZEuj84312KDUjwAgvTFMfTLapA
	 E/3LTz8rF7mdo6x8k8u/k3eABUsXmHtqXy8n8chLQDI3JpxlSHPdIm0UcIJmWDMr0B
	 AdSiBNa7nIjjCT9vKlnm99O39H1u1s4aR8Kl37rg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 503D9F800D3;
	Thu, 15 Jul 2021 21:54:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85FEDF8020C; Thu, 15 Jul 2021 21:54:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 035FCF80095
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 21:54:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 035FCF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NH+fs8Mu"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 05C9661396;
 Thu, 15 Jul 2021 19:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626378882;
 bh=OzI5qhsw9AWhl+RWxjpuRTSWtsOMOBgBrux4E7l3Z2I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NH+fs8MuRLsG1XRUSbfDBM8sdao0m6yKhpXexYBnFO8fjVUi5nLJRF8uG1fkRspDo
 NL4FCx7JB6WOMqxjeH6ZbhaUmCVbjbNgA+lU0Nbf05eYHogat2YAWwLpZmXCxthpGG
 xmWWdZT46YmgKYG+WJ2SIsMCca2zzLvyLY0dEwVBqknjGStVC4OBGclOvDKBHtSt6B
 zLAl1k3zTVp9+lHM8GBDG08TwKMHTF1YjtdKj+ZNZ1sqh/pK5N8N8HAzqikaLJJa5X
 fT0VrVqZVLI+CRLtWguNNm3nPE/2DYcH6f3uXLdzEHsRCyarghyo7KDE/czJSqZJ4j
 fyiBG2tycEQ1w==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: renesas: rsnd: Fix incorrect 'port'
 regex schema
Date: Thu, 15 Jul 2021 20:53:58 +0100
Message-Id: <162637883862.27669.2616702519037982107.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210715185952.1470138-1-robh@kernel.org>
References: <20210715185952.1470138-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

On Thu, 15 Jul 2021 12:59:52 -0600, Rob Herring wrote:
> A property regex goes under 'patternProperties', not 'properties'
> schema. Otherwise, the regex is interpretted as a fixed string.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] ASoC: dt-bindings: renesas: rsnd: Fix incorrect 'port' regex schema
      commit: 9a3223b0713369e6258fd8656e0c0a5ed794d186

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
