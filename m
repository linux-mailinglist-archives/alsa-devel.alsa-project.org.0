Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 484C08F1AE
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 19:13:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEB4F1662;
	Thu, 15 Aug 2019 19:12:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEB4F1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565889210;
	bh=Fz6ZvZ9iPXNorF3kxk+KCwJFOJXfm1QCyN8gXnFkJvU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KXcQSCKOQKJxGUSDGe8AljWTI9+Y0hnjRyfYFWw/9JlDr+7zt+VqctGupV6oy0iK6
	 DOEpvDGl8vSQX6zRU6P7NPbexcv8M8xbV0VeXu12p2kOu/dbNx393pT1dUTACvauCJ
	 jttuVRJNXOjRFDP3oLMe3/TgCyXvLAwSKtCwv1K0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2CECF804CA;
	Thu, 15 Aug 2019 19:11:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8E9DF8044C; Thu, 15 Aug 2019 19:11:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-f100.google.com (mail-wm1-f100.google.com
 [209.85.128.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3676DF8044C
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 19:11:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3676DF8044C
Received: by mail-wm1-f100.google.com with SMTP id o4so1868146wmh.2
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 10:11:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=U6kl8stUp78swwQspZj9A6v4U3B//HnC/MxGjf9yy/U=;
 b=D8QRccqtLumX03zk8k+pDeXFEs4n63dRA+WcUq6OYptkKXRaB121CDBRa6tLXxbV2T
 vQDUEOzqKNVgr6esvype2maJtie+CjCc6/viVyLf0YKpm+cui3xsgvX6VmurW42dZOcq
 5ORCgGV4GCPvdkdSp+v+GM6WRmxbvHgWrjkkiEjBv9PRyd46wLEfjapvAFThsYxsl5/g
 mUVqX6+7Y7/uI2Tv7ZYB8+O1dlugQPq+406ZRCB6JUWU751KPSLgRkJ1hzawxPTj/FKQ
 UceHlPV1J6TjItesJho7Gu6+jjxSGJyCMV2mH5Kek8WwAmiMnm9xS1uBWr4lw6fNfadQ
 yNWg==
X-Gm-Message-State: APjAAAXj9N06kvbBMnymf8KWCFmaLE/o6H+EHFRTfK+RcS7dqv5rAqd7
 RUxw7+11l/Z+9LfdFMQvf1UuUZcJFcJhrz4XW95BLpHGXu615qy2VimF+3G6YbOYjw==
X-Google-Smtp-Source: APXvYqwDX5TVo6TNhy2oP+UeWbH7S9mksP0PlAXgHPwu3e+NzGMtmvwvAKjDX/sJEKoE1wadPZ3XQXIkW5Ga
X-Received: by 2002:a1c:4c06:: with SMTP id z6mr3626399wmf.47.1565889104085;
 Thu, 15 Aug 2019 10:11:44 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id a12sm49392wrw.14.2019.08.15.10.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2019 10:11:44 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hyJHr-00050I-P7; Thu, 15 Aug 2019 17:11:43 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 183E72742B9E; Thu, 15 Aug 2019 18:11:43 +0100 (BST)
Date: Thu, 15 Aug 2019 18:11:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190815171142.GE4841@sirena.co.uk>
References: <20190815155749.29304-1-pierre-louis.bossart@linux.intel.com>
 <20190815155749.29304-4-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20190815155749.29304-4-pierre-louis.bossart@linux.intel.com>
X-Cookie: MIT:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Pan Xiuli <xiuli.pan@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 3/4] ASoC: Intel: common: add ACPI matching
	tables for EHL
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
Content-Type: multipart/mixed; boundary="===============8644267491024884258=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8644267491024884258==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Lb0e7rgc7IsuDeGj"
Content-Disposition: inline


--Lb0e7rgc7IsuDeGj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 15, 2019 at 10:57:48AM -0500, Pierre-Louis Bossart wrote:

> +++ b/sound/soc/intel/common/soc-acpi-intel-ehl-match.c
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * soc-apci-intel-ehl-match.c - tables and support for EHL ACPI enumeration.

Please make the entire comment a C++ one so things look more
intentional.

--Lb0e7rgc7IsuDeGj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1Vkk4ACgkQJNaLcl1U
h9Bbqgf/fqY55m8s21S5MoWeRbo6n4iwlfQd9dR013fM5S5SZQDYdrpMRqfowv+C
M7iKzDiuxiQ2nL95NYbk0EqEh5EB75sQowFH/uor7Pmx5QqNXJQbdqJhbJSob3We
Ytvmojpw5JhF9EPDA3gzPDcEgWYWab80NvmEaTJYVG2Rt+/EaN0WmDMTh/+ChD9T
bwOSJH9Y6wR5Nw6OLGvtML/0+l1yf0IllMqpYMPIgTa0wwmipaMuChBdy52J4ICR
jiLPJ8CNvZatk+VMbPU4Yc3RC/qaWcqVpj+UM9lBJA2Vt490CqSELdzE51pwA5ih
6zkSwHrWd4prbbRAoBFrwwoytGwzng==
=Yx++
-----END PGP SIGNATURE-----

--Lb0e7rgc7IsuDeGj--

--===============8644267491024884258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8644267491024884258==--
