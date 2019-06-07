Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A27703A0CC
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Jun 2019 18:54:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CE6F1690;
	Sat,  8 Jun 2019 18:53:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CE6F1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560012845;
	bh=Qv9o8geBOy7zeRzDGTw98Qr7h8Rxc+oP6t1xJPsqo+8=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tdugoiFiXvNNFe4LKQ9OKOAvdm9SqNI3c96nIaED0e88X9eQyaGNyrjY0EWhjh/7N
	 ExTVsyTDsgnn9Nr0oSYQvGBQHc4Y1m00ZRobZlf8EZFC6Mj6bCZLKjstZlcEFZVyn2
	 FHBMc6CtYWg3+asVOdyfKQT6VmM5UpA3j/BN0umo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74C75F8978D;
	Sat,  8 Jun 2019 18:40:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3787EF896DD; Fri,  7 Jun 2019 16:00:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=5.0 tests=HK_RANDOM_ENVFROM,
 HK_RANDOM_FROM,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from beta.rncbc.lan (a79-169-192-71.cpe.netcabo.pt [79.169.192.71])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C740F80709
 for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2019 16:00:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C740F80709
Received: from [172.21.2.2] (unknown [185.31.158.240])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by beta.rncbc.lan (Postfix) with ESMTPSA id 353AA2007F;
 Fri,  7 Jun 2019 15:00:24 +0100 (WEST)
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>
From: Rui Nuno Capela <rncbc@rncbc.org>
Openpgp: preference=signencrypt
Autocrypt: addr=rncbc@rncbc.org; prefer-encrypt=mutual; keydata=
 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
 41p/JuD/Njc=
Message-ID: <70c8eb71-54d7-b440-967e-7717063a7259@rncbc.org>
Date: Fri, 7 Jun 2019 15:00:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------899C8D2E36FA40B22F531F7A"
Content-Language: en-US
X-Mailman-Approved-At: Sat, 08 Jun 2019 18:39:50 +0200
Subject: [alsa-devel] ALSA: snd_ice1712: Check correct return value to
 snd_i2c_sendbytes (EWS/DMX 6Fire)
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

This is a multi-part message in MIME format.
--------------899C8D2E36FA40B22F531F7A
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Check for exact and correct return value to snd_i2c_sendbytes
call for EWS/DMX 6Fire (snd_ice1712).

Fixes a systemic error on every boot to snd_ice1712 driver
("cannot send pca") on Terratec EWS/DMX 6Fire PCI soundcards.

Signed-off-by: Rui Nuno Capela <rncbc@rncbc.org>

Cheers
- -- 
rncbc aka. Rui Nuno Capela
rncbc@rncbc.org
-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEml2OG8nT8/KXriugSepTUDAa1MgFAlz6beYACgkQSepTUDAa
1MgAggf+LVoDgtUTSU6OsBipvlZ9Ro8ll4qBIPC8JtECk6iHur3C/xEHYqirVRQa
HVBuNxN4RiaJI/upALZ/6n2XY3cjB04qgfCg+lQTQFAY7Or6G3L3vzyg8C/y7q2n
uqkZTgbfNwQ01Xbq7Xa9QQ02eJKFCAmAOscBXwBQTpzzoThwFj0edUqvHleYuWOT
b6qsVUSJJmJQlJe/10zyg+btmQEtLAWtLsIg0pkvJQJCmQgxeCvDspoH8THs/ov3
eCZNVUjnK1qkkl1Z7yFLjp7wx8RV28YZ5kMtDmkiDac66JfEO80qtJvxwbAY/hOm
B/mII9niJLCEGV2cdNwPGpr2n4EdLg==
=g9Fk
-----END PGP SIGNATURE-----

--------------899C8D2E36FA40B22F531F7A
Content-Type: text/x-patch;
 name="patch-5.1.7-snd_ice1712-ews-1.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="patch-5.1.7-snd_ice1712-ews-1.diff"

Check for exact and correct return value to snd_i2c_sendbytes
call for EWS/DMX 6Fire (snd_ice1712).

Fixes a systemic error on every boot to snd_ice1712 driver
("cannot send pca") on Terratec EWS/DMX 6Fire PCI soundcards.

Signed-off-by: Rui Nuno Capela <rncbc@rncbc.org>


--- a/sound/pci/ice1712/ews.c	2019-06-04 06:59:45.000000000 +0100
+++ b/sound/pci/ice1712/ews.c	2019-06-07 11:04:01.735954865 +0100
@@ -826,7 +826,7 @@
 
 	snd_i2c_lock(ice->i2c);
 	byte = reg;
-	if (snd_i2c_sendbytes(spec->i2cdevs[EWS_I2C_6FIRE], &byte, 1)) {
+	if (snd_i2c_sendbytes(spec->i2cdevs[EWS_I2C_6FIRE], &byte, 1) != 1) {
 		snd_i2c_unlock(ice->i2c);
 		dev_err(ice->card->dev, "cannot send pca\n");
 		return -EIO;

--------------899C8D2E36FA40B22F531F7A
Content-Type: application/pgp-keys;
 name="0x9D0514152A8E5EC4.asc"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0x9D0514152A8E5EC4.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=fVik
-----END PGP PUBLIC KEY BLOCK-----

--------------899C8D2E36FA40B22F531F7A
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--------------899C8D2E36FA40B22F531F7A--
