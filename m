Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79531297A03
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Oct 2020 02:31:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B8B11843;
	Sat, 24 Oct 2020 02:30:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B8B11843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603499488;
	bh=+FhP76HiOXe3pLSCqtvML2xh8BV++5Vbe3/EWxwGkS0=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jNu/u6u6UVO3Xh/FIwxS0NRbcqHEYZm6FeczHv93ml3/yD8Ln9/NF1ZN6NQwvuGC7
	 YTrTQrv89e2dDcwwGU02IHt6dhN05DZ0U2cFHx24HFO0LWDdhUIaYuQb1mLztTAGXN
	 IoIg6PEt6T5N0PFzjbX3PtA3DQ7FMZ6qgZk9Z6R8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8F4EF804BD;
	Sat, 24 Oct 2020 02:29:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DDC4F804B2; Sat, 24 Oct 2020 02:28:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 037D6F800BD
 for <alsa-devel@alsa-project.org>; Sat, 24 Oct 2020 02:28:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 037D6F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dQ4WtqDR"
Received: from localhost (cpc102338-sgyl38-2-0-cust404.18-2.cable.virginm.net
 [77.102.33.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B76A42225E;
 Sat, 24 Oct 2020 00:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603499335;
 bh=+FhP76HiOXe3pLSCqtvML2xh8BV++5Vbe3/EWxwGkS0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=dQ4WtqDRR9mWnKyBXxnLs1n5kJnoMWQ+fNdXS+7h3F1eWUPtwmG/YfyflQSUmTckJ
 xSD5QvPO5yw1C+LiYg1Az8ytrcMrDCZHcvBxNpCoKDe+qMjjf6bR40myzgnrLgS6QJ
 XP5lQqGlOZopAoGcU4sp8UyUKud4YuN/z10SQ0s4=
Date: Sat, 24 Oct 2020 01:28:53 +0100
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, Olivier Moysan <olivier.moysan@st.com>,
 alexandre.torgue@st.com, tiwai@suse.com, arnaud.patard@rtp-net.org
In-Reply-To: <20201020150109.482-1-olivier.moysan@st.com>
References: <20201020150109.482-1-olivier.moysan@st.com>
Subject: Re: [PATCH v2] ASoC: cs42l51: manage mclk shutdown delay
Message-Id: <160349931941.28438.14503960964995572782.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, arnaud.pouliquen@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
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

On Tue, 20 Oct 2020 17:01:09 +0200, Olivier Moysan wrote:
> A delay must be introduced before the shutdown down of the mclk,
> as stated in CS42L51 datasheet. Otherwise the codec may
> produce some noise after the end of DAPM power down sequence.
> The delay between DAC and CLOCK_SUPPLY widgets is too short.
> Add a delay in mclk shutdown request to manage the shutdown delay
> explicitly. From experiments, at least 10ms delay is necessary.
> Set delay to 20ms as recommended in Documentation/timers/timers-howto.rst
> when using msleep().

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l51: manage mclk shutdown delay
      commit: 20afe581c9b980848ad097c4d54dde9bec7593ef

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
