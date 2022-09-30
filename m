Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFDA5F0B2A
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Sep 2022 13:57:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 644C4169C;
	Fri, 30 Sep 2022 13:56:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 644C4169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664539048;
	bh=3zIKxbAiLcToLZncGPUrO0dreSdU2PDyLp+eRwEjvcA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sKm2PkCC1wrWsSaq8sFbZ+rWo3DSU6ZxDyf1angXFaO7iewtKlzXAxofDPHV5XDYz
	 1R5gTnCk1DjWTh0upmMvh4Xll7OvLcrWo7cqEhbNCx/d+miZKJcbNBVIMQEQcg33Jn
	 GLKMfak3rh24+n72WR3F190C0jcanAx2wQZO6bXY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEEF4F800E8;
	Fri, 30 Sep 2022 13:56:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49C16F800E8; Fri, 30 Sep 2022 13:56:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E106F800E8
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 13:56:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E106F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IzCe/3da"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 11DE4B8268B;
 Fri, 30 Sep 2022 11:56:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9466FC433C1;
 Fri, 30 Sep 2022 11:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664538985;
 bh=3zIKxbAiLcToLZncGPUrO0dreSdU2PDyLp+eRwEjvcA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=IzCe/3daJ4C60NF5EAhgksN1oPs8ws7ZV4hhtGN0CUbWBnbFmOI6kPRJdt55I/yEc
 vLFnYojGDEn0deAyZQmEYRNLQj4DGcACC32DL/4+73Bz4puMXJV5erSxRiZISyLHqj
 Op3Me8IzQMh2RC1x3c7Gp7p7WeJ7pGUw8YSrhPeMPOQ/IQZMfccH+uDFUMEUAVcSyP
 aqcE95mQKUVCY9jnc0zuW0NNkE/RKjewIML7TgzDD6eH2RpfvnNg7u4qilydNzFNqI
 zKZf0Gwfe2bqYJRogMHs3eNRe/ga4iPogHCZLBAWTcMPazQcpVMtHMm2H/WhDKbDJo
 DwJJPxJwAaMKw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220930105347.41127-1-srinivas.kandagatla@linaro.org>
References: <20220930105347.41127-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: qcom: fix unmet direct dependencies for
 SND_SOC_QDSP6
Message-Id: <166453898431.127290.17469866447860994691.b4-ty@kernel.org>
Date: Fri, 30 Sep 2022 12:56:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Randy Dunlap <rdunlap@infradead.org>, tiwai@suse.com, lgirdwood@gmail.com
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

On Fri, 30 Sep 2022 11:53:47 +0100, Srinivas Kandagatla wrote:
> SND_SOC_QDSP6 already has COMPILE_TEST so remove that from
> SND_SOC_SC8280XP and also add QCOM_APR dependencies to
> SND_SOC_SC8280XP like other Qualcomm machine drivers.
> 
> This should also fix below warning:
> on x86_64, when QCOM_APR is not set and COMPILE_TEST=y:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: fix unmet direct dependencies for SND_SOC_QDSP6
      commit: 7bc08355a4917f2bbd38e7af5207f339f47e5d36

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
