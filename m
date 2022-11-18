Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 857DD62F6C8
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Nov 2022 15:05:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D1A816BA;
	Fri, 18 Nov 2022 15:05:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D1A816BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668780357;
	bh=Hu2ADiq8c34DWIMOqGE0HETVNRQnko06241B6rRcLvw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aMHenUupdsKdDmcmzWNPMao9tmmouYuB4dd79GRqOvgBtSYevgCHA3Q2iAl5WMV3j
	 y/2OiY+Cwgysf/ZhxgEAc5cdMCrdkDRGJFahfGOt903Etp5KhrBEYZ7sCELTq1haak
	 uov6k1d56THOP6M16CkdnxiPIikE8zHKN3GVqWsQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F496F800B8;
	Fri, 18 Nov 2022 15:04:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FD20F8024C; Fri, 18 Nov 2022 15:04:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01229F800FD
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 15:04:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01229F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AaUhuagD"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 56AD8B823FD;
 Fri, 18 Nov 2022 14:04:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CB8CC433D6;
 Fri, 18 Nov 2022 14:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668780272;
 bh=Hu2ADiq8c34DWIMOqGE0HETVNRQnko06241B6rRcLvw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=AaUhuagDOBHROLqdFnh3lDZDFG9a00e9vyZ9CQhpnVwicx1MeGOZn6WixQuRxmJ0Y
 pyX4C5iKnaJM8vi+Xs17SPr4kIN4/JnD3ojYQTBIZyRNJlFySNDpJTkniJIB4EkV8H
 HOsqQNeEO5MDhp7w4Ki/FPaQmxlZag10w+jZX0s2ti3/QqXX7txmR+46/eUEf4Q9OL
 VsCdrk0PFDXln/AEZE8JBi5R0fhsO9KHg6Meziz8zALVBDh6N8DUxtPVNOclel9Jrc
 JvIT5LCh1CKoRtJQvRCy6+d67GtXN73SQW/BAsBLk6giSd7Iu/KES6/zD20/T7Yj3f
 vPWLapvbGIIUA==
From: Mark Brown <broonie@kernel.org>
To: venkataprasad.potturu@amd.com, perex@perex.cz, Vijendar.Mukunda@amd.com,
 AjitKumar.Pandey@amd.com, 
 ckeepax@opensource.cirrus.com, Gaosheng Cui <cuigaosheng1@huawei.com>,
 Vsujithkumar.Reddy@amd.com, error27@gmail.com, 
 lgirdwood@gmail.com, tiwai@suse.com
In-Reply-To: <20221118030056.3135960-1-cuigaosheng1@huawei.com>
References: <20221118030056.3135960-1-cuigaosheng1@huawei.com>
Subject: Re: [PATCH v2] ASoC: amd: acp: Fix possible UAF in acp_dma_open
Message-Id: <166878026909.872655.4767033901661635716.b4-ty@kernel.org>
Date: Fri, 18 Nov 2022 14:04:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: alsa-devel@alsa-project.org
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

On Fri, 18 Nov 2022 11:00:56 +0800, Gaosheng Cui wrote:
> Smatch report warning as follows:
> 
> sound/soc/amd/acp/acp-platform.c:199 acp_dma_open() warn:
>   '&stream->list' not removed from list
> 
> If snd_pcm_hw_constraint_integer() fails in acp_dma_open(),
> stream will be freed, but stream->list will not be removed from
> adata->stream_list, then list traversal may cause UAF.
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: Fix possible UAF in acp_dma_open
      commit: 3420fdb8ae99f0a08d78d2b80f42a71971cf478d

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
