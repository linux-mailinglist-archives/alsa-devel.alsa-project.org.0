Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F365E8061
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 19:08:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8100E868;
	Fri, 23 Sep 2022 19:08:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8100E868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663952934;
	bh=n9U15dwNcqXRZYJJDDbUQQ/3fEHzPd/5huqs2XJRWFs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qZvjo+ttLkQnmB6Tca5C2IAblI6FjX37xmm0MvND3nWjvMeb1HkqZwJwKnK8q+0zg
	 PbeJOkCnjBbgaOkATjeLEfyYan7tn7TFNCebvL57uvUFTS2y53kBPJtKhxi+ZIBK9Z
	 ca/tag+dzczDVCJ4EmmL7ScZwZDYHEaP2a7sFKDg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F4045F80542;
	Fri, 23 Sep 2022 19:07:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A8D4F80542; Fri, 23 Sep 2022 19:07:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4338F80538
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 19:07:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4338F80538
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hwLvkPsT"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 316D3B826F2;
 Fri, 23 Sep 2022 17:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A65C3C433C1;
 Fri, 23 Sep 2022 17:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663952824;
 bh=n9U15dwNcqXRZYJJDDbUQQ/3fEHzPd/5huqs2XJRWFs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=hwLvkPsTn9T8ARxKa65H+/JwEbAIqLC3+UuPJf7jeFTgMlpCLrStMaNRbZJiRl0ZL
 8rcgvrYtTgeEXFv57sAs21Rql0Wj/tbrcU3gWCWAgAApU67BqDzOw4PIjzii6J7uCC
 4etFrLo2Nyd2SONb57AUxdXIIIlJ1zS0eJOEf8oybNhnahH4GwJaezAYQLl56rerLu
 GLGK/V8ywiqbaf7Zk2HIOj487YkqVw2gEia/qI2LlZZSxZrToAvl5HOcimsbVpxfxS
 jCqsREFX1mqdYLDO2DP7BjL0SJCoNc9sGAXGE+bu/xdsszXxlQ2fJyNbvMFuT9PRYm
 3wCvCAZxmCI7A==
From: Mark Brown <broonie@kernel.org>
To: Nícolas F. R. A. Prado <nfraprado@collabora.com>
In-Reply-To: <20220922235951.252532-1-nfraprado@collabora.com>
References: <20220922235951.252532-1-nfraprado@collabora.com>
Subject: Re: [PATCH 0/6] ASoC: mediatek: Allow separate handling of headphone
 and headset mic jack
Message-Id: <166395282139.610218.7941761781105073129.b4-ty@kernel.org>
Date: Fri, 23 Sep 2022 18:07:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, "chunxu.li" <chunxu.li@mediatek.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Takashi Iwai <tiwai@suse.com>, Tzung-Bi Shih <tzungbi@google.com>,
 linux-mediatek@lists.infradead.org, Trevor Wu <trevor.wu@mediatek.com>,
 Miaoqian Lin <linmq006@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

On Thu, 22 Sep 2022 19:59:45 -0400, Nícolas F. R. A. Prado wrote:
> This series allows the headphone and headset mic jack status to be
> handled separately by userspace on MT8192, MT8195 and MT8186.
> 
> Changes based on commit d0508b4f1604 ("ASoC: rk3399_gru_sound: Add DAPM
> pins, kcontrols for jack detection"). Found while searching for an
> alternative for JackSwitch [1].
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: mediatek: mt8192-mt6359: Expose individual headset jack pins
      commit: 194ff8db03782d1dae41b7b42ea65da5748884c2
[2/6] ASoC: mediatek: mt8195: Expose individual headset jack pins
      commit: aa51e3c127a43cf4862db5f0081da281f1aa6429
[3/6] ASoC: mediatek: mt8186-da7219: Add headset widgets with switches
      commit: 13bee4a16ac5c5f0e3a5db868df991be57e74aa5
[4/6] ASoC: mediatek: mt8186-da7219: Expose individual headset jack pins
      commit: 8e986748680629a82398c65da0c5bda4c6a01b3d
[5/6] ASoC: mediatek: mt8186-rt5682: Add headset widgets with switches
      commit: d888e7afa03f06d8091ecdd43f87d5396dfbf907
[6/6] ASoC: mediatek: mt8186-rt5682: Expose individual headset jack pins
      commit: 42de42c22453064ffc9b72c259b2ab901dd766dc

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
