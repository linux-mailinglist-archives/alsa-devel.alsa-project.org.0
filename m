Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EED4F731AAB
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jun 2023 16:00:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A378825;
	Thu, 15 Jun 2023 15:59:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A378825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686837613;
	bh=VjrxKNUyqqwfgs3hDcEiMErb77PH5mLOvHSL73d2Y5E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f0bcvgQpXrAB9gLIVw3/LUMlRDQzCnXTO7zo81AtnLd4SexvfFozRa6xHaxiyRX2A
	 kha39ZFQShPgmmgfH7FmCylZrDQY4EDXMgPcKAjka1FOzcTb9GBtWgWDvXwdLyZefk
	 yyRELURufegrkhxOIfsyOX1iGXm31tLmLfw5/8k8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 748A3F800BA; Thu, 15 Jun 2023 15:58:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B942FF80548;
	Thu, 15 Jun 2023 15:58:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 506E1F80149; Thu, 15 Jun 2023 15:58:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93C76F80130
	for <alsa-devel@alsa-project.org>; Thu, 15 Jun 2023 15:58:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93C76F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=V1NmSeYQ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B5C1063194;
	Thu, 15 Jun 2023 13:58:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AA14C433C9;
	Thu, 15 Jun 2023 13:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686837504;
	bh=VjrxKNUyqqwfgs3hDcEiMErb77PH5mLOvHSL73d2Y5E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=V1NmSeYQXyDn8JX9Jp6wW564xLTgGZTxqBQAilml//XfEd2bfLiadeT81HcJdIDLP
	 vJk4hiheeqlaIN5zIl8QjM6dgjr4RpFbZzaVUf8vMLYTMKdSmTyf3o2rCVWIjYlm6V
	 gHQEXpmXX3ucAZ4cBveVspOXrjXEZOql/MtBjV73JMC+dSMUT3NHsavWzcJ2yT67s4
	 ACJdt8BlkZVMTNBAzuHtq7ccQMJx9aNYsme2C5/fewP4e6zf9Osmj5Q72Qol3p4POj
	 WQXrHyuANYmYP6o4fnUmDt5HjlvlXl/kNW2fFfFGf+tsP3FiYauhekRMyHNTfcfd7f
	 TRzPIeS4RBqcg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, YingKun Meng <mengyingkun@loongson.cn>
Cc: krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, loongarch@lists.linux.dev,
 loongson-kernel@lists.loongnix.cn
In-Reply-To: <20230614122240.3402762-1-mengyingkun@loongson.cn>
References: <20230614122240.3402762-1-mengyingkun@loongson.cn>
Subject: Re: [PATCH v3 2/3] ASoC: loongson: Add Loongson ASoC Sound Card
 Support
Message-Id: <168683750214.557448.6898111686510406347.b4-ty@kernel.org>
Date: Thu, 15 Jun 2023 14:58:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: U6XNPPTEI6CJUIY3BMW6HMLBYMJ5YH5U
X-Message-ID-Hash: U6XNPPTEI6CJUIY3BMW6HMLBYMJ5YH5U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U6XNPPTEI6CJUIY3BMW6HMLBYMJ5YH5U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 14 Jun 2023 20:22:40 +0800, YingKun Meng wrote:
> The Loongson ASoC Sound Card is a general ASoC DAI Link driver that
> can be used for Loongson CPU DAI drivers and external CODECs.
> 
> The driver supports the use of ACPI table to describe device resources.
> On loongson 7axxx platforms, the audio device is an ACPI device.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/3] ASoC: loongson: Add Loongson ASoC Sound Card Support
      commit: d24028606e7642261d33ad2a50aed940d35cfb66

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

