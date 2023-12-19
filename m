Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A07B818BCA
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 17:06:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E299ADF6;
	Tue, 19 Dec 2023 17:06:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E299ADF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703001992;
	bh=jCafuXZMr4CVA6ZUTmd6i6uEsoZeucixacGiBD7RwNI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nKB7CtzkZwF1dUAKHmVEZYng7h77xINGXkR+W7DKCJFY+heOvsxAvqedBm98bc77c
	 xdqrejw+tyZqtrG2Zs+Gki8Ov4qnVnPl5OftIf/uYlhdlsT4R+tGNeRqWoKvEmU94y
	 56S9kHmPxLo/nv+Ow9YjWxnyKzSrgSLkO+vWAdoM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE957F80588; Tue, 19 Dec 2023 17:06:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E97D1F80212;
	Tue, 19 Dec 2023 17:06:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF648F80431; Tue, 19 Dec 2023 17:05:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47767F80212
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 17:05:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47767F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qmUYPxhN
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 516606134F;
	Tue, 19 Dec 2023 16:05:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10C9DC433C7;
	Tue, 19 Dec 2023 16:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703001945;
	bh=jCafuXZMr4CVA6ZUTmd6i6uEsoZeucixacGiBD7RwNI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qmUYPxhNZWAocTkoQECmYZQFZ34/VqCmVQRLp/x4znYAOMATKsjCpJOSeJBucqVD1
	 J1E7k9VDZB5a5OdplC6Hbxv/CSeBUKETnSlQhWzrdZPlbacWcycx3gb/Jqr2h/iFoo
	 pZt5fd0PHnYOcRmfrnBmu3uTXD0Rsy2aYCP6mTLTI60DhbTwPbxQ6hMLP+pNytoKTR
	 Q9HAnCZEZP1WE+rVMLO2z2jQeYc4jpstcRRU7WqKPqa4CC+ajyDBmd3SNcTTuEAZrI
	 Tkj+nDRT9smYUHNCYCYbxMMdQggl4m6qyRjMkAkMx/krXz75+NDHwKtmmKDD8cewLq
	 AET82MXGYk4DA==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>,
 Hsin-Yi Wang <hsinyi@google.com>
In-Reply-To: <20231218145655.134929-1-jbrunet@baylibre.com>
References: <20231218145655.134929-1-jbrunet@baylibre.com>
Subject: Re: [PATCH] ASoC: hdmi-codec: fix missing report for jack initial
 status
Message-Id: <170300194376.59057.11924859016246547455.b4-ty@kernel.org>
Date: Tue, 19 Dec 2023 16:05:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: TH55ESIQGKKXFDPJCBNC4AXXLINL3O7E
X-Message-ID-Hash: TH55ESIQGKKXFDPJCBNC4AXXLINL3O7E
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TH55ESIQGKKXFDPJCBNC4AXXLINL3O7E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 18 Dec 2023 15:56:52 +0100, Jerome Brunet wrote:
> This fixes a problem introduced while fixing ELD reporting with no jack
> set.
> 
> Most driver using the hdmi-codec will call the 'plugged_cb' callback
> directly when registered to report the initial state of the HDMI connector.
> 
> With the commit mentionned, this occurs before jack is ready and the
> initial report is lost for platforms actually providing a jack for HDMI.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: hdmi-codec: fix missing report for jack initial status
      commit: 025222a9d6d25eee2ad9a1bb5a8b29b34b5ba576

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

