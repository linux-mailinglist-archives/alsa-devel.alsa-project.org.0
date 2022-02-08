Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C8E4AEDAE
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Feb 2022 10:10:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D07D318A9;
	Wed,  9 Feb 2022 10:09:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D07D318A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644397814;
	bh=iQ+/UanXs/ytqCKrnJ+MylBsqkW5v+Irsw5nOpPkZYs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h6jczCiHSVom6nZKBw+3VwfTWAep4momg/m+GDXROslqR6tfbEO0rdN07hOzbFgCQ
	 QvTsmF4X2zQNp7dGAHajYfH932OYwZ/N4c2nUmeQa6Hs6lu4fNWtLNP/nhWZEgHzhR
	 Z8ihiBBJsJdVwsWPy1qaIixWD4DZspufHF9likF4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49AEFF80518;
	Wed,  9 Feb 2022 10:08:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D656DF800EB; Tue,  8 Feb 2022 20:22:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FSL_HELO_FAKE,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BC8EF8012B
 for <alsa-devel@alsa-project.org>; Tue,  8 Feb 2022 20:22:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BC8EF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="gx78wvcP"
Received: by mail-pf1-x430.google.com with SMTP id b3so156035pfg.7
 for <alsa-devel@alsa-project.org>; Tue, 08 Feb 2022 11:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UHiwMBQmec+N97KOodr45Eaci5XXOZ3CLvB0wqnkTBE=;
 b=gx78wvcP/xtx3ixA17CLVN/xPosDin1SvP8cuPUl9t7+Isj1i4xCuOrL8bNPqlRk6f
 UxzlnfsQsqVMqRs0ZFndxsx8oqHyVfeo/GaoganJhPIq5Yd7V3X3zMl+mWNMdH2vYDHt
 GH0LkO/uR0DcU2Cw3kJzvGQjqsxMlJDPzV+Ccwd1Qs6GzrRlvOqgRZbl7NNngQTQme7a
 Qsx4ZoEnYQ37GqttUEYiZzt0N4x+HOR64le3cDDWLc97YLOtc2RL+ujle3mCdA5eF8OD
 t2Q1u9vscurRBeR9F2yjvNiglcgizvTuwtEeoLXQcqC0N8SzrUSm/6JKh0hYZzfGeNg3
 inyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UHiwMBQmec+N97KOodr45Eaci5XXOZ3CLvB0wqnkTBE=;
 b=Iucc0rSEMEYBN6ComO4vI482CoZSMkkpQeuC8dl4WvnTTYBiya8GvGwV1QbACKkv2G
 j7syjTJx7Eq8Lcgkl/m4YwQzhJqJ9Qdfy5cY12vpc05hSQfBqYgDO2/DemLdxy8qH2Mj
 oU4eYFVEmrDMdC0OmQnSBL+SHnaZ+1J4w+gxO72dlZG9ZzWVAsWdlBfPUWDWZ1ojcWXv
 98wCS3/rz7HdOEz6xXaydAvRRjwOjdZL3OBN6ch+gLdOcrYCwwmp4vM8MDPC1k0xps38
 TmtPMyDUnfrzo7/2Jln+UbelPMQuP2Fviiq8IELI92MpTA1kXbjGcF+qAFpU7m02001s
 jr5Q==
X-Gm-Message-State: AOAM532Ol0IxJblnaS3fBVkTglcJcU0Izf1vmi7tTrZz9dZBZpfwXQOT
 04rVQ64dZCw34N6xoU95pw88Pw==
X-Google-Smtp-Source: ABdhPJxFxBU745usl8AxFr3QNQAJI/ZY9KReUb3512zMvSEe5Py8g1mdXbC4+YNZT9bhRqbS97B0Xw==
X-Received: by 2002:a05:6a00:1150:: with SMTP id
 b16mr5846653pfm.57.1644348153059; 
 Tue, 08 Feb 2022 11:22:33 -0800 (PST)
Received: from google.com ([2620:15c:202:201:8e00:959f:eb2f:89fc])
 by smtp.gmail.com with ESMTPSA id p4sm277853pgh.53.2022.02.08.11.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 11:22:31 -0800 (PST)
Date: Tue, 8 Feb 2022 11:22:26 -0800
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH] MAINTAINERS: update cros_ec_codec maintainers
Message-ID: <YgLC8trl9L30Ofwn@google.com>
References: <20220208031242.227563-1-tzungbi@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="EYCneR3bHevFCBY0"
Content-Disposition: inline
In-Reply-To: <20220208031242.227563-1-tzungbi@google.com>
X-Mailman-Approved-At: Wed, 09 Feb 2022 10:08:04 +0100
Cc: chrome-platform@lists.linux.dev, alsa-devel@alsa-project.org,
 broonie@kernel.org, bleung@chromium.org, cychiang@chromium.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--EYCneR3bHevFCBY0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tzung-Bi,

On Tue, Feb 08, 2022 at 11:12:42AM +0800, Tzung-Bi Shih wrote:
> Updates cros_ec_codec maintainers.
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>

Acked-By: Benson Leung <bleung@chromium.org>

> ---
>  .../devicetree/bindings/sound/google,cros-ec-codec.yaml          | 1 +
>  MAINTAINERS                                                      | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/google,cros-ec-codec=
=2Eyaml b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
> index 77adbebed824..c3e9f3485449 100644
> --- a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
> +++ b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
> @@ -8,6 +8,7 @@ title: Audio codec controlled by ChromeOS EC
> =20
>  maintainers:
>    - Cheng-Yi Chiang <cychiang@chromium.org>
> +  - Tzung-Bi Shih <tzungbi@google.com>
> =20
>  description: |
>    Google's ChromeOS EC codec is a digital mic codec provided by the
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 568152aa9973..a1f4fd15e770 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4573,6 +4573,7 @@ F:	drivers/platform/chrome/
> =20
>  CHROMEOS EC CODEC DRIVER
>  M:	Cheng-Yi Chiang <cychiang@chromium.org>
> +M:	Tzung-Bi Shih <tzungbi@google.com>
>  R:	Guenter Roeck <groeck@chromium.org>
>  L:	chrome-platform@lists.linux.dev
>  S:	Maintained
> --=20
> 2.35.0.263.gb82422642f-goog
>=20

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--EYCneR3bHevFCBY0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCYgLC8gAKCRBzbaomhzOw
wjivAQCm86EOuf8EiBIvum7dUEufsdutArt9C3zy92ghKFaZ9wEAplKUR8Y8Dc5y
Tb+P00hCjfI6CLzKw/3JiokxIu4sEww=
=XJ8Z
-----END PGP SIGNATURE-----

--EYCneR3bHevFCBY0--
