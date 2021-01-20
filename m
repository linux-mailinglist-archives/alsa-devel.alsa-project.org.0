Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 255132FD44B
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 16:46:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0302182C;
	Wed, 20 Jan 2021 16:45:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0302182C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611157599;
	bh=waRBV/ilEBRU+KawpZotyrRagWTDyZh+1PpH+DOWxwQ=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M1KEUdMQsnYAlrs2GN5h6g5hEy7evHzzUARmP8l/n4pBRJcNj0jlEQdQvqpfbzCmI
	 BgvLg6B3A3UrFYxsK5U6VkHYCZrhHkg6nFpA7qSo8LVnNvPLTNXJhisojiPSE7POWW
	 c+jlIA3TKscb6BWxxMURPwIApo3wBXspVArZD+ho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A913F8019B;
	Wed, 20 Jan 2021 16:45:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88485F8016E; Wed, 20 Jan 2021 16:45:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org
 [IPv6:2001:67c:2050::465:102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DC4EF80137
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 16:44:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DC4EF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=aarsen.me header.i=@aarsen.me
 header.b="zFoqlWSF"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4DLVG10dMFzQlYt
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 16:44:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aarsen.me; s=MBO0001; 
 t=1611157495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=waRBV/ilEBRU+KawpZotyrRagWTDyZh+1PpH+DOWxwQ=;
 b=zFoqlWSFl8Lpem0p9eV+mexfHIIm+wRRQSy1e2bNCPsG+G3uqV1pBU2KzQtuJ+P0gv5LQn
 3iKnsy9QtmMi/L4I2UDuwqNNtKfqORePj8HS6OREpYjv2ydKm0tOtqCewMGdkhnxTH5UOQ
 baKMznkUWRSvesp+16G9+VaDTUEiv1hhu3nsbyNJJ7qN/634Yc2yUpMg/ykcsWeCf1aMA7
 NlIkeMkVTwtZXD38W8H2tokxGshU4dOPnleczAqL6L3ufShi2ymJw7b3Ay7bF009NOYHHy
 m1ZUHYZaHRs1zlTwIhLxxmd6erMbpQjuuBAumckL3pVrTNju98V3gfPkMrxWWA==
Received: from smtp1.mailbox.org ([80.241.60.240])
 by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
 (amavisd-new, port 10030)
 with ESMTP id h6l5YK5MdEP0 for <alsa-devel@alsa-project.org>;
 Wed, 20 Jan 2021 16:44:54 +0100 (CET)
Date: Wed, 20 Jan 2021 16:44:52 +0100
From: Arsen =?utf-8?Q?Arsenovi=C4=87?= <arsen@aarsen.me>
To: alsa-devel@alsa-project.org
Subject: handling different frame sizes in snd_pcm_extplug_callback_t
 transfer callback
Message-ID: <20210120154452.ad5y2rw262kbcocr@bstg>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yy3cewajsvypzwih"
Content-Disposition: inline
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -4.38 / 15.00 / 15.00
X-Rspamd-Queue-Id: 1AF561848
X-Rspamd-UID: fe52a8
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


--yy3cewajsvypzwih
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello!

I am writing an external noise cancellation plugin for ALSA, based on rnnoi=
se,
but I've hit a bit of a roadblock: rnnoise processes chunks of 480 floats a=
t a
time and does no buffering, but alsa expects the transfer callback to take =
all
the data from the input and put it onto the output, with no way to signal t=
hat
any buffering is or should be happening.

I have tried to return a multiple of 480 from the transfer callback and kee=
p a
buffer with the leftover data, to be prepended to the next payload, but it
looks like ALSA will, when a plugin returns too little data, just send back=
 the
same non-processed data in a new call, which breaks this idea.

Any way I can work around these limitations?

Another solution could be for external plugins to report the amount they
consumed and produced, rather than a single number for both, but I am not a=
ware
of how to do that, if it's even possible with the filter plugin SDK.

Thanks in advance!

EDIT: I had previously posted this question before I confirmed my mailing l=
ist
membership, but seeing as it wasn't approved for a few days I cancelled the
request and reposted it. Sorry about that.

--=20
Arsen Arsenovi=C4=87

--yy3cewajsvypzwih
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEN603JsCUe+6MiEcuSj/KZcFT9D4FAmAIT/QACgkQSj/KZcFT
9D7LgQgAsPaPuT7/jJ6+GIcNsI4M2xeMX4FAqrSMFklca0C9UV2qxWcJHfWEaHdD
dnz2nmh+81Mw4vWRz/2h6iflylDP0L40dsSlqZNQkBWrl1HMma5Mx+GUJDUZrcEn
dV5Od3bqgn8543PykXWoZX4yaBfL6MKEUH/a0FdKUi5jWXS7ZcHHheA3pSf543HH
tC4eg4BOnqKNo7QxI9LCey5lb/BD+1lBdMkq3cpWR7ni9HxKKgur0j7zPIJrK+SU
yCRStoeTw6mpwAH1MGQYUAktpF8CEjX/tUtSbLJC04yl4eiiyegvFcwHpwQ2yr2B
/VtCxEJ7C0r7/ZaxuDUbRW76KT7GnQ==
=/Wbi
-----END PGP SIGNATURE-----

--yy3cewajsvypzwih--
