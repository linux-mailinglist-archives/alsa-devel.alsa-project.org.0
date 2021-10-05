Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D853422CBE
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Oct 2021 17:40:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C171A1670;
	Tue,  5 Oct 2021 17:39:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C171A1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633448430;
	bh=dMaNVcV9n/AsE7FV5OdxX7BiQfijv6VpA9Xu4cdrapw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ryAph/lpsK+tnjBFXzv510MceiC5NZqFYjmzHWSxSc0IZ3BvFnZuO+batUuvNifcf
	 /VrO5Y38rBZNs14VlA1NeLEUbpsaf7fD1viIq/GsuLUTCz5JZoU35PdVQtq1dIVrnS
	 lxeoQAjL809v8h5Vt3EAnjBRUpKhoaqVv1BoifxE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A046BF804EC;
	Tue,  5 Oct 2021 17:38:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2EF5FF804D9; Tue,  5 Oct 2021 17:38:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34474F80259
 for <alsa-devel@alsa-project.org>; Tue,  5 Oct 2021 17:37:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34474F80259
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eS3PMGo5"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A133760F9D;
 Tue,  5 Oct 2021 15:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633448276;
 bh=dMaNVcV9n/AsE7FV5OdxX7BiQfijv6VpA9Xu4cdrapw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eS3PMGo5W7Dc/urhyhwMEbNZZrjk0emog2jLwrNLzjbAbGwKy718OEWvAJ+8gOKnv
 7UMz28kvv3b9Qqh7e+Vj1/TCdkJZZ0KIQS9TecjV1ykv3ZEnbI9V3O22v4eFjSSfut
 7lycsS63Do4K1eFjpMkINsSb4Qn1tKQdkVUFnpj5TOQtxJT7uq5ffsjSajJNXfN+Eh
 ED6zqWBGxYor6+RDAcwHzlMNpw0geAQJmRbIMDGqgIytPJW40RMXMORuScNvyrMdjz
 Q77siaMvFkQnEvhpFef03HsWcFCPSTIz5XxRYbSn9X7UYYndSIwrEnf8Gc0AiphShZ
 D+r66FQd0mvIw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: Re: [PATCH] ASoC: amd: acp-rt5645: Constify static snd_soc_ops
Date: Tue,  5 Oct 2021 16:37:42 +0100
Message-Id: <163344779742.1075058.2948246848855482699.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211004224514.8783-1-rikard.falkeborn@gmail.com>
References: <20211004224514.8783-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
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

On Tue, 5 Oct 2021 00:45:14 +0200, Rikard Falkeborn wrote:
> The struct cz_aif1_ops is only assigned to the ops field in the
> snd_soc_dai_link struct which is a pointer to const struct snd_soc_ops.
> Make it const to allow the compiler to put it in read-only memory.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp-rt5645: Constify static snd_soc_ops
      commit: d54aa2aeaa70237f4482336e86195235ea1de032

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
