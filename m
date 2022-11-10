Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8526248D4
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 18:59:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3507B166C;
	Thu, 10 Nov 2022 18:58:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3507B166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668103162;
	bh=Kdwf3HBzQKzgKvV7niLjKG3Y6fwZwErSkKiE9iGJJMg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XYShj/lfZeSRMj5WSiaY1LqLryPPpxraxkU+SURKCAnF48mgB6gjRay9g8gmDeJN8
	 3eFSbi29RZFwFXJ6SsObIINEo+1+4CbMPBU/PUaKmq+8K/c0C4sxTclmnkQSUEdH8f
	 ebQlGgcg5s0GEm9yZDJduw4vI68/2nIJMr9Wjf9Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AC8EF805B1;
	Thu, 10 Nov 2022 18:55:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E47E9F805A9; Thu, 10 Nov 2022 18:55:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B7B4F805A9
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 18:55:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B7B4F805A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BXK0eLGo"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 410E9B822A6;
 Thu, 10 Nov 2022 17:55:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC3D6C433D6;
 Thu, 10 Nov 2022 17:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668102949;
 bh=Kdwf3HBzQKzgKvV7niLjKG3Y6fwZwErSkKiE9iGJJMg=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=BXK0eLGoEiEvF2mpAttVE6XZHMV5Q6YEb2RE6L2eFLQfc78PK4gbCDlbuHYj/7LMz
 evLU7Yisb/kOYTbl5KwJ8+PQ9SZIeJJ4TUZj8Bo2B7YCSI1bkhDgtn0K1/+eFTnetw
 CHrq1AIATw77Ve/SOc/uzKzM8AqRft8A7StTIC+d8a6UO8nvLVzMXugBWdOdoNLeQX
 2U9L/EzUDjddMzbTBE/bhZmrTBlTNUd0yTkz8cT2irwRwp1R44Imj8KlXt57nuvaV8
 AGMf6xXHQl6ZZaBni3luxJ6d/V70ERayTUlwpH119RBuax6ppGCzROI1vlHyf3dAo8
 cG1bOG/Sb1lkg==
From: Mark Brown <broonie@kernel.org>
To: u.kleine-koenig@pengutronix.de, alsa-devel@alsa-project.org, perex@perex.cz,
 cmo@melexis.com, 
 Chancel Liu <chancel.liu@nxp.com>, ckeepax@opensource.cirrus.com,
 shengjiu.wang@nxp.com, chi.minghao@zte.com.cn, 
 ojeda@kernel.org, lgirdwood@gmail.com, luca.ceresoli@bootlin.com,
 patches@opensource.cirrus.com, tiwai@suse.com, 
 xiaolei.wang@windriver.com, steve@sk2.org, linux-kernel@vger.kernel.org
In-Reply-To: <20221109121354.123958-1-chancel.liu@nxp.com>
References: <20221109121354.123958-1-chancel.liu@nxp.com>
Subject: Re: [PATCH v2] ASoC: wm8962: Wait for updated value of
 WM8962_CLOCKING1 register
Message-Id: <166810294654.959181.11432270569807765176.b4-ty@kernel.org>
Date: Thu, 10 Nov 2022 17:55:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
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

On Wed, 9 Nov 2022 20:13:54 +0800, Chancel Liu wrote:
> DSPCLK_DIV field in WM8962_CLOCKING1 register is used to generate
> correct frequency of LRCLK and BCLK. Sometimes the read-only value
> can't be updated timely after enabling SYSCLK. This results in wrong
> calculation values. Delay is introduced here to wait for newest value
> from register. The time of the delay should be at least 500~1000us
> according to test.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm8962: Wait for updated value of WM8962_CLOCKING1 register
      commit: 3ca507bf99611c82dafced73e921c1b10ee12869

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
