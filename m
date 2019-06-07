Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B8038C5F
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 16:15:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D1331612;
	Fri,  7 Jun 2019 16:14:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D1331612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559916939;
	bh=J8BoannlRMX3MjoQwAFUROLiVK4PsC/6tpFdBtVimG8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mVYQWFfohdAeI2P1aOxQ0mZbNm7+inAojVcsaIeAGuVbqnjbeI4BN5eHZFid9shcy
	 IgPtWmzXVpOaIfKHKgP5WVOF3Fot8PEQShm9l2vkc6bnCoV4zzh70uqwE+TIR4oQDL
	 Tn1nZ5RBKfY5Y7fw2VI37TMdvWUGesSOmB6pwldQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41C77F896DD;
	Fri,  7 Jun 2019 16:13:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50786F896DD; Fri,  7 Jun 2019 16:13:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=5.0 tests=HK_RANDOM_ENVFROM,
 HK_RANDOM_FROM,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from beta.rncbc.lan (a79-169-192-71.cpe.netcabo.pt [79.169.192.71])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81797F80709
 for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2019 16:13:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81797F80709
Received: from [172.21.2.2] (unknown [185.31.158.240])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by beta.rncbc.lan (Postfix) with ESMTPSA id 63F9A2007F
 for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2019 15:13:48 +0100 (WEST)
From: Rui Nuno Capela <rncbc@rncbc.org>
To: alsa-devel@alsa-project.org
Openpgp: preference=signencrypt
Autocrypt: addr=rncbc@rncbc.org; prefer-encrypt=mutual; keydata=
 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
 41p/JuD/Njc=
Message-ID: <cdac9547-b08f-62d4-d29a-89a4f92c3225@rncbc.org>
Date: Fri, 7 Jun 2019 15:13:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------1E9DF436977A5F73D0C06C80"
Content-Language: en-US
Subject: [alsa-devel] [PATCH] ALSA: snd_ice1712: Check correct return value
 to snd_i2c_sendbytes (EWS/DMX 6Fire)
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
--------------1E9DF436977A5F73D0C06C80
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Check for exact and correct return value to snd_i2c_sendbytes
call for EWS/DMX 6Fire (snd_ice1712).

Fixes a systemic error on every boot starting from kernel 5.1
onwards to snd_ice1712 driver ("cannot send pca") on Terratec
EWS/DMX 6Fire PCI soundcards.

Signed-off-by: Rui Nuno Capela <rncbc@rncbc.org>


--------------1E9DF436977A5F73D0C06C80
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


--------------1E9DF436977A5F73D0C06C80
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--------------1E9DF436977A5F73D0C06C80--
