Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7CB6989B2
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 02:11:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB4FF86F;
	Thu, 16 Feb 2023 02:10:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB4FF86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676509881;
	bh=8bU5ot4UEC9oCBGcLSId91PlCnKLheeqvb9yICvFccs=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G3tRh2WWiIL+IPmzTC6EHFHBvvqSqdrYzsq87rj8+twD37LgFc95buFXyUsxORxJj
	 KotGIIfeYIMFps5mn6BnhK0bRDzko4eicJIuKEiVivKqsgp347CcoLj6D+6V+6P+bS
	 Be7miA7ow9kScHBepBgi5V/k+pm+krlmmN9c1BLw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5ADF3F80525;
	Thu, 16 Feb 2023 02:10:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63250F804B2; Thu, 16 Feb 2023 02:10:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98336F800B6
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 02:10:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98336F800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=h89PGSRf
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 89B9561E19;
	Thu, 16 Feb 2023 01:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EAC0C433D2;
	Thu, 16 Feb 2023 01:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676509799;
	bh=8bU5ot4UEC9oCBGcLSId91PlCnKLheeqvb9yICvFccs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=h89PGSRfq9ydIrkeTw1S+DUHXI94JmM7olmcN/gqYcV3b9jmWoNitITHkMIi+n2mk
	 jlbucI1ER9YJxg9pqSy+g+JE+ShbtJBvMISAK2NJd6bAImjmN52PLaw7AOQIPcvgQw
	 MKCFFKd49+k571g9sA4nhlmg492XtSITpwB9T+k2d2476fxPTBV07N8TTfR9CjV2Pp
	 isDGrkiFaPvMVLlhPo3TqyzA63jAW4zWS07Wr2psvJsES2ynWsqL8HKrOmJGdrfFhW
	 FE4LOVQMa37BuWCsZUXVSs3i+E7XrKSRp1G7SSE5Jyu62oX4rCFmIlWI6vvt7e/BvU
	 dW86OD7viS4sA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Lucas Tanure <lucas.tanure@collabora.com>
In-Reply-To: <20230215132851.1626881-1-lucas.tanure@collabora.com>
References: <20230215132851.1626881-1-lucas.tanure@collabora.com>
Subject: Re: [PATCH v2] ASoC: soc-dapm.h: fixup warning struct
 snd_pcm_substream not declared
Message-Id: <167650979674.3620645.17156084970442028190.b4-ty@kernel.org>
Date: Thu, 16 Feb 2023 01:09:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
Message-ID-Hash: HZ6T2YK665RSEAEJ65NGMLIARCYXBDUQ
X-Message-ID-Hash: HZ6T2YK665RSEAEJ65NGMLIARCYXBDUQ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HZ6T2YK665RSEAEJ65NGMLIARCYXBDUQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 15 Feb 2023 13:28:51 +0000, Lucas Tanure wrote:
> Add struct snd_pcm_substream forward declaration
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-dapm.h: fixup warning struct snd_pcm_substream not declared
      commit: fdff966bfde7cf0c85562d2bfb1ff1ba83da5f7b

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

