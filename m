Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5379C023
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Aug 2019 22:32:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B21A1657;
	Sat, 24 Aug 2019 22:32:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B21A1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566678775;
	bh=NjThZc/obsmDR2jxooUceUkOmXEoDZSdqKJx/G0my48=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FwuYEfDFyq2181K5p3b3pZuGXiRtYs34fflOAmlAlvdIS5gAr6BDTXGgJdjABjhJA
	 IzBUaP/Tcj2eQTj5lCkDrG2v8hLVP2+l5tvpFEl9M2Dfa2livGm6x3oZYCIZHBR3q8
	 +t0hTppEanAODnf7oekQH6SzcAEDGJw6yQ6b2Mpo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B397F8063D;
	Sat, 24 Aug 2019 22:27:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FEFBF805E1; Sat, 24 Aug 2019 22:27:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BB8FF803D5
 for <alsa-devel@alsa-project.org>; Sat, 24 Aug 2019 22:26:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BB8FF803D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl
 header.b="GadtC0t8"
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 46G8sG3RHFzhv;
 Sat, 24 Aug 2019 22:25:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1566678322; bh=VMADLsNAb53KqJMxEINzewk+gjFvVaLwVHUb8Ct9D+Y=;
 h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
 b=GadtC0t8GZJA/lhACGRFEtRl8Z69pZTr7VwbIJv7I5uAhvVM7V/Ea7mtmClXGF+WH
 X21adHNbfwNw0YI+mHhPDWXdhDkZERVvSjuc/InEx1JEyK08hE6AuII3LfnpRMvieR
 Ym54Z211qnXPqi9zWGF3QWHHWdOyGEv+4VMYXvp445EXOFsRwhk2uyQuyAhHwpAf0j
 fs9jsMo7IrTHip65QLCfhxrWi3yG7oVxt+wse75vpEhY3Z/i64Xn6ucteb1cLGmOEA
 wusM19TMVgygdapkBgu0woqjRFbG/AwK2VOxV5OzJgahPjjRhKv67+TZG9LaQbl2RX
 OHGJAkxUIW0eQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.2 at mail
Date: Sat, 24 Aug 2019 22:26:57 +0200
Message-Id: <b56ebac96ad232e2d9871067b13654eb9223f28f.1566677788.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1566677788.git.mirq-linux@rere.qmqm.pl>
References: <cover.1566677788.git.mirq-linux@rere.qmqm.pl>
From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Mark Brown <broonie@kernel.org>, Chas Williams <3chas3@gmail.com>,
 Rob Herring <robh-dt@kernel.org>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v2 6/6] ASoC: atmel_ssc_dai: Enable shared
 FSYNC source in frame-slave mode
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

