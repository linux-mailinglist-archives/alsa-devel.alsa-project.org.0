Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 879A75BEEB7
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 22:47:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D87E74C;
	Tue, 20 Sep 2022 22:46:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D87E74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663706860;
	bh=tRmySnzyxJtvKAKwBC3of+F/OYOk3Qbmx+SXQY2cawg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=khBaw4Upv4yj6/SFrLE2c+bYbQTDF8wgy8e1NNJbtiDtGdNSrpX2zk7RNad/qblTl
	 vqbJJuLKqoH0UnpCsI94shRE5J5JViIJvBVl6LbJSqhIRm0ZWKpgGBp1AgAK3UWjLD
	 Li5xU7ldoLSNwJ+hTRaZaQ4kta+HjQO+NEG8uy+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5101EF80171;
	Tue, 20 Sep 2022 22:46:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33B0DF80155; Tue, 20 Sep 2022 22:46:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F5B1F800F2
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 22:46:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F5B1F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XQeUHjq9"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CEA8A62D4F;
 Tue, 20 Sep 2022 20:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29016C433D6;
 Tue, 20 Sep 2022 20:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663706793;
 bh=tRmySnzyxJtvKAKwBC3of+F/OYOk3Qbmx+SXQY2cawg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=XQeUHjq9Pj072MUFjdlkgmhlsm6Ii6T4hBL32a9gi0MLiF4zTVHr1IuZ9ChsR49q2
 ywhc6tm8Wx7e6jmtIEbtQpss5umPnEwk1KKbAm2ZbHSo8NqArqDYZjEZrJgpfCVUsb
 tM0XQmWuOcd1ttz2tokjpkswBqdgptfnboj58u8woxnqtHmc39crve4KESdNpltLut
 Vh/M9cPSD5Nub4VBhgCTIVO8o6/dhbY4HjBVgFhU0oBQqfBPj+81KxQ+5lqNowo1cF
 PUQ2CZ1J+9ynttgI4yt2cIqFDqyo8MdiJXD3Jrc2owq2/GsWMmFHXT96rYBUcXCKRC
 IfMaQ9beLaDVQ==
From: Mark Brown <broonie@kernel.org>
To: Martin Povišer <povik+lin@cutebit.org>, David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, James Schulman <james.schulman@cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20220915094444.11434-1-povik+lin@cutebit.org>
References: <20220915094444.11434-1-povik+lin@cutebit.org>
Subject: Re: [PATCH v2 00/11] Support for CS42L83 on Apple machines
Message-Id: <166370678777.361668.609808774566315229.b4-ty@kernel.org>
Date: Tue, 20 Sep 2022 21:46:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 - <patches@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ChiYuan Huang <cy_huang@richtek.com>, asahi@lists.linux.dev,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Matt Flax <flatmax@flatmax.com>
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

On Thu, 15 Sep 2022 11:44:33 +0200, Martin Povišer wrote:
> [Changes for v2: Collected ack on compatible. Addressed Richard's
> comments pertaining to error handling. Rebased. Switched to
> dev_err_probe() in few places (added patch #11). Fixed authorship of
> one of Richard's patches.]
> 
> Hi all,
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[01/11] ASoC: dt-bindings: cs42l42: Add 'cs42l83' compatible
        commit: 23162672ff85c24afc19293309500d3a63134ef8
[02/11] ASoC: cs42l42: Add bitclock frequency argument to cs42l42_pll_config()
        commit: 7e178946c3e4e64cebda4e60d0b7e5c02a502d13
[03/11] ASoC: cs42l42: Use cs42l42->dev instead of &i2c_client->dev
        commit: 2feab7e7d8c01b67d9ffbfb902d1591c08e9d564
[04/11] ASoC: cs42l42: Split probe() and remove() into stages
        commit: 0285042feda799edca63b35cea0cda32ed0c47c2
[05/11] ASoC: cs42l42: Split cs42l42_resume into two functions
        commit: 56746683c2560ba5604bb212f73eb01f5edfd312
[06/11] ASoC: cs42l42: Pass component and dai defs into common probe
        commit: 52c2e370df07092437d1515e773d28a5f53fc810
[07/11] ASoC: cs42l42: Split I2C identity into separate module
        commit: ae9f5e607da47104bc3d02e5c0ed237749f5db51
[08/11] ASoC: cs42l42: Export regmap elements to core namespace
        commit: 30b679e2cb058c3dcf6d3ebdf10999f0a7a1644d
[09/11] ASoC: cs42l83: Extend CS42L42 support to new part
        commit: 94d5f62a91aab6ac9c3f4abfd048cbe5f77153ac
[10/11] ASoC: cs42l42: Implement 'set_bclk_ratio'
        commit: ab2940a72dfa823af09abf593512459afe3da460
[11/11] ASoC: cs42l42: Switch to dev_err_probe() helper
        commit: ac088c31d496b885d8268bd1c9746c3c76bf7078

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
