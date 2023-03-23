Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEC06C6CB6
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 16:55:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92F44ECF;
	Thu, 23 Mar 2023 16:54:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92F44ECF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679586918;
	bh=tDREPBXaK0ti0eVcANz4uaiEmiQSyLL0wDgzguewic4=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hcfwULrFkTkweBNjeqHDcrydf8NnmFzswUOjdmPv9liOB2FQ3qjTLhpgMmsJNp6as
	 ilDaoTRlOpSH5ssbgqnR7OOpw5YNBVoZqEBRo6EZOc0lST7P37uh74StVHUimh8Ayn
	 k1I6XrwRERPuJPb90UMRZj42d8POjSyL9Q+BxzHA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CD3BF804FE;
	Thu, 23 Mar 2023 16:53:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B031F802E8; Thu, 23 Mar 2023 16:53:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44249F8027B
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 16:53:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44249F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FEbZlfWV
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 074D06279B;
	Thu, 23 Mar 2023 15:53:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EA58C433EF;
	Thu, 23 Mar 2023 15:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679586806;
	bh=tDREPBXaK0ti0eVcANz4uaiEmiQSyLL0wDgzguewic4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FEbZlfWVelo81n17h/rHSnGYvpV84bdnc08jYT204xGP63j3TdDis1tRuSloVmbSn
	 4fnpOJBuGzquO0Oc7YeJ5a8A05ONvkz1U3I1g2xuV90Dg6ENt9KmeGxzV8Rmw3klmS
	 eXNnRUqRT8Iv0W7hueSn8VfXKIwa/Kqv9/sSXcyz8cHHmmW6r6ViEt51Fz46vvKkQY
	 4qWMRjshszKKRWfmP7q2gBsvhKZMr7K2C55n6lb5RLbwPr6wqMAvsDwS/A9PnAE0LO
	 NtFjzT9ruGGP1+9pQ5WVgVP0YZyPbclwX33bn4pSz90FwjIUJe0+oj+UvVXu+jg0wI
	 r9vQzqm7iK6sw==
From: Mark Brown <broonie@kernel.org>
To: krzysztof.kozlowski@linaro.org, daniel.baluta@nxp.com,
 Saalim Quadri <danascape@gmail.com>
In-Reply-To: <20230322200949.8986-1-danascape@gmail.com>
References: <d1559192-8f6d-26e0-ef19-d14ac7987a74@linaro.org>
 <20230322200949.8986-1-danascape@gmail.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: ak5558: Convert to dtschema
Message-Id: <167958680436.69273.12643001731670842652.b4-ty@kernel.org>
Date: Thu, 23 Mar 2023 15:53:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: RM6NR4AVGYFHYVFPJGMKO3FQHHX3X3OT
X-Message-ID-Hash: RM6NR4AVGYFHYVFPJGMKO3FQHHX3X3OT
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RM6NR4AVGYFHYVFPJGMKO3FQHHX3X3OT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 23 Mar 2023 01:39:49 +0530, Saalim Quadri wrote:
> Convert the AK5558 ADC audio codec bindings to DT schema.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: ak5558: Convert to dtschema
      commit: 829d78e3ea321eb4f4e93bc7b162b8cc6ed91ec7

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

