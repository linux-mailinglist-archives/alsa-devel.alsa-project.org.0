Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB334E2649
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Mar 2022 13:27:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 154FA171E;
	Mon, 21 Mar 2022 13:26:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 154FA171E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647865637;
	bh=8Qpt35h+wLGAVt96Yq3Nv+Cm4lUtawMA5bqmOoaXN1s=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bitUVhEJ0pg5OvHbz4ZQLFRaJTP0Trt3sYxT6IEMNARBfQ43+qoX041U8HQ18N9JE
	 XwmEe1M9wlMzwk4QD6dVNN7RL9a/d1x5HT9uSEJf1SYQR49/cb0r/aoxzeXGq6R3QG
	 vbFTYR3POH9r1y8MS8YeE/WOyLBAAV53g0pB333w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92854F800FD;
	Mon, 21 Mar 2022 13:26:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6A17F80109; Mon, 21 Mar 2022 13:26:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 351AEF80109
 for <alsa-devel@alsa-project.org>; Mon, 21 Mar 2022 13:25:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 351AEF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PgyixpbD"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 19541B812A7;
 Mon, 21 Mar 2022 12:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95428C340E8;
 Mon, 21 Mar 2022 12:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647865557;
 bh=8Qpt35h+wLGAVt96Yq3Nv+Cm4lUtawMA5bqmOoaXN1s=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=PgyixpbDxbHkWA840WoY8gjMeboqxonqZKHfZfVXTbgBpF71pej2icZJIeu0yDZkj
 ca6OR7tSH+1L09pdCmdE0iQ6MnrzsQzM0+tiddeMRjIP2VIp39C1t/HO7nbflDQek/
 WjPZmWW7AHEz32FxmA+z3mNmsQdW6mM1tcHZMbiey82TvLet1KOkqW+3XlJ+BTyvnl
 RoIvLPpf7LYDJAIN7CCACS7kZVYAoPXHHyWI6lnldm40Ek4Ee/p0k/cYmh6EsyxMbi
 jxc2MHOI0zIUy3+DbVx1EUy3HiUdme6VzElWH+SlMmMOYt11+JphOJ2eseymeuGsFK
 LSy0eQbuj0Peg==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Meng Tang <tangmeng@uniontech.com>,
 festevam@gmail.com, tiwai@suse.com, nicoleotsuka@gmail.com,
 Xiubo.Lee@gmail.com, lgirdwood@gmail.com, perex@perex.cz
In-Reply-To: <20220321065754.18307-1-tangmeng@uniontech.com>
References: <20220321065754.18307-1-tangmeng@uniontech.com>
Subject: Re: [PATCH v2] ASoC: fsl-asoc-card: Fix jack_event() always return 0
Message-Id: <164786555531.1723641.18058789746411582644.b4-ty@kernel.org>
Date: Mon, 21 Mar 2022 12:25:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
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

On Mon, 21 Mar 2022 14:57:54 +0800, Meng Tang wrote:
> Today, hp_jack_event and mic_jack_event always return 0. However,
> snd_soc_dapm_disable_pin and snd_soc_dapm_enable_pin may return a
> non-zero value, this will cause the user who calling hp_jack_event
> and mic_jack_event don't know whether the operation was really
> successfully.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: fsl-asoc-card: Fix jack_event() always return 0
      commit: 5cb90dcb6ad569f4968da6dd841db10b91df5642

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
