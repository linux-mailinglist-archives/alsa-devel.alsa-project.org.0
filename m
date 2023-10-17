Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E807CCA05
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Oct 2023 19:41:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 501EB84B;
	Tue, 17 Oct 2023 19:40:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 501EB84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697564505;
	bh=tbY7wgGRlO6v5IUjQhW+hckUTRT1IP/RqORMcLcgk+8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qBWceMDthuM8hrDFc0hghPJbWno/msENOHRck65BWZBXySr4nj5GtsWmQPkgZ6grG
	 OWuC/gjCKm7VC1uV6dJBexeBZSqTB0Wn4StyOqhwczfpvC44uwsyu09w7ionvcDOuu
	 1is6fhId7K5YmQNKXtyt6se8s0DU0TTAGK4eqATo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 079C8F80564; Tue, 17 Oct 2023 19:40:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C74FF8055A;
	Tue, 17 Oct 2023 19:40:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59B02F8025F; Tue, 17 Oct 2023 19:40:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BE0EFF80166
	for <alsa-devel@alsa-project.org>; Tue, 17 Oct 2023 19:39:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE0EFF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SwIVnnEe
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AFE89CE204B;
	Tue, 17 Oct 2023 17:39:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A258C433C8;
	Tue, 17 Oct 2023 17:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697564384;
	bh=tbY7wgGRlO6v5IUjQhW+hckUTRT1IP/RqORMcLcgk+8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SwIVnnEeSl3s6cGRsKx8rDN9O6cfILhT9uiTQpr4+svVReYz3okZbW6PfgYQMJf1t
	 hKZAZNxjj8ersJiDzQoE5PFs8vUL+zpznTSuDprjCVQQ3ZI3fadEJ7VgD7qxTj6CnW
	 2c6On+F5wHiovG2jjc1ye3vC5heV90Y0CkXbFdvnI5p8Oqa/MYjaGnfFDQNuQO8cKW
	 Anbb7VaLIV2t6N9Etk15JCVoX9ZSmP6oUfqk3pBHVsmVJX4Lbpax8hPVcq/iLMx6p3
	 +Q9X9hDttPCdj7BTRjY4iiTDqJj9UowiDqhORG6r2xKD0WpkxugEpyRLI0dXpyBt+e
	 t+pwuWqzFJUfA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Daniel Beer <daniel.beer@igorinstitute.com>, Rob Herring <robh@kernel.org>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20231016155547.2973853-1-robh@kernel.org>
References: <20231016155547.2973853-1-robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: tas5805m: Disallow undefined
 properties
Message-Id: <169756438301.1863854.2005606398222182933.b4-ty@kernel.org>
Date: Tue, 17 Oct 2023 18:39:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: 5WORZ7L3I3MUVPIDHFMDCJZ3JJDG24WG
X-Message-ID-Hash: 5WORZ7L3I3MUVPIDHFMDCJZ3JJDG24WG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5WORZ7L3I3MUVPIDHFMDCJZ3JJDG24WG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 16 Oct 2023 10:55:47 -0500, Rob Herring wrote:
> Device specific bindings should not allow undefined properties. This is
> accomplished in json-schema with 'additionalProperties: false'.
> 
> Examples should be last in the schema, so move additionalProperties up
> while we're here.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: tas5805m: Disallow undefined properties
      commit: 086357275fc7635c5a2856c667b3d2f7604403fa

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

