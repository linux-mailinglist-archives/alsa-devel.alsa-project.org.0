Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE5274F9B4
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 23:23:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FDF4F04;
	Tue, 11 Jul 2023 23:22:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FDF4F04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689110600;
	bh=YPSY5HUnEvTGUfr7w/tBIIh9m9ceIEnrSFhq7uRjKcY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g9YwNlWQNK+ShtiQ830lMzt+MtD4WsKvefHkW5kzfWfUY7Y9oFHp5cs6v1allNdRj
	 sqCVYm/BygriUgMHffWFpqrmVFcV6psByH5AUlmYm4gKnYt58QUfVhs4ahW0H65fXL
	 7BB/sFninHZCwK9RXvDQC6BNmM7wpfhUVwGlkIw4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFDA7F80570; Tue, 11 Jul 2023 23:21:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10709F8055C;
	Tue, 11 Jul 2023 23:21:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46244F8024E; Tue, 11 Jul 2023 23:21:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CFFBDF800E4
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 23:21:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFFBDF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jRIvjX4I
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DFE6661601;
	Tue, 11 Jul 2023 21:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 516FDC433C9;
	Tue, 11 Jul 2023 21:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689110483;
	bh=YPSY5HUnEvTGUfr7w/tBIIh9m9ceIEnrSFhq7uRjKcY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jRIvjX4IGsggKxoSXRCirgRqmZ+47AGWe5Vqd4Uc+mv3ipYCU9NUkLnjHTiG4XV7x
	 ivwAlabtQ50xEFzWz+YiffrTxoYqn2EJtRgcbiePFNi7WBmM3sMlqFJYC6yJzetkPS
	 r6UOvlCxOTAWdcE0GCHOtfcyn6/g9b9e9x/VxzLu2box23nW196Rvng/QyWHkO5wJP
	 ijUW1EtoHnTjeVvSTdeYTNP2p2H1qpfjxZFVi/d3Q7hhNHaJzSGnlhMawAvuPMHnJh
	 aI/aUzHBilSvPB8JmsmAWnhm0W0MHdhvdWPSDurYGE+Chxujgr/zHba1tZyKX+pvB9
	 jyv8urmbl9nmw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, cychiang@chromium.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Rohit kumar <quic_rohkumar@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230707074337.3120530-1-quic_rohkumar@quicinc.com>
References: <20230707074337.3120530-1-quic_rohkumar@quicinc.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: Update maintainer email id
Message-Id: <168911048005.530041.1862565252407998007.b4-ty@kernel.org>
Date: Tue, 11 Jul 2023 22:21:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: 6NOUO5ZL74ELU4ITFSU763WFPBS4BGIW
X-Message-ID-Hash: 6NOUO5ZL74ELU4ITFSU763WFPBS4BGIW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6NOUO5ZL74ELU4ITFSU763WFPBS4BGIW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 07 Jul 2023 13:13:36 +0530, Rohit kumar wrote:
> Updated my mail id to latest quicinc id.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: Update maintainer email id
      commit: a1ff5802da3806e916de100130a7850b3f80c377

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

