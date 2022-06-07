Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAF653FC17
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:49:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E12071A6B;
	Tue,  7 Jun 2022 12:48:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E12071A6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654598987;
	bh=7KeROakQhh0RozS317QXHC+LfNUD+I20gakesbMfS+4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K2zc1I8cPW+Qb4H00aYsdgkSd2UifHbm4szme+fU4lj25LEK2+2Q5VsX87/f09heB
	 I1MsWS9oR1s7v5eQGvBANjM8lLPBGVe3k12Nq1X8EljUHW4/KJhY/AZ5Vc2LXcTEJL
	 NeFbUBkk4d4apMjeQB/0Jxeh0+Kc8laSwFENgwXw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87A47F80578;
	Tue,  7 Jun 2022 12:45:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C64FF8057B; Tue,  7 Jun 2022 12:45:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01F78F80578
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:45:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01F78F80578
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OASkSWPB"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7FDBA6156E;
 Tue,  7 Jun 2022 10:45:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 429D9C34119;
 Tue,  7 Jun 2022 10:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654598747;
 bh=7KeROakQhh0RozS317QXHC+LfNUD+I20gakesbMfS+4=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=OASkSWPBwmPdUP8MgbOJ5BFcCe2vA45UG1zIKgvn93P58gfD34zijkQm+mmSX2Pf9
 DC+e01U7scfAaEU4Wlk4GV1nAUyaCJwIuVtkAbFh4qkCT0NuqDb7VBWK8a1rMRp/25
 Dt7E71WfKSe1Whgik5G/2KEf7BxkdsXKPHwWTE0FxFfMpBiik+dWZW2Lg9nlzD9+U5
 cJQQQVgXlT6Zd9He+1Cut9FRuGD0aGTVicwhYtB1ZZnHC2kgoA/yByiiHvlnaN8tg3
 M0Vgqy+X5wFcsKdurOZu3Q5iZqZh3ewULDwJitzaY4yY1RqFQkhOk3LNK4Djz9Phxz
 pYCPbVaW2FLIg==
From: Mark Brown <broonie@kernel.org>
To: linmq006@gmail.com, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20220603083417.9011-1-linmq006@gmail.com>
References: <20220603083417.9011-1-linmq006@gmail.com>
Subject: Re: [PATCH] ASoC: mt6797-mt6351: Fix refcount leak in
 mt6797_mt6351_dev_probe
Message-Id: <165459874498.301808.15369617374937965221.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:45:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 3 Jun 2022 12:34:15 +0400, Miaoqian Lin wrote:
> of_parse_phandle() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when not need anymore.
> Add missing of_node_put() to avoid refcount leak.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mt6797-mt6351: Fix refcount leak in mt6797_mt6351_dev_probe
      commit: 7472eb8d7dd12b6b9b1a4f4527719cc9c7f5965f

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
