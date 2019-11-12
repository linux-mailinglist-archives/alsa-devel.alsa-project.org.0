Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0BEF8CBB
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 11:22:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87369166D;
	Tue, 12 Nov 2019 11:21:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87369166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573554125;
	bh=DdNx3EoxLO8pHx+KcDdxmrKwC1BvMUamcVJzsvFGb/s=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DU8Umhzz52PgRSyhz3crOfRoFM4SyQ48BFAUnjvqC+5NVJfBDNTksulgHaD3xj78n
	 mZdFkcBIfF3gKEQnTEjEJl8IsM2VKB05FKyiLPhBbwM9VHYnBiz3TPItCHL6/k9P6O
	 3Jeb7/O/n2QWSXE+I7gf7DlXY99mqAM340sZPPsE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11580F80679;
	Tue, 12 Nov 2019 11:14:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C1A3F80483; Tue, 12 Nov 2019 08:37:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mx1.emlix.com (mx1.emlix.com [188.40.240.192])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE0F0F80144
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 08:37:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE0F0F80144
Received: from mailer.emlix.com (unknown [81.20.119.6])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.emlix.com (Postfix) with ESMTPS id DE1385FB2F
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 08:37:14 +0100 (CET)
From: Rolf Eike Beer <eb@emlix.com>
To: alsa-devel@alsa-project.org
Date: Tue, 12 Nov 2019 08:37:09 +0100
Message-ID: <3413798.Kuoc3IQsnZ@devpool35>
Organization: emlix GmbH
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 12 Nov 2019 11:14:25 +0100
Subject: [alsa-devel] Several problems when trying to run alsa-info.sh
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
Content-Type: multipart/mixed; boundary="===============3260537283581872176=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--===============3260537283581872176==
Content-Type: multipart/signed; boundary="nextPart2543480.JvrltE0Bje"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart2543480.JvrltE0Bje
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Greetings,

I had the need to run alsa-info.sh --stdout from 1.1.9 on our embedded devi=
ce.=20
There were multiple things I noticed:

=2Dit requires /bin/bash, but seems to run ok with just /bin/sh. We don't h=
ave=20
bash.

=2Dit requires pgrep, which we don't have, but replacing all calls with pid=
of=20
seems to work well enough

=2Dit requires whereis, and does not use that

=2Dat least in stdout mode the absence of lspci should not be a fatal error

Greetings

Eike
=2D-=20
Rolf Eike Beer, emlix GmbH, http://www.emlix.com
=46on +49 551 30664-0, Fax +49 551 30664-11
Gothaer Platz 3, 37083 G=C3=B6ttingen, Germany
Sitz der Gesellschaft: G=C3=B6ttingen, Amtsgericht G=C3=B6ttingen HR B 3160
Gesch=C3=A4ftsf=C3=BChrung: Heike Jordan, Dr. Uwe Kracke =E2=80=93 Ust-IdNr=
=2E: DE 205 198 055

emlix - smart embedded open source
--nextPart2543480.JvrltE0Bje
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iLMEAAEIAB0WIQQ/Uctzh31xzAxFCLur5FH7Xu2t/AUCXcphJgAKCRCr5FH7Xu2t
/GAKA/4ljPxNrxrg1lpBw65wAyzE3HXZvB8jBfuYLz8Q7Hl9+IgLS/YPZUrK62D6
+iVWTGmNmABclDSDQMHiYr/AeskALsLYaTNiNzYygSspbayuIsR3jVYr90eT+CY5
Rn3vpBYUA8SolVuPfnf7dD0V29bvIDnpGafozhkrQxPNipCwhw==
=8f/t
-----END PGP SIGNATURE-----

--nextPart2543480.JvrltE0Bje--




--===============3260537283581872176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3260537283581872176==--



