Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A654D756F90
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 00:01:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFCACDEF;
	Tue, 18 Jul 2023 00:00:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFCACDEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689631290;
	bh=L4LNILElwEJuIvZsN9V0NhiSCNz4Ki8cQsqwvuJykvo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=CcF4/YFhfclwVTQUVLB46HVFPdI1hXv0IfF/Df/BBQHlQSpBxKF1llcynouJdyiFa
	 ZDQVcsh0RU96u53tSyac1QY/wg8KZW1eyHotJSWMm0jYToCTE+8MRLgyhkBgOk1Elp
	 MM2Oy8+SbTs+2+Br1tThsrVryp3I1EtqhYwpxUug=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FE2DF80548; Mon, 17 Jul 2023 23:59:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7B24F80548;
	Mon, 17 Jul 2023 23:59:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 734A6F80494; Mon, 17 Jul 2023 23:59:46 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B1B05F8047D
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 23:59:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1B05F8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QXKgOwmH
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 60120612B4;
	Mon, 17 Jul 2023 21:59:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E28A5C433C8;
	Mon, 17 Jul 2023 21:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689631179;
	bh=L4LNILElwEJuIvZsN9V0NhiSCNz4Ki8cQsqwvuJykvo=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=QXKgOwmHlEVnNI7mc/TIk7h7m85AZuTRJ2zI7MzW+kUSv8nw7c0nIfPZw3GdADPXM
	 h6mhCp1iMdTp6ujNMJLWw5wicHgBYOvLa8XCqRzRf3ne0F67BCEovoP2CyOxQo74Rf
	 NIKJ8cHBUKFWgD4CTxM9rbPnQvQjZWcDWiXNchnNHdygR5a0fLkLTJENfTpkG/DAuM
	 v9Y9X7zw9FmaRvTGBTmTR0zH/zlVWhn/P/GjoVdxhhK/2198ujTP/u2Mjms92yQf0D
	 OvkNTk/a9dJgWA9Nm/xUqEZXcBvY6FQJK/qJcKZ5eNGEOhjTf1Fz1PWSsJPj0fCLIa
	 GCvfo8sCDBS6w==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
 Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20230714092913.1591195-1-chancel.liu@nxp.com>
References: <20230714092913.1591195-1-chancel.liu@nxp.com>
Subject: Re: [PATCH 0/2] Add support for rpmsg sound card on i.MX93
 platform
Message-Id: <168963117664.522208.15403610708641093351.b4-ty@kernel.org>
Date: Mon, 17 Jul 2023 22:59:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: IEHSBF2M7WRVVJE2HDHKWNTQDRVU2OZU
X-Message-ID-Hash: IEHSBF2M7WRVVJE2HDHKWNTQDRVU2OZU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IEHSBF2M7WRVVJE2HDHKWNTQDRVU2OZU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 14 Jul 2023 17:29:11 +0800, Chancel Liu wrote:
> Support rpmsg sound card on i.MX93 platform.
> 
> Chancel Liu (2):
>   ASoC: dt-bindings: fsl_rpmsg: Add compatible string for i.MX93
>   ASoC: fsl_rpmsg: Add support for i.MX93 platform
> 
>  Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml | 1 +
>  sound/soc/fsl/fsl_rpmsg.c                              | 8 ++++++++
>  2 files changed, 9 insertions(+)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: fsl_rpmsg: Add compatible string for i.MX93
      commit: 143f8c69a27f3fa8ed30c7f6790ea039fff57cfe
[2/2] ASoC: fsl_rpmsg: Add support for i.MX93 platform
      commit: 60f38a592efe08e5ced454e8a05f6814e6e221ec

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

