Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C72D796941F
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2024 08:49:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2457384A;
	Tue,  3 Sep 2024 08:49:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2457384A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725346196;
	bh=ub9hHPzWCg2ZO7IESniZCUNBELQpnPcRyQyrABcGDT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z3YtcTxL4AtNRAgihYN1vMiyCZ+H+UVwftVWYmoHqwrQ/Z7nW3xMA1UWlgPG05gAM
	 +UKEXeGPuAmkmW45R8xkYj3E+pAp3y67f/JiNyP+0VCQpz3aqJpbggxP5KKDLSQX0/
	 xqbK3Mg419C/O61OiWBQ1Su6nrryontB/grQq1PI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CC8CF80527; Tue,  3 Sep 2024 08:49:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E89DF805B2;
	Tue,  3 Sep 2024 08:49:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC490F80199; Tue,  3 Sep 2024 08:49:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5EF3F80116
	for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2024 08:49:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5EF3F80116
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rmWz7C7L
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3EE81A4145F;
	Tue,  3 Sep 2024 06:49:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D22C4CEC5;
	Tue,  3 Sep 2024 06:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725346165;
	bh=ub9hHPzWCg2ZO7IESniZCUNBELQpnPcRyQyrABcGDT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rmWz7C7Lc6E/IoufuRNWFhBxrXYdzPrtMn5vbDk1SY3npCwYbfDtZLZlNuSBMXbWn
	 I0is3bL/cIvP/uWMfzHsJDRuiJcCLuP9RJgbfJd3icvz/dKkBCvtA/mSm/IJFCFKso
	 ZmsIdxs55sGZte+Gge2oG7WqTVL510RsIYaiSivf7C6MFhGe0jL6c1K9jV2ST35bSB
	 20KzF1s77GGrschL13bpvU8vqxgNj7RGR8rVITQqEExOZPf0kXiJVp8IQsJSe0o0Vd
	 cN/mvy886GSAlTdK35QyRFfbYJch3MEz9EaAFKesjuO66N+Wo3Kb0P6KFbXrTCpKT/
	 1hmYTF8Zp076A==
Date: Tue, 3 Sep 2024 08:49:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kiseok Jo <kiseok.jo@irondevice.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 application@irondevice.com
Subject: Re: [PATCH v2 2/3] ASoC: dt-bindings: irondevice,sma1307: Add
 initial DT binding
Message-ID: <afb4bwvowfjjrkdh63wx7afz3gyydz7tpuhz2i6g6ahubat3vy@7t5vciiv2yp7>
References: <20240903054435.2659-1-kiseok.jo@irondevice.com>
 <20240903054435.2659-3-kiseok.jo@irondevice.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240903054435.2659-3-kiseok.jo@irondevice.com>
Message-ID-Hash: 446LRSXZVQU6QRT77LW76ITLPSSXVCI7
X-Message-ID-Hash: 446LRSXZVQU6QRT77LW76ITLPSSXVCI7
X-MailFrom: krzk@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/446LRSXZVQU6QRT77LW76ITLPSSXVCI7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Sep 03, 2024 at 02:44:34PM +0900, Kiseok Jo wrote:
> Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>

Empty commit? Read submitting-patches.

Please run scripts/checkpatch.pl and fix reported warnings. Then please
run  and (probably) fix more warnings.
Some warnings can be ignored, especially from --strict run, but the code
here looks like it needs a fix. Feel free to get in touch if the warning
is not clear.

> ---

Where is the changelog? What happened in v2? Why are you sending the
same patch?

>  .../bindings/sound/irondevice,sma1307.yaml    | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml b/Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml
> new file mode 100644
> index 000000000..0bb4ee664
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/irondevice,sma1307.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Iron Device SMA1307 Audio Amplifier
> +
> +maintainers:
> +  - Kiseok Jo <kiseok.jo@irondevice.com>
> +
> +description:
> +  SMA1307 boosted digital speaker amplifier
> +  with feedback-loop.
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - irondevice,sma1307a
> +      - irondevice,sma1307aq
> +    description:
> +      If a 'q' is added, it indicated the product is AEC-Q100
> +      qualified for automotive applications. SMA1307A supports
> +      both WLCSP and QFN packages. However, SMA1307AQ only
> +      supports the QFN package.

Difference is only in package bin? That does not warrant new compatible.

Best regards,
Krzysztof

