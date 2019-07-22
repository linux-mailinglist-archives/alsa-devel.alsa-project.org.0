Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 612A570806
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 19:59:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0D211824;
	Mon, 22 Jul 2019 19:58:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0D211824
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563818354;
	bh=so9Ujy/1Tm8c+QxA5vfoKzcdCf0n2u9jpPsPJXj1USA=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HkDyHjGg687lLOfnf2tlv+6RvaYCg0OsGFAvUzonrLSCJZX2CqR015wQDcQlRV605
	 eriNxC4cmY8bBWcKNTB1JURybVLQak6Jvtn7SAvsojCA120Xg45Sr2kbeybTbouy48
	 ULfpaNqYukfefh0+4WyljrUXgMZFU9HZzI5K5j9w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88E9FF803D6;
	Mon, 22 Jul 2019 19:57:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 989AFF803D7; Mon, 22 Jul 2019 19:57:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C22EF8015B
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 19:57:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C22EF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl
 header.b="kYJhe9M0"
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 45sq691hxyzB2;
 Mon, 22 Jul 2019 19:56:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1563818162; bh=23nwcPg6LghmL+X6QZ2e5+/c+rY936MjVWfhrxkjVF0=;
 h=Date:From:Subject:To:Cc:From;
 b=kYJhe9M0Q8m6OxmSoewG3nvahj5usYnfFUHP5/0CxfzKXrxZ3pi0RO+sKb/piy6Oy
 JYp7KTisNJfDYecaPVJqjGzh6Yiydb++xqXylbtuGljjxuEmNompSTtCnb/QZT3Ujl
 WRn/KZnZbJJVMGWk0f9pQVXwi+CCDvQEk3w5D+y/jcd6BPt/CQI7fwncEfiOr205vl
 QfVO63ZxFBVCMdu12ItQaNLDJ4SDphI5kiKnAiuLYdr09TB8FL00z+GS9+jgrC7fLD
 N1sRSJ+tBF0ySMULFOw8YxpVc/NTFZ9P/eb+gOGbP3tt//fwPze8hjPBLW5oRqgq0D
 8QFhMJeMTO0oA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at mail
Date: Mon, 22 Jul 2019 19:57:19 +0200
Message-Id: <cover.1563817201.git.mirq-linux@rere.qmqm.pl>
From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
To: alsa-devel@alsa-project.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 patches@opensource.cirrus.com, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: [alsa-devel] [PATCH 0/2] wm8904: adapt driver for use with
	audio-graph-card
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

