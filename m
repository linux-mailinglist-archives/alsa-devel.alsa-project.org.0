Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9EE5EC106
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 13:21:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 288E1820;
	Tue, 27 Sep 2022 13:20:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 288E1820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664277672;
	bh=QQYYaQMEZGvzeczjp2ttfiOGEJrYpgRJvX3jpp4RbLk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZDbjzDdaU85Z85HS7LfdJvffOahFb31vmmFDb8r185XCd3LBSl1rvHPLxnVm4PSed
	 e52lMzzlhRVp6QK7U8m/5jKCiKnN5UhP9K7PPTWMfB4a21w3JybuNwHFafJ1SIj+iW
	 USZrkWQ8yIHFYNOHH9JzPUZQHpV1KsU5gKt8J9kw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 812DFF80496;
	Tue, 27 Sep 2022 13:20:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D4D5F8025E; Tue, 27 Sep 2022 13:20:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03AA9F800AA;
 Tue, 27 Sep 2022 13:20:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03AA9F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SBJYAlf2"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D89CDB81AFE;
 Tue, 27 Sep 2022 11:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C515C433B5;
 Tue, 27 Sep 2022 11:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664277608;
 bh=QQYYaQMEZGvzeczjp2ttfiOGEJrYpgRJvX3jpp4RbLk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=SBJYAlf2n0xdNapfKdhNlJBt1VWw2tH1tLqXsShwzjI5JlYE0Rhyp3z88PvnavvDd
 L4KRYyQA5Bp84f11TxHA0Q5D07STruQIg2NeFwMNTVPfMw39V+JsYptr85cSTerGZ9
 fxZ1BzmhuASWEqOLhZKvXQiVtX2ba80ZwdpWCC4kWB3pAGuDndPXJMajV1CndD7+gG
 v44NUCVsnHv9qriyDOk1FculvZCdVeRsrwmvdT388aEL1K8mv3EKXiNJ9Mjdr9j9zb
 zDjjQEJ0H5S6AFK0VZ3KyqP+rIN7n1WHJfMNnvhZctSakIijOCDmZzQelKYf2DHfn9
 lmpXP2t7h0/Uw==
From: Mark Brown <broonie@kernel.org>
To: peter.ujfalusi@linux.intel.com, Chunxu Li <chunxu.li@mediatek.com>,
 angelogioacchino.delregno@collabora.com, 
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 daniel.baluta@nxp.com
In-Reply-To: <20220924033559.26599-1-chunxu.li@mediatek.com>
References: <20220924033559.26599-1-chunxu.li@mediatek.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: mediatek: mt8195: Add dsp_ops callback
Message-Id: <166427760496.294040.5707200014534943454.b4-ty@kernel.org>
Date: Tue, 27 Sep 2022 12:20:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 project_global_chrome_upstream_group@mediatek.com,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
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

On Sat, 24 Sep 2022 11:35:57 +0800, Chunxu Li wrote:
> ASoC: SOF: mediatek: mt8195: Add pcm_{hw_params,pointer} callback
> 
> Chunxu Li (2):
>   ASoC: SOF: mediatek: mt8195: Add pcm_hw_params callback
>   ASoC: SOF: mediatek: mt8195: Add pcm_pointer callback
> 
> sound/soc/sof/mediatek/mt8195/mt8195.c | 44 ++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: mediatek: mt8195: Add pcm_hw_params callback
      commit: 978a7144ae8497b40d833a3c0110b18810499f95
[2/2] ASoC: SOF: mediatek: mt8195: Add pcm_pointer callback
      commit: f7c91bf65388547f61888b7a67169966fc698ce1

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
