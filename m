Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6D7419D79
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 19:50:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5996716A6;
	Mon, 27 Sep 2021 19:49:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5996716A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632765034;
	bh=2YGyL+hXBkGHE1pwjNYrXFcwqsXr+FHDD0uurCfgPHE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fXWaOq7TYeiXf8DMuKvOdX6X3ksU+6cdJ3FJOqNUguxDkzyjHNfE0wEVCPVyr7Hxt
	 u/LfTa8QUB0ssktJcTKhT4FeQqlwGlQnKuhQFOjn+1Pn0jf2si247HtAgylUt/w/X9
	 7TpZiO3fK3X5Sd9xGx2CZXAbq7FJYV/Pw+fV60j8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B480F804FF;
	Mon, 27 Sep 2021 19:47:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03F1FF80507; Mon, 27 Sep 2021 19:47:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BDD7F804EC
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 19:47:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BDD7F804EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lLDqq0vS"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 62DE860F92;
 Mon, 27 Sep 2021 17:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632764838;
 bh=2YGyL+hXBkGHE1pwjNYrXFcwqsXr+FHDD0uurCfgPHE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lLDqq0vSUhxyIzWIeYveRYQFxU/sG2mYtbx1oQmFjwe16srp3N34OKNOeDbW7oSFp
 RX6u9hV4V7ChymScJNE7LfSWA+gH5B22J3U1nvhlbV4+G6pQAxbx5qqV4GOVDO78/4
 itJmcnPVyp6EfLxhYRvb/kf62rHgAUJRdc7vDxAFV+eeXvUwDEPI+iDG5e5DowEvRZ
 Ah196uWO3TJ1woklg7crYKdie35jRIG4JQuoCYyS8vj5o7XZvld/R48fcAatNHZiSg
 rJafketEnONqD9SlbrSpMgebFX4HXdwdKnjg9LgBxUNE7Hwow6tz02hp+6MyIguUCV
 QvAu7OUwTrvOw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 James Schulman <james.schulman@cirrus.com>, Takashi Iwai <tiwai@suse.com>,
 Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>, Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ASoC: cs42l42: Use two thresholds and increased wait time
 for manual type detection
Date: Mon, 27 Sep 2021 18:45:29 +0100
Message-Id: <163276442024.18200.9987078305118050259.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210927111437.18113-1-vitalyr@opensource.cirrus.com>
References: <20210927111437.18113-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 Stefan Binding <sbinding@opensource.cirrus.com>
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

On Mon, 27 Sep 2021 12:14:37 +0100, Vitaly Rodionov wrote:
> From: Stefan Binding <sbinding@opensource.cirrus.com>
> 
> Some headsets require very different comparator thresholds for type detection,
> as well as longer settling times. In order to detect a larger number of headsets,
> use 2 thresholds to give maximum coverage (1.25V and 1.75V), as well as a longer
> settling time of 100ms. This will not affect default audotodetect mode
> and applies to manual mode type detection only.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l42: Use two thresholds and increased wait time for manual type detection
      commit: edd6dffdc6670836909972b32a324dbf6c150757

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
