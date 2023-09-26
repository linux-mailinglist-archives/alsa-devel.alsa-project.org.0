Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A06407AEF35
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 17:09:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2244A4D;
	Tue, 26 Sep 2023 17:08:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2244A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695740944;
	bh=dMkPat5SysTqeHQNXfaF030bIQgy5IudxutWzuQNBVQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XimXPRMdhomyjRZereekiAnnDuMMIoV7POt64fUddfJqbdS9XgD/yt+7DCzBY3CfF
	 f3SvKshZz9Kw05ctWJsBmfHIu3OhjPTZ4DB2evVgTZSSmzpnED5hUyU5Dhj9qdGmAs
	 j1IE18R6QVNGYQD8Bte/6WvlRleWmfGhdD4TcEks=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F974F80166; Tue, 26 Sep 2023 17:07:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 199FCF80166;
	Tue, 26 Sep 2023 17:07:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36FA8F8016A; Tue, 26 Sep 2023 17:07:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5A95F8001D
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 17:07:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5A95F8001D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ujsXl/1N
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id CF87CB81081;
	Tue, 26 Sep 2023 15:07:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 545EAC433C9;
	Tue, 26 Sep 2023 15:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695740833;
	bh=dMkPat5SysTqeHQNXfaF030bIQgy5IudxutWzuQNBVQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ujsXl/1Nv8KE2evIgH5hWf4kNmGc4ef+8ZpkjU7oL1dZHDJHzI7fhwXmAsxr4O03m
	 J9IV5gB3ZF/VXUPfa+sHRFBOGqDVxxHIPont7eYa0D2e4Nu0Wi5wnmvjPwhI660QZO
	 Gxp5kMfk2vENWCj32HsuWpkuK0rqifg64KHXAGqz+W3Yntvm3C2TjQfYOuZVicAG5N
	 lurqpuV8VgS6v8wX/IG2acUrY/oUx83YHRXViQjZWltPVYTEv5t9Pg8Rky11tYab2I
	 kcK2OFqMLkz/dXicxzltMDesufljoDrG6K7+s4bLMQNnQXCNRTcKUgNEUwuj71aHFc
	 tQ47tdWxDoijA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Herve Codina <herve.codina@bootlin.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>,
 David Rau <David.Rau.opensource@dm.renesas.com>,
 Damien Horsley <Damien.Horsley@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Rob Herring <robh@kernel.org>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20230925220947.2031536-1-robh@kernel.org>
References: <20230925220947.2031536-1-robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: Add missing
 (unevaluated|additional)Properties on child node schemas
Message-Id: <169574083005.2649266.12499263818632259969.b4-ty@kernel.org>
Date: Tue, 26 Sep 2023 17:07:10 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: ZLBSIPAZUCRWAVVGYJ3IYL3MU7DFDMV6
X-Message-ID-Hash: ZLBSIPAZUCRWAVVGYJ3IYL3MU7DFDMV6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZLBSIPAZUCRWAVVGYJ3IYL3MU7DFDMV6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 25 Sep 2023 17:09:28 -0500, Rob Herring wrote:
> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present for any node.
> 
> Add unevaluatedProperties or additionalProperties as appropriate.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: Add missing (unevaluated|additional)Properties on child node schemas
      commit: 7b71da59122c3ab82908910abf78db1fd6340cac

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

