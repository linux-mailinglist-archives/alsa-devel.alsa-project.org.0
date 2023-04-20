Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD206E94BE
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 14:40:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82816EC9;
	Thu, 20 Apr 2023 14:40:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82816EC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681994452;
	bh=bEkdbyIx72etuIAUa7h/JO4/RfZQctLNpOFTkKfZP2U=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s65spxFNYKAvB31VevCh6dfto0DOU9RyDeVmx3nD9wUPyZ6sShpWMmV2LcWWs8gcU
	 Lz9gMURzLN0Cctxej6p+KIMFAf8VgXEAtNZb4yn8YdZUcuoWFtZfrPMfRmZga0sJkq
	 BDzHabv4MlJfKSFAEMEKCB6Pv//WOV+u7rpk7sF8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AF8A5F80149;
	Thu, 20 Apr 2023 14:40:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3A80F80155; Thu, 20 Apr 2023 14:39:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7D9E0F800F8
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 14:39:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D9E0F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hsnu7aGb
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7C29764932;
	Thu, 20 Apr 2023 12:39:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 767F8C4339B;
	Thu, 20 Apr 2023 12:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681994391;
	bh=bEkdbyIx72etuIAUa7h/JO4/RfZQctLNpOFTkKfZP2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hsnu7aGbIiJe8e/Wq0dB/VoyqAPHGW9sbLxsVwAV0vba0aMxuEg5i0nI8yNQFp5Cd
	 pRBJGMmFjAYJo9ABzZtKsxSKn4KPevNYs5wq0pTkvpLmQOWgyTMVKm+Eg9xSjCOzyx
	 JHEQJTqTybxSlHTKFKmdO6z/JtJR2hGH07hY7G24w1ruAU7R/qNCY1Lmc2NceXiSRs
	 aBvEtPuc4x1dncYhmnan1NU/Vyy8cX50hJyFQA0QirH8kGS1Lga8X5UGBstXBb4tzm
	 fjnZpX/h27Z1TpqI2OVkeGyWSAmJTe7K8GGFDyXjZ2XC+DSr2L9k4VQgFEfwZk4sP1
	 zu8LLycUVhOCQ==
Date: Thu, 20 Apr 2023 13:39:46 +0100
From: Lee Jones <lee@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v6 3/7] mfd: Add support for the Lantiq PEF2256 framer
Message-ID: <20230420123946.GB996918@google.com>
References: <20230417171601.74656-1-herve.codina@bootlin.com>
 <20230417171601.74656-4-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230417171601.74656-4-herve.codina@bootlin.com>
Message-ID-Hash: TUQQ6SPEETPLCOUTQPKB7OA275VPNN4X
X-Message-ID-Hash: TUQQ6SPEETPLCOUTQPKB7OA275VPNN4X
X-MailFrom: lee@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TUQQ6SPEETPLCOUTQPKB7OA275VPNN4X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 17 Apr 2023, Herve Codina wrote:

> The Lantiq PEF2256 is a framer and line interface component designed to
> fulfill all required interfacing between an analog E1/T1/J1 line and the
> digital PCM system highway/H.100 bus.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  drivers/mfd/Kconfig         |  16 +
>  drivers/mfd/Makefile        |   1 +
>  drivers/mfd/pef2256-regs.h  | 250 ++++++++++
>  drivers/mfd/pef2256.c       | 950 ++++++++++++++++++++++++++++++++++++

95% of this driver needs to be moved somewhere else.

What is a Framer?  Perhaps sound/ is a good candidate?

>  include/linux/mfd/pef2256.h |  52 ++
>  5 files changed, 1269 insertions(+)
>  create mode 100644 drivers/mfd/pef2256-regs.h
>  create mode 100644 drivers/mfd/pef2256.c
>  create mode 100644 include/linux/mfd/pef2256.h

[...]

> +static int pef2256_add_audio_devices(struct pef2256 *pef2256)
> +{
> +	const char *compatible = "lantiq,pef2256-codec";
> +	struct mfd_cell *audio_devs;
> +	struct device_node *np;
> +	unsigned int count = 0;
> +	unsigned int i;
> +	int ret;
> +
> +	for_each_available_child_of_node(pef2256->dev->of_node, np) {
> +		if (of_device_is_compatible(np, compatible))
> +			count++;
> +	}

Converting Device Tree nodes into MFD cells to register with the
Platform Device API is not a reasonable use-case of MFD.

Have the CODEC driver match on "lantiq,pef2256-codec" and let it
instantiate itself.

Your first version using of_platform_populate() was closer to the mark.

> +	if (!count)
> +		return 0;
> +
> +	audio_devs = kcalloc(count, sizeof(*audio_devs), GFP_KERNEL);
> +	if (!audio_devs)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < count; i++) {
> +		(audio_devs + i)->name = "lantiq-pef2256-codec";
> +		(audio_devs + i)->of_compatible = compatible;
> +		(audio_devs + i)->id = i;
> +	}
> +
> +	ret = mfd_add_devices(pef2256->dev, 0, audio_devs, count, NULL, 0, NULL);
> +	kfree(audio_devs);
> +	return ret;
> +}

-- 
Lee Jones [李琼斯]
