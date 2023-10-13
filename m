Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED7E7C8C13
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Oct 2023 19:11:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D346852;
	Fri, 13 Oct 2023 19:10:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D346852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697217065;
	bh=skmjxOUJLbI5ygBC/KBxQoBx8cL7mS97WiCTqeCHlYw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JrljSS8tzfTq9Fx0x30or1+Kc4TFmlTSIgBTcrEvdzSxmbB+7qcdEICAXvFgz1xPm
	 os8nPGWBzz3SjYBYBjiMur7gml/vuEZuYIKem8IRn+X7xR/VckRKgbEVVZ7HXiMduf
	 /EwilbgYkuhtCc0KhvCGsjA5FcHEI5NN+dt1j4Eg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 437C5F80536; Fri, 13 Oct 2023 19:09:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E697CF8055A;
	Fri, 13 Oct 2023 19:09:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62193F8019B; Fri, 13 Oct 2023 19:09:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B9B6FF8027B
	for <alsa-devel@alsa-project.org>; Fri, 13 Oct 2023 19:07:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9B6FF8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=f6itFyHD
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B917B61017;
	Fri, 13 Oct 2023 17:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61657C433C7;
	Fri, 13 Oct 2023 17:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697216871;
	bh=skmjxOUJLbI5ygBC/KBxQoBx8cL7mS97WiCTqeCHlYw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=f6itFyHDrYdvbyZDsMDWGzFqb8O7C8l63+AVPb89k+uKG7H6Rvft++laXaoArqLyJ
	 2+yq94fOPSwOcYFthT/z0U/qbCE6s5tOF7gHjzjFExqPTsaId1RsXf4lP5VQtUbxlW
	 ExM2c1nJpmnh/3vOy7xDjDZZ3uQl9WdjlM3158a5p7G+FYQOKwI/QW8pMuBmqJdEZY
	 0JxPZYEPAWkXzdmtaJkINQaASZCkyZ2edMrUp8iZeRMDrtUY6gtBYvlqfUnYzB9217
	 8RXgih72ubhgM3RDJsApIUZwrPbuUaLzNEFifpBktdMPG34uc4G7kzzWHayp1AGg3s
	 nS+G1QYVCljDg==
From: Mark Brown <broonie@kernel.org>
To: Roy Chateau <roy.chateau@mep-info.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231013110239.473123-1-roy.chateau@mep-info.com>
References: <20231013110239.473123-1-roy.chateau@mep-info.com>
Subject: Re: [PATCH] ASoC: codecs: tas2780: Fix log of failed reset via
 I2C.
Message-Id: <169721687019.2968842.13695931645768185437.b4-ty@kernel.org>
Date: Fri, 13 Oct 2023 18:07:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: 2E4CPLRHLMUPA5CISGONJA2SAKNSHOQQ
X-Message-ID-Hash: 2E4CPLRHLMUPA5CISGONJA2SAKNSHOQQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2E4CPLRHLMUPA5CISGONJA2SAKNSHOQQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 13 Oct 2023 13:02:39 +0200, Roy Chateau wrote:
> Correctly log failures of reset via I2C.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: tas2780: Fix log of failed reset via I2C.
      commit: 4e9a429ae80657bdc502d3f5078e2073656ec5fd

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

