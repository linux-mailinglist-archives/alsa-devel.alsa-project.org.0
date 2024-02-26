Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 151008680FD
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Feb 2024 20:29:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8120283B;
	Mon, 26 Feb 2024 20:29:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8120283B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708975757;
	bh=yov1KLPW8jwxZx2ukMf7yAUWEQaYbyWrExCGjm2gvdE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DC8hafY+XrP9L/95z7KaMKeNyC6SsYu2cGQkDzU+HpLg42tMsiy+k5sdFcfSOkYXG
	 Rif0Ll/VBkiQ8FEGmGZnrlKBPBfwQXFmRaR5JM5ydIl7gTDxTqQiMvNZksSu/VSrn8
	 7KvD46W2+g7cI1QVjw773icv37jukNphezhVgIYA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D98CBF80580; Mon, 26 Feb 2024 20:28:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 30C21F8059F;
	Mon, 26 Feb 2024 20:28:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC7A5F8024E; Mon, 26 Feb 2024 20:28:37 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 90A1DF8012B
	for <alsa-devel@alsa-project.org>; Mon, 26 Feb 2024 20:28:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90A1DF8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Fy3LA6Mj
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9D0FD60FB2;
	Mon, 26 Feb 2024 19:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB3CAC433F1;
	Mon, 26 Feb 2024 19:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708975702;
	bh=yov1KLPW8jwxZx2ukMf7yAUWEQaYbyWrExCGjm2gvdE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Fy3LA6Mjfs0NNrQpnvUQ75mu9K6CKnI8ciNizTKxs9Jas+bxGp2IStaCustxrLtfl
	 klfJDYGKTEO6h3mGO9igdI9KR1bGbOmvom4WTEV9+n09N2gGnTTNvRr64swppHxU+V
	 Jqqiw4mh0iNaWpi+K17Ymai/OPW4P2Pi6y6iTDrPA9+oFr4D0fCKEqVtNeClucgE/m
	 tILtRyRo+6eFEdJLwVO//phB5d4KsrdnJ1lr8BQj2QIQOL7NXN64zLVoONslDvigNQ
	 xasdmh0Q6CTTJOdoN4cFohp3INQLb2Nr0bfvHbTJIquycYrkr3ubjfYerBjhf+JZ1o
	 RoXluF4voCjKQ==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com
In-Reply-To: <20240221152516.852353-1-cezary.rojewski@intel.com>
References: <20240221152516.852353-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 0/6] ASoC: codecs: Simplify mclk initialization
Message-Id: <170897570049.121037.17100833782981803408.b4-ty@kernel.org>
Date: Mon, 26 Feb 2024 19:28:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: 27LS2NOWIXTM5RJVK7RTGHJ6YXAKTYDB
X-Message-ID-Hash: 27LS2NOWIXTM5RJVK7RTGHJ6YXAKTYDB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/27LS2NOWIXTM5RJVK7RTGHJ6YXAKTYDB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 21 Feb 2024 16:25:10 +0100, Cezary Rojewski wrote:
> The patchset may not cover all codecs found in the codecs/ directory -
> noticed a possible improvement and grepped for similar pattern across C
> files found in the directory. Those addressed here seem pretty
> straightforward.
> 
> Most of clk_xxx() functions do check if provided clk-pointer is
> non-NULL. These do not check if the pointer is an error-pointer.
> Providing such to a clk_xxx() results in a panic.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: codecs: da7213: Simplify mclk initialization
      commit: e2cb72d28740516cb03fa072e14b2f1a6eceef61
[2/6] ASoC: codecs: nau8825: Simplify mclk initialization
      commit: 71d322fd16a3a62d32a9e6a8d08f48e8a945a515
[3/6] ASoC: codecs: rt5514: Simplify mclk initialization
      commit: 67e9bf093372a070f67f85a6ffceb6a44d4cfcf4
[4/6] ASoC: codecs: rt5616: Simplify mclk initialization
      commit: f76de61ad1eb725cc05727377ccd4adda336b822
[5/6] ASoC: codecs: rt5640: Simplify mclk initialization
      commit: 6413849b678b04e30b5c938e344e653c31a5f73b
[6/6] ASoC: codecs: rt5660: Simplify mclk initialization
      commit: bf900c85f8a4ef47b868b6345879e35826a4fec1

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

