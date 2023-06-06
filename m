Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A93724159
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 13:56:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A3E03E8;
	Tue,  6 Jun 2023 13:55:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A3E03E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686052579;
	bh=AwQKK+vTDce/hOWPJg3SWi3sPnJdf83ZO5vJmOamOkE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rtR0bGaJwKQkkAVlD7GW/1bGYxRfNe+oVuOBwdpf1AWTodIzLKEOjkBlC3GHH3Gwo
	 YXOSfVjwNdxDmkMkr0ghVEXBKlec2DEbUCExfvggp0j5FG5yK1V6PUj42VgEyYhnFt
	 slc0g8NAZQMJUOimoKhiGlq6mPvGC0WR4MdwqVGA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1CB2F800ED; Tue,  6 Jun 2023 13:55:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5881F8016C;
	Tue,  6 Jun 2023 13:55:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62526F80199; Tue,  6 Jun 2023 13:55:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4ABECF800C8
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 13:55:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4ABECF800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DHNG6V6/
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 405BF62FC5;
	Tue,  6 Jun 2023 11:55:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1754C433EF;
	Tue,  6 Jun 2023 11:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686052516;
	bh=AwQKK+vTDce/hOWPJg3SWi3sPnJdf83ZO5vJmOamOkE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DHNG6V6/38Q7F4e45zExoOMuNwCarV2zw+iIG35cAsmapdi8OaU9g06REmXqAlMru
	 wOgDlyyrGzdqiEAI/GUMHr7dvvi8qgZhxFcdZtpHZv0gmDgJQsQOiRVeCOWzgH3UEg
	 gmdVkHWaVpCkhRFOEsi+YyalTDPx0gdnxnfXbd5ugn9lybnz40mzUf7waFN/RwBqBf
	 a0lKyXkT7j1al+Q+DzxKI4+V/qK0BRS40FyzHcXKUd9vfM525paXPA+A0UYa6fvkFo
	 R3VEwThIWwtxYmuWzrY8vFfeerJVAMj/CvNs7s2j2FDYDjVpZxieRebU8vgNkAlTPB
	 /3O6z3ZiBP9+w==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
In-Reply-To: <20230605143238.4001982-1-rf@opensource.cirrus.com>
References: <20230605143238.4001982-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] firmware: cs_dsp: Log correct region name in bin error
 messages
Message-Id: <168605251548.20864.13850925270775082245.b4-ty@kernel.org>
Date: Tue, 06 Jun 2023 12:55:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: YZ5Y6TWRY7HCWTPVUCED2QGTLT64YBNN
X-Message-ID-Hash: YZ5Y6TWRY7HCWTPVUCED2QGTLT64YBNN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YZ5Y6TWRY7HCWTPVUCED2QGTLT64YBNN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 05 Jun 2023 15:32:38 +0100, Richard Fitzgerald wrote:
> In cs_dsp_load_coeff() region_name should be set in the XM/YM/ZM
> cases otherwise any errors will log the region as "Unknown".
> 
> While doing this also change one error message that logged the
> region type ID to log the region_name instead. This makes it
> consistent with other messages in the same function.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] firmware: cs_dsp: Log correct region name in bin error messages
      commit: ad24919540fb4df83981d469b5253cc1aecca939

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

