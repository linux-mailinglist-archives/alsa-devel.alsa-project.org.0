Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B3B656B1A
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 13:57:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95CB273A9;
	Tue, 27 Dec 2022 13:57:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95CB273A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672145877;
	bh=jwJ3gYVZg/wd6rOxqD2UjAIUN05A1rPdGSTSIc9QPSM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Y/XdvxzGZvTHfUng76DEZDoh2bsT+pcnxXi+UAVP1h45puM7PfYU9blm2FaxNB/aE
	 pK0D6UrwYAsisLfWybk3sM2HOyH9xvu6WfXAmTtLOGz0uwPWmtzV3AZkhjF7VVzMoI
	 aMkWU2FNNLQ6UPFZJJzrPvinkuasqvJR/Ymjx2Qo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B15EF8023B;
	Tue, 27 Dec 2022 13:56:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78DA7F804E4; Tue, 27 Dec 2022 13:56:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E02C4F804B4
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 13:56:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E02C4F804B4
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cEOBWWfY
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4610B61120;
 Tue, 27 Dec 2022 12:56:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 501DAC433D2;
 Tue, 27 Dec 2022 12:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672145807;
 bh=jwJ3gYVZg/wd6rOxqD2UjAIUN05A1rPdGSTSIc9QPSM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=cEOBWWfYwhX+vi+hIc9qPtxxGfizpZofUZ10zJ5PpYpm/9SF6bHWGyZNMbPrU4g3I
 th6Tn/xPuiherZpQyJI5mHjG2lQW+8zTO4I55sxKs6z7RZ1/DZCWz2jOkb20tvK9LA
 E1fI7xgJeGKN3XFhbg9wICQQ+rcSWCqraYqHpRTfrtJKncrNTxliGhuRHfw9QiLBp7
 VtmDIiN6Z5IVCpK/5nChh3KoA6RvPIA88hD629d+BQONqgWZ0V51I8zW1gGgOFFp+n
 nT6d5x8M/OWR+y34sewk1N7keA1hGj6XKwty8RZkic+BBokiUes2bv6E4xR2jBHAL+
 QivAevwyMbXQg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 perex@perex.cz, tiwai@suse.com, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, Claudiu Beznea <claudiu.beznea@microchip.com>
In-Reply-To: <20221213112851.89212-1-claudiu.beznea@microchip.com>
References: <20221213112851.89212-1-claudiu.beznea@microchip.com>
Subject: Re: [PATCH v3 0/4] ASoC: microchip: power saving features and cleanups
Message-Id: <167214580504.324212.14250110724683049782.b4-ty@kernel.org>
Date: Tue, 27 Dec 2022 12:56:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-7ab1d
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, 13 Dec 2022 13:28:47 +0200, Claudiu Beznea wrote:
> The following series adds runtime PM and suspend to RAM features for
> mchp-pdmc driver.
> 
> Along with it 2 cleanup patches were added:
> - patch 1/4: use vendor,device.yaml file format for Microchip AT91 ASoC
>   bindings
> - patch 4/4: use FIELD_PREP() in mchp-spdiftx.c
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: dt-bindings: microchip: use proper naming syntax
      commit: cfec019399f6a90ae7b73b0edff053d10ba1ad25
[2/4] ASoC: mchp-pdmc: use runtime pm for clock power saving
      commit: e8c8e9de4ee3e9e1231b4f179c3f0e340bc2b1cf
[3/4] ASoC: mchp-pdmc: add support for suspend to RAM
      commit: 404c61c47d84bf1662e9d698e4f0c42898893c59
[4/4] ASoC: mchp-spdiftx: use FIELD_PREP() where possible
      commit: 24c86c8a3bb1bd12aa8bc32933df7394b83233dc

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
