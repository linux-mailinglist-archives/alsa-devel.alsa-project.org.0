Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 891D5346BE1
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 23:14:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E8171674;
	Tue, 23 Mar 2021 23:13:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E8171674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616537646;
	bh=IuxcZXDuH7ciWf6IKC7i07wcDMw4N/IhodCrroOKVY4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ayUUDcwQHicLkTYdvdTFCl5Vw00SLgEQ5iNOifq9XB8eEtxyV10SdGIXHyTHO09wC
	 Y4QWQ9ihWS20wtf/EZ2mRSkSgG7jUC07adQTCPuntbWqWa6xhSV8nl9tqQm/XKMmj2
	 1ji/bMOo9UKr7dqEFlx5mDD4j0BObg9uGPANXAGw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50695F8028D;
	Tue, 23 Mar 2021 23:12:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F5CFF80268; Tue, 23 Mar 2021 23:12:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15ABCF800EE
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 23:12:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15ABCF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AgETlZwU"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 00718619CB;
 Tue, 23 Mar 2021 22:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616537545;
 bh=IuxcZXDuH7ciWf6IKC7i07wcDMw4N/IhodCrroOKVY4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AgETlZwU8+7/LhLRSt9NTyJz5lJfbsYZ/KKbI8CdK0KdlNj8yvKk8D8nPyC4Ku/nR
 LQAGLFsED2QRZKKQO+teTWii8SJ4edOeXOEfB6hIVUgtp9uDSU096ySGEwqbfNJJwH
 0uDra+TE34Ggm1iUas3/iltVLauwvujEIccpttdTX/3WeSVLNk9bjpXFVbxVhfhLw2
 /DEU4vjbYQyeOu2gWNlG7RlreObYUXp4nFXEeGE+1nDESw/LzCNNdMk3nbFzIn4FfJ
 kfKEvPnvKbKtLsy/BKl7f+q59OR0tkj5qfTeBpEKLLbJ7P7onrcTNJB/ob0JFQXMLT
 cl1VoTIpFWrbA==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH 0/8] ASoC: SOF: Intel: shutdown and core handling
 corrections
Date: Tue, 23 Mar 2021 22:12:12 +0000
Message-Id: <161653747938.32729.8614811581903341680.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210322163728.16616-1-pierre-louis.bossart@linux.intel.com>
References: <20210322163728.16616-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Mark Brown <broonie@kernel.org>
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

On Mon, 22 Mar 2021 11:37:20 -0500, Pierre-Louis Bossart wrote:
> This patchset fixes a logical flow in the core status, improves
> shutdown support on Intel SOF platforms with an HDaudio controller and
> cleans-up ElkhartLake support.
> 
> Guennadi Liakhovetski (1):
>   ASoC: SOF: Intel: HDA: fix core status verification
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: SOF: Intel: HDA: fix core status verification
      commit: 927280909fa7d8e61596800d82f18047c6cfbbe4
[2/8] ASoC: SOF: core: harden shutdown helper
      commit: 91ec48f540f83022377723a774a0a37a630801af
[3/8] ASoC: SOF: Intel: TGL: fix EHL ops
      commit: 3c429f861ed483517a0a352281a16503bcc60b55
[4/8] ASoC: SOF: Intel: TGL: set shutdown callback to hda_dsp_shutdown
      commit: 22aa9e021ad1ee7ce640270e75f4bdccff65d287
[5/8] ASoC: SOF: Intel: ICL: set shutdown callback to hda_dsp_shutdown
      commit: 4939e49ea5804f89941df86d35f1a1e1cd8b435b
[6/8] ASoC: SOF: Intel: CNL: set shutdown callback to hda_dsp_shutdown
      commit: b0503e8410e5ee43da116772576dbdeb2a414e0b
[7/8] ASoC: SOF: Intel: APL: set shutdown callback to hda_dsp_shutdown
      commit: d3aa96bf349882763b9903e5800d2e83fc086886
[8/8] ASoC: SOF: Intel: move ELH chip info
      commit: 8bb84ca873d2222ca220e58a097090775b1fd8df

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
