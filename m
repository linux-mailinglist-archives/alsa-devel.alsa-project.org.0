Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E23B10834C
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Nov 2019 13:37:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 158B21871;
	Sun, 24 Nov 2019 13:36:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 158B21871
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574599056;
	bh=WnN4kD5KnGI8nNm9JsMEuH46r+Apg9DuU2qTbftMJ6k=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=koRcVjfgTPclE2+6nTnpl+9C9nZmtZJjPvjfOjOHBUxPUMcnGpWPyjpKO9AYIuT3F
	 eG57tZgC2j8t4TQtIsZCs/Cjj54Hj/BZrqoI7gWDQPBwAtuze2FdVxppH801oQ3IHH
	 96iRtV6CXmGXQN4NNpTPmvapC3oFkEnK0l9BrcvY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5697FF801ED;
	Sun, 24 Nov 2019 13:35:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA6D1F801ED; Sun, 24 Nov 2019 13:35:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 058ECF800E5
 for <alsa-devel@alsa-project.org>; Sun, 24 Nov 2019 13:35:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 058ECF800E5
Received: from [192.168.178.21] ([95.116.187.128]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MMnnm-1iIICb0OWa-00IkoZ for <alsa-devel@alsa-project.org>; Sun, 24 Nov 2019
 13:35:45 +0100
To: alsa-devel@alsa-project.org
From: Jens Verwiebe <info@jensverwiebe.de>
Message-ID: <384d65cd-5e87-91eb-9fc3-e57226f534c6@jensverwiebe.de>
Date: Sun, 24 Nov 2019 13:35:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------97084828ECDE7D8C037D3552"
Content-Language: de-DE
X-Provags-ID: V03:K1:RCtG0SlfYyHOWQIRJe+6jZfgebpXe3Ky4GAJYzb5Imy64q45uu7
 nt3e7wCPrULlhPOr6JhxGsr9Gtov+wGlTZs4KTFbB1DYKZ34P/YeCy7+Kcz1qhOZ4DPDT3h
 gs1KROjNJqQtmXfXeTDXd+aLuNJj2N7OlwEzXnhE9kNpNyq4OlMGhHusZdJJTvBsL+Hl/yX
 ImXcV9Ajo/Ti79P3fS0kw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wOVv+sF2Xrk=:6W/ljRKzxQIkjaveBF6/qS
 O4wff1rocqqfBDaPBjW1bLGthNewcFVYfUz63DqxCtId1P9r02vLaMTq06vQ3TA/AOwbWb4G3
 x23mNe5hknK2GaavFLKaC/rdLQxlg/LG0gH0POIyhGJPf/Sj1bcR2juWrbtyMKPnSQLfmfLcz
 jImePL/XiViVFH6MYchJYp9YLs4e25F4jt3NTWPpOqda/aogUVtjKPo3OkVHWpiuJxJdd6l8h
 NfJ+g065NQk9YRlYrf2pNojWdMiNo3RUZgp+aNs8dByAv9LQM2r7AKq8avw78bfEIpJny0ZGp
 GutCZjtJinoij2KVyi4VpRUlqx9f5QlJsvXF45isiGpiKwyZTjq9vuR58Ppr+jE1wQ0Mxs+8a
 R8XIlgUak5cWrB6OHBDc5DiTkuyabgz2mZoLWU9dnzCwcQbX/h1VqlySBJCoLYqtxGt82edms
 lp3MY5EbhX2KPp9h3pZLmBr+x0C0kvHmQWJRwPRErHsDmKrAeJea4szSnpfD4V17ZJzuiZb1z
 hhZls/4vA8DJjQwu7oFToEW6f0KN1QmHwGW5nAf6dwOTaHvQfXgYOBTdoY6iCcKcXXt05H9U4
 beSb/np+b4ybTgqM8xQsSEAVNTo8SN/OCYSdz2kGwXW6fdWtLEwUijR240EfiPAig7IjyyG7q
 qdMXBC1hZ3q9dbtEgUtX3ruWtAtsF8LMWqIE0y940WfoSQFV43uk5LEjCtAPV9M9NGBeiOTpx
 5VQrx+HJ9TIw6y/g8/9MAzI/09kBNITgorFmdKptHx/fbyhFfUZfsxBDRrBrpbPUaOiDPKuUR
 Oc6afAX2wtb38SAGmJSJVE7IDxwkweRLBY0ky4BqZUlN7Auvak8dgtpBlr0fLxcrSVenqD9ti
 r2CQjGnuqh+pKfpPTdJ3sPK9EeruePUsdDPQUgwRI=
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] [RESEND PATCH] ALSA: usb-audio: Fix Focusrite Scarlett
 6i6 gen1 - input handling
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
--------------97084828ECDE7D8C037D3552
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

The Scarlett 6i6 has no padding on rear inputs 3/4 but a gainstage.
This patch introduces this functionality as to be seen in the mac
or windows scarlett control.
The correct address could already be found in the dump info,
but was never used. Without this patch inputs 3/4 are quite unusable else.
The diff is attached as a textfile as i found this preseverves formatting best.
Diffed and testcompiled against todays kernel master.

Cheers ... Jens

Changelog: The Scarlett 6i6 has no padding on rear inputs 3/4 but a 
gainstage
(Lo/Hi). Adding this functionality according to macOS/Win drivers.

Signed-off-by: Jens Verwiebe <info at jensverwiebe.de>

-- 

Jens Verwiebe
Allerskehre 44 - 22309 Hamburg

Tel.: +49 40 68 78 50
mailto: info@jensverwiebe.de
web: https://www.jensverwiebe.de


