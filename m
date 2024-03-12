Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99433879906
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Mar 2024 17:35:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA66EEB1;
	Tue, 12 Mar 2024 17:35:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA66EEB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710261344;
	bh=Cmo2h33xnIVZ51l0Jr3ECDBtOxBycgNPcKHNVQygTMc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pxjkrs9YGSl0SeFLOPwuWIjmTMH5UdwDvEZnxh2fhH541Zak5R8yuLOlqql2DdAll
	 RxikgcKZOyJC+PZFk94LluBj8KFfoz2vmBDrC/byqHguumlMfu4kHMVfQUG0vCXQno
	 rKIJ8n5KkcBzX6Pxw3CCjGHm5os9prlhoGxg/QEQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03E46F804B0; Tue, 12 Mar 2024 17:35:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FA3DF804E7;
	Tue, 12 Mar 2024 17:35:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 087BFF8025F; Tue, 12 Mar 2024 17:35:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 48349F800E4
	for <alsa-devel@alsa-project.org>; Tue, 12 Mar 2024 17:35:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48349F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YAK8SFV4
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F36ACCE18A8;
	Tue, 12 Mar 2024 16:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0244CC43390;
	Tue, 12 Mar 2024 16:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710261298;
	bh=Cmo2h33xnIVZ51l0Jr3ECDBtOxBycgNPcKHNVQygTMc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YAK8SFV4cvlTKno3xc3IG3AmdA59fqu8UcsDkl1snvFC9k5zpk8/V568tyFt+1bjs
	 r+TOK5lqddbgXdLLCLtGogNgilHOFP6wBCtm/39CKveeqjui6wUJv6rcrlJfXKrGqe
	 gSgXzEyocOKQ+P8rlR2n1cWj0ntcTMSRtbWASNHWx9hm77gMM/u9EKYlHxXyX2gGep
	 fxbqSF+ZEqbKNDGvzPIqtVHLuo8fkrnM3z4LEYXKup0gEZfG51imwuzE2eT6GEeSHD
	 UIZkjtTxmSvZjHCq2FJ9udEQReoRpNyWnBKs1vN7ju1w1bZ3VTrH4A8XSaxwWXIXBW
	 N1Km9vM9s4gzw==
From: Mark Brown <broonie@kernel.org>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, patches@opensource.cirrus.com,
 Rob Herring <robh@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240311222554.1940567-1-robh@kernel.org>
References: <20240311222554.1940567-1-robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: cirrus,cs42l43: Fix 'gpio-ranges'
 schema
Message-Id: <171026129573.52506.3566774903045990906.b4-ty@kernel.org>
Date: Tue, 12 Mar 2024 16:34:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: NXJ6FO57JAXJ7MBBYXJB4IIQLOHMSUH3
X-Message-ID-Hash: NXJ6FO57JAXJ7MBBYXJB4IIQLOHMSUH3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NXJ6FO57JAXJ7MBBYXJB4IIQLOHMSUH3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 11 Mar 2024 16:25:53 -0600, Rob Herring wrote:
> 'gpio-ranges' is a phandle-array which is really a matrix. The schema in
> cirrus,cs42l43 is incomplete as it doesn't define there's only a single
> entry. Add the outer array constraints that there is a single entry.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: cirrus,cs42l43: Fix 'gpio-ranges' schema
      commit: 10eb0d3314c59dd0497282b33afabddf607b3050

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

