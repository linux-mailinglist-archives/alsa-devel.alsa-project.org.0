Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C487B4F298E
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 11:38:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDD001868;
	Tue,  5 Apr 2022 11:37:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDD001868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649151486;
	bh=86V35tezb7CnVylE5xhcOrRZJnrJztG/nm4t18+1yUk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M8IMGMFeTjl120YzHXmrXrzILwl9bwBTW4Gf5Uqoz+JxWJSK9gHjxS4I+agdY73J8
	 M/Qbxf4KgF/ScZUvRZZmqJzrjJ21mbffluTys0msvbA80LmZ8U3vBCen7HK5/VEIqI
	 IoA+oM3f0igdvP+onGWfUwqm5m2pldy86xj5S6+4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 892C1F805C7;
	Tue,  5 Apr 2022 11:31:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33DA9F805BF; Tue,  5 Apr 2022 11:31:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88848F805BD
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 11:31:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88848F805BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cgaphUKP"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 649E6616D6;
 Tue,  5 Apr 2022 09:31:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CF9CC385A8;
 Tue,  5 Apr 2022 09:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649151112;
 bh=86V35tezb7CnVylE5xhcOrRZJnrJztG/nm4t18+1yUk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=cgaphUKPI+f4uVShNLg3NRNpwdZ7b84IuOhO5OSefGnWv3VRUTRgWBR9cTlKAkPC0
 qOK4leaT5YVrerXCeE2R7WAA1rcaWnV0pOS5fM/rSmYWdiCZwBBHVvxNPQ74jxQVIC
 /AsqTeRA+guAKOWTijKZ0CgWOIDMoDYLqgxEvcHv12iBpQbRfrQ1tN0Z0EIr9BoB+Q
 JNVcua9PMUUtZfcjZHrOxbHYt+TbIzgSxtbftttbVVSo0IUOf//shbNr+zZHbmLlXL
 rbuM5UvcdsEdoLUXwDz9wg4i59nRvb5VmzFKqdlU7v5uk2Q7P48bQ9duifOtcmOPme
 GHagk96RP9o7w==
From: Mark Brown <broonie@kernel.org>
To: Judy Hsiao <judyhsiao@chromium.org>
In-Reply-To: <20220331084201.62815-1-judyhsiao@chromium.org>
References: <20220331084201.62815-1-judyhsiao@chromium.org>
Subject: Re: [v2] ASoC: qcom: Add driver support for ALC5682I-VS
Message-Id: <164915111030.276574.7396913741525054470.b4-ty@kernel.org>
Date: Tue, 05 Apr 2022 10:31:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: judyhsiao@google.com, dianders@chromium.org, cychiang@google.com,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, swboyd@chromium.org,
 yuhsuan@chromium.org
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

On Thu, 31 Mar 2022 16:42:01 +0800, Judy Hsiao wrote:
> Add Machine driver support for ALC5682I-VS codec.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: Add driver support for ALC5682I-VS
      commit: c5198db82d4c257d4d9fb9dc0db329482f3d08b9

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
