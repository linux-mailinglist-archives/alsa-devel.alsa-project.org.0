Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5707086A9
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 19:21:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C73F4208;
	Thu, 18 May 2023 19:21:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C73F4208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684430516;
	bh=piOq5yMlSJS5vyyMJbxfeW2jBDmCAz3nZ9BEF7MQFns=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nLHGDDepfrg0phqt/dCSMfsLUWpZZs/mD0KQoWvFwxdLe8HlVgmpwqZO6lsMFGA+v
	 pxdx+/6yHo6htGs0lnUOW2QXXrBG29yrr8+hXf/yUO9aWLA5OL2sVN1khloI6PB/7O
	 76AMIKdW7+Z18a8ys/HIlTa7VeveigNrH/uOgRYI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EDCDF80567; Thu, 18 May 2023 19:20:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D4C9F8055A;
	Thu, 18 May 2023 19:20:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA0C5F80552; Thu, 18 May 2023 19:20:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E096AF8016A
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 19:20:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E096AF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=l2dQIRYA
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C8CC665119;
	Thu, 18 May 2023 17:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC832C433EF;
	Thu, 18 May 2023 17:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684430420;
	bh=piOq5yMlSJS5vyyMJbxfeW2jBDmCAz3nZ9BEF7MQFns=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=l2dQIRYABelwZpNXnjfqP2r6MmhIcv4jS3+TCeML5UpseyRQk91f1zUpvu4CHzOtp
	 Du1cAZP4IG6qlTLUOkWgbEhCLi88RKyAl2pzn68l3oXV27ChA16srcBEWS37JQK6OJ
	 9fDrz0KL6kb89bhq5SDIMAS9+yyFNmGaFA+8SWJbjNvwuVbw6eRsuD1ZrQtBlyu6VF
	 Nay2Qwk285GUkFGngih/Y4UfP/MVn4JsYzpDiiAYlZa61AviwjnrgCyQ6eQBCu48dK
	 igDrXLLP77ewA/vSuPz6/9mRD+7K3TdflZ5jplI8spMX2j+foB+OAXyT+iopP69oOW
	 hA37MOEQWqptw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: perex@perex.cz, tiwai@suse.com, matthias.bgg@gmail.com,
 nfraprado@collabora.com, wenst@chromium.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
In-Reply-To: <20230517151516.343037-1-angelogioacchino.delregno@collabora.com>
References: <20230517151516.343037-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8192-mt6359: Remove " Jack" from
 Headphone pin name
Message-Id: <168443041576.472592.13647493326207546899.b4-ty@kernel.org>
Date: Fri, 19 May 2023 02:20:15 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: SY4XNDBCMSXAJIKUMCG5AHJKNQ4WLTDF
X-Message-ID-Hash: SY4XNDBCMSXAJIKUMCG5AHJKNQ4WLTDF
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SY4XNDBCMSXAJIKUMCG5AHJKNQ4WLTDF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 17 May 2023 17:15:16 +0200, AngeloGioacchino Del Regno wrote:
> Function jack_kctl_name_gen() will remove the redundant " Jack" from
> the name, if present, and then it will add it back, so that all of
> the controls are named "(pin-name) Jack".
> 
> Remove " Jack" from the Headphone pin name to spare some CPU cycles.
> 
> This commit brings no functional changes.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8192-mt6359: Remove " Jack" from Headphone pin name
      commit: cbbc0ec6dea09c815f1d1ef0abaf3f2ec89ff11f

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

