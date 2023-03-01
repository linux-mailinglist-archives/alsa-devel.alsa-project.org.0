Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F2C6A71DD
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Mar 2023 18:11:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 861501DA;
	Wed,  1 Mar 2023 18:11:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 861501DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677690717;
	bh=MYw2+PUxf8cpZNCa/JnkaMCDga8g684FWn6mP/BA928=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=lZMOLJwVFUlqUyJifanQmzfCbcNRG6wRCL3wWskOqtFyj+/4x6y7RHhU7mmSt1ncG
	 YdE55xDKeI4RSbhInRxdOh1Bj2a+8v+TVpNV0nmQHSoNQr4ZJ4UaRfj/Xvsa5QjnP+
	 7P7MlLTLhyqfyfOXEgro9J1rCYcnt5jEKecWcGT8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F63FF80236;
	Wed,  1 Mar 2023 18:11:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1DD9F8049C; Wed,  1 Mar 2023 09:30:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail.thaison-nguyen.de (thaison-nguyen.de [5.45.104.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E0A5EF800BA
	for <alsa-devel@alsa-project.org>; Wed,  1 Mar 2023 09:30:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0A5EF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=thaison-nguyen.de header.i=@thaison-nguyen.de
 header.a=rsa-sha256 header.s=dkim header.b=XEdEkFyb
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 303CBE392F;
	Wed,  1 Mar 2023 09:30:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thaison-nguyen.de;
	s=dkim; t=1677659443;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language;
	bh=oEWkW5wEYrzuuez8tZMMzh/jr7Rxp40QcWdWTz9fZqE=;
	b=XEdEkFybAl76IDPQgfL4LZy/C5Ej60jjDpNOC8NXdXVEd187snt7TQIXXwwFKmm6P9lF4n
	z4k2JqWf0GLrq60lAYitYIPprxPhzsqD2112ZhhGiWQbF6Cp5A8ThhNospDb/GFxC6nTyu
	ItaDeutSlYVBg78OVJKYuZTnRnVJfuY6xYqiG3jm+0I+xZYuWfVhmiLNakK7xVSf7Kk5SE
	VBCm1Bq8cQ2T5Hghteyx5R6WLQky8Qd1+epvJBiF9FhRBTaZMxTg6McNNzbnXo/GCY648E
	R/NewaYm87ZCeZ1uQ+/JwD9cD2Gl07PqiP1YtZQwTCci/GOLJFYi+r1BJF6k6g==
From: "Thaison Nguyen" <mail@thaison-nguyen.de>
To: <johannes@sipsolutions.net>
Subject: [Patch] sound/aoa: Add support for iBook G4 (powerbook6,5)
Date: Wed, 1 Mar 2023 09:30:39 +0100
Message-ID: <008801d94c18$1c7424c0$555c6e40$@thaison-nguyen.de>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
thread-index: AdlMFjpemFCBQa8GRkebkHE1IVtr+w==
Content-Language: de
X-Last-TLS-Session-Version: TLSv1.2
X-MailFrom: mail@thaison-nguyen.de
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: S3FBFRKDRYTF25K3KP2DFTPP2XIYPPWA
X-Message-ID-Hash: S3FBFRKDRYTF25K3KP2DFTPP2XIYPPWA
X-Mailman-Approved-At: Wed, 01 Mar 2023 17:11:03 +0000
CC: linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org,
 'Christophe Leroy' <christophe.leroy@csgroup.eu>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S3FBFRKDRYTF25K3KP2DFTPP2XIYPPWA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The audio on my iBook G4 (powerbook65) has not been working.
This is because the ids of the device were missing in the aoa audio =
driver.
With this patch, the IDs of Powerbook6,4 and Powerbook6,5 are added to =
the driver.

Signed-off-by: Thaison Nguyen <mail@thaison-nguyen.de>
---
 sound/aoa/fabrics/layout.c       | 15 +++++++++++++++
 sound/aoa/soundbus/i2sbus/core.c |  2 +-
 2 files changed, 16 insertions(+), 1 deletions(-)

diff a/sound/aoa/fabrics/layout.c b/sound/aoa/fabrics/layout.c
--- a/sound/aoa/fabrics/layout.c
+++ b/sound/aoa/fabrics/layout.c
@@ -111,7 +111,9 @@
 MODULE_ALIAS("aoa-device-id-14");
 MODULE_ALIAS("aoa-device-id-22");
 MODULE_ALIAS("aoa-device-id-31");
 MODULE_ALIAS("aoa-device-id-35");
+MODULE_ALIAS("aoa-device-id-38");
+MODULE_ALIAS("aoa-device-id-40");
 MODULE_ALIAS("aoa-device-id-44");
=20
 /* onyx with all but microphone connected */
@@ -368,7 +368,20 @@
 		.connections =3D tas_connections_nolineout,
 	  },
 	},
+	/* PowerBook6,4 */
+	{ .device_id =3D 40,
+	  .codecs[0] =3D {
+		.name =3D "tas",
+		.connections =3D tas_connections_all,
+	  },
+	},
 	/* PowerBook6,5 */
+	{ .device_id =3D 38,
+	  .codecs[0] =3D {
+		.name =3D "tas",
+		.connections =3D tas_connections_all,
+	  },
+	},
 	{ .device_id =3D 44,
 	  .codecs[0] =3D {
 		.name =3D "tas",
diff a/sound/aoa/soundbus/i2sbus/core.c =
b/sound/aoa/soundbus/i2sbus/core.c
--- a/sound/aoa/soundbus/i2sbus/core.c
+++ b/sound/aoa/soundbus/i2sbus/core.c
@@ -197,7 +197,7 @@
 			 * so restrict to those we do handle for now.
 			 */
 			if (id && (*id =3D=3D 22 || *id =3D=3D 14 || *id =3D=3D 35 ||
-				   *id =3D=3D 31 || *id =3D=3D 44)) {
+				   *id =3D=3D 31 || *id =3D=3D 44 || *id =3D=3D 40 || *id =3D=3D =
38)) {
 				snprintf(dev->sound.modalias, 32,
 					 "aoa-device-id-%d", *id);
 				ok =3D 1;


