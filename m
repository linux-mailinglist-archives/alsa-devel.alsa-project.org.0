Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 658C559331D
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Aug 2022 18:25:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 033DC1621;
	Mon, 15 Aug 2022 18:24:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 033DC1621
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660580729;
	bh=v3bpK2E4N1NqumBHnIC8Ju5m6pkyBYRYBdJjQedAkIM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hrhKrW7jLgphQajMZ35zEE1S1/Q+RXzsfsNyVYPz4yI7kqSnMrkxoO7SgErGfS4md
	 6dDcW1j/Pw7EVW9y+bFdrN5aq5FX5fRtGiJFERXpcvNDxqwNQl1tVEdCyAO4gQ3Sa4
	 QECNxPfuoAGsntddxJnRCpQbjGNh/75t92Vtjfuo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFD02F80570;
	Mon, 15 Aug 2022 18:23:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3B4AF80567; Mon, 15 Aug 2022 18:23:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03353F80558
 for <alsa-devel@alsa-project.org>; Mon, 15 Aug 2022 18:23:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03353F80558
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DImoUUic"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A3C83B80FAE;
 Mon, 15 Aug 2022 16:23:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 090C5C433D6;
 Mon, 15 Aug 2022 16:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660580586;
 bh=v3bpK2E4N1NqumBHnIC8Ju5m6pkyBYRYBdJjQedAkIM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=DImoUUicTNbB1bX9cFEmOpoFuW6P1iYIaxdX3d9fShYKAj1Gphl1568kEsIHvCh9z
 4ZfFnXpydJsRpartq8P0DeKsXO7nGZO8XUHQrFBx1Cs+goH9d2nTN9DrjikboIKVfw
 NFTELaCc8UiHU9qMi+xFftiluG+cqjU25vTmv5ouoxcNa5KHELg/eUWvCqU7uMSEgA
 3TNaAMN5hQhQl4p3Il7C7kmr8IWOKQqzi3WqmLbz66K3+O92QWpOOIdlcXrDRAPfJc
 Fs3u1Ti5gEjZvggzv/wA3yK11hlKxXRkgUkpPswaCXG1HFnLXhse8hntmbWrl1fm/9
 wlp9MOtOctExg==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20220801170108.26340-1-tiwai@suse.de>
References: <20220801170108.26340-1-tiwai@suse.de>
Subject: Re: [PATCH 0/8] ASoC: Replace sprintf() with sysfs_emit()
Message-Id: <166058058474.769843.640910803181735949.b4-ty@kernel.org>
Date: Mon, 15 Aug 2022 17:23:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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

On Mon, 1 Aug 2022 19:01:00 +0200, Takashi Iwai wrote:
> this is a patch set for rather simple conversions from the plain
> sprintf() & co to the new helpers, sysfs_emit() and sysfs_emit_at().
> No functional changes are expected.
> 
> 
> Takashi
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: cs43130: Replace scnprintf() with sysfs_emit()
      commit: 32d3679cbb383478c7e9dff590f367f1d7dda975
[2/8] ASoC: tlv320aic26: Replace sprintf() with sysfs_emit()
      commit: 1218d67d376156aa8dc9dbc39616867823f60783
[3/8] ASoC: Intel: sst: Replace sprintf() with sysfs_emit()
      commit: 0aab7bda03086061abd5f8a7794324bb70f769a3
[4/8] ASoC: Intel: catpt: Replace sprintf() with sysfs_emit()
      commit: 7ae8d8ea9427b6fb1ed04b02faf31ad5e3a6de8b
[5/8] ASoC: Intel: skylake: Replace sprintf() with sysfs_emit()
      commit: 11af2b1e33e8c9e72ddf14cd61f9494f34e06c40
[6/8] ASoC: core: Replace sprintf() with sysfs_emit()
      commit: 628d0f72d5828611cae353bd8b49d7647711c283
[7/8] ASoC: DAPM: Replace sprintf() calls with sysfs_emit_at()
      commit: 69f7cbfb08c7ee2ca565f532b0073b847db20bdc
[8/8] ASoC: omap: Replace sprintf() with sysfs_emit()
      commit: a111ae4d7f0796cf2ea0e8bf3ab6c06a401e0560

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
