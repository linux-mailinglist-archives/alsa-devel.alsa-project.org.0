Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1592F4D1F10
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 18:26:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A97C618F3;
	Tue,  8 Mar 2022 18:26:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A97C618F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646760411;
	bh=r0phUWwXuodlZB9g376p0WnbRKfdUHRWw2XOE/O6cE8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SBNsHZPH761V/BZKwB2oKhkeDr7XAz4HEv6N5E0ZNy92Se8Q8lvG0BZ/xiaeJCLFF
	 Ws1HRsLACZMI8Jwa5Z3huxrA+lo9xgccL2PJDnEm7C/aak2H3FNbTZrznBNgeRkUvl
	 Gvi9i48b3oYWzAzWMYnyosik5xfwi1bwGSQee4lI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6E7EF8055B;
	Tue,  8 Mar 2022 18:21:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00A12F805B6; Tue,  8 Mar 2022 18:21:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02EADF80508
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 18:21:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02EADF80508
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mNdns1GK"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 73E65B81BA7;
 Tue,  8 Mar 2022 17:21:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 495B4C340F4;
 Tue,  8 Mar 2022 17:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646760077;
 bh=r0phUWwXuodlZB9g376p0WnbRKfdUHRWw2XOE/O6cE8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=mNdns1GKRgyX9nw4gEM7EBaXTiHkW0e9F9nrn4BQ33AO3t7Ze/yUrAFKy3ii0uYdu
 tIsOi5nASBmnmjMNhzPWx9YLgxqSWD6V3Sk2rq7vcxpgVs4wLIXG1P/A3Oexp28/b+
 fR76HmJs9PZVv10MZA0TTUm228WWE+jnK/xQX3JDjGEz0n7x7MlKQboT3KrtuUMs2o
 j4UsyGBDZTqiS8TtEVG0QBXgctLu4UAGaJiqeLCYgKPpANHOUE/beFeTHatFHiQfuf
 AmZYZPZ6pH1WA776ASoVFQs/GElnyl0mlj/HiYwZW63f8TaaD7Cwp+Q3wUzlfErscn
 Nwdiyt8rGCvAg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 devicetree@vger.kernel.org
In-Reply-To: <20220307122202.2251639-1-codrin.ciubotariu@microchip.com>
References: <20220307122202.2251639-1-codrin.ciubotariu@microchip.com>
Subject: Re: (subset) [PATCH v3 0/6] Add driver for SAMA7G5's PDMC
Message-Id: <164676007501.54315.7100142758313239597.b4-ty@kernel.org>
Date: Tue, 08 Mar 2022 17:21:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.com, robh+dt@kernel.org, nicolas.ferre@microchip.com,
 lars@metafoo.de
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

On Mon, 7 Mar 2022 14:21:56 +0200, Codrin Ciubotariu wrote:
> This patch series adds support for Pulse Density Microphone Controller
> (PDMC), present on Microchip's SAMA7G5.
> The PDMC interfaces up to 4 digital microphones having Pulse Density
> Modulated (PDM) outputs. It generates a single clock line and samples 1 or
> 2 data lines. The signal path includes an audio grade programmable
> decimation filter and outputs 24-bit audio words.
> The source of each channel can be independently defined as PDMC_DS0 or
> PDMC_DS1, sampled at the rising or falling edge of PDMC_CLK.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: dmaengine: do not use a NULL prepare_slave_config() callback
      commit: 9a1e13440a4f2e7566fd4c5eae6a53e6400e08a4
[2/6] ASoC: dt-bindings: Document Microchip's PDMC
      commit: 015044e9610c8523794ea6cb55d5388bc00ba96a
[3/6] ASoC: atmel: mchp-pdmc: add PDMC driver
      commit: 50291652af5269813baa6024eb0e81b5f0bbb451

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