VGhpcyBzZXJpZXMgYWxsb3dzIHRvIHVzZSBXTTg5MDQgY29kZWMgYXMgYXVkaW8tZ3JhcGgtY2Fy
ZCBjb21wb25lbnQuCkl0IGlzIGEgcmV3cml0ZSBvZiBhbiBlYXJsaWVyIGFwcHJvYWNoIGZyb20K
aHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDczODA5Ny8KClNlcmllcyBiYXNl
ZCBvbiB0aXdhaS9zb3VuZC9mb3ItbmV4dCB0cmVlLiBZb3UgY2FuIGFsc28gcHVsbCBmcm9tOgog
ICBodHRwczovL3JlcmUucW1xbS5wbC9naXQvbGludXgKYnJhbmNoOgogICB3bTg5MDQKCkV4YW1w
bGUgRFRTOgoKLyB7CiAgICAgICAgc291bmQgeyAKICAgICAgICAgICAgICAgIGNvbXBhdGlibGUg
PSAiYXVkaW8tZ3JhcGgtY2FyZCI7IAoKICAgICAgICAgICAgICAgIHdpZGdldHMgPSAKICAgICAg
ICAgICAgICAgICAgICAgICAgIlNwZWFrZXIiLCAiTG91ZHNwZWFrZXIiLCAKICAgICAgICAgICAg
ICAgICAgICAgICAgIkhlYWRwaG9uZSIsICJIZWFkcGhvbmUgSmFjayIsIAogICAgICAgICAgICAg
ICAgICAgICAgICAiTWljcm9waG9uZSIsICJJbnRlcm5hbCBNaWMiLCAKCiAgICAgICAgICAgICAg
ICByb3V0aW5nID0gCiAgICAgICAgICAgICAgICAgICAgICAgICJIZWFkcGhvbmUgSmFjayIsICJI
UE9VVEwiLCAKICAgICAgICAgICAgICAgICAgICAgICAgIkhlYWRwaG9uZSBKYWNrIiwgIkhQT1VU
UiIsIAogICAgICAgICAgICAgICAgICAgICAgICAiQW1wbGlmaWVyIiwgIkxJTkVPVVRMIiwKICAg
ICAgICAgICAgICAgICAgICAgICAgIkFtcGxpZmllciIsICJMSU5FT1VUUiIsCiAgICAgICAgICAg
ICAgICAgICAgICAgICJMb3Vkc3BlYWtlciIsICJBbXBsaWZpZXIiLAogICAgICAgICAgICAgICAg
ICAgICAgICAiSU4xTCIsICJNSUNCSUFTIiwKICAgICAgICAgICAgICAgICAgICAgICAgIklOMUwi
LCAiSW50ZXJuYWwgTWljIjsKCiAgICAgICAgICAgICAgICBkYWlzID0gPCZzc2MwX3BvcnQ+Owog
ICAgICAgIH07Cn07CgomaTJjMSB7CiAgICAgICAgc3RhdHVzID0gIm9rYXkiOwoKICAgICAgICB3
bTg5MDQ6IGFjb2RlY0AxYSB7CiAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIndsZix3bTg5
MDQiOwogICAgICAgICAgICAgICAgcmVnID0gPDB4MWE+OwogICAgICAgICAgICAgICAgY2xvY2tz
ID0gPCZydGNfMzJrPjsKICAgICAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gIm1jbGsiOwogICAg
ICAgICAgICAgICAgaW50ZXJydXB0cy1leHRlbmRlZCA9IDwmcGlvQSBQSU5fUEIzIElSUV9UWVBF
X0xFVkVMX0hJR0g+OwoKICAgICAgICAgICAgICAgICNzb3VuZC1kYWktY2VsbHMgPSA8MD47Cgog
ICAgICAgICAgICAgICAgY29kZWNfcG9ydDogcG9ydCB7ICAgICAgICAgCiAgICAgICAgICAgICAg
ICAgICAgICAgIGNvZGVjX2VwOiBlbmRwb2ludCB7CiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZzc2MwX2VwPjsKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBkYWktZm9ybWF0ID0gImxlZnRfaiI7CiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgYml0Y2xvY2stbWFzdGVyOwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGZyYW1lLW1hc3RlcjsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtY2xrLWZzID0g
PDI1Nj47CiAgICAgICAgICAgICAgICAgICAgICAgIH07CiAgICAgICAgICAgICAgICB9OwogICAg
ICAgIH07Cn07Cgomc3NjMCB7CiAgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKICAg
ICAgICBwaW5jdHJsLTAgPSA8JnBpbmN0cmxfc3NjMF9kZWZhdWx0PjsKICAgICAgICBzdGF0dXMg
PSAib2theSI7CgogICAgICAgIGF0bWVsLHNoYXJlZC1mcy1waW47CiAgICAgICAgI3NvdW5kLWRh
aS1jZWxscyA9IDwwPjsKCiAgICAgICAgc3NjMF9wb3J0OiBwb3J0IHsKICAgICAgICAgICAgICAg
IHNzYzBfZXA6IGVuZHBvaW50IHsKICAgICAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBv
aW50ID0gPCZjb2RlY19lcD47CiAgICAgICAgICAgICAgICB9OwogICAgICAgIH07Cn07CgoKTWlj
aGHFgiBNaXJvc8WCYXcgKDIpOgogIEFTb0M6IHdtODkwNDogcmV3b3JrIEZMTCBoYW5kbGluZwog
IEFTb0M6IHdtODkwNDogYXV0b21hdGljYWxseSBjaG9vc2UgY2xvY2sgc291cmNlCgogLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvc291bmQvd204OTA0LnR4dCAgICAgIHwgICA0ICsKIHNvdW5kL3Nv
Yy9hdG1lbC9hdG1lbF93bTg5MDQuYyAgICAgICAgICAgICAgICB8ICAxMSArLQogc291bmQvc29j
L2NvZGVjcy9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgIHwgICA0ICsKIHNvdW5kL3NvYy9j
b2RlY3MvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICB8ICAgMiArCiBzb3VuZC9zb2MvY29k
ZWNzL3dtODkwNC5jICAgICAgICAgICAgICAgICAgICAgfCA0OTQgKysrKysrLS0tLS0tLS0tLS0t
CiBzb3VuZC9zb2MvY29kZWNzL3dtODkwNC5oICAgICAgICAgICAgICAgICAgICAgfCAgIDUgLQog
c291bmQvc29jL2NvZGVjcy93bV9mbGwuYyAgICAgICAgICAgICAgICAgICAgIHwgMzM5ICsrKysr
KysrKysrKwogc291bmQvc29jL2NvZGVjcy93bV9mbGwuaCAgICAgICAgICAgICAgICAgICAgIHwg
IDI2ICsKIDggZmlsZXMgY2hhbmdlZCwgNTMxIGluc2VydGlvbnMoKyksIDM1NCBkZWxldGlvbnMo
LSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBzb3VuZC9zb2MvY29kZWNzL3dtX2ZsbC5jCiBjcmVhdGUg
bW9kZSAxMDA2NDQgc291bmQvc29jL2NvZGVjcy93bV9mbGwuaAoKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWls
aW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNh
LXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
