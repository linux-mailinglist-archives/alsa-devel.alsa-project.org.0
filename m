Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FA4857B94
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Feb 2024 12:26:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33990E69;
	Fri, 16 Feb 2024 12:25:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33990E69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708082766;
	bh=JJcfIBGCp3ZKPHLIPV/hxkDPf5TaHhr8o0zt0AcWnRY=;
	h=Date:Subject:From:To:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=TlPX2qNwM53vmg2nn8uwYPZ5z/KA0M2kTL9vnF2OnaRh7ISmec6N4ZZZXiZ9nnnJf
	 a381e0+RrrdaMD6Xa4/N4DHSHQ5UrI7MLibQlrqyJvabGC5hYVu27EiTANHMvNBQeX
	 bunha6QNMXUX1v5znl29kYjthg228cD3vjBP0ZIE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45D66F80589; Fri, 16 Feb 2024 12:25:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 28AA5F800BF;
	Fri, 16 Feb 2024 12:25:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46CE0F80238; Fri, 16 Feb 2024 12:24:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D7CFEF800BF
	for <alsa-devel@alsa-project.org>; Fri, 16 Feb 2024 12:23:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7CFEF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GAWypOyj
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-511a04c837bso2257567e87.0
        for <alsa-devel@alsa-project.org>;
 Fri, 16 Feb 2024 03:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708082618; x=1708687418;
 darn=alsa-project.org;
        h=in-reply-to:references:to:from:subject:message-id:date:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qCkIBF2HUHDgPA/fkE23qtD6c+3DYAPMy1MuIjYZckA=;
        b=GAWypOyj1QOqydCz8IeNZ2FWXa5EB2QzFWPXxQXCBADA23gHgI/vYSpazUZDNC8WyL
         EZMCQ1eeCL478LmcJVwQWYNpSaEmSyyeBSaC7abIvGqLO0vKnP0+qMHOPZHHKNZ9U1Jd
         l8ERJv4/7GoUJUVBGFLFJ/Oi+gFvwS/wTONeQqfFfGIwa0+MVjNUuKH7B8Fdj/PA1OFb
         sJZdH0FqopDYtepwDy9SyM+Jez72k+6GIeDlYbqZCjvWyJyLOKimKAbQLuBAjCB9bmN3
         7wocBkv/0Xagugqa30SmEer6kuVLdywIWz1hfjZhijeMJCQJg++rs4X6WhcBA1lu3HSm
         0PTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708082618; x=1708687418;
        h=in-reply-to:references:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qCkIBF2HUHDgPA/fkE23qtD6c+3DYAPMy1MuIjYZckA=;
        b=CgH8H0X8wWg550tEZmEO202jGFgJ5uWI8zis93DPpCV48iazJYA0BGnL85lkBQgZ1J
         BkeBbN7HlsthHfUL2HGztdvpRG501v7vB12/XJ5m5sSs71l2hZOWSDDWkPq/E25zC5/+
         YqijAEWJ62bjFCwOjK61WayHJUEoe2VGF+K+sFeKY58ewjjCco8HOlcwxZvl72rOzVj6
         ukmyOcIO++9DSh/h7CrPAlrj5HZRJrDuJ0YgJB0w/h65l6xANd4U3w02gLlu0/wYG4Qn
         B668dGf1VzkED4DcvyGwOZiKXEI/JbXbg1l4VEmXmZuX24LU/oz8Bgv1DMgXk5+7wQb4
         wasg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0KT7Ow9Ti37CqeJPdPI0oyhgf5tkpTc8Fu0AOlROvlblPcOGaxzgJGLuBF7V+95WBbtbUP4cowZHtUjI2XiG4jrpgRb5x8eDFHEk=
X-Gm-Message-State: AOJu0YxdvB3nf/G6NjC0Cu9u2Lztt/9tz7thvV6hqVxi4lRY8E/HCR/E
	xqXYry2kVXFZcmd72oY0o86dgEvJ3S9+81T5A56JIpj8oKSbtvou
X-Google-Smtp-Source: 
 AGHT+IFk4ZkCa0R/m44omA2Xi3MhoAzI8tKPY8V0cTU/2axm4inHWuZNW2UcVx0PzaNks2ZutoR+ew==
X-Received: by 2002:a05:6512:716:b0:511:8b40:ab6b with SMTP id
 b22-20020a056512071600b005118b40ab6bmr2834631lfs.50.1708082618024;
        Fri, 16 Feb 2024 03:23:38 -0800 (PST)
