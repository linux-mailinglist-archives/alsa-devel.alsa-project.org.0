Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA56D3A83C9
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 17:17:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19C121689;
	Tue, 15 Jun 2021 17:16:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19C121689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623770231;
	bh=LGwVPo0Y/aLPCEiDrC1crvd4LvwuYtE4FdfFxVWndSI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iao6kieVofS0YAYBuy5q4sLm0q8Eg6e4m1NgaQ3AmK3GmtOcKihvDDwP8qF/uQ73z
	 KSTLRl7KVkZGNwrGMEhEC6uhWREvezlkj4Jyy3SGdFkzIRjf+3SYDquf91SabD2oOu
	 P5NM/onarQckS/TDvYVV1C9xhAP8VmoB4XMiN7Jw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CA3FF8025A;
	Tue, 15 Jun 2021 17:15:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3919F80171; Tue, 15 Jun 2021 17:15:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8097AF80165
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 17:15:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8097AF80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TgXwKoZM"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8CFF7611CE;
 Tue, 15 Jun 2021 15:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623770132;
 bh=LGwVPo0Y/aLPCEiDrC1crvd4LvwuYtE4FdfFxVWndSI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TgXwKoZMbnQccXof0lAWG6BImPv639MHdDL8jqBlZ927bZiyrnKASo3B9F41RpLoW
 aQi144EqOep3LuVJy2YSleQvrDK332SjvhywDNAe+qAaLYMLrq1CidINvtA0BVoTgk
 QaKpNb3w7r6A8DmufPsEzrnhulfv/sPZcl6xsdwOFfN1bAZeINC/HN/V24ZvoyWNzA
 uTljKZJTsNbqeaRVJTOaYFIGE+altl/ccr0mWV/kwUhQRqe6udVSvH/l6EgPz6HOKn
 bMKNqzHVmFyK9x02RdHWoWCGr4v4kB7h3gHBHuOwleyfhKFWhVkQk7NHJ6NcycHuh3
 c1XOUIax0yvrA==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
 sfr@canb.auug.org.au, Pu Lehui <pulehui@huawei.com>, lgirdwood@gmail.com
Subject: Re: [PATCH -next] ASoC: codecs: wcd938x: constify static struct
 snd_soc_dai_ops
Date: Tue, 15 Jun 2021 16:15:07 +0100
Message-Id: <162376540392.36156.3517885436389644399.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615113324.238837-1-pulehui@huawei.com>
References: <20210615113324.238837-1-pulehui@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: zhangjinhao2@huawei.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

On Tue, 15 Jun 2021 19:33:24 +0800, Pu Lehui wrote:
> The snd_soc_dai_ops structures is only stored in the ops field of a
> snd_soc_dai_driver structure, so make the snd_soc_dai_ops structure
> const to allow the compiler to put it in read-only memory.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wcd938x: constify static struct snd_soc_dai_ops
      commit: 355af6c0c09d4dd0d97fa1aca0ff797b64cd6187

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
