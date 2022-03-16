Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9084DB994
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Mar 2022 21:40:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A950A184D;
	Wed, 16 Mar 2022 21:39:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A950A184D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647463207;
	bh=J8cE2oxTtiVUydoOJrk2olXpmW5RsNMRyw3bjSmHe+I=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p4FXRvJG6Vd5+cUJA2KEk6J9WLdPOX7MHJxBiWGT+ZTpK7EtdQt5b8pdntR9KXDFn
	 4pUkV7KOMgQrvSxd0+rv/x4ajETwAefkGcC7W9Oa49k78Vqjnbw+tE643XWibd3yEo
	 kV35cr+dKGqjHufsLJdxVnNhQ5AFr+huataPjO4A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DD93F80551;
	Wed, 16 Mar 2022 21:36:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACE7BF8053B; Wed, 16 Mar 2022 21:36:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 424CFF80535
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 21:36:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 424CFF80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="T9Qr3JkC"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A4CD46142A;
 Wed, 16 Mar 2022 20:36:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE5CDC340EC;
 Wed, 16 Mar 2022 20:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647462966;
 bh=J8cE2oxTtiVUydoOJrk2olXpmW5RsNMRyw3bjSmHe+I=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=T9Qr3JkC3g+FD01GFXej2Tvf8AsrUWoEY5J9eCgLGZRJSitWgp2vVVYF8lZtVaP29
 nr401EC0hUijGNoOH6At74EMcR+6ncFJt13bc2YOPXylRts+JhHnj7N0CxcM78lQ5V
 NAo+xVjV6DlERoLcf/mQUPZu9MdgnflZnWlD7PgxSAG4r2hahIKueYNSSQPklRc52X
 fH3jK8N+a5krVILHUNNhcBPpBgarZ0k05NmNsS31QLj727F9MNotsODPoZIAl/0xPG
 hDO4j6cQbwjsigORS65FwBhLDLf8WkJavgTnROu+SjIhU4vqlEWqlJ+4KYnbAj3M6T
 IS7c/YJRuLyFg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Miaoqian Lin <linmq006@gmail.com>, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20220316041924.17560-1-linmq006@gmail.com>
References: <20220316041924.17560-1-linmq006@gmail.com>
Subject: Re: [PATCH] ASoC: msm8916-wcd-analog: Fix error handling in
 pm8916_wcd_analog_spmi_probe
Message-Id: <164746296435.1220201.18023236522112794929.b4-ty@kernel.org>
Date: Wed, 16 Mar 2022 20:36:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 16 Mar 2022 04:19:24 +0000, Miaoqian Lin wrote:
> In the error handling path, the clk_prepare_enable() function
> call should be balanced by a corresponding 'clk_disable_unprepare()'
> call , as already done in the remove function.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: msm8916-wcd-analog: Fix error handling in pm8916_wcd_analog_spmi_probe
      commit: 9ebd62d60edcd4d9c75485e5ccd0b79581ad3c49

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
