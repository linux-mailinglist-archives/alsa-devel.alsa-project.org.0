Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8CC3B0884
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Jun 2021 17:17:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCB8E1672;
	Tue, 22 Jun 2021 17:16:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCB8E1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624375040;
	bh=K/joDXOjMWjSrHEyHcJiXlslAz8UC17B9j+5gcEpRBE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tZ+mmvm/Em4mL7KjoJauXgZSEwDdIdLb44MOy0p9lqtNu0gNa1a6FcWnTXVjONEWn
	 aQbxq5zdrvcKjAna8OViq19vDDgXhE7tbMpCOasdyUT63pG7mBskXjwoHLhgVUg+34
	 wBf5WAqUEhp+jBwb5umwH00qghl1AHWmXwhfSaSE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 338FBF80161;
	Tue, 22 Jun 2021 17:14:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B336DF804DA; Tue, 22 Jun 2021 17:14:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43D65F804D6
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 17:14:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43D65F804D6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iTKCpOUK"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 80D4A61289;
 Tue, 22 Jun 2021 15:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624374887;
 bh=K/joDXOjMWjSrHEyHcJiXlslAz8UC17B9j+5gcEpRBE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iTKCpOUKN8tfhrT6IoLLxIAmmzpcW53nvFpOrGjauIYAfwUpvE4zGyBXUbw64nSvd
 3adt1jaUXyE2/zsqHYok4SO5LUARxt1GFjgRhqK7Bcj1g3ZspMjTmtOxgkMcBjqjIs
 VQuP5rN6DOa5CISEfMOvR7mL8tYj04Qwn3PoGnask0PRQqT7P+jlEFQ9ABE4xnZ6rN
 EQNWLWWaAa8+IxCm3O5BRnArv/x8KbsFSSzko/1qbhm0YaCwNYBLwtk2GquC6nmaDf
 c0bUbFo3ZXD5pHoZJ3DSn85R0jhpVxp1Cyo0sQFil4o+81noYGGiyDzK3WynvWRNos
 J28yFaOCvprYg==
From: Mark Brown <broonie@kernel.org>
To: timur@kernel.org, tiwai@suse.com, Shengjiu Wang <shengjiu.wang@nxp.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, perex@perex.cz,
 linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com, lgirdwood@gmail.com,
 nicoleotsuka@gmail.com, festevam@gmail.com
Subject: Re: [PATCH] ASoC: fsl-asoc-card: change dev_err to dev_dbg for defer
 probe
Date: Tue, 22 Jun 2021 16:14:07 +0100
Message-Id: <162437355277.1773.16436234060629231949.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1622616132-10391-1-git-send-email-shengjiu.wang@nxp.com>
References: <1622616132-10391-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

On Wed, 2 Jun 2021 14:42:12 +0800, Shengjiu Wang wrote:
> Don't need to print error message for defer probe

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl-asoc-card: change dev_err to dev_dbg for defer probe
      commit: 4b1d51715d1cf78a1527fe426fc0278dcfea1959

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
