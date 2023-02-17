Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFA069A3A1
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 02:55:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A62EEC7;
	Fri, 17 Feb 2023 02:54:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A62EEC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676598909;
	bh=Gw5LE3twoGw4eDFOyNeOTFFuzAZaxlBPT44ZcdXStuk=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vEgktZjBBVbvb12J0u8u1IX3N0yrAm7WfE8j9FzZoV4vV8hVe5jTxlpvB1+rSqLfV
	 HBqYOV4afe0w9v1sNrKma9c9RVT1JcHm9s/JoKT1+Gb5ldB3Jwc8cYyOWVKpZpaVif
	 IWlkhTg/OJDvJ8m88KfN/FU+djGGV/QzgcAjb63c=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E110F801C0;
	Fri, 17 Feb 2023 02:54:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9486F8047C; Fri, 17 Feb 2023 02:54:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8EDADF800B6
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 02:54:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EDADF800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pMYaEO+n
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B4D9D61191;
	Fri, 17 Feb 2023 01:54:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B961FC4339B;
	Fri, 17 Feb 2023 01:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676598849;
	bh=Gw5LE3twoGw4eDFOyNeOTFFuzAZaxlBPT44ZcdXStuk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pMYaEO+nM4HYKGFOGrCC2gJ8NTppz1XUFbx7S2o42CcorIXnk5RaTfbxb9X3YstTs
	 NoBC09X09lo6E8Wp1rYMY33QQ5+NjHLYMMvKHUqAhSHpntxnTerAY4yK7Xdn0VdyI5
	 lCsunmp/8USEwUfWiySLAzgkgYonRJmxMxmuzfrfmimlc0a975onIagYfxp26/Egyr
	 tDwiUZDmYYhI0nAvO+hzjacM39/rania2WmrBI2KGYMNml3l/ui3Vd6hQWw2K7yv+B
	 x90xrZX0C3jQf0IQ/DmiTSgrJ2XFTHO1Jbq+VGybP8ixpawXN11ZPnUK5Te+KOoouf
	 GbDq4v3MHcwdw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Joseph Hunkeler <jhunkeler@gmail.com>
In-Reply-To: <20230216155007.26143-1-jhunkeler@gmail.com>
References: <20230216155007.26143-1-jhunkeler@gmail.com>
Subject: Re: [PATCH] soc:amd:yp:Add OMEN by HP Gaming Laptop 16z-n000 to
 quirks
Message-Id: <167659884738.51394.3064624449308276945.b4-ty@kernel.org>
Date: Fri, 17 Feb 2023 01:54:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
Message-ID-Hash: JH3VQT2Z7BR4ULXG7CP53Q63CNHTJMTS
X-Message-ID-Hash: JH3VQT2Z7BR4ULXG7CP53Q63CNHTJMTS
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JH3VQT2Z7BR4ULXG7CP53Q63CNHTJMTS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 16 Feb 2023 10:50:07 -0500, Joseph Hunkeler wrote:
> Enables display microphone on the HP OMEN 16z-n000 (8A42) laptop
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] soc:amd:yp:Add OMEN by HP Gaming Laptop 16z-n000 to quirks
      commit: 22ce6843abec19270bf69b176d7ee0a4ef781da5

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

