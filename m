Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F09526D06C3
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Mar 2023 15:31:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B3AD1F9;
	Thu, 30 Mar 2023 15:30:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B3AD1F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680183091;
	bh=UYwcFtjiNWcrI1M33VyMuYU2JXa6OsSD4SbVHSzlB6c=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nRMyWNLmZcK552ETDa1dk69y3v0ac6Lv49vlVPX783d9fkGR46gYCHGaoGH5AT6KW
	 s77ibOdTKxWapnEapHEa+fDQpkjgXDHWonrgXTVaE0WA68QEu5wpGA2rSlVmQbCxqK
	 ucj3doCMPmgJic8sVo8GEZxOl/9mpw4SQLHGZ+lo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA6AAF80423;
	Thu, 30 Mar 2023 15:29:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41383F80290; Thu, 30 Mar 2023 15:28:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F37FFF80114
	for <alsa-devel@alsa-project.org>; Thu, 30 Mar 2023 15:28:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F37FFF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AUZ41RVy
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 61F70B828D9;
	Thu, 30 Mar 2023 13:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91D0FC4339C;
	Thu, 30 Mar 2023 13:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680182910;
	bh=UYwcFtjiNWcrI1M33VyMuYU2JXa6OsSD4SbVHSzlB6c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AUZ41RVyL3525/NLbs2wSb0dW6c2MYwBuNbxTZQ3IPg7K5uo9HDsjRqO5f3pSWw+x
	 CPDay3CChMD3y0vGPlj9Z8CptQ63vlzyMbuxqk5UzQ0k09BkZuOz0wdkY2V7iJmec2
	 oy6RURAa0bpnnhUFnZBJd8uoBGk6L/EqBWhuJrtuqez/Uk7JA8h6YYD5+2Ht9F2Yi+
	 6pI6SdZ/dgbrXgwwe3mMS21/SynKtg2MolCwiJGhbJ2BTd/oVr3uhyjVB77SFGPZJl
	 urOoZQfFT30QBK3hIf2q5W7rMuCby6qPODGU+CQ9DmYxhTf6A2wzUY50GJzYlTbQq5
	 NxP2+LlVcvEzg==
From: Mark Brown <broonie@kernel.org>
To: krzysztof.kozlowski@linaro.org, daniel.baluta@nxp.com,
 krzysztof.kozlowski+dt@linaro.org, lgirdwood@gmail.com, robh+dt@kernel.org,
 Saalim Quadri <danascape@gmail.com>
In-Reply-To: <20230327211629.28643-1-danascape@gmail.com>
References: <20230327211629.28643-1-danascape@gmail.com>
Subject: Re: [PATCH v4] ASoC: dt-bindings: alc5632: Convert to dtschema
Message-Id: <168018290732.3345013.248666317288313324.b4-ty@kernel.org>
Date: Thu, 30 Mar 2023 14:28:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-2eb1a
Message-ID-Hash: JOW7V5EVBMSPCD5EBUGK5BOFH6AY6SBZ
X-Message-ID-Hash: JOW7V5EVBMSPCD5EBUGK5BOFH6AY6SBZ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JOW7V5EVBMSPCD5EBUGK5BOFH6AY6SBZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 28 Mar 2023 02:46:29 +0530, Saalim Quadri wrote:
> Convert the ALC5632 audio codec bindings to DT schema.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: alc5632: Convert to dtschema
      commit: 0b57a2d87b4de2a1f01edaf3b00b3d1939792948

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

