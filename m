Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF13511CFC2
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2019 15:28:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C90316E7;
	Thu, 12 Dec 2019 15:27:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C90316E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576160880;
	bh=M4JR2ojsDf7QfqYaV5kvtFhftt2V1h1V7jfy0Hyk4b4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DAgoJLFD5TebW0Lh1uDTmb4qbNmUsCnhT+KHCVL1VGc8KWPepZpJ0xZgDO7MKV6fX
	 JY6UMjlXd3HQ17ktMa7edckKfXhMqR/Y5ygrPgH4CzOQyCyCWb6T0ke73bgzZRi1cV
	 afmmgNOEAK1cEgsTr3BO94OF0doR6wMQU/2x75Po=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58399F802A2;
	Thu, 12 Dec 2019 15:19:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16C6AF8020C; Thu, 12 Dec 2019 11:57:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5C00F80139
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 11:57:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5C00F80139
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6CFDAAEC1;
 Thu, 12 Dec 2019 10:57:56 +0000 (UTC)
Message-ID: <9f0d4eb964f3f18ff18c0c2697ff1a681639ce58.camel@suse.de>
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Takashi Iwai <tiwai@suse.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Date: Thu, 12 Dec 2019 11:57:55 +0100
In-Reply-To: <20191210141356.18074-5-tiwai@suse.de>
References: <20191210141356.18074-1-tiwai@suse.de>
 <20191210141356.18074-5-tiwai@suse.de>
User-Agent: Evolution 3.34.2 
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 12 Dec 2019 15:19:28 +0100
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com
Subject: Re: [alsa-devel] [PATCH for-5.6 4/4] staging: bcm2835-audio: Drop
 superfluous ioctl PCM ops
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
Content-Type: multipart/mixed; boundary="===============2536916971930924552=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2536916971930924552==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-g0TJqR5cdhbPOzOoFy6+"


--=-g0TJqR5cdhbPOzOoFy6+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-12-10 at 15:13 +0100, Takashi Iwai wrote:
> PCM core deals the empty ioctl field now as default.
> Let's kill the redundant lines.
>=20
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Reviewed-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

Thanks!


--=-g0TJqR5cdhbPOzOoFy6+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl3yHTMACgkQlfZmHno8
x/4wugf+NmAk0UkDbFiLmoISfbHMhP+QF9xsW4TglreylmVopMkzBgb7rGFwpf+c
lYB4ggdHpr4CfCZlYS4C5eKUa6KxCs4cqhQgkJqWkMrSQ3xNWzyrblVr7uA+yz17
3HtdAB6wE83Hh7zrJgvcQPASSXlziK2JryotwDHjpqGixTRAYmAIueTMIiP8j/+Y
SWzx6QZY4CduTjIYjDgOIE+12GB2w4NJ/n4UCJ0nBXF4jth6FE6VbqPqQ2zylgYJ
W/XW/w3yJ1ebgDRmriOGNS2vBG/L8ASuiI4RnnXWa1jLMd75IPnGBAgvIOCRnkQk
NKRgdGsILjMZhoEISnha3z3jvYUmTQ==
=IRls
-----END PGP SIGNATURE-----

--=-g0TJqR5cdhbPOzOoFy6+--


--===============2536916971930924552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2536916971930924552==--

