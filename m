Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6391332953C
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 00:37:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEDD6167C;
	Tue,  2 Mar 2021 00:36:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEDD6167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614641847;
	bh=rLQduTIs5jHkiD4vnc60vLesppydKxcbRhb2ApKSTKA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YuLX3KJZT28i1abklEQUcV8tdNhLg7MnFkVT69wZ1TqFNtRD+tR/hOTnT/v8DRwJb
	 Wa9dg5EIEugfaVsdc1abNkx/LPNx5UY/tX979HsKiE2pLZGPWRJZYZM/TCzu7fy+JV
	 tGwga/rgmWWsq5u9Wtp6UCvtDCremffJrChneL+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FF27F800E0;
	Tue,  2 Mar 2021 00:35:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44ADEF8025E; Tue,  2 Mar 2021 00:35:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D7DDF8010B
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 00:35:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D7DDF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sWGTr6FB"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B08E760200;
 Mon,  1 Mar 2021 23:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614641747;
 bh=rLQduTIs5jHkiD4vnc60vLesppydKxcbRhb2ApKSTKA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=sWGTr6FBybOpFuzXYoM16lTr83+IxLLBHpvHer+l4rgkE111DgosHn9kcIRdCFr3s
 BHyQ8oXl1RFc56IYowxI+4iYVWdvyyyeJ/54mf1YzczCWyK2VWvq3pPy/1XWuG3L2T
 l1NZZr+elpK7h/oOJoTnKPvoq/Aixq7g/yFNt0AXz1ZxeNwq27T+Rygv6zh0wLYkFh
 M6RnPMA0LDcqoRX6dIMQ3AZ2KzFMuxpqtPJN/LvqR3sFdT1okjZdKPIubxwQX/6Dut
 8MA630DKvpiRygIXGK5o5jtRygkwgEQUb2zUCcwK6aFhGVXOThKRAqyqlJJcf38Zo6
 frZnMV4xlOKJg==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Colin King <colin.king@canonical.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20210215200501.90697-1-colin.king@canonical.com>
References: <20210215200501.90697-1-colin.king@canonical.com>
Subject: Re: [PATCH][next] ASoC: codecs: lpass-rx-macro: remove redundant
 initialization of variable hph_pwr_mode
Message-Id: <161464168094.31144.11681610130344407838.b4-ty@kernel.org>
Date: Mon, 01 Mar 2021 23:34:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Mon, 15 Feb 2021 20:05:01 +0000, Colin King wrote:
> The variable hph_pwr_mode is being initialized with a value that is
> never read and it is being updated later with a new value.  The
> initialization is redundant and can be removed.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: lpass-rx-macro: remove redundant initialization of variable hph_pwr_mode
      commit: 7f7d1c4fce10ca68e87165898e6232353e4be1af

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
