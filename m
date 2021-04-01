Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF123516AC
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Apr 2021 18:17:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4321016C3;
	Thu,  1 Apr 2021 18:17:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4321016C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617293878;
	bh=dwHmd5z7d3S6IKZJVqZz0GEYmtsn7TXcZwT3wxRq0HU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ck/m1qsMwSwLlFvjdKcjRVOUXi4Zn4i0ip1qM+24VAibD2i8Kspnovt8RLAZ8yagy
	 glJL81IMRZItzVIzLqlDXFLLt0bGw18MkcOeHSmNiTITEeGVPavBtntVKpc/c1RLXB
	 tmRu/Z7mcNausIl2NwUTgRQUqqNW9xx9xezztooo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FFAAF8027D;
	Thu,  1 Apr 2021 18:16:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AEA3F802D2; Thu,  1 Apr 2021 18:16:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51BDFF8027B
 for <alsa-devel@alsa-project.org>; Thu,  1 Apr 2021 18:16:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51BDFF8027B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="P82XwlnO"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A671361376;
 Thu,  1 Apr 2021 16:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617293772;
 bh=dwHmd5z7d3S6IKZJVqZz0GEYmtsn7TXcZwT3wxRq0HU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P82XwlnOVJaSE5ZHL1OyJ7KOQrkT/rE4Tky0TKeN8YgnK/v9WeRj91MiHA9qKAD/C
 GVsdXH/dbIAZcq2gxKSPD/OETUCKTrq90Nw1/OjX6YU7LViVNOP322zhkcN1vrs8Wv
 pKMevN4w9qw5uvkTDt5CsS3Y2NO1+QBtj4bwrEBLb2vDXUM2JigvSwkuzjLtX78UgA
 K12SsejB1ilGABY6Tp3swg2/xqc5ZNqWKSoq2AQTH398Wn8Yv3+/asDQPQ/T+d+f8z
 b6BqEkUDEW/05ivCL9QX+t25kopc6guY2rMDQu2wlYYC00VaRtFJqIgwB4f/QAZem2
 1LnPGz/t4Ef2A==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: codecs: lpass-tx-macro: set npl clock rate
 correctly
Date: Thu,  1 Apr 2021 17:15:49 +0100
Message-Id: <161729333651.31618.804470082704941093.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210331171235.24824-1-srinivas.kandagatla@linaro.org>
References: <20210331171235.24824-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.com, Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Wed, 31 Mar 2021 18:12:34 +0100, Srinivas Kandagatla wrote:
> NPL clock rate is twice the MCLK rate, so set this correctly to
> avoid soundwire timeouts.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs: lpass-tx-macro: set npl clock rate correctly
      commit: b861106f3cd693f944ba46d9ea8744a3fbfd14db
[2/2] ASoC: codecs: lpass-rx-macro: set npl clock rate correctly
      commit: adfc3ed7dcb98f7411d3632e3bdf81690294fe7d

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
