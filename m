Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B010A47AA12
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Dec 2021 14:02:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2582C175C;
	Mon, 20 Dec 2021 14:01:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2582C175C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640005359;
	bh=REUKzYvTnWFtSseRl3TT7ssf0DMkQQjLPLGHo24Iw9o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kqfz1T8Qm8TyZBu9Mui/ydP1Ul3NVS9IY0z7Kj475riv9VQ2/uUri0ZsxVe+d/mv8
	 cwkXmK2bk6EbK3dznYTcShZxnC9682u1VrxS/Xhrg1nZ/92XYsuxQNAGlpIqBoEsyt
	 ItB0BypXMACfPbDQ/OTS8PwnFC6o3cnkHdAtFLq4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 560FAF80149;
	Mon, 20 Dec 2021 14:01:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3912F8011F; Mon, 20 Dec 2021 14:01:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E6E3F8011F
 for <alsa-devel@alsa-project.org>; Mon, 20 Dec 2021 14:01:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E6E3F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Aasdkjnn"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 15CE5CE1025;
 Mon, 20 Dec 2021 13:01:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70C11C36AE7;
 Mon, 20 Dec 2021 13:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640005275;
 bh=REUKzYvTnWFtSseRl3TT7ssf0DMkQQjLPLGHo24Iw9o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AasdkjnnNJsF6oJgAWJT46rCcWhebElwpln7Xpf1P6NArnvIcFfIbpOGhC7lMsx4W
 UsDtDACQOU78EolMCL/awrtb+O7ENvyEU7TnKFn3/UT94i7PufoeQCE/b18F3XyAHz
 Y7eNUT4qNIGc65ebCagifqHyLXBQcCSPmjLpsUIhSsn/4SvvPbbsGDCuHR5zR/nOEL
 /txjGN7JclFRQkedc7znxNTw9U0nsK3JyyfkNhYrKGvj/lUyuBW+Q7qKAF71bwQm8y
 624/nIfXaukjrN8wceJstgK54zySU15CPhXC7B3fKNOzkc9/UmpaSwjUTQFFXJT/5G
 5b8xH68R8hG6w==
Date: Mon, 20 Dec 2021 13:01:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v6 08/10] ACPI / scan: Create platform device for
 CLSA0100 and CSC3551 ACPI nodes
Message-ID: <YcB+lUePGlo1S9tX@sirena.org.uk>
References: <20211217115708.882525-1-tanureal@opensource.cirrus.com>
 <20211217115708.882525-9-tanureal@opensource.cirrus.com>
 <CAJZ5v0jTELqFeO6q6w_mYNo_yf1R9SX66RrEz0ZSe27w7E6kog@mail.gmail.com>
 <4b5506b1-20c6-3983-d541-86dc2388b2a7@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="9/Pqt07Ueb9aNBfT"
Content-Disposition: inline
In-Reply-To: <4b5506b1-20c6-3983-d541-86dc2388b2a7@redhat.com>
X-Cookie: Christ was born in 4 B.C.
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>,
 Stefan Binding <sbinding@opensource.cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Gross <markgross@kernel.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Len Brown <lenb@kernel.org>
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


--9/Pqt07Ueb9aNBfT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 17, 2021 at 07:26:51PM +0100, Hans de Goede wrote:

> This is fine with me, but I wonder if it would not be better
> to keep it under drivers/platform/x86 ? Since the new SPI
> use-cases are also all on x86 laptops AFAICT.

Someone's going to end up using it for one of the Arm devices with ACPI,
*especially* if it's put in drivers/platform/x86.

--9/Pqt07Ueb9aNBfT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHAfpQACgkQJNaLcl1U
h9Ac8wf9FmAjh+2RRFMNCcPoRlzeJvaGXlVOENLgOET0tUOx6vtKf/bBmdZ04Jfn
/EnxgiVJOnHRjALACEva0AvgeooyLzMROopnthAcw6fbR0t4mWTruzNn8uawTUU7
Jdz52ctPsB3q0kLrYCvCMI3qvmUFUcN+0iyDhMlP5yxSBEJadzdlMYDtywlfoO3e
URO0st0GO/Vmhlp/EqEiwbEnp48KbSi/YvSbYMGeSemQ+PU6t43NikAV80DWAZgt
2kbHYXZEOV/HA2qPrtGRalL2CqpriYMbeF4lm1zml+DliGSVBYIVKOryZfz1cX0v
JP7EXWfEgcaclQFKDq4295OGuW0K/A==
=QTdH
-----END PGP SIGNATURE-----

--9/Pqt07Ueb9aNBfT--
