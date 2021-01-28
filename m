Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA75307FFE
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Jan 2021 21:56:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 917E516B9;
	Thu, 28 Jan 2021 21:55:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 917E516B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611867409;
	bh=1tbtuFQkxbc4ZnV8cTnHuV1+0RiZFgiK3PLGpUTpqzY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=csZVVec7tw4AliEQrJeayyy3EM4TqyqwHPhx37eVZPEtReL2vBwdpy966F4TPvg+G
	 q1KSzpIzMjlKEahVF5+LHvZ3MbFFQ6NL4wI4Cyi4St218igdqX1QPn7GCsoGBOKzwo
	 1fb8nVaLugmBmf/c2pFn5/5LLYVLS1UHdbYRhc1s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CC52F80253;
	Thu, 28 Jan 2021 21:55:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5F7EF80217; Thu, 28 Jan 2021 21:55:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3A69F8015B
 for <alsa-devel@alsa-project.org>; Thu, 28 Jan 2021 21:55:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3A69F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="T8GRz5W4"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F41F64DD6;
 Thu, 28 Jan 2021 20:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611867321;
 bh=1tbtuFQkxbc4ZnV8cTnHuV1+0RiZFgiK3PLGpUTpqzY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=T8GRz5W47Ps3HktkyrIxm0ogPUgwEeF57co8nvyKTuWV4GLA6SuVYJfOCAfUz7lkP
 37fR6EkachvJP8xeJNwWF3ZsMNpTcIMPX/nIbQx6GRgIGeDguB5vKcdC60fq7BZDa5
 Vpxn8N+ZDSIza/Syw4SKvrGRlaf4jDAhFet+sfTR5lZclHYTkDwhUh7TZH1EkF736V
 fFoVrogFxTQ27HHzICx2jY2t69R1xzJRC2v7+ZtDTnqsBJM/eD+1ezxg5xurdyjA/5
 YN0OfrUeCl6ZYKIPJ1zY7eHkGrAn5/DF31FCAQU6so5jspaToAaceVSqsGMO/0vp6K
 Y2fKp+tR1XUFA==
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org
In-Reply-To: <20210128093850.1041387-1-kai.vehmanen@linux.intel.com>
References: <20210128093850.1041387-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH 0/5] ASoC: SOF: use common code for DSP core pm
Message-Id: <161186727763.43763.5863459561857832758.b4-ty@kernel.org>
Date: Thu, 28 Jan 2021 20:54:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com
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

On Thu, 28 Jan 2021 11:38:45 +0200, Kai Vehmanen wrote:
> Series to refactor the DSP core management:
>  - move tracking of powered up DSP cores to common SOF code
>  - add logic filter unnecessary power actions
>  - modify existing implementations to use common code
>    whenever DSP cores are powered, so the state in common
>    code stays in sync
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: SOF: Intel: hda: use snd_sof_dsp_core_power_up/down API
      commit: f6c246eacb62977dea5c9c65ac6fb4921cad5bcd
[2/5] ASoC: SOF: Intel: hda-loader: keep init cores alive
      commit: cedd502d18b5b7a913fa13fa18a037cc51b1798d
[3/5] ASoC: SOF: update dsp core power status in common APIs
      commit: 42077f08b3f1ba891dca1f8f479810f16b7d6cbd
[4/5] ASoC: SOF: Filter out unneeded core power up/downs
      commit: 30876e2a06f35b525dc71f94dfc3c6f329e55a28
[5/5] ASoC: SOF: intel: hda-loader: use snd_sof_dsp_core_power_down/up APIs
      commit: 92c6ec606cd12c16091b70442da536bdeddb1f7f

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
