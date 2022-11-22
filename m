Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C85633F0C
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Nov 2022 15:36:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79D09163B;
	Tue, 22 Nov 2022 15:35:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79D09163B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669127801;
	bh=idT7Duah9n5dfy7C5Y9Z/wnjPjKyXBy9xQUKoFfCt/I=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jyqQAYHfy3NNlYRP8QDmfFswwutBQw4FX0ETqT8y308ajBHKHS0u/rHO3zd8EVR0w
	 I0HEet0UGb/q+06Doky9Sf3NpspSgQJWMdVEtYQT3C2SUZ2XHrdqYfNIB1EGcND+A4
	 R1SucxVs1mY1dyLtDKHQvFpAt1UM1EUn85ueK0fM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A79EF80310;
	Tue, 22 Nov 2022 15:35:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6EC5F80154; Tue, 22 Nov 2022 15:35:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 726EDF80154
 for <alsa-devel@alsa-project.org>; Tue, 22 Nov 2022 15:35:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 726EDF80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Hh3YTjsE"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DB02861732;
 Tue, 22 Nov 2022 14:35:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B25FC433D6;
 Tue, 22 Nov 2022 14:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669127736;
 bh=idT7Duah9n5dfy7C5Y9Z/wnjPjKyXBy9xQUKoFfCt/I=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=Hh3YTjsEnwXdIj8hP7rBW82DTNH21cI/tpTUBwydrbEgts5SLs/pSwkoEMuuJYJlS
 cjDgH3YV3vPV6sn+8zTI1by/qan6LILG/k4c7uFIUjlpFTuvQTecHv2dCOFHKm2TGd
 Lp6E97js0jd8ElUs4J93HYKDLfswC5kXyycnfPzqeYeTTbZFJhNv4RRQ8SweTmgZ4O
 6JUVfpDjLJ/DWjXZRJYriMIgA9cUmadjeuIT4IUug5Wu/K/46xLnDgH9BJShuw+L7s
 pwlvGuVt+bz0TpttVV9Y0DM6mQFXCV4ZY9XGlOrzDOg37s+1U/GscxU91jbPgI3jr5
 451oSxA8GU1zQ==
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@linaro.org, alsa-devel@alsa-project.org, perex@perex.cz,
 lgirdwood@gmail.co, 
 andersson@kernel.org, bgoswami@quicinc.com, quic_plai@quicinc.com,
 quic_rohkumar@quicinc.com, swboyd@chromium.org, 
 lgirdwood@gmail.com, devicetree@vger.kernel.org, tiwai@suse.com,
 judyhsiao@chromium.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org, 
 linux-arm-msm@vger.kernel.org
In-Reply-To: <1669098673-29703-1-git-send-email-quic_srivasam@quicinc.com>
References: <1669098673-29703-1-git-send-email-quic_srivasam@quicinc.com>
Subject: Re: [PATCH v2] ASoC: soc-pcm: Add NULL check in BE reparenting
Message-Id: <166912773193.193495.10138627098068902263.b4-ty@kernel.org>
Date: Tue, 22 Nov 2022 14:35:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
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

On Tue, 22 Nov 2022 12:01:13 +0530, Srinivasa Rao Mandadapu wrote:
> Add NULL check in dpcm_be_reparent API, to handle
> kernel NULL pointer dereference error.
> The issue occurred in fuzzing test.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-pcm: Add NULL check in BE reparenting
      commit: db8f91d424fe0ea6db337aca8bc05908bbce1498

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
