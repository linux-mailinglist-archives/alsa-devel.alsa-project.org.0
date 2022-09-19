Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A3D5BD7E9
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 01:11:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEE131655;
	Tue, 20 Sep 2022 01:11:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEE131655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663629117;
	bh=MROo2XMbqbwo7kp5pNKP6bB1k6dqwbTItS+Uef+RX34=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yg+7MfzXyq41BrCUscc+buNWJYrfxbeM4eJZ6pBHCJMYarKvx0rkz4D/SOXHd7gbV
	 lWGY0gHxpG5SmjrlRD+2uOwJvWcCh6IRR23uHtlhjWEf5SvdR9zN6W83s5lzYj5a6v
	 FnAyoOLrK+gStYu8pUqOcfgNuhqJ7l7toU81safA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CC37F80551;
	Tue, 20 Sep 2022 01:09:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCB07F80558; Tue, 20 Sep 2022 01:09:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 867E5F8053B
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 01:09:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 867E5F8053B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dNoQMJ3M"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 895F2B807ED;
 Mon, 19 Sep 2022 23:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAC22C433D7;
 Mon, 19 Sep 2022 23:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663628989;
 bh=MROo2XMbqbwo7kp5pNKP6bB1k6dqwbTItS+Uef+RX34=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=dNoQMJ3Ma4URZbgEyxLCMEJNEKIz3YVainvQfvITGuhLcGWk0cmNdA4cDZyjGHck3
 t3u27rk2Hq8dJiJvyqccq2G++3HvhRzu0PpGrgZIkQhkJgcb64hXEVWhx58fbRi49h
 pEJbXxXYn4ytkeiT16ljacG6ATNc7ppbK+QOnP0gGUz6ncnzdtk8xIx5dejd9yN077
 zhkvvaHadxYtSNP2fnqGRoM7RMdVSZMsqBuduZtTxlNrN+wE8sJ5WmzmyNcdGZcjg6
 IgE+adqHBl4y7yhUiOG+nUYtzixTu/YEIT2Y0CDScCyJ+jo7KHDZm0EWgBFgixQlP9
 PJKM1VR9ANGRg==
From: Mark Brown <broonie@kernel.org>
To: cgel.zte@gmail.com
In-Reply-To: <20220916061906.152434-1-ye.xingchen@zte.com.cn>
References: <20220916061906.152434-1-ye.xingchen@zte.com.cn>
Subject: Re: [PATCH linux-next] ASoC: amd: acp: use devm_kcalloc() instead of
 devm_kzalloc()
Message-Id: <166362898554.3419825.13173032039628568145.b4-ty@kernel.org>
Date: Tue, 20 Sep 2022 00:09:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: alsa-devel@alsa-project.org, AjitKumar.Pandey@amd.com, lgirdwood@gmail.com,
 venkataprasad.potturu@amd.com, ye xingchen <ye.xingchen@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>, yangyingliang@huawei.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, Vijendar.Mukunda@amd.com,
 Vsujithkumar.Reddy@amd.com
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

On Fri, 16 Sep 2022 06:19:06 +0000, cgel.zte@gmail.com wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Use 2-factor multiplication argument form devm_kcalloc() instead
> of devm_kzalloc().
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: use devm_kcalloc() instead of devm_kzalloc()
      commit: 8e34d743f97f151824a2dc0803695752de80bf7d

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
