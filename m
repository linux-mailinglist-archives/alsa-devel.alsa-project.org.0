Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7837A777140
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 09:22:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6084857;
	Thu, 10 Aug 2023 09:21:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6084857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691652150;
	bh=eRuxRZrzTLlnx6DgquYB53RKWnoQsTCb3WWN1Nw8+QI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SN4/p2qbY6NNyjkNL6PDa9yTW9Wrvppj0fLtEq/40DIBT2/CCBOPgEGJHb1u8W71c
	 jNHdgQLFQ0QkxdEtHe5sfZ2MwUh1uqkkj+NriEXL+mmwXFfRS8lRRspkI+ByodRAwd
	 tRIHJG/YQN4dNd9L/YcWjvKLcZfIhw2WTRWrXTbk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71079F80589; Thu, 10 Aug 2023 09:20:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EDA4CF8057D;
	Thu, 10 Aug 2023 09:20:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5CD7F80570; Thu, 10 Aug 2023 09:20:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F81CF80552
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 09:20:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F81CF80552
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Wk9TMqyp
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 075716512F;
	Thu, 10 Aug 2023 07:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5340BC433C8;
	Thu, 10 Aug 2023 07:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691652043;
	bh=eRuxRZrzTLlnx6DgquYB53RKWnoQsTCb3WWN1Nw8+QI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Wk9TMqypQrE2pJPhrsUb6UFv0kTTwlisz0A6e1v6LV1UGrHd1w8Cr+fhVZXMYLfbR
	 scwm42jYERXU3Ox6O/JuIpjF4tM23uRF4tN4Il58We+H7Uqrj6wKN3aIeIcqZ6KSE8
	 wwgAQpOazPV4FaJmn4HeR8syA7UaAM6Th8IXsbU1JGubl4LQcYgEesfpHyX0PexhZq
	 LCEDeXGd8gmO800zDq5Ye6BHj4fJ/la2aTv7H0fUTwAlQ1KPh1a4I7If6ui0DXec+0
	 Xus3Ug1ZMajO0p6tEquDrkIWtxPwnDTlYBPi8GgPAlW+RSLThAecdzv6QvopbavZgU
	 7DezKL3qslI8w==
Received: (nullmailer pid 3911831 invoked by uid 1000);
	Thu, 10 Aug 2023 07:20:21 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Fabio Estevam <festevam@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rohit kumar <quic_rohkumar@quicinc.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rao Mandadapu <srivasam@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Judy Hsiao <judyhsiao@chromium.org>,
 Trevor Wu <trevor.wu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Mark Brown <broonie@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jonathan Bakker <xc
 -racer2@live.ca>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
In-Reply-To: <20230810063300.20151-4-krzysztof.kozlowski@linaro.org>
References: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
 <20230810063300.20151-4-krzysztof.kozlowski@linaro.org>
Message-Id: <169165201826.3911647.6192321838074174058.robh@kernel.org>
Subject: Re: [PATCH v2 04/11] ASoC: dt-bindings: samsung,midas-audio: use
 common sound card
Date: Thu, 10 Aug 2023 01:20:21 -0600
Message-ID-Hash: G5CC4INMX4PAP5LXBXGRJQ6CBXH637FW
X-Message-ID-Hash: G5CC4INMX4PAP5LXBXGRJQ6CBXH637FW
X-MailFrom: SRS0=zxi7=D3=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G5CC4INMX4PAP5LXBXGRJQ6CBXH637FW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Thu, 10 Aug 2023 08:32:52 +0200, Krzysztof Kozlowski wrote:
> Reference the common sound card properties and deprecate the
> custom "samsung,audio-routing" in favor of generic one.  This allows to
> remove "model" property and make the binding closer to other sounds
> cards.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/sound/samsung,midas-audio.yaml      | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230810063300.20151-4-krzysztof.kozlowski@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