U1NDIGRyaXZlciBhbGxvd3Mgb25seSBzeW5jaHJvbm91cyBUWCBhbmQgUlguIEluIHNsYXZlIG1v
ZGUgZm9yIEJDTEsKaXQgdXNlcyBvbmx5IG9uZSBvZiBUSyBvciBSSyBwaW4sIGJ1dCBmb3IgTFJD
TEsgaXQgY29uZmlndXJlZCBzZXBhcmF0ZQppbnB1dHMgZnJvbSBURiBhbmQgUkYgcGlucy4gQWxs
b3cgY29uZmlndXJhdGlvbiB3aXRoIGNvbW1vbiBGUyBzaWduYWwuCgpTaWduZWQtb2ZmLWJ5OiBN
aWNoYcWCIE1pcm9zxYJhdyA8bWlycS1saW51eEByZXJlLnFtcW0ucGw+CgotLS0KIHYyOiB1c2Ug
YWx0ZXJuYXRlIERUIGJpbmRpbmcKICAgICBzcGxpdCBEVCBhbmQgZHJpdmVycy9taXNjIGNoYW5n
ZXMKCi0tLQogc291bmQvc29jL2F0bWVsL2F0bWVsX3NzY19kYWkuYyB8IDI2ICsrKysrKysrKysr
KysrKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zb3VuZC9zb2MvYXRtZWwvYXRtZWxfc3NjX2RhaS5jIGIv
c291bmQvc29jL2F0bWVsL2F0bWVsX3NzY19kYWkuYwppbmRleCA0OGU5ZWVmMzRjMGYuLjAzNWQ0
ZGE1OGYyYiAxMDA2NDQKLS0tIGEvc291bmQvc29jL2F0bWVsL2F0bWVsX3NzY19kYWkuYworKysg
Yi9zb3VuZC9zb2MvYXRtZWwvYXRtZWxfc3NjX2RhaS5jCkBAIC02MDUsMTQgKzYwNSwzMiBAQCBz
dGF0aWMgaW50IGF0bWVsX3NzY19od19wYXJhbXMoc3RydWN0IHNuZF9wY21fc3Vic3RyZWFtICpz
dWJzdHJlYW0sCiAJCXJldHVybiAtRUlOVkFMOwogCX0KIAotCWlmICghYXRtZWxfc3NjX2Nmcyhz
c2NfcCkpIHsKKwlpZiAoYXRtZWxfc3NjX2Nmcyhzc2NfcCkpIHsKKwkJLyoKKwkJICogU1NDIHBy
b3ZpZGVzIExSQ0xLCisJCSAqCisJCSAqIEJvdGggVEYgYW5kIFJGIGFyZSBnZW5lcmF0ZWQsIHNv
IHVzZSB0aGVtIGRpcmVjdGx5LgorCQkgKi8KKwkJcmNtciB8PQkgIFNTQ19CRihSQ01SX1NUQVJU
LCBmc19lZGdlKTsKKwkJdGNtciB8PQkgIFNTQ19CRihUQ01SX1NUQVJULCBmc19lZGdlKTsKKwl9
IGVsc2UgewogCQlmc2xlbiA9IGZzbGVuX2V4dCA9IDA7CiAJCXJjbXJfcGVyaW9kID0gdGNtcl9w
ZXJpb2QgPSAwOwogCQlmc19vc3luYyA9IFNTQ19GU09TX05PTkU7Ci0JfQogCi0JcmNtciB8PQkg
IFNTQ19CRihSQ01SX1NUQVJULCBmc19lZGdlKTsKLQl0Y21yIHw9CSAgU1NDX0JGKFRDTVJfU1RB
UlQsIGZzX2VkZ2UpOworCQlpZiAoc3NjLT5scmNsa19mcm9tX3RmX3BpbikgeworCQkJcmNtciB8
PQkgIFNTQ19CRihSQ01SX1NUQVJULCBTU0NfU1RBUlRfVFhfUlgpOworCQkJdGNtciB8PQkgIFNT
Q19CRihUQ01SX1NUQVJULCBmc19lZGdlKTsKKwkJfSBlbHNlIGlmIChzc2MtPmxyY2xrX2Zyb21f
cmZfcGluKSB7CisJCQkvKiBhc3N1bWUgUkYgaXMgdG8gYmUgdXNlZCB3aGVuIFJLIGlzIHVzZWQg
YXMgQkNMSyBpbnB1dCAqLworCQkJLyogTm90ZTogd29uJ3Qgd29yayBjb3JyZWN0bHkgb24gU0FN
QTVEMiBkdWUgdG8gZXJyYXRhICovCisJCQlyY21yIHw9CSAgU1NDX0JGKFJDTVJfU1RBUlQsIGZz
X2VkZ2UpOworCQkJdGNtciB8PQkgIFNTQ19CRihUQ01SX1NUQVJULCBTU0NfU1RBUlRfVFhfUlgp
OworCQl9IGVsc2UgeworCQkJcmNtciB8PQkgIFNTQ19CRihSQ01SX1NUQVJULCBmc19lZGdlKTsK
KwkJCXRjbXIgfD0JICBTU0NfQkYoVENNUl9TVEFSVCwgZnNfZWRnZSk7CisJCX0KKwl9CiAKIAlp
ZiAoYXRtZWxfc3NjX2Nicyhzc2NfcCkpIHsKIAkJLyoKLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxp
c3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
