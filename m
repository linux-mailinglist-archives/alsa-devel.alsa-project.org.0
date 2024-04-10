Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3B38A018E
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Apr 2024 22:56:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20C4D2BC6;
	Wed, 10 Apr 2024 22:56:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20C4D2BC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712782600;
	bh=1fYUihKmz+w7nrA/FjAUTSJZtMWHKfN+hN2ym7MkZjs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z1PZmDED61FSYdIxHyuBxbuQ41J/unXAnPzW6mhIj6zaZvZMSlEq1vDNQyNMJ2/Gj
	 KHWQ5IbrNKWB3oKRrwWdj5rjYstFX67CXFGf0t9szu22JbVZN/QfAZYrjza8O96Vp3
	 kuyi7dGoJ6seCW02zxOTi5/csKm15PATN1Re3JMo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A63CF805CA; Wed, 10 Apr 2024 22:55:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 60397F805C9;
	Wed, 10 Apr 2024 22:55:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD3F9F8026D; Wed, 10 Apr 2024 22:55:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 35D9DF80130
	for <alsa-devel@alsa-project.org>; Wed, 10 Apr 2024 22:55:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35D9DF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=K5eAqxz5
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8785061EBF;
	Wed, 10 Apr 2024 20:55:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DAE1C433F1;
	Wed, 10 Apr 2024 20:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712782542;
	bh=1fYUihKmz+w7nrA/FjAUTSJZtMWHKfN+hN2ym7MkZjs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=K5eAqxz5q0e5EObEd5IkijNDnbvJmUPvi/B+Ab3V9XvW6Qvt1ESAaEuoEdX568kNj
	 pEJJa285qRtMQ9MEmwiLnbqDG3HFx1ljDuni6Q3bXzpswlWbyckivHc61n/4NYn3oe
	 ZlmWqn7arkxqPLJQiVqiuEHPdh04JGkQ+Sj+o3ABRvdDCmCliheE5HdMvlzyGveYsn
	 gYBQbnbAuOcnzW/3bwzY84U4yse3R8hqcnu4907hdD7lT0zexUu2kBrL1m5guA7ZuU
	 ePBJMLBS5FH6qLki7+L36qCVWMAF2lTuIS/i5orFB18tWerTcwQeUR1LqNKbxeuKEH
	 G1OFuqrfzA7oA==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20240410161312.22313-1-rf@opensource.cirrus.com>
References: <20240410161312.22313-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm_adsp: Include array_size.h
Message-Id: <171278254083.69181.1643120705707152702.b4-ty@kernel.org>
Date: Wed, 10 Apr 2024 21:55:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: EXOPRSPLSTHXVD3PR6GHTGSV62DR2PRE
X-Message-ID-Hash: EXOPRSPLSTHXVD3PR6GHTGSV62DR2PRE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EXOPRSPLSTHXVD3PR6GHTGSV62DR2PRE/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 10 Apr 2024 17:13:12 +0100, Richard Fitzgerald wrote:
> Explicitly #include array_size.h for the ARRAY_SIZE() macro.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm_adsp: Include array_size.h
      commit: 4693b120299a5893034d1882ddbbe08af1d2ff07

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

