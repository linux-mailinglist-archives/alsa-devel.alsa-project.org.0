Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED10D1C8A72
	for <lists+alsa-devel@lfdr.de>; Thu,  7 May 2020 14:20:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F3801814;
	Thu,  7 May 2020 14:19:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F3801814
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588854006;
	bh=MSkChxFZqIspRLCauSd0CqP4IKv9LrIyPZ388vIuY7k=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p7O4Gd7dkAEQzrBZ1xZo/XXwTxSsBtNJhykaI+6dwZVQyc0wWtFki2cGBcneicWRw
	 bOyJWdIWuCSTLDs1V3hrjwZ0+VylpK9RUabUvmca9b0GCJ+Frdnn8eJThOTAbw+y4D
	 OGRfSQFU7MNqu+tH1nZ3vJYiGj8RvtP3ne01FyCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B65E3F8015F;
	Thu,  7 May 2020 14:18:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EADDAF8015F; Thu,  7 May 2020 14:18:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E484AF8011C
 for <alsa-devel@alsa-project.org>; Thu,  7 May 2020 14:18:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E484AF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HdHgVWug"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7AA23208E4;
 Thu,  7 May 2020 12:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588853896;
 bh=MSkChxFZqIspRLCauSd0CqP4IKv9LrIyPZ388vIuY7k=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=HdHgVWug8sOeiIUH0XthCnuDAbPqcWRNCMQy+00dXYQ/3BGhDowdVJCi+5oT+fiVi
 2j8PCk9mYTnbPiHxkicqfuuDr3evannnwYXnw8zrjlcmKlad4XgzqzD/9OAAfuvUeN
 EqP19g+z2+/OzJq7BVp4kT05T+biuRQ1l5d8vP7g=
Date: Thu, 07 May 2020 13:18:13 +0100
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, tiwai@suse.com, ChenTao <chentao107@huawei.com>,
 Xiubo.Lee@gmail.com, timur@kernel.org, nicoleotsuka@gmail.com
In-Reply-To: <20200507022959.183739-1-chentao107@huawei.com>
References: <20200507022959.183739-1-chentao107@huawei.com>
Subject: Re: [PATCH -next] soc: fsl_asrc: Make some functions static
Message-Id: <158885389338.38935.7126937131103152522.b4-ty@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org,
 festevam@gmail.com, linux-kernel@vger.kernel.org
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

On Thu, 7 May 2020 10:29:59 +0800, ChenTao wrote:
> Fix the following warning:
> 
> sound/soc/fsl/fsl_asrc.c:157:5: warning:
> symbol 'fsl_asrc_request_pair' was not declared. Should it be static?
> sound/soc/fsl/fsl_asrc.c:200:6: warning:
> symbol 'fsl_asrc_release_pair' was not declared. Should it be static?
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] soc: fsl_asrc: Make some functions static
      commit: c16e923dd635d383026a306acea540b8e0706c88

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
