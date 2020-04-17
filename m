Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E3C1AE558
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Apr 2020 20:58:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84C2D1675;
	Fri, 17 Apr 2020 20:57:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84C2D1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587149916;
	bh=Dm3R98EwUsHzxty01uoqbg4lClykQLLZ0/eLOPZF/aI=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zdp9EFcjvAsC9jq//EMAoBRjdmbiDckWuwTIDmK393gt1JQZ9hV1mOnB2TkHPlPAw
	 FKENt4/a5FEv9kQReo+b/cGxoYfzSRcjCMLW+ITZDnqvlGIZGxnW2ecmgcQYbSNJu+
	 L9geHbOI1oiKFQ9Dl9v0ozfvA6RXn11BWPpIdOVg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC140F8026A;
	Fri, 17 Apr 2020 20:56:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46361F80266; Fri, 17 Apr 2020 20:56:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1031DF80264
 for <alsa-devel@alsa-project.org>; Fri, 17 Apr 2020 20:56:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1031DF80264
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="s84ng54P"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E23BD206E9;
 Fri, 17 Apr 2020 18:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587149766;
 bh=Dm3R98EwUsHzxty01uoqbg4lClykQLLZ0/eLOPZF/aI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=s84ng54P9XXBCp2gGV+A6cOqwWuqWzcbakKh/O/Bjvr2W3MXBlCBb48hpMi23Vkp3
 C++UWR1jhP0Zp3UopEesVXIaopvo5fQCXKi+Iw8+KraqZ1iqhrELT1EslYmXTXNMp9
 S9a4pcHAcd0AViiBUn3sXgKgSkAR7+nc9/R+ZavM=
Date: Fri, 17 Apr 2020 19:56:03 +0100
From: Mark Brown <broonie@kernel.org>
To: alexandre.torgue@st.com, lgirdwood@gmail.com, tiwai@suse.com,
 Olivier Moysan <olivier.moysan@st.com>, perex@perex.cz
In-Reply-To: <20200417142122.10212-1-olivier.moysan@st.com>
References: <20200417142122.10212-1-olivier.moysan@st.com>
Subject: Re: [PATCH] ASoC: stm32: sai: fix sai probe
Message-Id: <158714975762.9428.15651619763000447218.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
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

On Fri, 17 Apr 2020 16:21:22 +0200, Olivier Moysan wrote:
> pcm config must be set before snd_dmaengine_pcm_register() call.
> 
> Fixes: 0d6defc7e0e4 ("ASoC: stm32: sai: manage rebind issue")
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> ---
>  sound/soc/stm/stm32_sai_sub.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> [...]

Applied, thanks!

[1/1] ASoC: stm32: sai: fix sai probe
      commit: e2bcb65782f91390952e849e21b82ed7cb05697f

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
