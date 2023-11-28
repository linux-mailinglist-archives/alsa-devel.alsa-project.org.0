Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B434A7FB8AE
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 11:56:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AD0C950;
	Tue, 28 Nov 2023 11:56:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AD0C950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701168971;
	bh=m2fTBFmCzr/K6uqZqRhPE0KGTUGPsJ73zAx639A66gY=;
	h=Date:From:To:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LR7/3v7Q07X8j4hAuq2vBHgFzxXfh5OGttb9i5bRHQiBXUeusZ0Pk+SoQ3WcminZj
	 1IX75+zqxTP/nIzxoSmlqyNymuGBjybpT2Dn+d60o6dQGN7zw3MZZu0PjDOD5tFIp+
	 rGTSu9v24CK31+CVhiGRm0IbC6CbA8/WdH9grN1Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C64BBF80579; Tue, 28 Nov 2023 11:55:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A9FBEF80571;
	Tue, 28 Nov 2023 11:55:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60A91F8016E; Tue, 28 Nov 2023 11:55:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1752F800F5
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 11:55:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1752F800F5
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1r7vkV-00012k-Ft; Tue, 28 Nov 2023 11:55:27 +0100
Received: from [2a0a:edc0:0:b01:1d::7b] (helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mkl@pengutronix.de>)
	id 1r7vkU-00C9S6-Jt; Tue, 28 Nov 2023 11:55:26 +0100
Received: from pengutronix.de (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 52436254FDE;
	Tue, 28 Nov 2023 10:55:26 +0000 (UTC)
Date: Tue, 28 Nov 2023 11:55:25 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
Subject: tlv320aic3x: Failed to init class D
Message-ID: <20231128-frail-parted-f6e66c217965-mkl@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tkh5oc4fgwgfuy5i"
Content-Disposition: inline
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: I6FQMLX7OZIEJ5HCCI2GSR627FMR6UBP
X-Message-ID-Hash: I6FQMLX7OZIEJ5HCCI2GSR627FMR6UBP
X-MailFrom: mkl@pengutronix.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I6FQMLX7OZIEJ5HCCI2GSR627FMR6UBP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--tkh5oc4fgwgfuy5i
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

we are using an I2C connected ti,tlv320aic3007. During probe,
regmap_register_patch() returns -6, which leads to the error message:
"tlv320aic3x 2-0018: Failed to init class D: -6". I think this is
because the codec is still in reset and does not respond to the I2C
transfers.

How to get rid of the error message? Power on the codec, just to write
the register sequence or don't print the error message on "-6"?

regards, Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--tkh5oc4fgwgfuy5i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmVlxxsACgkQvlAcSiqK
BOg/Kwf9GnusR7B6hfTl6uMhuDtlF/ilNveCjI4FZ+T34h5+7l7VHcmj8fGcGEXe
47xPwwon7CfJcbItiN54ebtyYs+hrawOcRigV65BkTPFxXrHUb0S+DM1+CssTDbY
D9pN2ITqmD1WP61i+pU6rj7BA7JgDTWV/is7RhBZBQUxVYhf72fPjIACkOCF0/fb
Cb5bH8SjYS/6qD5If6Ok2DkkgUaSZbcxM6IEex/hf2NzqXJPYpuqVaQ2/Q1c3dWz
N+jRwZ47hYtrH9jKLySTe4Om9juXcJIewYS/HSY6493AZQvWmnJd+pHJaecQG67Z
oAEWWO7Rnv1fQXLr53SlHTU6eZugjA==
=InmG
-----END PGP SIGNATURE-----

--tkh5oc4fgwgfuy5i--
