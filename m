Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C15842CA8F
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Oct 2021 22:02:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 537FA168A;
	Wed, 13 Oct 2021 22:01:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 537FA168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634155319;
	bh=om0HazlAjz/5nUCLR5kLqslvvq5C7vKYnMkWeQTOsBs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XZKdUMnQMQFSqS63PmvumpyTduqtoVIoyLcjb8ywcqfaj3wJ9lr8Hx72Crl/5lA92
	 08oaXh1koowGiPeWd/m6wqV4Snk2Fnq+bDPPbCkooeqMIG3N33AuNEyXWHQgC2oLRO
	 OA3M6ghE6Zo2W6BmjtFFE3KAvyfrh1KdVNhF4SZw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06DBCF80430;
	Wed, 13 Oct 2021 22:00:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 028DDF8028D; Wed, 13 Oct 2021 22:00:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C72B5F800C0
 for <alsa-devel@alsa-project.org>; Wed, 13 Oct 2021 22:00:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C72B5F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EmI2cldZ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E9393611EE;
 Wed, 13 Oct 2021 20:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634155206;
 bh=om0HazlAjz/5nUCLR5kLqslvvq5C7vKYnMkWeQTOsBs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EmI2cldZLk7dXlFCA6+ucpCFWa7lvxlNiJZYbWmw92AuUSrCbPFjjkciTpiDcIi2x
 4w17i9RqXDo6Ai1crmQVnvy0WmPbTGahMUV03YqK1H3ifwtkIpkFARIPGyxFkNBwKp
 y2VLt3mCy6NIy3eWKcMda9HgSEWEiRIqGbH/raO1kqGAD3L2GjVFJOJ2GuIogxquv0
 Qsac8OJXZLPOOFrOuq4d7EnQjbzuBLZzTe5UV/vf7fm0x9lP8vf+EzRHtc+fN1FdlU
 gxt4hqqYJ0eYO7Hsl90fSO52bLW1Y0n3RvXZxCDxGaeMyBfAc4kytdA2g3cH7S5RwW
 Ada7zRIhVddFA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: Constify static snd_soc_ops
Date: Wed, 13 Oct 2021 20:59:48 +0100
Message-Id: <163415517073.1358186.16264637881632852203.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211012205521.14098-1-rikard.falkeborn@gmail.com>
References: <20211012205521.14098-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-kernel@vger.kernel.org,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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

On Tue, 12 Oct 2021 22:55:21 +0200, Rikard Falkeborn wrote:
> These are only assigned to the ops field in the snd_soc_dai_link struct
> which is a pointer to const struct snd_soc_ops. Make them const to allow
> the compiler to put them in read-only memory.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: Constify static snd_soc_ops
      commit: abed054f039a69579a21099dbb53aa008ea66d03

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
