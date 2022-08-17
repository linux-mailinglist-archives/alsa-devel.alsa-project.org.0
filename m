Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A62597129
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Aug 2022 16:32:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0365A166A;
	Wed, 17 Aug 2022 16:31:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0365A166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660746754;
	bh=/37xOLgFFyR9lC9/rK8t//Keov0kWYTvWZQazTYIghk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Arfmh0hvX4Q5od07E64ykxWmNFEuVnwXxf8zFFSvqfe9XqKcmDzV2nIFZlnNpMtPt
	 6UrNG2SLvBCp7B74QTsLxL6m4xF4ysZdmaJHRr5/DWCt/+b6mr+Je6A0DG4rdNj8p0
	 5ZuUSZMt3+vYuiFj8kXqELf4RwVZZjQciBVI1VEI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D96E7F802E8;
	Wed, 17 Aug 2022 16:31:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCEB7F8021D; Wed, 17 Aug 2022 16:31:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F29BF800E9
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 16:31:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F29BF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SCywGIC8"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B465E6148B;
 Wed, 17 Aug 2022 14:31:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BB46C433C1;
 Wed, 17 Aug 2022 14:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660746662;
 bh=/37xOLgFFyR9lC9/rK8t//Keov0kWYTvWZQazTYIghk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=SCywGIC8zDAOdKBO+hN5TkQIZjWsSWZc6OBOtPg0Gsux+Gbh0y/zm4M53SQL1fY4F
 xfjHnnENM4FHxgP5EaSibRL8FWiy1S0J0uLqigJ8WT/ar3hwf84ERxJfAjWWNgQa2O
 VGqHqWD+YM6O/dRZnguVtcvn6F873fhk6s5QLmv4KI7FRtJ3tLUa1+dRK1H29BrleY
 pZ5Uwpn2xDkOQ+NgUow6fgCvIhysWJnjeVBqL/S0WxKWBl3v2cIsce/10TmcwcqUVb
 yY2Mv13uJ/mXs5WSHt6HmZocojQANek1bHbMPLKTsq4gg27ZeI9kYVOp/tPkCA29FY
 GU8uMC0mXi6+w==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220816170118.13470-1-srinivas.kandagatla@linaro.org>
References: <20220816170118.13470-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: qcom: qdsp6: q6prm: add new clocks
Message-Id: <166074665990.210979.17992957875043506685.b4-ty@kernel.org>
Date: Wed, 17 Aug 2022 15:30:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-msm@vger.kernel.org
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

On Tue, 16 Aug 2022 18:01:18 +0100, Srinivas Kandagatla wrote:
> Add support to new clocks that are added in Q6DSP as part of newer version
> of LPASS support on SM8450 and SC8280XP.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: qdsp6: q6prm: add new clocks
      commit: ea15d3bd3cd6e9483bb8aa664954c0a8cde253eb

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
