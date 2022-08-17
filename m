Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 643E759712C
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Aug 2022 16:33:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11723164E;
	Wed, 17 Aug 2022 16:32:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11723164E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660746803;
	bh=+fAp6q0oNEBcBmsZFkorVQv43BFESvY96V4smdRItO0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mD5kL/6AQffusXas04/WsjPYd5XhbEQtLoYci7OUgswdOCYQQKi3ExDn+v8tvhZmz
	 SwK2ww0jsmNBYJnoAV6S6NsL0N8MWeSZBTjCUWp+SlM40CS/uVBN0CJhGxqhsWROaS
	 I70qOSBqb8UVm5YuAQg2LrnrFs/XnLyouRCbxZrQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 261D7F80549;
	Wed, 17 Aug 2022 16:31:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06422F804CB; Wed, 17 Aug 2022 16:31:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01421F803DB
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 16:31:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01421F803DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZMztFhN/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6E6EB614B7;
 Wed, 17 Aug 2022 14:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02EB0C433D6;
 Wed, 17 Aug 2022 14:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660746666;
 bh=+fAp6q0oNEBcBmsZFkorVQv43BFESvY96V4smdRItO0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ZMztFhN/hAv57Vj9ldCdrInquS1yuzUY9MmCzygZ6Di2ZH3ApbYyfvhAbWZyJVTLN
 kbZoOTGJObkZoMPNO/FwaZ4nrFTz7GWE7m028mHG1iOx+I9tXYnczhoNVyykA9IqEK
 sKlLQTbmoPBoCvK4FWO04dLcjyogbccSEmlHoX7Nd/PrKwr+jsnlnR2S9Jlyw3g7Gi
 0vVTkwNVZv6RDYL+8N4nzUSUgv8A10DwzXqIq2BH+c8AKnayYpxYjvhHB+oyToBfEN
 Hm/9mT9WEFuPBs/SnmoMfjS6pMxRVtWJXKrrhwbeUuC28kxMW4LbA6Z8AnGx45zjrp
 7xT3ILCxjXk+A==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20220817080529.10864-1-daniel.baluta@oss.nxp.com>
References: <20220817080529.10864-1-daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH 0/4] Enable timestamp support for SOF compress driver
Message-Id: <166074666372.210979.8582498171681865301.b4-ty@kernel.org>
Date: Wed, 17 Aug 2022 15:31:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: Daniel Baluta <daniel.baluta@nxp.com>, pierre-louis.bossart@linux.intel.com,
 daniel.baluta@gmail.com, kai.vehmanen@linux.intel.com,
 peter.ujfalusi@linux.intel.com, lgirdwood@gmail.com,
 laurentiu.mihalcea@nxp.com, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com
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

On Wed, 17 Aug 2022 11:05:25 +0300, Daniel Baluta wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>
> 
> This patchseries computes pcm_io_frames from the DAI position reported
> by SOF firmware.
> 
> Using pcm_io_frames userspace applications can later compute timestamps
> for compressed stream.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: SOF: compress: Remove byte offset computation
      commit: bab10ec9fd9dc1537b705d0dd3862dd5982b921f
[2/4] ASoC: SOF: compress: Introduce sof_compr_stream
      commit: e3091f0a3f563ad1c9b60c290752e1190b67ea97
[3/4] ASoC: SOF: compress: Save channel count and sample bytes
      commit: 3ccbe6887747679d15e5c9524b23754281a24d9e
[4/4] ASoC: SOF: compress: Add support for computing timestamps
      commit: c1a731c71359407eae4fd0a5fd675ef25a582764

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
