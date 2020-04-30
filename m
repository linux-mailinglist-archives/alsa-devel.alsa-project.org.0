Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB7F1BF9C0
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 15:41:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7D48168E;
	Thu, 30 Apr 2020 15:41:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7D48168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588254113;
	bh=a43nYn+qS7iNxT2X6McPTs0Bu/0lH/VI4JaZxk8GgLI=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aITkAmVB83jI7qYK43Eh4uhH/XzAerxu19a+aq26TYnd7QXwF8YPN03DjdULRAFF2
	 gOxMkQIRspd2UuEpahHaXcWRPDgux+v4B9AMaFoi6dFgHNyDNffUfu/qz3ZcxXKvGz
	 5dTYTqLjNRYukVXG5RKPy5FzpSli4MJtzL9pQI48=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0F39F801F7;
	Thu, 30 Apr 2020 15:40:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2915EF801EB; Thu, 30 Apr 2020 15:40:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F566F800E5
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 15:39:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F566F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WBH/2DIU"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 877DF2074A;
 Thu, 30 Apr 2020 13:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588253997;
 bh=a43nYn+qS7iNxT2X6McPTs0Bu/0lH/VI4JaZxk8GgLI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=WBH/2DIUYbDV++JOPsKIIzbk5O043Dm6MmtjH95E9++VW0IJcjEv3q36c1/SW2YRG
 sDEiCf/JgwpDqcdGVYsicYVSUrDT3QJ8nq8DftJ6RtXvUfXgIpnuZcqAof7m6V6z9s
 dCm9GtdeBWjV5Fwc4b3I/2VQTXbrFG6/royqmhkw=
Date: Thu, 30 Apr 2020 14:39:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20200427172939.25848-1-ranjani.sridharan@linux.intel.com>
References: <20200427172939.25848-1-ranjani.sridharan@linux.intel.com>
Subject: Re: [PATCH 0/4] SOF topology parsing updates
Message-Id: <158825399444.18388.4802459008517338475.b4-ty@kernel.org>
Cc: tiwai@suse.de, pierre-louis.bossart@linux.intel.com,
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

On Mon, 27 Apr 2020 10:29:35 -0700, Ranjani Sridharan wrote:
> This series includes updates in the topology parser for DAIs
> and their config.
> 
> The first three patches address the problem of sending the DAI
> config to the DSP when there are multiple DAIs associated with
> a DAI link.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/4] ASoC: SOF: topology: send ipc for all found DAIs in sof_set_dai_config
      commit: 726e6142b5c99b407a8118330598f82ba63617c3
[2/4] ASoC: topology: set component dai_index to ipc dai config dai_index
      commit: 744a3bb3b4b6c4073ae9381a02c9824b29dd1a05
[3/4] ASoC: SOF: topology: replace sof_link_hda_process by sof_set_dai_config
      commit: ac764249485189fa0f019e48aeed7175c7b5376b
[4/4] ASoC: SOF: Intel: change trigger sequence to fix pop noise when stopping playback on sdw platforms
      commit: fd045558295e5dab4ebe3176401bafa7090fa007

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
