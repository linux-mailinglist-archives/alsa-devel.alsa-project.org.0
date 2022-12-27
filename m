Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4B165663A
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 01:16:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5982666F4;
	Tue, 27 Dec 2022 01:15:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5982666F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672100188;
	bh=DIg/odKp2/GsvUG9uXZmNZJHmI/8dBE3E1rswz+7Tyk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JR9bNSPcCNybVKe2uWpHR2UBbCSaEVKiUuabd/a9hhx6haMQLjLD10RAL+de4Y3pb
	 af2fcPrq3Ssqd9uhNp7kSNn8bRjwVemZlLlrgj5XCF0jekU+4W5erLNnhvr3u0R6zl
	 BM8aTpZlsdnq0tRt99uxoZkM83CEKvIul5fEoGcw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09FF9F804FE;
	Tue, 27 Dec 2022 01:15:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E793F804FE; Tue, 27 Dec 2022 01:15:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9BFEF8042F
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 01:14:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9BFEF8042F
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=adHxV0oz
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CEC1EB80E0D;
 Tue, 27 Dec 2022 00:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B12A4C433F0;
 Tue, 27 Dec 2022 00:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672100097;
 bh=DIg/odKp2/GsvUG9uXZmNZJHmI/8dBE3E1rswz+7Tyk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=adHxV0ozZYYWlL030bfLJGOsiPe/eNeexNMRZocUQljH1oPjk0543dDUTvvBuQEBJ
 lsHsqyuE+akOlLxgKxGoOHr9wnt5NpuGxYb8tfb1RNnPa729Xbbrn/GoIYGK66uYVH
 YZNociIMJHtsQEUqedEnyScQUpaGOvxxRBrQ56K9O2KBZ8l2iq4mG7YJlcXyv4FP9d
 wfkQARgBkwMRZaz0JEK8KmAC3HqxGuVUVjITcA2/SYY6lQkQyG9rB7f9yYcvUtngJq
 AR7ly1iuhsNhUFhX8qx4GG9p1C79rJ94aSPLiW9Y1YFtMqEkuNt3pLcL8qsCb4RTko
 wgnOhtUTDuD0Q==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20221220125629.8469-1-peter.ujfalusi@linux.intel.com>
References: <20221220125629.8469-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v2 0/3] ASoC: SOF: Fixes for suspend after firmware crash
Message-Id: <167210009543.553759.6276339953213630705.b4-ty@kernel.org>
Date: Tue, 27 Dec 2022 00:14:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-7ab1d
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, 20 Dec 2022 14:56:26 +0200, Peter Ujfalusi wrote:
> This is the followup series for the v1 sent out by Ranjani [1]. Unfortunately
> Ranjani was dragged away to another issue and could not send the update herself.
> 
> Changes since v1:
> - In patch 2, move the tear_down_all_pipelines call instead of duplicating it
> 
> Amadeusz: I have kept the check as it is:
> if (tplg_ops && tplg_ops->tear_down_all_pipelines)
> I'm preparing the ops optionality change series which would require this change.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: pm: Set target state earlier
      commit: 6f95eec6fb89e195dbdf30de65553c7fc57d9372
[2/3] ASoC: SOF: pm: Always tear down pipelines before DSP suspend
      commit: d185e0689abc98ef55fb7a7d75aa0c48a0ed5838
[3/3] ASoC: SOF: Add FW state to debugfs
      commit: 9a9134fd56f6ba614ff7b2b3b0bac0bf1d0dc0c9

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
