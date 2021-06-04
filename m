Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 387FA39BD4B
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Jun 2021 18:35:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A11B11748;
	Fri,  4 Jun 2021 18:34:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A11B11748
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622824516;
	bh=2ujz3UvSOClvdWQEVr3TmeBifJcWX51ORDVUCP5zweI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sDtlQbUhUpRyLmbA8qj9R1wePPeQhS/EEJAmhOTSotxsv6UZeUWLerjVUCJSKzpCr
	 TG7qGYXCeqe1yg9gZmq6vh1eXjurc5l90sZAdwXbmNwC2YHyjQk3lDV0Z1ERz4mLh4
	 XbCQBmCzWZhpBxqxzB/fZNqSxf4lpBWVTM1ISN0k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12556F804BD;
	Fri,  4 Jun 2021 18:33:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 734D3F8016D; Fri,  4 Jun 2021 18:32:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BF31F8016D
 for <alsa-devel@alsa-project.org>; Fri,  4 Jun 2021 18:32:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BF31F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hQpYO5ou"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 98E5C613C9;
 Fri,  4 Jun 2021 16:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622824375;
 bh=2ujz3UvSOClvdWQEVr3TmeBifJcWX51ORDVUCP5zweI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hQpYO5ou66/+WQLmmx2VPuyXS5TCoDsf57I/V8ibov/UvTXMbMczUr3BDonLfcgsY
 5ev12xode8sEGvvkafYe1fMKiGM33FVsQeNpW7MIoS0xpwj45CXDm54rsyiopDZII0
 ST9KRfcDKYuoRWrUmQpwR6d7B5XJhdFNyuPF0ksRe4urYb4WruTv70mJNuAZoehBAy
 /na0YSQBNYWpr6gaUhsDS90M3lJ6TTUdhMpMExQFAucugGVmTlzW/399nmq5YylNZf
 vg1xqndqTaWhg0uFQDXXrJpySaRN5QfwD5zd4EGVN/7v5dBbSub8nsLTlvod5wNEoD
 Gop1tO+fL4Rlg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com,
	Oder Chiou <oder_chiou@realtek.com>
Subject: Re: [PATCH] ASoC: rt5682: Fix the fast discharge for headset
 unplugging in soundwire mode
Date: Fri,  4 Jun 2021 17:32:29 +0100
Message-Id: <162282419357.38836.3417945749384407435.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604063150.29925-1-oder_chiou@realtek.com>
References: <20210604063150.29925-1-oder_chiou@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: libin.yang@intel.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 shumingf@realtek.com, Mark Brown <broonie@kernel.org>, derek.fang@realtek.com,
 flove@realtek.com, sathya.prakash.m.r@intel.com, bard.liao@intel.com
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

On Fri, 4 Jun 2021 14:31:50 +0800, Oder Chiou wrote:
> Based on ("5a15cd7fce20b1fd4aece6a0240e2b58cd6a225d"), the setting also
> should be set in soundwire mode.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5682: Fix the fast discharge for headset unplugging in soundwire mode
      commit: 49783c6f4a4f49836b5a109ae0daf2f90b0d7713

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
