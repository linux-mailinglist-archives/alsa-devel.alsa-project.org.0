Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E56BA465585
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 19:33:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C74A2265B;
	Wed,  1 Dec 2021 19:33:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C74A2265B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638383632;
	bh=90TxFpT/M1LNhoPNwcqFMk7eXj+jFVO21rJCnVE3wNo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CrtYLNgXM2R7zAU42jrXW5EdnL7MIcA5/GdwwtKOqyYkTc+aQTXBiFbfb6iuW0rqZ
	 1P82jD6tJmhOzlf7qFq8g0XDQ2R63GfHia0VZ7fDmC8IrJmnBIi9w6XtTg1H14KY7w
	 1swh9uFjXfn9rB2P2CyOPW3IRFbCMZAPrv2fY3MI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E99B1F804FB;
	Wed,  1 Dec 2021 19:32:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A408BF804EB; Wed,  1 Dec 2021 19:32:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 541C4F800EE
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 19:32:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 541C4F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SxDgTg+u"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AB79EB820E0;
 Wed,  1 Dec 2021 18:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FE69C53FAD;
 Wed,  1 Dec 2021 18:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638383521;
 bh=90TxFpT/M1LNhoPNwcqFMk7eXj+jFVO21rJCnVE3wNo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=SxDgTg+ueoQoqH6ekFP2ymP+F0QcN1kgWsHNNBhe16nGkF5999WfdZCw5WbH5OY2H
 ohW7HrmTBM4XIDyUThyd2UpSSIuoHXtJMwYifrignEd6TOeRb1v1LVCqTSwtGSpvDG
 mFlORxAh2a4OqlJrag8OOlFxjTZnNMACLEnWPHxG41QnqSOwYvQNMRwp/CtWJxNxZA
 c45WFQHyXUkGB3rvUU/OaGfI1vQMCYXoHwqHRyWCwZIeXiQWJjXmNk6CcfpnWvUkaF
 xoT+oWXq02i8/urNVr1BWfV1azRdNiwWO1oaT1hrgveHNm9XXnOn90TGocEg3BEZS/
 zQKVYQtrhS0rA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20211130090606.529348-1-kai.vehmanen@linux.intel.com>
References: <20211130090606.529348-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: Retry codec probing if it fails
Message-Id: <163838351937.2179725.554786262652740080.b4-ty@kernel.org>
Date: Wed, 01 Dec 2021 18:31:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: yung-chuan.liao@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, Hui Wang <hui.wang@canonical.com>,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com,
 Bard Liao <bard.liao@intel.com>
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

On Tue, 30 Nov 2021 11:06:06 +0200, Kai Vehmanen wrote:
> From: Hui Wang <hui.wang@canonical.com>
> 
> On the latest Lenovo Thinkstation laptops, we often experience the
> speaker failure after rebooting, check the dmesg, we could see:
>  sof-audio-pci-intel-tgl 0000:00:1f.3: codec #0 probe error, ret: -5
> 
> The analogue codec on the machine is ALC287, then we designed a
> testcase to reboot and check the codec probing result repeatedly, we
> found the analogue codec probing always failed at least once within
> several minutes to several hours (roughly 1 reboot per min). This
> issue happens on all laptops of this Thinkstation model, but with
> legacy HDA driver, we couldn't reproduce this issue on those laptops.
> And so far, this issue is not reproduced on machines which don't
> belong to this model.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: SOF: Intel: Retry codec probing if it fails
      commit: 046aede2f847676f93a2ea4f48b77909c51dba40

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
