Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 980FD5E8064
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 19:09:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F6E9829;
	Fri, 23 Sep 2022 19:08:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F6E9829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663952952;
	bh=OHPc09XdtkB69hHy9A41/zPZ29zpuKb1HP+2+9skeBA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vdhL1RKj4Wg1CmiEAAbee4aE/Skf0QKG3p4DeBo5hBuhcHCZCkq9wtoApngun7kXO
	 +slNlracXllV8A8quBNPeVrDdk6yMCeU3Eyxzy7zHpfyvARRW4Dl3eU3rFrjEQZfAL
	 63o+RBCDdSaqIaNLIaSNtPf8+Uwp5p9r+1JnHhQs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F634F80543;
	Fri, 23 Sep 2022 19:07:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93FEAF8053D; Fri, 23 Sep 2022 19:07:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 284BDF80539
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 19:07:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 284BDF80539
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sPYgRfnH"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A5A2B621CA;
 Fri, 23 Sep 2022 17:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AF0DC4314B;
 Fri, 23 Sep 2022 17:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663952827;
 bh=OHPc09XdtkB69hHy9A41/zPZ29zpuKb1HP+2+9skeBA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=sPYgRfnHuP+icV2S/4rnjYWWFaj8e6xIPXcYr3UlywAG6ubQqFuZ4kEsz5L6sWeFT
 cLcHRONKOEfSqNv+DSKMzrb7ORks/ew5Q8Cl645OdytW8p/oFiFeqF0SOrW/DEF+h9
 qpWNmSG28hJJ7IbXp5KYjVZngeXfWYFhBHZ5oA4hYallbJRkFck4oY0McTfYnRnzDZ
 GGn0rjC9ZVSjPw9cqucDA0ynJ/zJdsqCQxR4+3vbEkkBEyb78mKQtbslRNp0/h8wcy
 BMudEc9Jt4SOJiPXHxky4bPdkDrNzyC95CB3Jdn9YDyD2G0RE3SmtewOI94F+yq/Mn
 TVhI4rx9Mcdtg==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, 
 Banajit Goswami <bgoswami@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220921145354.1683791-1-krzysztof.kozlowski@linaro.org>
References: <20220921145354.1683791-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: wcd9335: fix order of Slimbus unprepare/disable
Message-Id: <166395282508.610218.13514868920079222413.b4-ty@kernel.org>
Date: Fri, 23 Sep 2022 18:07:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: stable@vger.kernel.org
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

On Wed, 21 Sep 2022 16:53:53 +0200, Krzysztof Kozlowski wrote:
> Slimbus streams are first prepared and then enabled, so the cleanup path
> should reverse it.  The unprepare sets stream->num_ports to 0 and frees
> the stream->ports.  Calling disable after unprepare was not really
> effective (channels was not deactivated) and could lead to further
> issues due to making transfers on unprepared stream.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: wcd9335: fix order of Slimbus unprepare/disable
      commit: ea8ef003aa53ad23e7705c5cab1c4e664faa6c79
[2/2] ASoC: wcd934x: fix order of Slimbus unprepare/disable
      commit: e96bca7eaa5747633ec638b065630ff83728982a

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
