Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F00BA62BFFC
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 14:48:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79A121696;
	Wed, 16 Nov 2022 14:48:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79A121696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668606532;
	bh=kWOWTI+d+y31sf5/I44KmEK4Vgs9Vsix+AryQQ5pz9M=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rrq90X2BQQNycVCZpWUWM7REac60NP2f/QefdlAcB4zSTd41CwpQUrRG+tnyX+M2r
	 9rWq0TMT+fLfiIzdaIYgsLq38fSeybJd7cWAOy5oAr8tPqWEA2NxZwLKNz999GYm9/
	 y2C5lvLXJw05+URIfuNkUEeKPsH3eQd1dMBvuDac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07EC4F80238;
	Wed, 16 Nov 2022 14:47:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93F8AF800B8; Wed, 16 Nov 2022 14:47:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FA1AF800B8
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 14:47:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FA1AF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GeAFIY1r"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 83C7EB81D7A;
 Wed, 16 Nov 2022 13:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08655C433D6;
 Wed, 16 Nov 2022 13:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668606472;
 bh=kWOWTI+d+y31sf5/I44KmEK4Vgs9Vsix+AryQQ5pz9M=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=GeAFIY1rJw/KTbJHQ4DBU4pCsNdFyb0m9JyJUZCL3vMftqV0zG+cKuehS5drGlLlH
 HjjHD0+07AN+R2A6Cq256rjnii226j1TEXnssQYYTbOzizDepeut3muSaqTc6WRMPw
 fctFdLDTvAL9hxrAYSFCQryshGrWjG+XWmavT1NdMiEa5QYSwDgBiRFKS48OabWX3s
 +XKU2WNeIssZCUWeKFWlkzxJMeN/8SiUWTNGIxIutn6OjHOzVJswEy1NHjIzjKD8XI
 EjwVQF1shqIBNTtkm+gF86qgvosxjz5UqdehxVVuLxACvLmnTHCJ3eYiKVyeJ0sI8o
 qzaiQ09ZG24Yg==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 steve@sk2.org, lgirdwood@gmail.com, 
 ryan.lee.analog@gmail.com, perex@perex.cz, tiwai@suse.com
In-Reply-To: <20221116082508.17418-1-jiasheng@iscas.ac.cn>
References: <20221116082508.17418-1-jiasheng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: max98373: Add checks for devm_kcalloc
Message-Id: <166860646973.422565.7735553281079696974.b4-ty@kernel.org>
Date: Wed, 16 Nov 2022 13:47:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Wed, 16 Nov 2022 16:25:08 +0800, Jiasheng Jiang wrote:
> As the devm_kcalloc may return NULL pointer,
> it should be better to check the return value
> in order to avoid NULL poineter dereference.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: max98373: Add checks for devm_kcalloc
      commit: 60591bbf6d5eb44f275eb733943b7757325c1b60

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