Received: from localhost
 (p200300e41f147f00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f14:7f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id
 f23-20020a170906561700b00a3d828c54f1sm1459386ejq.135.2024.02.16.03.23.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 03:23:37 -0800 (PST)
Content-Type: multipart/signed;
 boundary=87caa6e717479adfa0f5d015ffee82cc14ceb938e5f7a71c46d45b7997b5;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Mime-Version: 1.0
Date: Fri, 16 Feb 2024 12:23:36 +0100
Message-Id: <CZ6GR5BWC80N.36XRBM33WF8MW@gmail.com>
Subject: Re: [PATCH] clk: constify the of_phandle_args argument of
 of_clk_provider
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Michael
 Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "Sudeep Holla" <sudeep.holla@arm.com>, "Peng Fan" <peng.fan@nxp.com>,
 "Shawn Guo" <shawnguo@kernel.org>, "Nishanth Menon" <nm@ti.com>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@linaro.org>, "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Jonathan Hunter" <jonathanh@nvidia.com>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Vinod Koul" <vkoul@kernel.org>, "Russell King"
 <linux@armlinux.org.uk>, "Srinivas Kandagatla"
 <srinivas.kandagatla@linaro.org>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
 <linux-stm32@st-md-mailman.stormreply.com>, "NXP Linux Team"
 <linux-imx@nxp.com>, <linux-amlogic@lists.infradead.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-tegra@vger.kernel.org>, <linux-omap@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240208163710.512733-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240208163710.512733-1-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: L5GFZ33GZ6TCO4UVLR5FMUTYDNMT7YBZ
X-Message-ID-Hash: L5GFZ33GZ6TCO4UVLR5FMUTYDNMT7YBZ
X-MailFrom: thierry.reding@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L5GFZ33GZ6TCO4UVLR5FMUTYDNMT7YBZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--87caa6e717479adfa0f5d015ffee82cc14ceb938e5f7a71c46d45b7997b5
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Feb 8, 2024 at 5:37 PM CET, Krzysztof Kozlowski wrote:
[...]
>  drivers/clk/tegra/clk-bpmp.c                  |  2 +-
>  drivers/clk/tegra/clk-tegra124.c              |  2 +-
>  drivers/clk/tegra/clk-tegra20.c               |  2 +-
>  drivers/clk/tegra/clk-tegra30.c               |  2 +-
[...]

Acked-by: Thierry Reding <treding@nvidia.com>

--87caa6e717479adfa0f5d015ffee82cc14ceb938e5f7a71c46d45b7997b5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmXPRbkACgkQ3SOs138+
s6FzcQ/9F5fJyakwkqSmFCFsFTUwQ0Vv6AmJP7kf0C2oOGiJISmgaFwRE7ikl73f
tfJ/jetoF3grVZE950B1ZtY1sAK6WLfAlRnkD52YE25Y+NcehSPfcE2403gBL/JZ
6Rtlw4U/jJhHC7k1NNSCV6W3YM9tFJZzPdOwWL1efc33DWZQkTgvIPKSfqGIHd0i
iclZTsusANQThdL9ASOlvq81RrglhXgo2PIt/oeGjEBtf+IoDVhHSWqJ65e/lmYV
cBw1uhHa5zHLiWoT4xTqJY8dPkSLfBSRM3uflLUkA5BRNllvVsHAPvIgR6aBpqi5
KeLdZEDFeIuIi8nqtYxhhnGa8nKz9t03MNj9GbFf9HYocIVDIV4SvKuKongDjcYZ
zr5jC3lMZnmuQIM5XOIFu8hQWG0zQ6H+Kuf6ifolHj13E5gplCo4BoZWNnE84OZ8
fMjNHraK6RNUUqJXW43OBEjejW+FvvZIpMvyyt8TcE/I7hieXCjib0Spu2n5SwvK
mQgKxPJpsOpCxIOID89cK2VwOX3uOZslT3M5sU9ZkoUcwRpQ/Ntfr7ZWW8Jy/L4Y
DWnk7IvOvI4fFlmRQONIeWpr8euHFmCL8L8dJ29AI9oB2lvs7ZovvWw9QTE8E6iU
EjVBwtdG6KqWJxP803h8DAvvD0Vsu0KzQFr+Pwre3NP2FHYDCR0=
=E0uq
-----END PGP SIGNATURE-----

--87caa6e717479adfa0f5d015ffee82cc14ceb938e5f7a71c46d45b7997b5--
