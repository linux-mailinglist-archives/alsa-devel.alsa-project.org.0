Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE82ACEB06
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Jun 2025 09:43:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CA20601DD;
	Thu,  5 Jun 2025 09:43:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CA20601DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749109419;
	bh=WcB9OLk3IbK3PrU7BwDLL38nq2o0Yny7n7fjpv0Em78=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gmFSFmOBjcK9Fc9ch3SAayJxA0txR2znWaRRCVvtmdsmRikLCSK9I1ygqSsmNn106
	 jeWpMPhlpCO67okcWL38wBdft7OnkDRsu4dNwbFZv4mkPS5sFFw8G8I+j7ZVMimRsy
	 WZc4qi2C8iMkomBWc1hJSeFsTiZHbF2TcJSQgEcU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43B9AF805B5; Thu,  5 Jun 2025 09:43:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C543F805B1;
	Thu,  5 Jun 2025 09:43:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B6F2F80212; Wed, 28 May 2025 05:24:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E62EF800D2
	for <alsa-devel@alsa-project.org>; Wed, 28 May 2025 05:24:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E62EF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.com header.i=meowmeowbeanz@gmx.com
 header.a=rsa-sha256 header.s=s31663417 header.b=cjqsOMv7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
	s=s31663417; t=1748402683; x=1749007483; i=meowmeowbeanz@gmx.com;
	bh=ir3St0EToVdOtFoQuHxG0DRTDoertb0nXRrbxaaO0rE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=cjqsOMv7+hCPXjOIFFdv+QhByVhXTx7waAcSZ4Aq40yTB1gR1g2kPIggK0MaGfOh
	 5KFGI5wufh6vYPrxSi7sgUtwcITq5t0lwJyRCKDhVIb+8u0HachgDNecbJwtrDdk4
	 tQ+a4SOc7SKbrYh0/uCryeIJb5YrN9LERRxCG6fyFBbtC2uX82pEWKScljtWu1+Pj
	 jkW3j3jXmHGJ2czpniuNh9weK9d7qtpacQ+IvwWGh8mOPX9vt6hvKuXmnMiXW3Hr/
	 OOiIiscyoudco9094XOWKYiu4X/uICR+ERYz/eKNAzNTTzpHWyOwkDc8TM7DsqrZV
	 27+MclmWIwqSZrGwmQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from gemini.localnet ([24.205.220.130]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MPXhK-1uWr603bik-00Xkck; Wed, 28
 May 2025 05:24:43 +0200
From: meowmeowbeanz <meowmeowbeanz@gmx.com>
To: alsa-devel@alsa-project.org
Cc: broonie@kernel.org, mario.limonciello@amd.com
Subject: [PATCH] ASoC: amd: yc: Add support for Lenovo Yoga 7 16ARP8
Date: Tue, 27 May 2025 20:24:39 -0700
Message-ID: <5015425.31r3eYUQgx@gemini>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Provags-ID: V03:K1:kjHiMNVefzq9VCPSasS2uJVff12Ov6aQShn39kCOKtBIb5iPwJ0
 ahSKZRq1oTTNjwnxMQenBeOTludkiSi9szoYZLCItzmMx2fYLjj5IzQ0sKedEMlvWQl+IX2
 hJ5Gu0nnX9o+ZrZ+mH9y7iIN3rJDIR0Jg34bIXQj0H5+78DR+j8oZBj+J7koydPrbNltnQc
 uAhHD0TO2dxj0gAr2Z+Dg==
UI-OutboundReport: notjunk:1;M01:P0:c4g6nNytRdk=;6BikSzjNd++dEdpsoAHgfZQWYwB
 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
X-MailFrom: meowmeowbeanz@gmx.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZLTP6T2T5GNJSBNBWO7CE4WOKAYUJCHC
X-Message-ID-Hash: ZLTP6T2T5GNJSBNBWO7CE4WOKAYUJCHC
X-Mailman-Approved-At: Thu, 05 Jun 2025 07:43:03 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZLTP6T2T5GNJSBNBWO7CE4WOKAYUJCHC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

=46rom e1bc7cbafcdefad60ac6a34fd834a734c64f3fd5 Mon Sep 17 00:00:00 2001
From: meowmeowbeanz <meowmeowbeanz@gmx.com>
Date: Tue, 27 May 2025 19:57:07 -0700
Subject: [PATCH] ASoC: amd: yc: Add support for Lenovo Yoga 7 16ARP8

Add DMI quirk entry for Lenovo Yoga 7 16ARP8 (83BS) to enable
digital microphone support via ACP driver.

Fixes microphone detection on this specific model which was
previously falling back to non-functional generic audio paths.

Tested-by: meowmeowbeanz <meowmeowbeanz@gmx.com>
Signed-off-by: meowmeowbeanz <meowmeowbeanz@gmx.com>
=2D--
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 3d9da93d22ee..7e62445e02c1 100644
=2D-- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -311,6 +311,13 @@ static const struct dmi_system_id yc_acp_quirk_table[=
] =3D=20
{
                        DMI_MATCH(DMI_PRODUCT_NAME, "83AS"),
                }
        },
+       {
+               .driver_data =3D &acp6x_card,
+               .matches =3D {
+                       DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+                       DMI_MATCH(DMI_PRODUCT_NAME, "83BS"),
+               }
+       },
        {
                .driver_data =3D &acp6x_card,
                .matches =3D {
=2D-=20
2.49.0





