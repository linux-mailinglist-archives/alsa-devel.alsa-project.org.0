Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F422C4D1F02
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 18:25:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9809318D8;
	Tue,  8 Mar 2022 18:24:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9809318D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646760333;
	bh=VXtXZwmTg2CbEhaflPUS8x55Hns993/Kt31uJMvMLc8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G2bp1Nw39Xet7atx80LPxcuU+lAonQ83dLuUTLh8yUzbeCpP/PofsowwFfgVuC9Fq
	 3xUQDrMZnvX0b5+BoInbXl3zdJpx1OdtK4WnC05YRHYTrbVtrI7BI3970ZurZjAVsD
	 soSmdd5pb/+kIQAQ96gvXNC2cpd6mPSywGFP4O+c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E5C4F80524;
	Tue,  8 Mar 2022 18:21:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09192F80538; Tue,  8 Mar 2022 18:21:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31283F80524
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 18:21:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31283F80524
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tW64Ce1U"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 93DC5B81B8E;
 Tue,  8 Mar 2022 17:21:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C297C340EB;
 Tue,  8 Mar 2022 17:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646760063;
 bh=VXtXZwmTg2CbEhaflPUS8x55Hns993/Kt31uJMvMLc8=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=tW64Ce1U/EXWJOzttKG02pKqy8yiAZ70nH7BuHMz+MNAdF4xKAk9EreguqHoWCcRM
 cjwQqF3L4KsOt+qTMEQCwZHJKe2t+FhbZoaQ7fYpHuydx9MDYwf1NN0aaP2ymzJNV8
 3Ij3yHlCb9vnWoC2lSpDTQIgrVNGiZ1Z9WaJ8XY2VvziCg8VEqSwZ3JHbPlXW8s9LL
 tjHJa3rfNX8GmTa34F07Dej2TMTcWG75LyNtEGt5FL+8GxDv3FjqwptnClpjgtxUds
 TphFgFT8MywsNP4ofWThY1I9VFfw6XAOKV1ONQTUheu8WCHrh/Zkfx9cv6mUZ6QdDl
 3kwuI5Kcm61Ng==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>,
 Miaoqian Lin <linmq006@gmail.com>, linux-mediatek@lists.infradead.org
In-Reply-To: <20220308015224.23585-1-linmq006@gmail.com>
References: <20220308015224.23585-1-linmq006@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8192-mt6359: Fix error handling in
 mt8192_mt6359_dev_probe
Message-Id: <164676006096.54315.8478351478662604607.b4-ty@kernel.org>
Date: Tue, 08 Mar 2022 17:21:00 +0000
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

On Tue, 8 Mar 2022 01:52:22 +0000, Miaoqian Lin wrote:
> The device_node pointer is returned by of_parse_phandle()  with refcount
> incremented. We should use of_node_put() on it when done.
> 
> This function only calls of_node_put() in the regular path.
> And it will cause refcount leak in error paths.
> Fix this by calling of_node_put() in error handling too.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8192-mt6359: Fix error handling in mt8192_mt6359_dev_probe
      commit: e45ac7831ff3e2934d58cce319c17c8ec763c95c

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
