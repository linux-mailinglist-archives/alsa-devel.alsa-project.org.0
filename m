Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1ED67820F
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 17:44:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F5ED851;
	Mon, 23 Jan 2023 17:43:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F5ED851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674492270;
	bh=yVswVCV3rpo6pRLtM1xxdVAc0/UTV0lZ6oclhcJUEWs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=acK4LTzIlV3U8nbtSV4hc/G0Tu/lAc+Ql/0yHi+3x/bwTcJxbHvPpixEFLNJCaMOF
	 QYR098hFwvdnGx4iJBZgJkNl2iNJTgCf0iuu1NlR0UhXRrv+hnPRcKf0kSkvobBFnY
	 aSpvSpcraxXFYgpGi76ZOSEn+HG72Xveb9QmFIQQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6003FF804FD;
	Mon, 23 Jan 2023 17:43:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC936F804FD; Mon, 23 Jan 2023 17:43:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83AA7F80132
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 17:43:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83AA7F80132
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bKuWY1ea
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A5CBCB80E1A;
 Mon, 23 Jan 2023 16:43:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FF77C433EF;
 Mon, 23 Jan 2023 16:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674492180;
 bh=yVswVCV3rpo6pRLtM1xxdVAc0/UTV0lZ6oclhcJUEWs=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=bKuWY1eaAfXuFWEMD8pXG7JEG5uZGmSqXAsAQDJ5+dMKnj+Z+jzKXS36dWDlfAGrO
 xhoKpPwcbuYrRBnyU94xNn/hmcnuP21SfZJEJfzY71UY11MpXs0UYKRRzUgHo+PUEV
 HPRYld4mauT7+E4CDLTE6Ux+qm00CO50i9vyVcBYictQmyFdPxPhl8FAB8Hp+6U3tC
 VkrOA7vef3+K8K1X3Dlnb4tdPtq0KL4iHkDXDGylA0YMnE7DC+6hlYgXg/v2sF675p
 lqS661UKVFpEbKSM+Z54N0arlJC4+a1saK2IOG2kR7MJ6n2QCwsf5mZ7JfAyp+nJ0m
 /2tF5v/1yFIwQ==
From: Mark Brown <broonie@kernel.org>
To: agross@kernel.org, andersson@kernel.org, lgirdwood@gmail.com, 
 robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@quicinc.com, 
 perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org, 
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, 
 swboyd@chromium.org, judyhsiao@chromium.org, devicetree@vger.kernel.org, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
In-Reply-To: <1673508617-27410-1-git-send-email-quic_srivasam@quicinc.com>
References: <1673508617-27410-1-git-send-email-quic_srivasam@quicinc.com>
Subject: Re: [PATCH] ASoC: qdsp6: audioreach: Add ADSP ready check
Message-Id: <167449217624.1484410.5375459304519764541.b4-ty@kernel.org>
Date: Mon, 23 Jan 2023 16:42:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 12 Jan 2023 13:00:17 +0530, Srinivasa Rao Mandadapu wrote:
> Check for SPF readiness in prm driver probe to avoid race conditions
> during ADSP pil loading.
> This patch is to avoid, sending requests to ADSP before it's
> power domains are up and ready.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: qdsp6: audioreach: Add ADSP ready check
      commit: 47bc8cf60e926d1fb0c5d990bf6f5e01e9b3352e

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

