Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DC657227C
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 20:23:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F37F016DA;
	Tue, 12 Jul 2022 20:22:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F37F016DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657650212;
	bh=do/TRq2oML5DtBONUvQXu585DRHe18zNwLUUdn3ZRtw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DbJw2m7uYAMXnAucydQvS6tfdBwfoETexr1kB1XCYpxVBCtoddonHffvBHvh+DtJC
	 cxbAN4e/k7b/cTQc6v42KcHHocDQzAPWws5A58spqFelzUU66vu0+rYRDYOW6fIpuy
	 2oQWLJ68LDcWajtzsPKe/PDJRfjqhWD11A12fXtU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 693B1F802DB;
	Tue, 12 Jul 2022 20:22:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D3D7F800BD; Tue, 12 Jul 2022 20:22:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 203C7F800BD
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 20:22:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 203C7F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="vA7cvLvT"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CA3F6B81B93;
 Tue, 12 Jul 2022 18:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6053BC341CA;
 Tue, 12 Jul 2022 18:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657650142;
 bh=do/TRq2oML5DtBONUvQXu585DRHe18zNwLUUdn3ZRtw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=vA7cvLvTW86OFmMNLHw2mY2+4OQMr80RVGVdV0I8bt9GkTmjlqLyWDOY76PMm03RP
 UiX7WqYHqVgO7JCIl/PAM/y713SrqXLYZ2GC/OnviOJkvcXF4OuHeYmiP2rby95Eol
 /u6fgvI/5V8VyK7+IkYTKcH3EMqCg5NMufg1+DrWCmaSS+RD9P3SLx3qWX+GwfXECX
 /GkhiRJnxfXXgb8BtKFg3cLnMHox03j8Ji22lzb9Bb4D4w3ov6JpPnZ4tjU0bz+ro8
 EjVS7ZQoLDLwqZOHyu/mK2gmYLZ2bJRggKLljy6Mh+7fhfLCRS/UCoKH1VG0b5uK56
 E4YE1CQvYkERA==
From: Mark Brown <broonie@kernel.org>
To: peter.ujfalusi@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com
In-Reply-To: <20220712122357.31282-1-peter.ujfalusi@linux.intel.com>
References: <20220712122357.31282-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: Intel: Do not process IPC reply before
 firmware boot
Message-Id: <165765014108.502248.13560911536744263994.b4-ty@kernel.org>
Date: Tue, 12 Jul 2022 19:22:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

On Tue, 12 Jul 2022 15:23:54 +0300, Peter Ujfalusi wrote:
> By mistake a developer managed to create a 'corrupted' IPC4 firmware image which
> loaded fine to the DSP and after boot it sent an IPC reply before we would have
> received the FW_READY message.
> It turned out that the image was an IPC3 firmware and the IPC reply was the IPC3
> FW_READY notification message which got understood as an IPC4 reply message due
> to the difference between the two IPC mechanism.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: Intel: cnl: Do not process IPC reply before firmware boot
      commit: acacd9eefd0def5a83244d88e5483b5f38ee7287
[2/3] ASoC: SOF: Intel: hda-ipc: Do not process IPC reply before firmware boot
      commit: 499cc881b09c8283ab5e75b0d6d21cb427722161
[3/3] ASoC: SOF: Intel: mtl: Do not process IPC reply before firmware boot
      commit: 1549a69b89b7e5b1b830da897529344766728a4b

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
