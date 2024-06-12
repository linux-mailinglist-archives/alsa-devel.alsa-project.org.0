Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F2390525E
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 14:25:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01A50A4D;
	Wed, 12 Jun 2024 14:25:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01A50A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718195157;
	bh=Wrzhzu7bIdEAEmG7BQsLuO7wEyAX0cCb7hQvsk2N+G0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XugZKqOPk1Yhf2xYP49bLLYCJVst2HY3umdj8SyHAqZqATJwhrmWFUyQMQI0HAjqL
	 K3qm0yfHteTyPwSxHou8/t5sL8Qecqq/neEiGpDTLuiL7LhWNiML/mgw4VGHmuT0ry
	 eXApYme4BCPvlEPhdvzwSiqcS3OW0lctojstcG00=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2496F8057A; Wed, 12 Jun 2024 14:25:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77D99F805A0;
	Wed, 12 Jun 2024 14:25:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 298F0F8057A; Wed, 12 Jun 2024 14:25:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A571F80448
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 14:25:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A571F80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jAnHwG6m
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-704313fa830so3065261b3a.3
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 05:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718195123; x=1718799923;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jC+Unx6/L3Ahsjr160FqlUlQIcBGGCTwQ+U7pYUCZQ0=;
        b=jAnHwG6mGxFXqpLB+6h1EY5D5++yFq44e0wIVnROnCjrFNtq6Uy9WATXXHfHPP3Cdh
         ED59I2MN9pERg6LnkAOE+dzEkmcbEBMj2ac4MFqJSVlv+iyvOmeoS9UOeaqykrPQgVcE
         r2VfwELtxNuRVOhgi92tcNPmko4cIqDp6+YzZn3E2Jv3sJ0hZikFVGtUdXNpN941kBqK
         U7PM4oyFh6Fk56OoXlgCMh64NMjVoBja0Tx17lr07Q/bUScCwgmS+xLEwxdeZbyJJztS
         TJyCfx7KyjkOqjbe/QVzdGxOkLsH8EW6WbqGEo1d++LP/ImRGwkS3ne05T5WS6N3U1Ui
         EJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718195123; x=1718799923;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jC+Unx6/L3Ahsjr160FqlUlQIcBGGCTwQ+U7pYUCZQ0=;
        b=Zsjz/gi1KSyAjhmk7XdJr+aJ47k1vJQZHKY7onLRQEFDE5FhishbWzFYKScAdiRFey
         I/YqyuVCEhkIOoz+ulOlly8yA/T2ZOe6fAAkaKOkMD2oRoV7Esh7jgHLNMAbPWCWTLDg
         cut5YfNQmtksd/HD6f2XghTa9hrF4d80skEcH+G1e6oNVqSQGZu7M/17mRZUmro0kRN4
         juufZX8kDDGrcoOVGqJbNcpyrsG11yRCz0MdF2IVWQYKT6+Lty1DakMlaKe6KETPUzlC
         3ZuJt1/44lufI3ui3UsSAckKnwDlkognmO+Vb90vwnEeQYqZpHeX0IaM9dFdppLwwRS8
         61HA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZvFlRy9B2E/eekHTwuAx/wg0LqqlNIQDiBSoxTq09uDkQMP0AeT/4ORkTJCQ6nXT+XEzr08RqfU22dWd2MRMlifg5m/yO6+X3FYI=
X-Gm-Message-State: AOJu0YwsiuFQXXXnnLlCrAt0eiP+B3fUrXnBa4m1k5ObxhfZ73mX8n53
	3Kx5Ok5tjwbBSQvPrPS9YCwmylx/nkCq2Gke8P2tWAX0PyhiAA5U9VosyQ==
X-Google-Smtp-Source: 
 AGHT+IErt7uVvEdoTI+9BxF9U3hhKUgJvir/IBG5VhQMRaKn/1u60z5z026VLtNbbSWbrgj1SHg2Bg==
X-Received: by 2002:a05:6a21:32a4:b0:1b8:54f8:385d with SMTP id
 adf61e73a8af0-1b8a9c688e8mr1858023637.47.1718195122807;
        Wed, 12 Jun 2024 05:25:22 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6bd7e3e71sm121898095ad.219.2024.06.12.05.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 05:25:22 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 5B4DE182522A0; Wed, 12 Jun 2024 19:25:19 +0700 (WIB)
Date: Wed, 12 Jun 2024 19:25:19 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
	mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
	corbet@lwn.net, broonie@kernel.org, lgirdwood@gmail.com,
	krzk+dt@kernel.org, Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com,
	tiwai@suse.com, robh@kernel.org, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v23 32/32] ASoC: doc: Add documentation for SOC USB
Message-ID: <ZmmTr48zLCxRVlYf@archie.me>
References: <20240610235808.22173-1-quic_wcheng@quicinc.com>
 <20240610235808.22173-33-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="P13nW3ExZUkt8gyc"
Content-Disposition: inline
In-Reply-To: <20240610235808.22173-33-quic_wcheng@quicinc.com>
Message-ID-Hash: TXCDTWL4VOWKV3OZFQDCQVORV5APBESQ
X-Message-ID-Hash: TXCDTWL4VOWKV3OZFQDCQVORV5APBESQ
X-MailFrom: bagasdotme@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TXCDTWL4VOWKV3OZFQDCQVORV5APBESQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--P13nW3ExZUkt8gyc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 04:58:08PM -0700, Wesley Cheng wrote:
> +Overview
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +In order to leverage the existing USB sound device support in ALSA, the
> +introduction of the ASoC USB APIs, allow for the entities to communicate
> +with one another.
"... ASoC USB APIs are introduced to allow for ..."

> +USB Audio Device Connection Flow
> +--------------------------------
> +USB devices can be hotplugged into the USB root hub at any point in time.
> +The BE DAI link should be aware of the current state of the physical USB
> +port, i.e. if there are any USB devices with audio interface(s) connecte=
d.
> +The following callback can be used to notify the BE DAI link of any chan=
ge:
> +
> +	**connection_status_cb()**
"... connection_status_cb() can be used to ..."

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--P13nW3ExZUkt8gyc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZmmTqwAKCRD2uYlJVVFO
owd6AQCEY5WzdrzzRuY11wLRsArm4PXhVeYX76BrwKtOEaytPAEA0vFiTnhwd+vZ
Dthl3BItVCKR0K2COEv+kWuRoxJD1As=
=YNu/
-----END PGP SIGNATURE-----

--P13nW3ExZUkt8gyc--
