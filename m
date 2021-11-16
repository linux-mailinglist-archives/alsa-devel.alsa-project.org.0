Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8D44538D4
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 18:50:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FB23186E;
	Tue, 16 Nov 2021 18:49:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FB23186E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637085046;
	bh=kzq0dlu0gjzDR19x6UB8TtYBuQv/WXthmFOPYes7mv4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ItCLPzRmjGZIWYq7VVYa6GXDW6FqOBhc1dNcAryeQYuAbfME/8sEOGhN+vx8SGV2j
	 xP9woa8poTi3t0oM22x76QWwCRAgz33HGOhGOybAW+chkOtmtGhBj/tauPys6OThuK
	 tAqkRcp0h2voMEKjphC/rOVutR5EkAg6rLIoYGQ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 497F5F8026D;
	Tue, 16 Nov 2021 18:48:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB3AEF804F2; Tue, 16 Nov 2021 18:48:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F8E8F804ED
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 18:48:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F8E8F804ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tE5KZQn6"
Received: by mail.kernel.org (Postfix) with ESMTPSA id F214F61BE2;
 Tue, 16 Nov 2021 17:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637084901;
 bh=kzq0dlu0gjzDR19x6UB8TtYBuQv/WXthmFOPYes7mv4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=tE5KZQn6XGHZxSTDoS6gQwYT24jKy4qJvWLYfMtNg27dhXaO3Hl9niha8HY9mYtwT
 XnScvK3Wnkl6DKnfYI3nkiG9reh2DxCtIkQNDVapeBrLsSzdDrCesenLty1+6o4u3T
 3ulw3QTyOY9S2RC/ZRhlF5+9ilzHT6Mk9dM5fivWVNCbhLXWXfN1J7R7R7CXp+N0qC
 XkwzjFMsSPp0kF+kzwX+DXVjb6z9PF3PmZTzQQMGjLP2UuPzkyt/OjHPweXcJFOO5L
 NNkRAZwkzinV/ob26iMwzPEnmaFxCigJxP3RqEj/5f7rV19KmbtmdvnyGywZeRAYvK
 MPlfSGiur+roQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20211116115021.14213-1-srinivas.kandagatla@linaro.org>
References: <20211116115021.14213-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: qcom: sdm845: only setup slim ports once
Message-Id: <163708489973.808776.5891488829987310491.b4-ty@kernel.org>
Date: Tue, 16 Nov 2021 17:48:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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

On Tue, 16 Nov 2021 11:50:21 +0000, Srinivas Kandagatla wrote:
> Currently same slim channel map setup for every dai link, which is redundant.
> Fix this by adding a flag and conditionally setting these channel maps.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: sdm845: only setup slim ports once
      commit: 5f55c9693a222ee1b8ec62a57fbcff59af0c4837

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
