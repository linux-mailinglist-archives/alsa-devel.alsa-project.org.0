Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F3D5B8551
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 11:42:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5D621890;
	Wed, 14 Sep 2022 11:41:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5D621890
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663148524;
	bh=9d25q7djykcHE0hT6Fq9ch208cDtKJYVQfvbgze86aM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rO9oMJ5BpUcdqCv2R2yfQ45616SjjsvBSU9brIuINvdIY2QbW9xD370SCxvsEOlPy
	 mPRHWgTOAYum4nl6xhjbjGWJCLlKLlzAVam/MIJWLr6afm+biup98YWmgTTiy3Ee51
	 twsthp7R18H8ZXUswELn/ypRFnPlcd4IRJ8uZtu0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E97AF80507;
	Wed, 14 Sep 2022 11:40:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8091F80430; Wed, 14 Sep 2022 11:40:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39E72F801D8
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 11:40:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39E72F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="M20tsW8J"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E729361AED;
 Wed, 14 Sep 2022 09:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABD36C43141;
 Wed, 14 Sep 2022 09:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663148420;
 bh=9d25q7djykcHE0hT6Fq9ch208cDtKJYVQfvbgze86aM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=M20tsW8JimtW/0pw2xZm3L1G3Ax1P8M1qasEDF7rc57ZKVhl21vmyOJDq1PanYHU3
 K1CMf/zLtsJ0o4WGe87Bt0GT94k6vPT62O3AmxdZDujbeVjzd8mrGtiVEBNNga/cRH
 L6QWPx435XADr1l3S/5CPrvPJwLCspPx0eQQkVnxdrblo1Gs7AcoNm+KNGEQP0xS1d
 KQoxlHN4n8MIf5lD1UVyqdY0R2JjJQXceBlGJDEyiFvQEeWRLF9IUlCSilPg1DPKff
 wfgZPU+k7F7JXrGVMlKxYlcDipssxmQWUVifu/GiXcnzHWPiQ6KVyP/xYKlyWby2Pv
 CG0wqLYuXD4iA==
From: Mark Brown <broonie@kernel.org>
To: Gaosheng Cui <cuigaosheng1@huawei.com>, cezary.rojewski@intel.com,
 tiwai@suse.com, ranjani.sridharan@linux.intel.com, 
 pierre-louis.bossart@linux.intel.com, perex@perex.cz,
 liam.r.girdwood@linux.intel.com, kai.vehmanen@linux.intel.com, 
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com
In-Reply-To: <20220822035133.2147381-1-cuigaosheng1@huawei.com>
References: <20220822035133.2147381-1-cuigaosheng1@huawei.com>
Subject: Re: [PATCH -next] ASoC: Intel: fix unused-variable warning in
 probe_codec
Message-Id: <166314841746.314266.6045600836637107787.b4-ty@kernel.org>
Date: Wed, 14 Sep 2022 10:40:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-7dade
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Mon, 22 Aug 2022 11:51:33 +0800, Gaosheng Cui wrote:
> In configurations with CONFIG_SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC=n,
> gcc warns about an unused variable:
> 
> sound/soc/intel/skylake/skl.c: In function ‘probe_codec’:
> sound/soc/intel/skylake/skl.c:729:18: error: unused variable ‘skl’ [-Werror=unused-variable]
>   struct skl_dev *skl = bus_to_skl(bus);
>                   ^~~
> cc1: all warnings being treated as errors
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: fix unused-variable warning in probe_codec
      commit: 515626a33a194c4caaf2879dbf9e00e882582af0

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
