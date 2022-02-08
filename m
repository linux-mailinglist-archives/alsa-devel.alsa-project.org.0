Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE72F4ADC06
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Feb 2022 16:09:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79CA11753;
	Tue,  8 Feb 2022 16:08:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79CA11753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644332976;
	bh=tE5AOCEG2c+CQWBhZfHrrAph/5E+Kj0G3ujCO3tjYrc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IQue9fxq2v+eI6ojr453EPv53KOLaHTsSi4AsZf2Oj3vocwhybRvjrc90WNYA8BmB
	 IgwLlsRI6hQr55PDMx9wRAaZ2AZej1BmlTSyoqdybsOqaOycKoCvqOF3ogYNRl1mOA
	 7kNqdrhTXe/ZcBhb+5Y/iT5F6qgw1TBsGc5+EdH4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E1DFF80475;
	Tue,  8 Feb 2022 16:07:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63B09F80475; Tue,  8 Feb 2022 16:07:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0149EF800E1
 for <alsa-devel@alsa-project.org>; Tue,  8 Feb 2022 16:07:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0149EF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aCyA8fwE"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CC4D6614B5;
 Tue,  8 Feb 2022 15:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE0FC340EC;
 Tue,  8 Feb 2022 15:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644332871;
 bh=tE5AOCEG2c+CQWBhZfHrrAph/5E+Kj0G3ujCO3tjYrc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=aCyA8fwEv0DF7n7ABQ3FpsHph+pHkZOHnIONPOhe7I71gGR+J+RXSTgJUXRFVdIwz
 9GG+FEJjq6CklJrzZLQnQ+PCnmKbrJcjCgeTkrRuze6Qxyd0Mt5t35UNK2EguHsuac
 BkNmVkyRTXGx+wCfX4FiY80F0hNiWPe8nc+TTjXYDaEip7ewsOhlP4hH+4HTGWAD1S
 QQzSymulO5lMxjIlT1/LZ5hqTgVXhwJY0Rev0spMmWNQH9Ww8BiFg+XHxdmi8r/ssh
 G3IimoKdG2nSzL+WD3ZS38xuJ37bN/gDtqL7cjAktd0uWJDUvBpEJzxcDlgMKGjr98
 rPehENwx6dweA==
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org,
 Oder Chiou <oder_chiou@realtek.com>
In-Reply-To: <20220207153000.3452802-1-kai.vehmanen@linux.intel.com>
References: <20220207153000.3452802-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH 1/3] ASoC: rt5682s: do not block workqueue if card is
 unbound
Message-Id: <164433286943.2964899.8455003909665521508.b4-ty@kernel.org>
Date: Tue, 08 Feb 2022 15:07:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Shuming Fan <shumingf@realtek.com>, Péter Ujfalusi <peter.ujfalusi@linux.intel.com>, yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com
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

On Mon, 7 Feb 2022 17:29:58 +0200, Kai Vehmanen wrote:
> The current rt5682s_jack_detect_handler() assumes the component
> and card will always show up and implements an infinite usleep
> loop waiting for them to show up.
> 
> This does not hold true if a codec interrupt (or other
> event) occurs when the card is unbound. The codec driver's
> remove  or shutdown functions cannot cancel the workqueue due
> to the wait loop. As a result, code can either end up blocking
> the workqueue, or hit a kernel oops when the card is freed.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/3] ASoC: rt5682s: do not block workqueue if card is unbound
      commit: d7b530fdc45e75a54914a194c4becd9672a4e24f
[2/3] ASoC: rt5668: do not block workqueue if card is unbound
      commit: a6d78661dc903d90a327892bbc34268f3a5f4b9c
[3/3] ASoC: rt5682: do not block workqueue if card is unbound
      commit: 4c33de0673ced9c7c37b3bbd9bfe0fda72340b2a

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
