Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE7F94E65
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Aug 2019 21:36:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3424F1666;
	Mon, 19 Aug 2019 21:35:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3424F1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566243363;
	bh=+DvAsbkJlbUlJt5rLqheK6TfIAfhXHSsRDNcl5mYBME=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P2/fl/ZPM+bbkd/NP5eTkWTJZDdoZLxUGEvmp4S08WJc+9aKDepkgKw1KjDM4Tnvk
	 8xnyKYdVotsMbu/l7o1QRrtAM9AG5qI6cKV8PJtGoVxiX31whgBkOfFESlVs8X5iye
	 lbzU6TnEBcRtNM+NO3xJKmRAyAn29aw0t3kOkKeo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A76BDF80659;
	Mon, 19 Aug 2019 21:34:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6E5AF8064C; Mon, 19 Aug 2019 21:34:10 +0200 (CEST)
Received: from mail-wr1-f99.google.com (mail-wr1-f99.google.com
 [209.85.221.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 728A3F800B6
 for <alsa-devel@alsa-project.org>; Mon, 19 Aug 2019 21:24:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 728A3F800B6
Received: by mail-wr1-f99.google.com with SMTP id p17so9858708wrf.11
 for <alsa-devel@alsa-project.org>; Mon, 19 Aug 2019 12:24:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=asY+JEfud3QLXmqqhMWz7vkV88PZHb5mSyH+FWyiasY=;
 b=WjUpOuA/WspLDp/74ayO+KUErwRjRkLRFd1VV+nMqg5Cjovpd0pPncdGcJordrEBXz
 kvC0lTixQ/rdXaYMtMJ14tWx0cJZEVSbzf+SLo/GDmPurTXURHq8nxLrZ4Dc6na25zs3
 i7sn05RLBKdIaIZ8dU2et1WI53FbMEXG1P0LfsC8/+vByrmaL1rqPub3As7pPxObRbR2
 ymZS4aoteDaNFHxz52o1Gl2py5PIIefIhRhylnBlg10YisuWAbIxBcIEdKY4Vfeg57+z
 AbQCWWHW7jwYKIEMwbvy7VHEzFYmQtUg5nakJNHF5R0u1aBu89htRTYLt2fjJO72jbFe
 PN5w==
X-Gm-Message-State: APjAAAUxA0B+UBXtnSyk16vnNJuKioluIRtb2C9L1oaFkcynry6p89EB
 QgfWbSzJxgZwEyjse+K/wTTnZJVxcUIoocbzq3C867LmHzcQ9FXQz58gyuzIH0gAcQ==
X-Google-Smtp-Source: APXvYqz4UkzYwJsCuwK5t8beauK0BKp9AdGSy6g1GsIjytfJX9fzAtwNCtAwmPJEOBAXiOx4xbjTBUZ78SYe
X-Received: by 2002:adf:f507:: with SMTP id q7mr29508281wro.210.1566242648462; 
 Mon, 19 Aug 2019 12:24:08 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id o9sm269429wrg.25.2019.08.19.12.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 12:24:08 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hznGC-0006PH-0z; Mon, 19 Aug 2019 19:24:08 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id D3509274314C; Mon, 19 Aug 2019 20:24:06 +0100 (BST)
Date: Mon, 19 Aug 2019 20:24:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>
Message-ID: <20190819192406.GC5563@sirena.co.uk>
References: <20190815154500.29090-1-pierre-louis.bossart@linux.intel.com>
 <20190815154500.29090-2-pierre-louis.bossart@linux.intel.com>
 <20190815164942.GB4841@sirena.co.uk>
 <CAEnQRZAM6VkCewfVYysz-NmPNEz-CSe763Cv-kz9kyNjx8uMtQ@mail.gmail.com>
 <20190819134616.GR5999@X250>
MIME-Version: 1.0
In-Reply-To: <20190819134616.GR5999@X250>
X-Cookie: QOTD:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>, Daniel Baluta <daniel.baluta@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH 1/3] ASoC: SOF: Add OF DSP device support
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
Content-Type: multipart/mixed; boundary="===============0805854776173964349=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0805854776173964349==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t0UkRYy7tHLRMCai"
Content-Disposition: inline


--t0UkRYy7tHLRMCai
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 19, 2019 at 03:46:17PM +0200, Shawn Guo wrote:
> On Fri, Aug 16, 2019 at 11:43:13AM +0300, Daniel Baluta wrote:

> > Binding documentation together with the actual dts nodes were sent
> > to Shawn.

> > https://lkml.org/lkml/2019/8/7/682

> > Can you pick 4/5 and 5/5 patches from series above? 1-3 are sent to
> > Mark to go through to alsa tree.

> I just picked up DTS patch (4/5), but DT bindings should generally go
> through driver/subsystem tree as preference.

Right, especially so we get domain experts looking at things before they
are merged.

--t0UkRYy7tHLRMCai
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1a91YACgkQJNaLcl1U
h9Duhwf+Jun/261NvS0DyKcg4mZ3Us1NgoEMjPfXVxXIlqHD+DSU+kyNcUeAevIi
geJqCRUpDk/8m7yFbVHuVikAoZwEcSAm41PkRYy+jw02WYiIpI/zKmpucsorv3+S
/5yV4qHykS94VSInBhxLI9SOwaPBT0cNfQFLKMmE5R5e2nhKNbbAaby/oCottVGj
nTzSz4wFgDLjwcaopxnxfXYJOwN1l2hg0hK/4+eBTso7+sGqVGfbiVAfmPHAjACY
j1MWzj5e3NuilCp33tJ3ZODBUZ6Er2/8kOaiY73c4I0OZ1ymI9NCtW82LGqneycG
CBZq3Whpox7pAry6kx4vSVO6HniTOQ==
=yP+B
-----END PGP SIGNATURE-----

--t0UkRYy7tHLRMCai--

--===============0805854776173964349==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0805854776173964349==--
