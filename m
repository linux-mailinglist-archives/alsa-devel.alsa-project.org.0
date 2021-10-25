Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6592843A1E1
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 21:42:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3D9C16D8;
	Mon, 25 Oct 2021 21:41:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3D9C16D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635190950;
	bh=7i0EGCIRB4HrVnhBD2qDiI6GxHmFk3q3ZtD9GUd1INA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pgDCwczQE0NzCIW9h6pH2/jkYfwLUbFdV5E8R+buFM9tBM6qNJ4DfTC4iHHAB0Q5F
	 HCG/59vQ5gBY6kS5lQFrbk2/R7NX2OcGmex0lPHuJpSa+0KLfm3yRiXR3H2c7f3xe9
	 RhFUBRTGU4lG7Th5KknTQPhOwMOtBPE/8P7UzULM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E3BBF80166;
	Mon, 25 Oct 2021 21:40:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57A8FF804E2; Mon, 25 Oct 2021 21:40:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AA5AF80166
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 21:40:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AA5AF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IZYbzKSA"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1772561205;
 Mon, 25 Oct 2021 19:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635190820;
 bh=7i0EGCIRB4HrVnhBD2qDiI6GxHmFk3q3ZtD9GUd1INA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IZYbzKSAk4vMkqevR8sy5nqAFXwOoSEHNjogCmvkDtWsYdgskXTD55Ei3quSLi94M
 Tz9Qut0hR+P5PJ8rOxjSr0+3M4TZHsvMkx6fPyWU1MqeqHWx2pF+VhEhiNMfD5qgF8
 TAFp8Um1yuM9lCuSNkBaHcjktU0lAszMP2DqG1SweVLNdYExWfAXrtONGM3aQXfFt9
 EuPTF1C92aqmiJ0Mky79Tik4ni4tSvZHlzX29hxf6JC62o/AbnryKX11+HbAxmuwka
 o8R9oFc5EufcPhddizzL3lGuaJ4PBzNJzTVZePfkYBEJ5U7tG6f9587RXP0GM8Cgj+
 dEL+I6AvuI8dw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, plai@codeaurora.org,
 srinivas.kandagatla@linaro.org, devicetree@vger.kernel.org, perex@perex.cz,
 lgirdwood@gmail.com, judyhsiao@chromium.org, bjorn.andersson@linaro.org,
 swboyd@chromium.org, tiwai@suse.com,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, robh+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 agross@kernel.org, rohitkr@codeaurora.org, bgoswami@codeaurora.org
Subject: Re: [PATCH v3] ASoC: dt-bindings: lpass: add binding headers for
 digital codecs
Date: Mon, 25 Oct 2021 20:40:12 +0100
Message-Id: <163519067112.407220.9849529941824458080.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <1633670491-27432-1-git-send-email-srivasam@codeaurora.org>
References: <1633670491-27432-1-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

On Fri, 8 Oct 2021 10:51:31 +0530, Srinivasa Rao Mandadapu wrote:
> Add header defining for lpass internal digital codecs rx,tx and va
> dai node id's.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: lpass: add binding headers for digital codecs
      commit: de6e9190a8a74d55ed936ec483919b328bbbbf5c

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