--------------97084828ECDE7D8C037D3552
Content-Type: text/plain; charset=UTF-8;
 name="scarlett_6i6_rev1_gain_3+4.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="scarlett_6i6_rev1_gain_3+4.txt"

ZGlmZiAtLWdpdCBhL3NvdW5kL3VzYi9taXhlcl9zY2FybGV0dC5jIGIvc291bmQvdXNiL21p
eGVyX3NjYXJsZXR0LmMKaW5kZXggODM3MTVmZDhkZmQ2Li45ZDEwY2JmMWI1ZWQgMTAwNjQ0
Ci0tLSBhL3NvdW5kL3VzYi9taXhlcl9zY2FybGV0dC5jCisrKyBiL3NvdW5kL3VzYi9taXhl
cl9zY2FybGV0dC5jCkBAIC0xNDIsNiArMTQyLDcgQEAgZW51bSB7CiAJU0NBUkxFVFRfT1VU
UFVUUywKIAlTQ0FSTEVUVF9TV0lUQ0hfSU1QRURBTkNFLAogCVNDQVJMRVRUX1NXSVRDSF9Q
QUQsCisJU0NBUkxFVFRfU1dJVENIX0dBSU4sCiB9OwogCiBlbnVtIHsKQEAgLTE5Miw2ICsx
OTMsMTUgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzY2FybGV0dF9taXhlcl9lbGVtX2VudW1f
aW5mbyBvcHRfcGFkID0gewogCX0KIH07CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgc2Nhcmxl
dHRfbWl4ZXJfZWxlbV9lbnVtX2luZm8gb3B0X2dhaW4gPSB7CisJLnN0YXJ0ID0gMCwKKwku
bGVuID0gMiwKKwkub2Zmc2V0cyA9IHt9LAorCS5uYW1lcyA9IChjaGFyIGNvbnN0ICogY29u
c3QgW10peworCQkiTG8iLCAiSGkiCisJfQorfTsKKwogc3RhdGljIGNvbnN0IHN0cnVjdCBz
Y2FybGV0dF9taXhlcl9lbGVtX2VudW1faW5mbyBvcHRfaW1wZWRhbmNlID0gewogCS5zdGFy
dCA9IDAsCiAJLmxlbiA9IDIsCkBAIC02NTIsOCArNjYyLDggQEAgc3RhdGljIHN0cnVjdCBz
Y2FybGV0dF9kZXZpY2VfaW5mbyBzNmk2X2luZm8gPSB7CiAJCXsgLm51bSA9IDEsIC50eXBl
ID0gU0NBUkxFVFRfU1dJVENIX1BBRCwgLm5hbWUgPSBOVUxMfSwKIAkJeyAubnVtID0gMiwg
LnR5cGUgPSBTQ0FSTEVUVF9TV0lUQ0hfSU1QRURBTkNFLCAubmFtZSA9IE5VTEx9LAogCQl7
IC5udW0gPSAyLCAudHlwZSA9IFNDQVJMRVRUX1NXSVRDSF9QQUQsIC5uYW1lID0gTlVMTH0s
Ci0JCXsgLm51bSA9IDMsIC50eXBlID0gU0NBUkxFVFRfU1dJVENIX1BBRCwgLm5hbWUgPSBO
VUxMfSwKLQkJeyAubnVtID0gNCwgLnR5cGUgPSBTQ0FSTEVUVF9TV0lUQ0hfUEFELCAubmFt
ZSA9IE5VTEx9LAorCQl7IC5udW0gPSAzLCAudHlwZSA9IFNDQVJMRVRUX1NXSVRDSF9HQUlO
LCAubmFtZSA9IE5VTEx9LAorCQl7IC5udW0gPSA0LCAudHlwZSA9IFNDQVJMRVRUX1NXSVRD
SF9HQUlOLCAubmFtZSA9IE5VTEx9LAogCX0sCiAKIAkubWF0cml4X211eF9pbml0ID0gewpA
QCAtODgzLDYgKzg5MywxNSBAQCBzdGF0aWMgaW50IHNjYXJsZXR0X2NvbnRyb2xzX2NyZWF0
ZV9nZW5lcmljKHN0cnVjdCB1c2JfbWl4ZXJfaW50ZXJmYWNlICptaXhlciwKIAkJCWlmIChl
cnIgPCAwKQogCQkJCXJldHVybiBlcnI7CiAJCQlicmVhazsKKwkJY2FzZSBTQ0FSTEVUVF9T
V0lUQ0hfR0FJTjoKKwkJCXNwcmludGYobXgsICJJbnB1dCAlZCBHYWluIFN3aXRjaCIsIGN0
bC0+bnVtKTsKKwkJCWVyciA9IGFkZF9uZXdfY3RsKG1peGVyLCAmdXNiX3NjYXJsZXR0X2N0
bF9lbnVtLAorCQkJCQkgIHNjYXJsZXR0X2N0bF9lbnVtX3Jlc3VtZSwgMHgwMSwKKwkJCQkJ
ICAweDA4LCBjdGwtPm51bSwgVVNCX01JWEVSX1MxNiwgMSwgbXgsCisJCQkJCSAgJm9wdF9n
YWluLCAmZWxlbSk7CisJCQlpZiAoZXJyIDwgMCkKKwkJCQlyZXR1cm4gZXJyOworCQkJYnJl
YWs7CiAJCX0KIAl9CiAK
--------------97084828ECDE7D8C037D3552
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--------------97084828ECDE7D8C037D3552--
