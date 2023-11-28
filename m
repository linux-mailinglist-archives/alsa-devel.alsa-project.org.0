Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 917A87FB9DA
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 13:05:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0ABAA847;
	Tue, 28 Nov 2023 13:05:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0ABAA847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701173141;
	bh=i55TD+jqPJqNMu1csxYYbwmdAkXCEdI8W2QHQXOzNMQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AvUwrM8BCftxupPo8rBqj+JI1qQmIAVpoQrgS/h9bPu9w0J48+gCZ9HAcTOAcvO/b
	 vvbqQEWlynfRjZ9pnkzH93XM1p7YgiBB9dCKHFhrfYp01gHAPOVJ9ZXA8l13LVwLHJ
	 lhqH1viVgbMQ2Mb7HB2zntjkmnGsBzVLHlGQD/fw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC71FF8057B; Tue, 28 Nov 2023 13:05:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D2D01F80578;
	Tue, 28 Nov 2023 13:05:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27CDDF8016E; Tue, 28 Nov 2023 13:05:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4B299F80104
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 13:04:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B299F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dS+vj4KE
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B11BCCE1A9D;
	Tue, 28 Nov 2023 12:04:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5968C433C7;
	Tue, 28 Nov 2023 12:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701173090;
	bh=i55TD+jqPJqNMu1csxYYbwmdAkXCEdI8W2QHQXOzNMQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dS+vj4KENFpbmNeaFcBTdQCEgb80MJG/nZw46Orm0YRo9u5edeLbzdu4EV3AJCv9/
	 wRCJf2FCFBYJLHCqhI6l2Kuy3qPq6fBuiC7pNtw+4G3kh27JcZaNJbTBsx8LJDOEX3
	 /TozcelAfJREaWirWdC3mBmzEV7hS5AvBJCU78oNwgAgyZjc750ra+NrZV0XPjnXnF
	 XZFijZyRrP439uGTD48vFiOIeWZPujBJnM2dg/R9KOoA5bEkeP4GSpMkOx1QvL7pqp
	 r48jWI4dZJxzn/O/2wVGeN6BxF+qXobTQL57qVGleUcDobnl9r7xUzsvbLlulNfY0W
	 pphU5s2r2mb7w==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, bard.liao@intel.com,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org
In-Reply-To: <87v8a64f3d.wl-kuninori.morimoto.gx@renesas.com>
References: <87v8a64f3d.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v7 0/5] ASoC: makes CPU/Codec channel connection map
 more generic
Message-Id: <170117308718.2712587.12761626999755612414.b4-ty@kernel.org>
Date: Tue, 28 Nov 2023 12:04:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: HA3AAEBSDB7AQOPTXA5QBRM5RROPOPDT
X-Message-ID-Hash: HA3AAEBSDB7AQOPTXA5QBRM5RROPOPDT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HA3AAEBSDB7AQOPTXA5QBRM5RROPOPDT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 13 Nov 2023 01:27:50 +0000, Kuninori Morimoto wrote:
> Cc Bard, Pierre-Louis, Jerome, DT-ML
> 
> This is v7 patch-set.
> 
> Current ASoC is supporting CPU/Codec = N:M (N < M) connection by using
> ch_map idea. This patch-set expands it that all connection uses this idea,
> and no longer N < M limit [1][2].
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: makes CPU/Codec channel connection map more generic
      commit: 45cc50d13433a62f23b7b4af380497aae5e8ddc7
[2/5] ASoC: audio-graph-card2: use better image for Multi connection
      commit: 912eb415631140c93ff5f05378411fec8e6a537f
[3/5] ASoC: audio-graph-card2: add CPU:Codec = N:M support
      commit: e2de6808df4ad5faa6106f7a80617921fdf5dff5
[4/5] ASoC: audio-graph-card2-custom-sample: Add connection image
      commit: a706366f93c37c6649acfe15a1ef9a80e25bace4
[5/5] ASoC: audio-graph-card2-custom-sample: add CPU/Codec = N:M sample
      commit: 792846d9daa876186196b66dc496a2ba8ddd7535

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

