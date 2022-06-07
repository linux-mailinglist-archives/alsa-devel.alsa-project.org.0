Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 858AE53FBD4
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:46:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FDC71945;
	Tue,  7 Jun 2022 12:46:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FDC71945
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654598814;
	bh=dWi9pVoSXFMjNQasXg+itxXBUXG1usYFJbMM2nTrsb0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NUdHaq9tthI+Pwca5GpJU9SXyPpy9JVX2+LN5KUEVwSvKbxLB004T2F/sn32wkF1U
	 YYukU9VIjdglIhrTOHJMAOpmRWIBvpxY0G4ucRQ67/ggTQDsrGCqpfU/xpAT9H+kqA
	 aUavMUv6VRqozoN8ROdctG88jMjz+DxnQOMiZQhU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FE90F804BC;
	Tue,  7 Jun 2022 12:45:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47E5EF804BC; Tue,  7 Jun 2022 12:45:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 990B8F80116
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:45:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 990B8F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jbbJVJHz"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2AEF261550;
 Tue,  7 Jun 2022 10:45:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08CDEC385A5;
 Tue,  7 Jun 2022 10:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654598719;
 bh=dWi9pVoSXFMjNQasXg+itxXBUXG1usYFJbMM2nTrsb0=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=jbbJVJHznc3BWrvL9hvWGW4/IGx4f9ENxcWG7iVdMkdZZkNnISL4d7mjeKfubXrKK
 8oPtTg3eNzeA68a4oOOg0kkVVwIuIoGXkdZpV/vYd2tSjFtKgITsle39SazOg118Pm
 Mf+eXY4bu7Zxiay+y++FcaKk9OMzuy4ymsYPo4Mu/kSBYEVwMcwZ8CM629Bj061DgT
 sJXD3LI7cYrabxXNs9qSkQb6cbzB/iPlh+YtJCjjEg3M3ZJdi53jIHjOwbpKitXMcg
 MgwAm0rX3ZF8O3d5eZqJiSkjd+X4FVd1U4A+JZiBt2TsmSWZztnAobUsMsc8Ni2+u2
 4yFlXg4mWM/lQ==
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@linaro.org, bjorn.andersson@linaro.org,
 swboyd@chromium.org, tiwai@suse.com, vkoul@kernel.org,
 linux-arm-msm@vger.kernel.org, agross@kernel.org, quic_plai@quicinc.com,
 bgoswami@quicinc.com, devicetree@vger.kernel.org, judyhsiao@chromium.org,
 robh+dt@kernel.org, lgirdwood@gmail.com, quic_rohkumar@quicinc.com,
 perex@perex.cz, linux-kernel@vger.kernel.org, quic_srivasam@quicinc.com,
 alsa-devel@alsa-project.org
In-Reply-To: <1652877755-25120-1-git-send-email-quic_srivasam@quicinc.com>
References: <1652877755-25120-1-git-send-email-quic_srivasam@quicinc.com>
Subject: Re: [PATCH v2] ASoC: qcom: soundwire: Add support for controlling
 audio CGCR from HLOS
Message-Id: <165459871566.301808.10281011736457954166.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:45:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 18 May 2022 18:12:35 +0530, Srinivasa Rao Mandadapu wrote:
> Add support for controlling soundwire audio CGCR interface using clock
> framework to make hclk ungating with software. As per new hardware
> changes, software has to always ungate hclk if soundwire is operational
> and keep it running. This requirement is for latest LPASS chipsets for
> RX, TX and WSA path to work.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: soundwire: Add support for controlling audio CGCR from HLOS
      commit: 32882881078bd8f8fae47ff69c102d9e691f5bb9

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
