Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 800988B2F0C
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 05:37:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C0169F6;
	Fri, 26 Apr 2024 05:37:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C0169F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714102642;
	bh=Ocikva22THq9PBTO61gJ+rASfUWRbAU8cbS5LgaAepQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=izUgIcFKvMvfyHbyccjriHQBiuCKd/LY5obKrmFjnQ8NvekYc8sTLsxb6k7l8Qo/x
	 xI2kioEDhemBqEefb1HXVWLTun+F1pY+iqdOgJOh1ShuhbI1zdIhD6s65Kr9Mp8bkh
	 WrG4Ek0qqL/+Bl9qXApMWkO4pcrGgB/3YoGLaUy8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7779FF80580; Fri, 26 Apr 2024 05:36:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D1ADF80580;
	Fri, 26 Apr 2024 05:36:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2C5FF80423; Fri, 26 Apr 2024 05:36:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 91D39F8003C
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 05:36:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91D39F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Hw96B5Ms
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-3c84bb69c6fso954332b6e.3
        for <alsa-devel@alsa-project.org>;
 Thu, 25 Apr 2024 20:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714102584; x=1714707384;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8cFtVpbfNqJH56tTzxhsPWmtdud93WLdQtJ36KpwUE=;
        b=Hw96B5MsGg4ds5sS+ARYwp7zm9vicvYl4S7cFdiCPqFUR2mV7x/IAvsfR+2BwVjLYO
         VoHlU2U0/qm9cI0dHbl57JuOvXWadVAGST7ZuD7NoWQ9UzYI+yKKzRIsgWAqiw6ZRB4f
         Zr8CWXpvGhTpvOVNq00b02Ru9V7zBARhmiSHV8aQXnBJT4VJxUvEB7JTwsXDizEE0dU2
         bjnDv+k4NmVLAaMKsmD4ctZK+jDzafSMFXqdB+GOIL4JDE90O+bjWiuSTAMXKKgkVQvf
         iudXFc3Lya+fkUXVImUOlKXl0H0M82vFPlSd0YwdVfYkPXan0BBe3W4khocw0QZf2v77
         CkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714102584; x=1714707384;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8cFtVpbfNqJH56tTzxhsPWmtdud93WLdQtJ36KpwUE=;
        b=k+EOLNtpHPCGuvJ5FvrpxnggFRYXt96kRRsMMymZhj/OcKEzcD2ZjKiP9VIlP3iDxg
         rMl9/pMQmOT4EwyY72Xnyz1zx7LMTejpnTHTTVyVxsOsut8+sYk5hBlKKSMe71GU2DKW
         M2Lr+1LMTq+UXm1RYnZ2XrSyiHBVyY5/nz9OuvG/ALxzuz1vMPHNhds0pjsUgRq+WHI/
         gRCMMXRCYC1fT5CueMcfszFZ1Lura8RoeP4pf2HFLzLN+v1nGmWDW2tcbZD74rrVyR4r
         s/RflhRGc40oM95Krifu6+BAZtjbPbJWY01blHlQwEggKsqr0X2Tuj/MBaKI4BbAvUWO
         pwTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwIA/GmuNRUnpJZSnxDuj49C44BsUdMCmQmRvTqTTG7N/u/6gMCYBK4UY5xNNvbUIzbTWmAKq9GEjC23NVVMuWLdEk3iXBQQ7VbzI=
X-Gm-Message-State: AOJu0Yyi+Sbe9My9eA9BQYbtV52XZWcdJaPXI1rLdIiNUxMyieqrU5lC
	AdMmvI0ULM9fvMvDdkEhMW2IrU7bIExEqvk4Wi8geV2oPAy9dD2T
X-Google-Smtp-Source: 
 AGHT+IHBLFRWKXEYGxFCF54F3pVkYNxRnt0ZLU+mSTWXVXW5HHsRpGcBmTNLh/DFqy2C7n5xKmynJg==
X-Received: by 2002:a05:6808:13cd:b0:3c8:4dcb:3d8e with SMTP id
 d13-20020a05680813cd00b003c84dcb3d8emr2189161oiw.37.1714102584292;
        Thu, 25 Apr 2024 20:36:24 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id
 t3-20020a635343000000b005f077dce0f6sm13740028pgl.31.2024.04.25.20.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 20:36:22 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 05F3C18462BCF; Fri, 26 Apr 2024 10:36:19 +0700 (WIB)
Date: Fri, 26 Apr 2024 10:36:19 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
	mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
	corbet@lwn.net, lgirdwood@gmail.com, andersson@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com, broonie@kernel.org, bgoswami@quicinc.com,
	tiwai@suse.com, robh@kernel.org, konrad.dybcio@linaro.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
	alsa-devel@alsa-project.org, Mao Zhu <zhumao001@208suo.com>,
	Ran Sun <sunran001@208suo.com>, Xiang wangx <wangxiang@cdjrlc.com>,
	Shaomin Deng <dengshaomin@cdjrlc.com>,
	Charles Han <hanchunchao@inspur.com>,
	Attreyee M <tintinm2017@gmail.com>
Subject: Re: [PATCH v20 41/41] ASoC: doc: Add documentation for SOC USB
Message-ID: <ZishMx1mSpnbWq0P@archie.me>
References: <20240425215125.29761-1-quic_wcheng@quicinc.com>
 <20240425215125.29761-42-quic_wcheng@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="P89L7XsIZU/s9H0u"
Content-Disposition: inline
In-Reply-To: <20240425215125.29761-42-quic_wcheng@quicinc.com>
Message-ID-Hash: X7GAZOA6DFYS6BXHVXDCH5SDA7FLHVEF
X-Message-ID-Hash: X7GAZOA6DFYS6BXHVXDCH5SDA7FLHVEF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X7GAZOA6DFYS6BXHVXDCH5SDA7FLHVEF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--P89L7XsIZU/s9H0u
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2024 at 02:51:25PM -0700, Wesley Cheng wrote:
> With the introduction of the soc-usb driver, add documentation highlighti=
ng
> details on how to utilize the new driver and how it interacts with
> different components in USB SND and ASoC.  It provides examples on how to
> implement the drivers that will need to be introduced in order to enable
> USB audio offloading.
>=20

The doc LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--P89L7XsIZU/s9H0u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZishLwAKCRD2uYlJVVFO
o5DJAQD+rkyBnIMvpNNaVk9L86LrDuJEbiHqinPevfblrJEMzwEAq9C11BX6KHIX
RW6EYUrw/Ayfy0D/ZGZo/aorFkUhrQM=
=d3kj
-----END PGP SIGNATURE-----

--P89L7XsIZU/s9H0u--
