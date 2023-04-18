Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E86F6E6953
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 18:22:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91AE4E83;
	Tue, 18 Apr 2023 18:21:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91AE4E83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681834948;
	bh=ap6Q5odoQ4rNoTfPJqKCKCL+ukarr6XYL6tmAzzw7Qw=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PrudqgVcLr1KQgikjhhL99IBsbat5wAFaP8g0Y1jS4S9+aol8wqpI7aSgWaUIu0Ip
	 3xKOJfw97S0fyF+tZi/XGQYRb3baU2H6LIEnCvzesOKDRcOWR2m1xhSrJAtfKS0P+o
	 KnjXH847mjCtcb90EhQ0WwLOiAMLHG9dQdqGTqCc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98D06F800AC;
	Tue, 18 Apr 2023 18:21:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B094F804FC; Tue, 18 Apr 2023 18:21:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A80E8F800F8
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 18:21:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A80E8F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MrFuEiWQ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C02406366B;
	Tue, 18 Apr 2023 16:21:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB76C4339C;
	Tue, 18 Apr 2023 16:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681834881;
	bh=ap6Q5odoQ4rNoTfPJqKCKCL+ukarr6XYL6tmAzzw7Qw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MrFuEiWQY5pEd6wb4KR1+TS3E3VXN4mi6xoxWF1ods9t1Mg/FK1Og11IWCNOFPIIw
	 c1OrFuxGXfWdR9Qc752L7Ete4iHhYkaDZPDclXzWrjkPqPIbl3HTpPVorMEfWF/m9P
	 B3z3cie4yBQSOGkt8f4D21Euykk4rqB0A2pa5pI4Gi1ab04i2Frm+HbcPgoeAh09T9
	 e48IEmR4HvUXjpjEHaXS7jxZCqi5bmdNNC+xb59EG1B3nR3+gppahy/+U0nW2QYXVB
	 OffyKv8UyCCbjdWxnEdAWJAFOOs0BGd6d57Zd2+zl2DMHAi+RBDoyDiOAtKtYmdvYw
	 6UOF3m/W48MIg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, daniel.baluta@gmail.com,
 Saalim Quadri <danascape@gmail.com>
In-Reply-To: <20230417212400.161796-1-danascape@gmail.com>
References: <20230417212400.161796-1-danascape@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: wm8737: Convert to dtschema
Message-Id: <168183487901.87933.8631683727283438800.b4-ty@kernel.org>
Date: Tue, 18 Apr 2023 17:21:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: YYNRYSOUYI6R5FVDGGMOYDM77UVK6UIR
X-Message-ID-Hash: YYNRYSOUYI6R5FVDGGMOYDM77UVK6UIR
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YYNRYSOUYI6R5FVDGGMOYDM77UVK6UIR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 17 Apr 2023 21:24:00 +0000, Saalim Quadri wrote:
> Convert the WM8737 audio CODEC bindings to DT schema
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: wm8737: Convert to dtschema
      commit: c341b5681fa074faa596fbb0fa0fc256b7e2301a

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

