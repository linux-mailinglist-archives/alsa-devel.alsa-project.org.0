Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0D75834D1
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jul 2022 23:26:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C441100;
	Wed, 27 Jul 2022 23:26:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C441100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658957213;
	bh=RQDcnihAQECpIPIGtWrEQpvzYtBnkf+NmAmzZ4dC/+Y=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cjBnnDbvJKPiDK94zCi7tzJkJX9mnPZG+wvHNkDYBymUm5z+KXdzq0GpJJvxfMgGc
	 Z1JRhAsDd+SwH2UPjH0B8dDqgexnUvWXLNfuvzbCKuE4gNhcFRi4DVtYpLe+E/c/DW
	 JBkK0BuwZvGbelCIryfGlkM1hFeyo+InaTVhpMKs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2319F80171;
	Wed, 27 Jul 2022 23:25:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12BB7F8014E; Wed, 27 Jul 2022 23:25:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3590F8014E
 for <alsa-devel@alsa-project.org>; Wed, 27 Jul 2022 23:25:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3590F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qKpjjjqn"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B583360A47;
 Wed, 27 Jul 2022 21:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B065FC433D6;
 Wed, 27 Jul 2022 21:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658957145;
 bh=RQDcnihAQECpIPIGtWrEQpvzYtBnkf+NmAmzZ4dC/+Y=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=qKpjjjqn72xgTFE8Qs967fz8bQD3tFQehF+DhEXll8ngJ6CijQxk74P78F9PgEEAl
 cPg3QrIlLgVmk9c8J6XrPwFx4duifuTOvNznH6a4FL9d2EXnRTcpuK6NO1IKzp6zF+
 CFsOzPkhTWpmv9M74RzJYoHPOlb5/ogttmxg6adjPewcBNoGK33dJh/vXxU5IWfTtO
 /QgOK9PSHj1BfJAtuKKQoB5wu1YQbYZc3D3JpOO2OQxeK0B14LBJqRCgnsUCfcdXHH
 Ap+5hzZ6i52hj6/zevDEdIJCfzT0HDS8bw5VAgLgWCrzQz4eCKLWDLcvKFA44uTWNw
 Wd5jvPxQxF58g==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220727124749.4604-1-srinivas.kandagatla@linaro.org>
References: <20220727124749.4604-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: codecs: va-macro: use fsgen as clock
Message-Id: <165895714343.1039659.13792597737035466028.b4-ty@kernel.org>
Date: Wed, 27 Jul 2022 22:25:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-d1cc2
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

On Wed, 27 Jul 2022 13:47:49 +0100, Srinivas Kandagatla wrote:
> VA Macro fsgen clock is supplied to other LPASS Macros using proper
> clock apis, however the internal user uses the registers directly without
> clk apis. This approch has race condition where in external users of
> the clock might cut the clock while VA macro is actively using this.
> 
> Moving the internal usage to clk apis would provide a proper refcounting
> and avoid such race conditions.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: va-macro: use fsgen as clock
      commit: 30097967e0566cac817273ef76add100f6b0f463

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
