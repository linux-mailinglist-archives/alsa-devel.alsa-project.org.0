Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F238A4704
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Apr 2024 04:33:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 364AB14E2;
	Mon, 15 Apr 2024 04:33:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 364AB14E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713148393;
	bh=PH9b6fEZwH6ZuwqKTmFAkjoqOuY8tlDyKXTvvTqkLsw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QnJJJU7tNjMQMbofYvMut/WgCEB5qD+v1MdLzn6GdJBwCyTxKOaAcnUFZB6wBTdKD
	 ANAu6EiULHlVjmttAFX7m2gxD3o3S8BWHCs4wmqdWdXPcmUDWAYUizwb+yDRIfuqWd
	 HI+AvsmjgjBl63LpHCapanMtB8iOH2VVE0YAU2oc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27C25F8058C; Mon, 15 Apr 2024 04:32:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D61E8F8059F;
	Mon, 15 Apr 2024 04:32:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18B5EF80494; Mon, 15 Apr 2024 04:29:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5A458F8013D
	for <alsa-devel@alsa-project.org>; Mon, 15 Apr 2024 04:26:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A458F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VWNNjQZC
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1C1DCCE09CF;
	Mon, 15 Apr 2024 02:26:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2DCFC072AA;
	Mon, 15 Apr 2024 02:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713147981;
	bh=PH9b6fEZwH6ZuwqKTmFAkjoqOuY8tlDyKXTvvTqkLsw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VWNNjQZC1hmK8mt32J1/DLPzwjgZSA51v5LLH4j8jQ1ZAlCDYMsdC2VxYFRBeZ+lC
	 eJ9MRJtWp4e0RM5MGV4s7/njLuq5J3dbyPNz67BKdY3QlPLIvH7SHQJUkuumr2OhER
	 iTPJcuvBJ1V1xayRfTs3l+L8eF/aG6wPOQ3lYCBpI5NxjD1cjFxGTFN+vbAudn1pB0
	 utP86Mbou2wYmwNJLWRMM2TjFMcEz/jUJVUlsgqoxBtUolm4A0/no91N9k+MmbMeun
	 sjMiVL+W737mOuTCMD84AYItQiYNQpOkeGLmYLj8AKKtq5CHs5leSwgzUSPoEWucgq
	 lhUn2eaNgJN5Q==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <871q7bcew5.wl-kuninori.morimoto.gx@renesas.com>
References: <871q7bcew5.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: dt-bindings: renesas: add R8A779H0 V4M
Message-Id: <171314798017.1649319.17336242454425093208.b4-ty@kernel.org>
Date: Mon, 15 Apr 2024 11:26:20 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: GFFNXON4Z56G434ZIRMTWWBMJEZUHV32
X-Message-ID-Hash: GFFNXON4Z56G434ZIRMTWWBMJEZUHV32
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GFFNXON4Z56G434ZIRMTWWBMJEZUHV32/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 12 Apr 2024 05:46:03 +0000, Kuninori Morimoto wrote:
> Add document for R-Car V4M (R8A779H0).
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: renesas: add R8A779H0 V4M
      commit: d6e792ed7dd022a16a637ade224da070b60f4f3b

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

