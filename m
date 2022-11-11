Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D0C62603A
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 18:16:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FEAF167D;
	Fri, 11 Nov 2022 18:15:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FEAF167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668186964;
	bh=dVQOi/S03pY1FV8kYP5MkzaNPG8ZfLE8AOpJOHFEgpA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jpxD78vGdaLRVOc/QKZaT9BEijoAe7C4tqE9E1HWweqo4/BV8agEI6xxSIZ+GL4yG
	 //+yZjiLr1wImSGM7+kL+lyZqNXTjJzVF4a3LMYqI23SCefijOwHcir8h8DK9cr1xS
	 gvgOoeBaDNxb8UenCkqXk/nhLTfKgOVp6ZoOLzOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC06EF80519;
	Fri, 11 Nov 2022 18:15:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BB22F804B1; Fri, 11 Nov 2022 18:15:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCD1FF800F8
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 18:15:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCD1FF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VcBLZ5sf"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3DCDBB8267A;
 Fri, 11 Nov 2022 17:14:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3D23C433D6;
 Fri, 11 Nov 2022 17:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668186897;
 bh=dVQOi/S03pY1FV8kYP5MkzaNPG8ZfLE8AOpJOHFEgpA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=VcBLZ5sfSCJcOtfczUE3GqDYjn9Ci0NhoXAoeLsLTDGoh4mfUhS182/7uoxCD3FMk
 FcZ/KKbfyHZwx3QePIaUZv7qn8Gy8WLzgjvJ65mnOVe5pgrXizZ2VWiXzSfznCS+wk
 Bjom4RHydT6ug7d8gc6Ilyr/htWCA6DL4qErs1UC2tcZbBxv89kqp8k2tj+Th4b2O6
 bHtQFUljdbEnanlBIr3q2Byye/0dWCHOHfzFjqpCTiLKrwaP58oaLCEJkwHB4LgF9P
 uT1ZHoo6FZGgZBDD+W5UPqOqkOGGAKiEEmfe/cy5760HAvq7a8P+DM5rxXT8/nHHUJ
 HIadv1Uci37/A==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
In-Reply-To: <20221109091234.17180-1-shumingf@realtek.com>
References: <20221109091234.17180-1-shumingf@realtek.com>
Subject: Re: [PATCH 1/4] ASoC: rt1308-sdw: get BQ params property and apply
 them
Message-Id: <166818689552.487154.11843450344019290690.b4-ty@kernel.org>
Date: Fri, 11 Nov 2022 17:14:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, jauliang@realtek.com, derek.fang@realtek.com,
 jfmiranda@gmail.com, flove@realtek.com, pierre-louis.bossart@intel.com
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

On Wed, 9 Nov 2022 17:12:34 +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> If the machine driver level sets the BQ params into the device property,
> the codec driver will get the BQ params and apply them.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: rt1308-sdw: get BQ params property and apply them
      commit: 5efb40b335a70010999311187be4517f5f114009

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
