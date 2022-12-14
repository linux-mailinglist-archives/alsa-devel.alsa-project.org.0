Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6DC64CB67
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 14:33:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11EB22A14;
	Wed, 14 Dec 2022 14:33:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11EB22A14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671024837;
	bh=MphwCkdn5QeL6NXAHvFCBDgfGRjYo4fTYVGRBnJWEds=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jc65EU5jdbuMB7I00IuEkNO4YF9eQDcFYHgJ1FFJEfecTdMJSLihdIpkofvtkyeJm
	 X4qJRhaqL8UuSwsuIiRmj31qCFShV/1dceOOJgm7RLvuIis4ZbAI/QLUrnz/32WCZY
	 VP8KjdDdcr333y2Um5HJyHv0nhXowzfPromInQJo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 141ADF80551;
	Wed, 14 Dec 2022 14:32:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6699CF804E0; Wed, 14 Dec 2022 14:32:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9E2AF804E0
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 14:32:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9E2AF804E0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cIOEbsqR
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 78AABB818B4;
 Wed, 14 Dec 2022 13:32:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A0F4C433F0;
 Wed, 14 Dec 2022 13:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671024728;
 bh=MphwCkdn5QeL6NXAHvFCBDgfGRjYo4fTYVGRBnJWEds=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=cIOEbsqRHqjMOlAPyTV/Ir2Y0AEY8qo8+9DDbN37lq0TrAIjYb0GrhgS//Hn+/2fL
 bO8gIZT+JpDLcB1pT9QPRMpWyIrbDMVZEAeI5J2jfbTA9Jdg6oAcBgnGKfFfbc9B5K
 tWFDEHn7zA09v/1f4yAVdAuh1bMtNweT9F6ShleOUozzvI1MD4z4uPX0t27NsxvciB
 vgK+PyI52BJ2JwCPcBgPSyr65TNsak8L60vEq6+3WzupSVI89es1kVTzP/u0y4mTfB
 P2PLIBUfjGaPWBMqCB6F+fUug+q9Kw4wbSU1A7vvjQhEmYO4P3lY3eekb9r8l2MStC
 eEYWEou34JQTw==
From: Mark Brown <broonie@kernel.org>
To: YC Hung <yc.hung@mediatek.com>
In-Reply-To: <20221209031053.8444-1-yc.hung@mediatek.com>
References: <20221209031053.8444-1-yc.hung@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: add sof be ops to check audio
 active
Message-Id: <167102472482.27755.57467344519009874.b4-ty@kernel.org>
Date: Wed, 14 Dec 2022 13:32:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.0-dev-7e003
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org,
 "Nicolas F . R . A . Prado" <nfraprado@collabora.com>,
 linux-kernel@vger.kernel.org, whalechang@google.com,
 Takashi Iwai <tiwai@suse.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-mediatek@lists.infradead.org,
 Trevor Wu <trevor.wu@mediatek.com>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 09 Dec 2022 11:10:53 +0800, YC Hung wrote:
> In MT8195 SOF design, both DSP and audio driver would access audio
> registers. Before DSP accesses audio registers, audio power and clock
> should be enabled. DSP will hang up if DSP access audio register but
> audio power and clock are disabled. Therefore, we add audio pm runtime
> active checking before accessing audio registers in SOF BE's callback
> hw_params function to avoid this situation.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: add sof be ops to check audio active
      commit: 83f1b7f39af73b01edf098fe3141404670703281

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
