Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE00E543DBD
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jun 2022 22:48:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 499FE1E7B;
	Wed,  8 Jun 2022 22:47:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 499FE1E7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654721289;
	bh=I7MP7j+Aj8ecZXgCH/5MDZumKTh3JqfwRQjdSTkXqeQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f+qkjKn/WRExdyz5a29lBEc1I2sKFCqzcxfKohB8dmPiAr2l3gscd8glRVwkaGl+V
	 EZXbVYtqH4e9yPQMrHElCq8xfov/VNnfVqGsBAiXtzrAwtFj/FUkW83Kkzpxgk0FFD
	 em2nwIT9+Uu9uv9m3achNUb5tTAX+zMeTFB8gn/c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0527F804AE;
	Wed,  8 Jun 2022 22:46:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0B7CF8024C; Wed,  8 Jun 2022 22:46:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53FAEF80116
 for <alsa-devel@alsa-project.org>; Wed,  8 Jun 2022 22:46:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53FAEF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YpXF9XUE"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5E8ACB82B3F;
 Wed,  8 Jun 2022 20:46:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74EBBC3411E;
 Wed,  8 Jun 2022 20:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654721194;
 bh=I7MP7j+Aj8ecZXgCH/5MDZumKTh3JqfwRQjdSTkXqeQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=YpXF9XUE70oWUW9tz9pcLM0j9BO5yfijhA/pOGZqHYElexVcVDLl9AZHCCzFDqeEo
 sNJYyZbs/gGYPIIQb1j9p2zY6ps8BkEBe6L7Xw2tu6l5Jcx3wckj8EnHdzuwMe9IrR
 arVV0LEGF0nqTNSFG3czryY6XvEI0VUEqD4bjKQcznikRaYwJljSg0d5f0tfzcAczy
 B6PIzqwK6BJhmzAfeAYXHpp6l41cEoIainVcU3pEdZfJzm+vaeJqqQaKb8yxeXESAh
 v6L1nmEfKnkcI8oMthAXbHQtC0rtUJwm4HUazD6DAkUUwW7R4N5Kt3KynekA1VxB4s
 Kq4TB4MmDHOWQ==
From: Mark Brown <broonie@kernel.org>
To: amartinz@shiftphones.com, ~postmarketos/upstreaming@lists.sr.ht
In-Reply-To: <20220607074329.13129-1-amartinz@shiftphones.com>
References: <20220607074329.13129-1-amartinz@shiftphones.com>
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: nxp,
 tfa989x: Add tfa9890 support
Message-Id: <165472119120.3018072.2563361398863658752.b4-ty@kernel.org>
Date: Wed, 08 Jun 2022 21:46:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: me@dylanvanassche.be, alsa-devel@alsa-project.org, stephan@gerhold.net,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 caleb@connolly.tech, krzysztof.kozlowski+dt@linaro.org,
 phone-devel@vger.kernel.org, robh@kernel.org
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

On Tue, 7 Jun 2022 09:43:29 +0200, Alexander Martinz wrote:
> Document TFA9890 binding for tfa989x.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: nxp,tfa989x: Add tfa9890 support
      commit: d0da7c8668dc19df157d927a67721ca00e29ff2b
[2/2] ASoC: codecs: tfa989x: Add support for tfa9890
      commit: ef6c320942a2f057204702d769d507186fd7f0b7

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
