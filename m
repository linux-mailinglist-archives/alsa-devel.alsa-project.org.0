Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 311E57B8639
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Oct 2023 19:16:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C05DA4E;
	Wed,  4 Oct 2023 19:15:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C05DA4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696439789;
	bh=PgL3evwIOV/77BxTPntvEU/hYBN5ZLqrDoo7IwbFWG8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LviTZz1tJVL2l9LOapfRXYSnq47bhwA+aROvSmUIWl03AbDRh0ixzA5xlcE8Apsnb
	 z80AKksHS4XbU7o09BAMLU/OWq35gQIVKK06Ure9lPrBhXj66GtFgqGTg0rQxM8FdF
	 1qUfqV6lsz6h1rWSWOws2peR5UCo5EiF/DZpWL0k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32C9FF80563; Wed,  4 Oct 2023 19:15:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC55FF8055A;
	Wed,  4 Oct 2023 19:15:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B4B4F8055B; Wed,  4 Oct 2023 19:15:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7FB75F80557
	for <alsa-devel@alsa-project.org>; Wed,  4 Oct 2023 19:14:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FB75F80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LhDWcvdK
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 73D59615FF;
	Wed,  4 Oct 2023 17:14:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DB23C433CB;
	Wed,  4 Oct 2023 17:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696439693;
	bh=PgL3evwIOV/77BxTPntvEU/hYBN5ZLqrDoo7IwbFWG8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LhDWcvdKs4il6Kx4Zt2qDoMbzPqBgvPotLQPmvaiQVcKRZtr7Z98AFeujETSwmPTi
	 tppbp1BGoqUVR96OqQtgXi6WuJQ4CEiNRXF2bwLnUzUgM5eF2dzud3gWblIGVb7uTI
	 6Yb3fXdyiJ1dOZhgyRFwvdn0+INoCG3sdWYc0Kcn2sJUnytZ8Zzx7zzYcF6TxF8EgT
	 Q5OwpK1fCThYYivVt3raoMEoEXz3nzESPI4/VlkquXOoxNFRdavMduHlUtA+q4m96j
	 EuH7/ldDqqmnxa4aRiiIoSQaOeqZ6EjiEJbPi25nVyzm+Td7izJhRN9vn7sVyzyAOv
	 GhauZ7rUlihJw==
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, shengjiu.wang@nxp.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, aford173@gmail.com,
 Fabio Estevam <festevam@denx.de>
In-Reply-To: <20231004122935.2250889-1-festevam@gmail.com>
References: <20231004122935.2250889-1-festevam@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: fsl,micfil: Document
 #sound-dai-cells
Message-Id: <169643969102.45803.10283738118906505047.b4-ty@kernel.org>
Date: Wed, 04 Oct 2023 18:14:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: MRCCXEAV6HXEVRVYOJMIUWKHH5L5BCPB
X-Message-ID-Hash: MRCCXEAV6HXEVRVYOJMIUWKHH5L5BCPB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MRCCXEAV6HXEVRVYOJMIUWKHH5L5BCPB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 04 Oct 2023 09:29:35 -0300, Fabio Estevam wrote:
> imx8mp.dtsi passes #sound-dai-cells = <0> in the micfil node.
> 
> Document #sound-dai-cells to fix the following schema warning:
> 
> audio-controller@30ca0000: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
> from schema $id: http://devicetree.org/schemas/sound/fsl,micfil.yaml#
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: fsl,micfil: Document #sound-dai-cells
      commit: 1426b9ba7c453755d182ebf7e7f2367ba249dcf4

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

