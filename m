Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F05BB52EA9F
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 13:19:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85060173B;
	Fri, 20 May 2022 13:18:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85060173B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653045582;
	bh=K/HrRMv6djwUaET7IYhl0udvj25T3d8ReiyZWFxaTSs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RhmGZ6ESSkG0hOT/J+nVQOEJMFeJxNpsf0MxTcbGq6tlohPbo3kLyr248V5UZykVL
	 oZNTfGD4n07HXLGK73iX4T9MpOqw8oeQBV4DzCUm6/PTe+5bo3KWtsx3NsKA2bhT8V
	 wY08gO6sB3t5ATArCqTN1+pmwL6R3S/MORDI+tec=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC652F801F5;
	Fri, 20 May 2022 13:18:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37A3DF8019D; Fri, 20 May 2022 13:18:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B23CBF800D2
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 13:18:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B23CBF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WGRk3hmf"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E6F2FB82AEB;
 Fri, 20 May 2022 11:18:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D978C385A9;
 Fri, 20 May 2022 11:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653045517;
 bh=K/HrRMv6djwUaET7IYhl0udvj25T3d8ReiyZWFxaTSs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=WGRk3hmfSkiDeLWCnz04H8B+sSLqBguOtwl2KpvZ8sObiAf4zRt6NchEBkzwIxltu
 0ClkpwW/38zpvxVUGzZZO+Q2ZfsRXedvVEJ+74UvyDYlrD1swomyIt7DAfoh0n9pgX
 bU2oqJoRBmBJ4TxVjtNewW6hM0fCiaot0xp4diFf0s4KIZeFiHS0C9Vbubj6wyVeyl
 W2rTDoXDNAwIrUewLeMwdRx5vTuF+vNIf3XhSlrrl9mvO+tIz0uum5FkAfbppvRFlW
 XQJjJ3YOA5bVtWC3Uadk8JrvebbeUblJ5wtgOoR+almQA7Nkl4l5vWiKD9WZg4hxJM
 /PRkoLwcYpDcA==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, tiwai@suse.com, quic_srivasam@quicinc.com,
 quic_potturu@quicinc.com, lgirdwood@gmail.com, yuehaibing@huawei.com
In-Reply-To: <20220516120909.36356-1-yuehaibing@huawei.com>
References: <20220516120909.36356-1-yuehaibing@huawei.com>
Subject: Re: [PATCH -next] ASoC: codecs: lpass: Fix passing zero to 'PTR_ERR'
Message-Id: <165304551581.45439.10887051635570767512.b4-ty@kernel.org>
Date: Fri, 20 May 2022 12:18:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Mon, 16 May 2022 20:09:09 +0800, YueHaibing wrote:
> sound/soc/codecs/lpass-macro-common.c:28 lpass_macro_pds_init() warn: passing zero to 'PTR_ERR'
> sound/soc/codecs/lpass-macro-common.c:38 lpass_macro_pds_init() warn: passing zero to 'PTR_ERR'
> sound/soc/codecs/lpass-macro-common.c:54 lpass_macro_pds_init() warn: passing zero to 'ERR_PTR'
> 
> dev_pm_domain_attach_by_name() may return NULL, set 'ret' as
> -ENODATA to fix this warning.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: lpass: Fix passing zero to 'PTR_ERR'
      commit: 81e7b165c45e94188ae8f1134b57f27d1f35452f

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
