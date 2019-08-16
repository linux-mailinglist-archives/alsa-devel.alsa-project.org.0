Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0986790141
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Aug 2019 14:20:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 910051668;
	Fri, 16 Aug 2019 14:19:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 910051668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565958009;
	bh=yjvLpnI+GX/3Md7OPf8xJsYCmhj2N5swARG/BcqZNMQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hcMon5Vyy2uEvS/Nu2PIMAxhQSm/J+ncjK9NtUdejACsGYbYeydK8gmf0RRbSUb9t
	 tgPeFFycYRD2lOJIb8MHJ0UIsNl1zfxst+xZTt9a67oUo08DnrxKjylr8rgV8uDpYc
	 qMMbWcDzy7yRsQ1zUMfRmcV4+h5WKSiO1p5wva6M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8DDFF803F4;
	Fri, 16 Aug 2019 14:16:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69765F80611; Fri, 16 Aug 2019 14:16:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-f97.google.com (mail-wr1-f97.google.com
 [209.85.221.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59E02F801DB
 for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2019 14:16:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59E02F801DB
Received: by mail-wr1-f97.google.com with SMTP id b16so1340970wrq.9
 for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2019 05:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dn2KIuS3Wg8ZAV1Rn4EmhRNXAghPOAWFXahs2NO+P7I=;
 b=SIx96LTdRidNshy1GTq79zxAc5KDP6X/qC/q/Sbu1jntSCtg4cDGg9PKW5BI184e85
 9NEUf6Dtgl8YnqaxKZQrYitPxfqloI7WMFOukzVSUnKptAPgcP28Pb7w4vpK2swSJZgw
 E/k/nFDbhccY9evZKKV/2juww6y5mU9avLfHxFp50i/DW0YiFgjTKfAewGoSqnUulH3p
 0TWeOVbpzJtMmm5rrhjzR0JzYr2bvI46aav1segYgvZx3zU4BpLzxzzpeLW+cPaRc6EF
 6gETaLXRhEualE/iahPnZRmECE/oOD0OnHtMGeepgUE5JXqfqOhUKgIWAMGe3qwswP8y
 +u+w==
X-Gm-Message-State: APjAAAXRoVlkwZZa3PXMr3k5Pd1H4GYYO2+JQdZxw08NXPTLQCZ5JM8m
 DQ6VYPVX7XTcx/frb60PWB2MCaQBxFNJ1k6r8v+nk1hprRfAN40reYMgH24YtGXpJw==
X-Google-Smtp-Source: APXvYqxzvi1VoIOoRXJFajCnQ/dE3fzFo5N+5Qat7cLvuByHbL41fsf69MyjqXOpnK7z54RKl4/zDq8J3tpC
X-Received: by 2002:adf:f287:: with SMTP id k7mr10732366wro.183.1565957786460; 
 Fri, 16 Aug 2019 05:16:26 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id k67sm34897wma.53.2019.08.16.05.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2019 05:16:26 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hyb9d-0003MM-Ul; Fri, 16 Aug 2019 12:16:26 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 2556927430D6; Fri, 16 Aug 2019 13:16:25 +0100 (BST)
Date: Fri, 16 Aug 2019 13:16:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Message-ID: <20190816121625.GC4039@sirena.co.uk>
References: <1565931794-7218-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
In-Reply-To: <1565931794-7218-1-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: My life is a patio of fun!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, tiwai@suse.com,
 lgirdwood@gmail.com, nicoleotsuka@gmail.com, linux-imx@nxp.com,
 kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: imx-audmux: Add driver suspend and
 resume to support MEGA Fast
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
Content-Type: multipart/mixed; boundary="===============7104005194791386508=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7104005194791386508==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Bu8it7iiRSEf40bY"
Content-Disposition: inline


--Bu8it7iiRSEf40bY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 16, 2019 at 01:03:14AM -0400, Shengjiu Wang wrote:

> +	for (i = 0; i < reg_max; i++)
> +		regcache[i] = readl(audmux_base + i * 4);

If only there were some framework which provided a register cache!  :P

--Bu8it7iiRSEf40bY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1WnpgACgkQJNaLcl1U
h9AuxQf/SUokJSA9quJeah9hsT6jJhQKPr9uQwbuhnIcx6+bhKouXbtrmPWZsHF8
zLUHwY1cvcQm2qitQxsYCZm1a65PWSIAX9P4s+GUfNVz9p2dL0q3TYDH8mDJBjWv
CK1KDEfko6PsY4AHrSa13aNy7IImcOn2J5+/CUOonmPlKPS7CezGbfACaQMG5Zdf
Ln4T/JnCQ6IZzFeJMwzD/RzXiwXOLc7SZ5mIADxbP+4rL9ByOG1BJy/rXIV9YbJe
IQqO5Zu7uen0NjPDOQP/Uy8RF4HItglOTrO8Cjr/95gQ4QJKxLzQyq5NzEGJu1h8
BgQWgH1vDAKWp04BZb2jzQtLMtmwiA==
=hQwi
-----END PGP SIGNATURE-----

--Bu8it7iiRSEf40bY--

--===============7104005194791386508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7104005194791386508==--
