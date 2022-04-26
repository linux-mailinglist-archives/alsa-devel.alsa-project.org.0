Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEDD5104F1
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 19:10:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60BF0173C;
	Tue, 26 Apr 2022 19:09:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60BF0173C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650993021;
	bh=z8XjpnqOvJUbja+qK9jiBSvWbNGD8GrNw7y0G33iHfU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jprBgF1GRzEcZ1QGFI1NRNEBIaZpcOC4axyjGdyuW5Zm8VsWVhQe8qG+YbHGM9UAa
	 pO/pi2Qn6XOQE9+DopPAN68rE7wcrZVvhouKjR4jWZ3BQhHBHnJ1z3MqXNvLQwA9qs
	 Tt3TZ34LJEqoYmGpif6zq/J4b5K6wZKAJvLaaiz4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B66AF8052E;
	Tue, 26 Apr 2022 19:08:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C40A1F80529; Tue, 26 Apr 2022 19:08:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3E4EF8014B
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 19:07:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3E4EF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MwKZLLU4"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A511A615CD;
 Tue, 26 Apr 2022 17:07:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27C6AC385AA;
 Tue, 26 Apr 2022 17:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650992877;
 bh=z8XjpnqOvJUbja+qK9jiBSvWbNGD8GrNw7y0G33iHfU=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=MwKZLLU4pGdM68uuQVPsV8JrCw8WG/PWkfeqfkCgzdGQVUO1puSRaa7fB5xuk9wDw
 JhxdAAM0CFsfR2MySPyYz9Q1Tr8pY6q+dx5DsHSTdDtjuOze3TTrOjL7wUNx4hAV3V
 sK9mu/saDwpFXJ80r787Hc1TsGt6fnw4u87fUvkr8nC/Dd2l0OffAMTwz6MvThRE6e
 PrIroClFFi2gg8CRXVZU2U+Zq1/9OHyHDKDkLgC4Rtcs08NjcNM2KB7Aws7NxArZJu
 VXWGMETP+Kj8LjcNivkdk/ou05iyqamCmCWRcRR2bKiyq9qXfoa6GHW+33XRnmubs2
 y1mO8Z7kDt+9Q==
From: Mark Brown <broonie@kernel.org>
To: stephan@gerhold.net, devicetree@vger.kernel.org, perex@perex.cz,
 tiwai@suse.com, lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
 pbrobinson@gmail.com, lukas.bulwahn@gmail.com, krzk+dt@kernel.org,
 cy_huang@richtek.com, ryan.lee.analog@gmail.com,
 pierre-louis.bossart@linux.intel.com, srinivas.kandagatla@linaro.org,
 hdegoede@redhat.com, drhodes@opensource.cirrus.com,
 tanureal@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 ryans.lee@analog.com, Arnd Bergmann <arnd@arndb.de>, robh+dt@kernel.org,
 alsa-devel@alsa-project.org
In-Reply-To: <20220425173715.1827706-1-ryan.lee.analog@gmail.com>
References: <20220425173715.1827706-1-ryan.lee.analog@gmail.com>
Subject: Re: [PATCH V3 1/2] ASoC: dt-bindings: max98396: add amplifier driver
Message-Id: <165099287287.2323572.11051414352040587552.b4-ty@kernel.org>
Date: Tue, 26 Apr 2022 18:07:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 25 Apr 2022 10:37:15 -0700, Ryan Lee wrote:
> From: Ryan Lee <ryans.lee@analog.com>
> 
> This patch adds dt-bindings information for Analog Devices MAX98396
> and MAX98397 Smart Amplifier.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: max98396: add amplifier driver
      commit: 3a2c9a553f4785555408b32d59ebfe125d8b9f09

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
