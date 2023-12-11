Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ABC80DA87
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 20:04:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 848DA843;
	Mon, 11 Dec 2023 20:04:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 848DA843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702321483;
	bh=jPZOpPfRIO33FjSw4TAO0bYOtHviQ2FfdXPtOMPoOE8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X/l+Xo+NXBU5rgkSgRsrjj+i4HXlb5B/burZA12ukEtraIyy6fMrlnDCQbcNRVFkH
	 SQTorBj/6DCNkGDoeTQ3dgQKMTie89UbUXa6JYaxgUsi00sslAJT4MQKgOIUCnTV9/
	 jeIQn4W/YxoiwcQLqr5ikcgG2i+xeU+YZxMDh22o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60C55F805BE; Mon, 11 Dec 2023 20:04:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CDA4F805BB;
	Mon, 11 Dec 2023 20:04:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D007F80166; Mon, 11 Dec 2023 20:03:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D876F800D2
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 20:03:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D876F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=h5zI46uJ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 01961B81018;
	Mon, 11 Dec 2023 19:03:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40035C433C8;
	Mon, 11 Dec 2023 19:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702321430;
	bh=jPZOpPfRIO33FjSw4TAO0bYOtHviQ2FfdXPtOMPoOE8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=h5zI46uJjeCyx4H2ZEq5X5havzSjmZ2VhYKme/jQj9aF2bEPvMOa+4hUWcxLl48qp
	 HRsBlclkh9NOaF4LHT7pu+xeFDRRN1s4DHQofxmlSfFaHPVR3Kji4BniHWClrATwZj
	 HSgW/0G9xs+8aSk79lVbPxGhlhzzWD1cX6mdBA+grG/sQz4kvZnmRTr4rmmlBJznUZ
	 QilldgQZ3F7WZx7Tn0/pL4U8FVsNi0S8cYvS5+9yK4deBVClVySLrbmlVKW0PUCkJC
	 31dPb5cgn3hq6wF5t8ExzvRm73oxbg4IPEivbXXsAgTymORNz//BJgs2fjXSxOzs9p
	 YBH8xjVzS8OqA==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com
In-Reply-To: <20231211160019.2034442-1-ckeepax@opensource.cirrus.com>
References: <20231211160019.2034442-1-ckeepax@opensource.cirrus.com>
Subject: Re: (subset) [PATCH 1/2] ASoC: cs42l43: Don't enable bias sense
 during type detect
Message-Id: <170232142897.117554.4237555442844549737.b4-ty@kernel.org>
Date: Mon, 11 Dec 2023 19:03:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: OBNJJ53UNXKOEZRIYVCO2SQDIYONBCOH
X-Message-ID-Hash: OBNJJ53UNXKOEZRIYVCO2SQDIYONBCOH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OBNJJ53UNXKOEZRIYVCO2SQDIYONBCOH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 11 Dec 2023 16:00:18 +0000, Charles Keepax wrote:
> Alas on some headsets the bias sense can cause problems with the
> type detection. It can occasionally be falsely triggered by the type
> detect itself and as the clamp is applied when this happens, it will
> cause a headset to be incorrectly identified as headphones. As
> such it should be disabled whilst running type detect. This does
> mean a jack removal during type detect will cause a larger click
> but that is unfortunately unavoidable.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: cs42l43: Don't enable bias sense during type detect
      commit: dc96528b176fa6e55a3dc01060fe9d97be450ce9
[2/2] ASoC: cs42l43: Allow HP amp to cool off after current limit
      commit: bbbc18d8c27cc9d40cc9a3b03b61e4df85311146

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

