Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E56B64615F
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Dec 2022 20:02:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADF631820;
	Wed,  7 Dec 2022 20:01:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADF631820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670439760;
	bh=2vhrKfL5f5Th8736PXYY9evBIgWxXb6E39AhM7EvysA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I7U381M2AgkseU367Ms1Ue7XGKqC8blngBPBOXt/YfjvMDl1jzOMS4ztZCCRsz8bx
	 2sRlI5/LuczF70EbU3MrjvbueIIqzb16r8rqcvNMiUFbz9zh00Q2HuVCgwnXXoTCOs
	 utPj+EAo1kTNkeJO9RwQhzjP5fZdKvgAIwBwpOmI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49843F80301;
	Wed,  7 Dec 2022 20:01:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D81DF802BE; Wed,  7 Dec 2022 20:01:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0429BF80121
 for <alsa-devel@alsa-project.org>; Wed,  7 Dec 2022 20:01:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0429BF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sq0zbvj1"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CA885B82052;
 Wed,  7 Dec 2022 19:01:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82D80C433D7;
 Wed,  7 Dec 2022 19:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670439692;
 bh=2vhrKfL5f5Th8736PXYY9evBIgWxXb6E39AhM7EvysA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=sq0zbvj1RpcD2DkI+5o/yE00jR1KMvYaD0n2qpFbzwiVT40gHWm3lfwW6dm2QdNqZ
 fiUAczDpUN/AcVcacvuwCIVH9euRhN3h7T5xZlKdvOB56/avUOM+9PgcYH0WExIdbD
 E4Wq+c3tsvjVrBdZPxQScukgUEbd+LbiOZOKEuQUS735lK3DvNaz8NVBqBAVjTpYFa
 yN7lCkvi35HX4ek9YdHGcQb4sP2s1j0QZzvVuiMDakp2aGib/TeaG+jAHqxWgTNTuU
 sMmvlK3O+2nDYauJv5WAl0e39VkL1kJPD1sH+NlDgxPt2g7mxNp7Lu1axTL3PCAtmI
 sJx3KwPMHOTJA==
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@linaro.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20221205073507.36071-1-jiapeng.chong@linux.alibaba.com>
References: <20221205073507.36071-1-jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] ASoC: codecs: wcd-clsh: Remove the unused function
Message-Id: <167043969025.414898.9604459872443283940.b4-ty@kernel.org>
Date: Wed, 07 Dec 2022 19:01:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.0-dev-b77ec
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 tiwai@suse.com, bgoswami@quicinc.com
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

On Mon, 05 Dec 2022 15:35:07 +0800, Jiapeng Chong wrote:
> The function wcd_clsh_set_buck_mode() is defined in the wcd-clsh-v2.c
> file, but not called elsewhere, so remove this unused function.
> 
> sound/soc/codecs/wcd-clsh-v2.c:133:20: warning: unused function 'wcd_clsh_enable_status'.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wcd-clsh: Remove the unused function
      commit: 81ed7d9de18768fe0cb3d74a7a163a8c082e1346

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
