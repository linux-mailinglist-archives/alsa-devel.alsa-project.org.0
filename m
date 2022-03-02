Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4614CAB0D
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 18:02:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F89C1DE9;
	Wed,  2 Mar 2022 18:01:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F89C1DE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646240556;
	bh=/gWvP2vsXd8rkLtqrnHFSfxrMj9k6L9zIS6GLOLcGZg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nXxIodScx00+J3f7oN0NSHjVR52O+ADlGdQtnJzxLE+LgkiNNzIrssbl4vxi3Wjg8
	 1bzf2AutxZo1VTco5w9PyBpA86s/0kBwPu82uYcre+o7xl8RTq1czDiuoP6uX8VzvO
	 miYMBT4JzyrAXs1l/T/7h0k2NA5qe4QrfQwo5lpE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D9B8F804CB;
	Wed,  2 Mar 2022 18:01:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D151F804CB; Wed,  2 Mar 2022 18:00:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FBC1F80171
 for <alsa-devel@alsa-project.org>; Wed,  2 Mar 2022 18:00:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FBC1F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ihaxAi5Y"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 30FEFB820F9;
 Wed,  2 Mar 2022 17:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C66DC340ED;
 Wed,  2 Mar 2022 17:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646240451;
 bh=/gWvP2vsXd8rkLtqrnHFSfxrMj9k6L9zIS6GLOLcGZg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ihaxAi5YdgX++mOBAWXxCQiSAgVpJ1bm319KXG1/l9w5dIEJ8a49WBAF0bnnhJHwe
 OFWyNQYEzX7m15f5Ps7Lg/sz5VKQzjHbIajYbHKu4sArBHTdEioYzPR4rteswDlU0x
 xwY5zGHUzdv07pXhhBNzZvhl1HN69wbhWvKYN1Sa3Kg7hfzcZAoMXh1U2YdQ1TLco5
 qLIVTWM44ydf7rF4+SSZWTXfkDZ45GSyhidRet+RmpxNsjwaCgqBCrpLe9RrxuIvQr
 YmMfZwPbRoY1FMx7syHCdW6/V+IGZgcJ8QfCtpAtc2D/FtrhuaXq8vOuB91hG71BY/
 /lvtCeFIJ5BvA==
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220301081104.GB17375@kili>
References: <20220301081104.GB17375@kili>
Subject: Re: [PATCH] ASoC: qcom: Fix error code in lpass_platform_copy()
Message-Id: <164624044896.1145067.17126236966898923867.b4-ty@kernel.org>
Date: Wed, 02 Mar 2022 17:00:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org, Christian König <christian.koenig@amd.com>, linaro-mm-sig@lists.linaro.org, Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
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

On Tue, 1 Mar 2022 11:11:04 +0300, Dan Carpenter wrote:
> The copy_to/from_user() functions return the number of bytes remaining
> to be copied.  This function needs to return negative error codes
> because snd_soc_pcm_component_copy_user() treats positive returns as
> success in soc_component_ret().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: Fix error code in lpass_platform_copy()
      commit: d5dd781bcc81aa31b62310927f25cfa2574450f1

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
