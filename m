Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 293157A07F7
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 16:54:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AF8284B;
	Thu, 14 Sep 2023 16:53:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AF8284B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694703242;
	bh=gE+iGruQvOG/SXJlNTNSS7Rv1fSDB/ionw3c3sNQrcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V5NvUv9sivAXJ/++gSj0HZb/xmVWWUVKAMMPH4TFwRehrF45GrPIOp5gEEGoqhMpb
	 uFa5wmWHnM4gEuv5mF1W6iqLJk2n+01rq1gV1AjClyLsxBG3xkZDgjA68EPzOifUi9
	 YO29W1MSETEqhzvtYbgnGQR7y1DWvhEfJvBN4VTU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B513BF801F5; Thu, 14 Sep 2023 16:52:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A7DEF80212;
	Thu, 14 Sep 2023 16:52:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76E2BF80246; Thu, 14 Sep 2023 16:52:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C609F80212
	for <alsa-devel@alsa-project.org>; Thu, 14 Sep 2023 16:52:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C609F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=S5ESi6R5
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EC805B82643;
	Thu, 14 Sep 2023 14:52:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4994C433C8;
	Thu, 14 Sep 2023 14:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694703156;
	bh=gE+iGruQvOG/SXJlNTNSS7Rv1fSDB/ionw3c3sNQrcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S5ESi6R5qMDsXGmiZDsnnind0aPSnL6noRDyLYFTZtx1d+j1daLn7AWfsepRmepyf
	 viDS8j6XGiMLl50jlo7xDu3U+90/N5EZ19I0jOGIP5jLktjo279oem6Ri6jaLJhWNx
	 VV03MjWJqy5rq4m/h+OLechKjMHRILcFnnHQ9CR9t+Ja3iKYb6iuy4OXj1+UUmUmk7
	 sHJ2m7IALxLbuJa8hfxQcfpAv6UwjLAWlh1nEtZ0Xp7zanYEohytfLo8wbk5wet7o7
	 Qhfvhf5MULFQUlPhgaCyJynvsuC9h1MAVmzPQUfvTVNgmJVlechH3RVnHN/SxZK7Vv
	 CaEobsiHP5ApQ==
Received: (nullmailer pid 1276282 invoked by uid 1000);
	Thu, 14 Sep 2023 14:52:34 -0000
Date: Thu, 14 Sep 2023 09:52:34 -0500
From: Rob Herring <robh@kernel.org>
To: John Watts <contact@jookia.org>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] ASoC: dt-bindings: wlf,wm8782: Add wlf,fsampen
 property
Message-ID: <20230914145234.GA1275176-robh@kernel.org>
References: <20230913171552.92252-1-contact@jookia.org>
 <20230913171552.92252-4-contact@jookia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230913171552.92252-4-contact@jookia.org>
Message-ID-Hash: TQIR6G4CVR5OL4NJMBMNVJ72WM5366PB
X-Message-ID-Hash: TQIR6G4CVR5OL4NJMBMNVJ72WM5366PB
X-MailFrom: SRS0=Sijl=E6=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TQIR6G4CVR5OL4NJMBMNVJ72WM5366PB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Sep 14, 2023 at 03:15:52AM +1000, John Watts wrote:
> The WM8782 can safely support rates higher than 48kHz by changing the
> value of the FSAMPEN pin.
> 
> Allow specifying the FSAMPEN pin value in the device tree.
> 
> Signed-off-by: John Watts <contact@jookia.org>
> ---
>  Documentation/devicetree/bindings/sound/wm8782.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/wm8782.txt b/Documentation/devicetree/bindings/sound/wm8782.txt
> index 256cdec6ec4d..d217a616e103 100644
> --- a/Documentation/devicetree/bindings/sound/wm8782.txt
> +++ b/Documentation/devicetree/bindings/sound/wm8782.txt
> @@ -8,10 +8,15 @@ Required properties:
>   - Vdda-supply : phandle to a regulator for the analog power supply (2.7V - 5.5V)
>   - Vdd-supply  : phandle to a regulator for the digital power supply (2.7V - 3.6V)
>  
> +Optional properties:
> +
> + - wlf,fsampen : FSAMPEN pin value, 0 for low, 1 for high, 2 for disconnected

What's the default if the property is not present?

> +
>  Example:
>  
>  wm8782: stereo-adc {
>  	compatible = "wlf,wm8782";
>  	Vdda-supply = <&vdda_supply>;
>  	Vdd-supply = <&vdd_supply>;
> +	wlf,fsampen = <2>; /* 192KHz */
>  };
> -- 
> 2.42.0
> 
