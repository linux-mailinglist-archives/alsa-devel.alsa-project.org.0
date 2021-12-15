Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AD64750B5
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Dec 2021 03:05:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A6FA1F7A;
	Wed, 15 Dec 2021 03:04:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A6FA1F7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639533949;
	bh=I2Cnmary5Jqy04437jsTV6wE8dmrgoA/icM9J4+h0YM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kYtqU36cCPGRFeVs9h3a1toa+tlqT1kJYeu1CN2yY5y1I+TD44eyfIZ1kvCT3neFO
	 zgc6XExUfarBzFugsPVKSZXI8yZ2jR9t1z0qcNY5Fu9ofZLPMMzJkqA/XKD8YI3Txu
	 jUe0rLNHgQAgj3FF6385hfKQWCF+8jEQlNhSrSUU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C95CCF80254;
	Wed, 15 Dec 2021 03:04:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DDD4F80249; Wed, 15 Dec 2021 03:04:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA6EBF801EC
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 03:04:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA6EBF801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eFuZjpx7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 48D496178C;
 Wed, 15 Dec 2021 02:04:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3399CC34601;
 Wed, 15 Dec 2021 02:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639533842;
 bh=I2Cnmary5Jqy04437jsTV6wE8dmrgoA/icM9J4+h0YM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=eFuZjpx7HcZeGDYFfGrLEB8CArZbZ6uo3TWjhhDP9K3bDGJDAWISy3BFjpNljIsuE
 AmKbKfERMNFU+/WHJL8y5mXCQY+A8r/X/3tnmVPqBpG0Vq5acykBSSb3fR1xKpulcc
 YQ0JmkeSn0eV1G87E9V9A6Ds5MMiSq/oBjlNpAedOFNTE+z7BmQoOQtjDMMzev7EOn
 iP9AbOU6codGS1ftnUEcjAdeVPdGjKziytZnxw+wB+sOxmHEH/P3htJjPXsXKIOTnz
 YwNNSeDJxD0LXcq4HLiihZhnKEqLv56+CKB2RNoGuSPn5pSLdfIaFBVz9XdsN7+XPw
 j1f2z+QOnrtwA==
From: Mark Brown <broonie@kernel.org>
To: Judy Hsiao <judyhsiao@chromium.org>
In-Reply-To: <20211214022509.1288245-1-judyhsiao@chromium.org>
References: <20211214022509.1288245-1-judyhsiao@chromium.org>
Subject: Re: [v3] SoC: qcom: Distinguish headset codec by codec_dai->name
Message-Id: <163953383992.1515253.6537590429675017997.b4-ty@kernel.org>
Date: Wed, 15 Dec 2021 02:03:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: judyhsiao@google.com, dianders@chromium.org, cychiang@google.com,
 linux-arm-msm@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Banajit Goswami <bgoswami@codeaurora.org>,
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

On Tue, 14 Dec 2021 10:25:09 +0800, Judy Hsiao wrote:
> Distinguish which headset codec is on the board by codec_dai->name
> instead of card->name.
> 
> It fixes the crash of being unable to handle kernel paging requests
> at virtual address ADDR by initializing the correct audio codec on
> the board.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] SoC: qcom: Distinguish headset codec by codec_dai->name
      commit: 833a94aac572d7f0fe3f51329e0eb9f2884cf665

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
