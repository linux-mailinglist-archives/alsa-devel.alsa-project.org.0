Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B286A3B2809
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Jun 2021 08:57:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28C2F1658;
	Thu, 24 Jun 2021 08:56:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28C2F1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624517846;
	bh=wbyP7PQce5t0rfSxenZho1yjfZnWLHxhfzKp1fuAe70=;
	h=From:Subject:To:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qMh6T1okm0bdT659/Et/xXKGSYsRC76Olf49v2/GZmJqT5s2EvJXw+tsyRQhrHbXh
	 3lWnLQ4SufZ7sNDHTxXfiqnq/AuCjxr01h7Mszpqf4xuooKUXJP91zVOU/J2pwVIfX
	 G47LKX33IeC0OdgIlCXV0YEMH4NSxZNItbozJ1Qc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 922AAF80268;
	Thu, 24 Jun 2021 08:55:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3688EF8025F; Thu, 24 Jun 2021 08:55:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.web.de (mout.web.de [212.227.15.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62EDBF80147
 for <alsa-devel@alsa-project.org>; Thu, 24 Jun 2021 08:55:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62EDBF80147
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=web.de header.i=@web.de header.b="n5y2MGuc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1624517749;
 bh=W4Ua++xNYJB1Mo5rrizP6uKokP8spVGiueGvvux2nuo=;
 h=X-UI-Sender-Class:From:Subject:To:Date;
 b=n5y2MGucAAsehxDDgCayypOQRUQZ9iplpyFG5RL25vQAj3BhvTq5cCvNIDOIZVQGM
 T9PhX3Dl8yoXy2YSNd4XvcyPp3UCuMGmxr2G7Bb/v6PB9/ACgBNjhVkfiQ0zD2zrKG
 BeKTC0Lnx/cy2eOgFi1SZ0tlmLJxJudHlcIcuY+w=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from jupiter.fritz.box ([78.94.222.115]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MWRkA-1lluBj2Vnm-00XaLn for
 <alsa-devel@alsa-project.org>; Thu, 24 Jun 2021 08:55:49 +0200
From: Joachim Schwender <joachim.schwender@web.de>
Subject: C-Media 6632A (Xonar U7), 'Input Gain Pad Control'
To: alsa-devel@alsa-project.org
Message-ID: <6e1eaf12-a7e0-2e77-2fab-ac08e839247e@web.de>
Date: Thu, 24 Jun 2021 08:55:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="9JAkziFUycexzfgV3rCLUDmWtDOYpz6Ja"
X-Provags-ID: V03:K1:2O6zwlNel3ClLzvxCV1vZ+so+v7P39oFPuKx1e0x9R0QU9b82Iq
 9E5Kij4wut8GxFj+vl/tRmBtg8Tqnfd6XK9mZguklyMGhi5Rhp1ydyTYaK3eGSt0zH8qTYG
 aW4tF1FCMv8b32aHQRNWREu5ZsI6FTAKzKSdsc/oa+ZFa6joU7YtQKHP6pYtGzjYXYCTao+
 iNv8zdSCWTS7r+AtUp3mA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WpvIo8yGboQ=:dFsx7SKI52dbCp09e9gSlo
 gJ4NbhR3UBbVlRktl3qtWSsY9Y6Vt3GdxBtA4jBq4/L2YMaxCfSOLFJCfvNl1c5GYNz5+Wri8
 CFTHpvdVithhHrdqhjUa6l/e6JTrWnUDchPWC+ER9dGTfsLEOuikjQ4SCY0lXXvdKtlr1mGU9
 DdTPG94TzCLXmowvqbnvSqyv7zqY+gNWLstp9kUwmj2VB5U/d7WeAwok/i+nmhZZKx0KdJLDP
 sPBrWrFrfqVWANr3kHH8XRq4V8SAw+68pJ39M7UYzTB9OocpfqTsONg4QWzHcxfXSYz6UtWui
 3e1mbQgXkaTxBDXc4Pn6QyVEeXqUkbWkGBu4Nf83abAm4lG6LWovmn49S0bNVo+5eruSgUHek
 zYe2n993QTjQa8wuEr+VjjnL6xrclsXMSAr210ZDxSdzY3529JMiZAMLnWZNVsGGgLs6nLjQL
 kFSpHt7XJ+mLyAEbCExqMmhxu4Z7H8nO3lCjjxejPdJwlcMhHeIO0Gpn+zNTcMlkQmLe0bWcI
 foaCkeP0G4jE2/pSLtyA46iQcTPTvbEd9SS3w+aMYZ//yrjrI29wNQ2p7Yzi01wm9kVk5R1tO
 OG8OMFEgij95gJb7tl/Q+Ib/Qmt1nUKDm5VnIqhUPZOP1gJmtYQFF+skmtYzpImooFJ4ylLND
 6ro3vUCI3y/kAZ/VPsQChaWgT3tpr5HtI5DdeLhbL/INa+a+p3wieQaXu5qCeLAb+v/D8Co4u
 C1ae1Zhsk/F6ktqO+tDbRy1Etb9ykGc1dBUWhCEEIvbq9vs9/YwDStRvBJrHg1AvitdQBItwV
 m65NQFBcY+CS2EKQaAm7gfY/NTXL4ZoNiZWxg96U7q5j2fG9agS7b32EvIJKtXrv5sPUVbZg0
 dkpvWC9XbTAdpsADgw7ZT5BxL2zWOI5qCrOAPWe8UgH1Lay0vJgwB8GLO8Fy3cN0uhpw5d8xT
 A1IXbuwdhJxHN3walQc/Jiw+aC7zA6qR9vwBo7BBrSZvGm+hoU/mah1HFKndMPQoABEklfK+Y
 5EQ+hIMsB+2Rq+KSW9a7Grr7u36VnAg4BWB4845zBlHaIwD3BVdKJytunthWiqXYnookhnXbf
 Wag6N9kGo6+YMjor/YZshyJV8QlMEeEV1k2DwBpHODHOf8LRnY6gH3ipA==
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9JAkziFUycexzfgV3rCLUDmWtDOYpz6Ja
From: Joachim Schwender <joachim.schwender@web.de>
To: alsa-devel@alsa-project.org
Message-ID: <6e1eaf12-a7e0-2e77-2fab-ac08e839247e@web.de>
Subject: C-Media 6632A (Xonar U7), 'Input Gain Pad Control'
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I have a Xonar U7, with a C-Media 6632A. It works somehow, the only
issue i have is that the control 'Input Gain Pad Control' is kind of odd:=

By the control name i would expect it changes the gain on the input
path, but in reality it changes the headphones output level.
The Line output level is constant, as well as the input level.
Alsa settings are:
Line capture on
Mic capture off
Item0: 'Line'

Is this Xonar U7 specific or is this a general implementation bug??

best regards


--=20
Dipl.-Ing (FH) Joachim Schwender

H=C3=B6lderlinstrasse 8/1
72636 Frickenhausen

=E2=98=8F+49 7022 8103 =E2=80=83Web:schwender-beyer.de <http://www.schwen=
der-beyer.de/>

Datenschutzerkl=C3=A4rung <http://gedanken-polizei.de/ueberwachung.php>


--9JAkziFUycexzfgV3rCLUDmWtDOYpz6Ja
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEsoq3xi/47F3Fs/8pvbzQr5GWk7wFAmDULHUFAwAAAAAACgkQvbzQr5GWk7xN
ggf/dWbfPHLIldIrj72J2xeslQFRkKAc3lc346KPskhwwW8nGg6pedjpeH7K4ze10fcesgs0He5g
YYaUI05G+macfXw02UeVWrm9n6lQAkkqdZQMkg9V8sf2jSL2slF4UjEecp20Nc5k0eb+7+eqEsoZ
EPDveRghhvgfKMGY8YH2nkx8gsrTpbo98GQCwCXZCcQ9KQIZAKvOMM5OqQyP8C+FBu1d9DfTzpHk
RKwjhTdXPWbqBBXWZieKRe9TUeZg1O/fFK3w2q5e180PYMQ3SWL8S5q0MCWaSKBemb4luRVuxJ8C
b0Ge9jRaq7zzYvoe7xT8ZsvN7Sl7jEMrSCjN/rrNCw==
=WJcN
-----END PGP SIGNATURE-----

--9JAkziFUycexzfgV3rCLUDmWtDOYpz6Ja--
