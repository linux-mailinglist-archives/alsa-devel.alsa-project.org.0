Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFE7572281
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 20:24:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BE6816F7;
	Tue, 12 Jul 2022 20:23:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BE6816F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657650266;
	bh=VLRubhjL7y27NdF7YVEb5Ddc0uUdgYRMTym9ib6gI9Y=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PTUzYA/uGgIwh0Tp+j0Sh+znbWRqNeQWzjnXe7pVcZL5oNU50prQLBKSy3RWVqAse
	 Jm9rCbNL59/bzDjJ71aKxHgNVqtUOK1vUxC5OP55zyI+EVetkQ3r7IqFuZrI7hq0Uu
	 ASZfzhZLGH2QayVMv3XlJjZx+RkZRXMyUVON5heU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC38BF80559;
	Tue, 12 Jul 2022 20:22:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 882D2F8054A; Tue, 12 Jul 2022 20:22:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1E22F800E8
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 20:22:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1E22F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ni+XIbZ1"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A2580B81B94;
 Tue, 12 Jul 2022 18:22:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5091C3411C;
 Tue, 12 Jul 2022 18:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657650146;
 bh=VLRubhjL7y27NdF7YVEb5Ddc0uUdgYRMTym9ib6gI9Y=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ni+XIbZ1/lddFoZctjviMfFbqKOVw83VtgIlvJwwtEtQvOZE4xmTWZh2HZi4AD2Q5
 y3cKD+ci5lR56PaRojzq0kFm6r4CzI4XweMJ1GjPbZBQsnWnM2wAssu5Apgl8VZzLF
 sNhvIcrl8u9zga8QYtrXt6g73rVXoYi08q/R/dgn7RQ9lZZ1k8H1wdiOGRDl1y1XRD
 j8AFaEhaFed3T1MBya6pukoH4IZ5+/hHbaPEAMYQHQXrlhDal2i/wGS0W+9yxcwlfa
 l5l1cVF8uzP3G7GuE2xWBQ97TZb8f62U90+lSY0PmjVWNPko5YRjAGShE6+DDHzy8M
 Hud7OZzT76F4Q==
From: Mark Brown <broonie@kernel.org>
To: peter.ujfalusi@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com
In-Reply-To: <20220712130103.31514-1-peter.ujfalusi@linux.intel.com>
References: <20220712130103.31514-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc3-topology: Prevent double freeing of
 ipc_control_data via load_bytes
Message-Id: <165765014466.502248.4536508731495125083.b4-ty@kernel.org>
Date: Tue, 12 Jul 2022 19:22:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, seppo.ingalsuo@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

On Tue, 12 Jul 2022 16:01:03 +0300, Peter Ujfalusi wrote:
> We have sanity checks for byte controls and if any of the fail the locally
> allocated scontrol->ipc_control_data is freed up, but not set to NULL.
> 
> On a rollback path of the error the higher level code will also try to free
> the scontrol->ipc_control_data which will eventually going to lead to
> memory corruption as double freeing memory is not a good thing.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc3-topology: Prevent double freeing of ipc_control_data via load_bytes
      commit: d5bd47f3ca124058a8e87eae4508afeda2132611

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
