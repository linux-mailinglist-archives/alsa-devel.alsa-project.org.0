Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB292C8A1D
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Nov 2020 17:59:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8049172F;
	Mon, 30 Nov 2020 17:58:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8049172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606755545;
	bh=7Vk28EpWuHZuMnrQqTFNVfiCs4UlJCZKrdZFJcP3amk=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cdZNdnVaitALpRtJReDg3zLq78JZ4JXD4qzcMjrzji3Nj55YesIqRahzi5Svp2WsX
	 jYLl8CQsWitMELl/NOHfR83Q38a58vGpQLKuUhSDAMhgoBHuvD44e+iHQfbCbg2t36
	 8kxZl4PEAMuybbeB+Ca2MGaComlMb5e/YXZMYfz8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3554DF804CA;
	Mon, 30 Nov 2020 17:56:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2152F804AA; Mon, 30 Nov 2020 17:56:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7794AF80146
 for <alsa-devel@alsa-project.org>; Mon, 30 Nov 2020 17:56:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7794AF80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PWlBhoks"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4C9492076B;
 Mon, 30 Nov 2020 16:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606755359;
 bh=7Vk28EpWuHZuMnrQqTFNVfiCs4UlJCZKrdZFJcP3amk=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=PWlBhokstXIrt3HShF+u0MtDphfvLTvqH/VUpu4q1S5g7N1fbQjHvJ9uzeb6VVqLM
 YaHrWqeAEvSiw4KWEXyYy+byh161jIrXzbHhv9Tis+sOfIJCXnPM7wpoXSEVFo1vR9
 rDSAMxpKEY+xOzmDG8uqQ+QEdF0pS0Z4GRLLYx88=
Date: Mon, 30 Nov 2020 16:55:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Lumi Lee <Lumi.Lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <1606705875-1940-1-git-send-email-Lumi.Lee@mediatek.com>
References: <1606705875-1940-1-git-send-email-Lumi.Lee@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: btcvsd fix tx stream assign
Message-Id: <160675530955.30326.8266521477804403197.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 wsd_upstream@mediatek.com, Lumi Lee <lumi.lee@mediatek.com>,
 jiaxin.yu@mediatek.com, linux-kernel@vger.kernel.org, Shane.Chien@mediatek.com,
 linux-mediatek@lists.infradead.org, eason.yen@mediatek.com
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

On Mon, 30 Nov 2020 11:11:15 +0800, Lumi Lee wrote:
> Fix tx/rx stream assign in write.
> Write should use tx instead of rx.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: btcvsd fix tx stream assign
      commit: bbe1f69dce94089943cc407a88325ae7e851d49c

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
