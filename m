Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A5B967BD
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 19:42:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E32511672;
	Tue, 20 Aug 2019 19:41:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E32511672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566322953;
	bh=WsKIFG3ncbfN2ZYX0aeso2kIgHSAP9HrS9kg5OX3qes=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oJsPpv08LfBfaW2w09RcjpxlCKonDkrOFcl6E1Y5Ya3XSQ2YD9GFFIcuNC9kC8O7+
	 pSJhI+L9aTWWf8H4sBVBUBCy+SkDKNZ+Kz8YUzFLqj2tySzk/hlMUa5UcNjsjt8a0E
	 jW8eqvgAumu0NI+HzhEwzPj+69uMGr8EUyxL4wGg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CABBF80529;
	Tue, 20 Aug 2019 19:40:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80D36F805A1; Tue, 20 Aug 2019 19:40:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-f99.google.com (mail-wm1-f99.google.com
 [209.85.128.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3976AF800BF
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 19:40:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3976AF800BF
Received: by mail-wm1-f99.google.com with SMTP id d16so3396057wme.2
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 10:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dPgK01oevHPRx/4tpsvEIz1PjRNMyssqoT8LMFXK318=;
 b=odnjsmi3ogM1gGnMGuFu6hunbSXDQQ6oJWK0hRIyEnuDf944J8ynfADQ4caOuTmeQB
 QHmR7Q6cLth+xzMF2Tft83rm8X6ftnvc3capgBUn4nH7Kq2mSqoeJYLJ61ePZgzUplXe
 GCAXTJct1wN+Z67awZfPN0eT0jorYVTSesngGWhSzrH3f/B8u9jUGevA1nw0YxJ39j7u
 D9KgjU8Wv7NE3gv+7odj1svbW/soZS7EqbYI6sJM5Xq0dERquTdXYf1FfsF8KO595AII
 Lb/PwNvvprsHyCxz5RA0uXpImBXOnXbEiWCsgGc1uGTlrrrSoG7WQ9074G7nhyvHPCK9
 0TQg==
X-Gm-Message-State: APjAAAX+ExLpfQDGrxsWu0N1BtUwq1bnPKXlda32Pmh/sYM3wqZhP/tw
 adrW/+MCOOoSZU9U6APY34mdrti9zwu9f8ksHqZc0HBI/Fq0ZjwiM32GDYrrWdGzOg==
X-Google-Smtp-Source: APXvYqxezCRfQ0QxxLTKw5S/EOA+LKKumUVD+1mqpKm6VwrQOZzIw0CqEK+wQb/bMD9gYrQem4g/cyk64A98
X-Received: by 2002:a05:600c:2245:: with SMTP id
 a5mr1201694wmm.121.1566322812258; 
 Tue, 20 Aug 2019 10:40:12 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id i11sm325281wrr.50.2019.08.20.10.40.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 10:40:12 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i087A-00031w-1J; Tue, 20 Aug 2019 17:40:12 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 55E092742B4A; Tue, 20 Aug 2019 18:40:11 +0100 (BST)
Date: Tue, 20 Aug 2019 18:40:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <20190820174011.GG4738@sirena.co.uk>
References: <87pnlhahr6.wl-kuninori.morimoto.gx@renesas.com>
 <87d0hhahon.wl-kuninori.morimoto.gx@renesas.com>
 <928df91b-997f-c1eb-5ab5-bda1fc374c1a@intel.com>
MIME-Version: 1.0
In-Reply-To: <928df91b-997f-c1eb-5ab5-bda1fc374c1a@intel.com>
X-Cookie: It's the thought, if any, that counts!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [alsa-devel] [PATCH v2 09/25] ASoC: soc-core: tidyup for
 snd_soc_dapm_add_routes()
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
Content-Type: multipart/mixed; boundary="===============2992866387077445355=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2992866387077445355==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NPukt5Otb9an/u20"
Content-Disposition: inline


--NPukt5Otb9an/u20
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 20, 2019 at 01:18:01PM +0200, Cezary Rojewski wrote:

> Previously, ret from snd_soc_dapm_add_routes has been ignored thus it was
> permissive for addition of several routes to fail. As long as some routes
> succeeded, card was working just fine. Now it's no longer the case -
> behavior of the card initialization has changed: it is required for ALL
> routes to succeed before card can be fully instantiated.

I really wouldn't expect routes failing to add to be a normal part of
instantiation (we should have been complaining about that in the logs
shouldn't we?).  Whatever enumeration is causing the missing widgets
to not instantiate also ought to control the addition of the routes
connecting them.

--NPukt5Otb9an/u20
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1cMHoACgkQJNaLcl1U
h9A8Swf+O0Lr9XMYyD8dIJBFRWD7RIUK+ivVn5mtnJ+dAa14saiptogl3rTCwDZF
2RZIQEz3XxEXoOhl3iTFCTujugV8pNj+mtiBO8kupEsfG8WFBjiCE/IyGdzxVdug
WU3ucbiTSgFvViV9jXHH7xjmbBrMtfHbRf+yhRlLvkgwG/WjMCczTaQv4IJ1a7Ql
O/A7NbOeGN5xPiclAb7ldjv5r/YksHy4tHraq2e3xmEYNIHtsWyXiqVe1PW1JwlL
fAH5TRP1hAPJQYu/R0KxA/VXigu9x9+4Qz5lKRFjCIVg1+UP3VS971bSyJlPvwvF
WD1Osj9BPJ4PvzLupkIH/SJdPpolkA==
=d++c
-----END PGP SIGNATURE-----

--NPukt5Otb9an/u20--

--===============2992866387077445355==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2992866387077445355==--
