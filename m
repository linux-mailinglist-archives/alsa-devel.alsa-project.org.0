Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DED129D26A
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Oct 2020 22:23:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D843C83E;
	Wed, 28 Oct 2020 22:23:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D843C83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603920231;
	bh=6OAbUy4jL6Bx1P3st+/vdMDyglfJGd3vOkanNKHQnkA=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vfy0vXH/zcjkoMoR5BQXmqj7w9+rJJaRR3x70l2mDC0JeXvSU4QGE4nDXWoqQhxgb
	 a1k3WAqzpqAnEv8lZ0jZr8NF++O4gluNVZSZyu98Mbirq+T0sSIfJYFq/OfUYqbWca
	 bU6z42W0WBWMJnPmsSC9jEF1dYFEnMvTF3z1Qy/0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 501C2F8025E;
	Wed, 28 Oct 2020 22:22:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 719A9F80212; Wed, 28 Oct 2020 22:22:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D3DFF80134
 for <alsa-devel@alsa-project.org>; Wed, 28 Oct 2020 22:22:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D3DFF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="B0lch2UH"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D2EB224838;
 Wed, 28 Oct 2020 21:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603920130;
 bh=6OAbUy4jL6Bx1P3st+/vdMDyglfJGd3vOkanNKHQnkA=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=B0lch2UHpafpd1SgSfTrs7u2APbezZCJcbm1+rN+3tSYW+odtUqfaF/lXiykxj16J
 xl5HeqCshjUNhFE2z+7CxkuYB94LQfTkG5UbJwJYXbIjwdHXyamWKC3FBfiO18Hdcf
 3ZQ9zHhpGCOFItmP3jhNy/+WYKkdZXzFxhYTXYgQ=
Date: Wed, 28 Oct 2020 21:22:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20201028154340.17090-1-srinivas.kandagatla@linaro.org>
References: <20201028154340.17090-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: codecs: wcd934x: Set digital gain range
 correctly
Message-Id: <160392012411.40829.13831056962403963010.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com
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

On Wed, 28 Oct 2020 15:43:39 +0000, Srinivas Kandagatla wrote:
> digital gain range is -84dB min to 40dB max, however this was not
> correctly specified in the range.
> 
> Fix this by with correct range!

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs: wcd934x: Set digital gain range correctly
      commit: fc0522bbe02fa4beb95c0514ace66b585616f111
[2/2] ASoC: codecs: wcd9335: Set digital gain range correctly
      commit: 6d6bc54ab4f2404d46078abc04bf4dee4db01def

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
