Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F742258C0
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jul 2020 09:38:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0838844;
	Mon, 20 Jul 2020 09:37:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0838844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595230720;
	bh=coVCcEB0Ome5TFv/yh7Tq+cyWe8fdCk/gB0AfUjgtZ4=;
	h=Subject:From:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=j52FIXi6csqc+9/kYnAYmrc6JRuPUEfknewI1bLZufxhJfRX74WYN96drVRb24zCZ
	 b9mjGGPwAym3qoXWzkrTUbsj81rWW8/XaH/xs7rI9qZFtFnpljDytTzzo7rOEImEt4
	 zl4WXyPS1y4/n9ooeyA/wUpEyARc5PF7KKPRoTyE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01F73F802C4;
	Mon, 20 Jul 2020 09:34:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09573F8016F; Sat, 18 Jul 2020 16:57:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 MISSING_MID,RDNS_DYNAMIC,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from qq.com (out203-205-221-249.mail.qq.com [203.205.221.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 390D0F8014C
 for <alsa-devel@alsa-project.org>; Sat, 18 Jul 2020 16:57:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 390D0F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="zWpFRVa6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1595084199; bh=DCgSq9pEwVHUYszd9MLQsC8i8Dkpw2H8+7P/BACNV2w=;
 h=Subject:From:Cc:To:Date;
 b=zWpFRVa6mxWAgJra1Gi+HVN8YbNjlyZ+ZqCfnstrfsnnbsagmhtiP1cB/0NIl3lj6
 k4t3ZXcFQ2AqjTbcwbscN3KwTbdv22+GE6zioylgkNmG8tSWc7wtQT2bcqFiDAOc+e
 x7pC2g+IiFV3cGGKaMsxiUHGEymMrPNtyU+e7VoY=
Received: from localhost ([219.145.34.93])
 by newxmesmtplogicsvrszc8.qq.com (NewEsmtp) with SMTP
 id E0224AE3; Sat, 18 Jul 2020 22:56:02 +0800
X-QQ-mid: xmsmtpt1595084162tj2lmcn5l
Messag-ID: <tencent_CB757578310155A0CF414761AD3843CC9E0A@qq.com>
X-QQ-XMAILINFO: MJbzIFWCh68vVL7NkW7oUKwNdMt9CvugGOKGpd0Wt23zEvRYHRxZdzzNp/kdZJ
 ugMI2DM3CGeZlrYiCjTYHZtZfjhs47sC87MMPlq0bj9ZqBmidi8vNj+VNkt//v068uH4oKl43y4I
 pNeteQ6dUc7cBWa7U/XbjFy2mJhchBVEnjPsXO+KP2XXqC68Hm8+HVBnqK91sAYZgjkHejLkT8vs
 S5ufe1Hj6oRxsu8v0wFkz5CxQ/HA9kaAucwSIrbtsPc3nVEJICFOFjfWuYUJ95Dcr7s/xqiLjkwm
 /BtGthdMCJ84WTcCTvSHklAk4YNYDtGxrQj4E7DJBu8gnXfn+T7xfGKyZBm+fSatVztJ8yNjbvDH
 v4/bm2fjYlZeQLafZroxI6QELcxLoqBQ8NuS2KeDoG/Qbc/3y7rrPHfFLRWPqaBt9ij8pcFE13ja
 p5vapxrmspbufiTQ2ar2B1O5MjZLmP06tsebcgz3cFhlhis1C922GQribaUXyUlFTRl9moFZi/pk
 x/6eFYBuMgf75AyGrYk4bK+hW5AMOEJNv84yYVQj75wubyOO8jNtv8wdo8n1/HQCbFysAB0dCRDy
 ajG7kR2Q59dM8wIyh0Grpj8hvtcUXJtLh7hxIUWWLaErVdvwg6wm53zcvkT0WvJw+Y9Z38qHz2sy
 cQxw2f79b08rLbdqAMasqOSDOTk6/pZmI3Oi64Lr2H+MrzDNWrYpT5UdQKSpJpEKUEsjUhV+LNVQ
 WHQq/B7xFfEsIHozHfQTbb3cY6QclDayOGRuuW7yzSkcXGFYMh/V12vSy7AHTT6p2S
Subject: [PATCH] ASoC: soc-jack: calling snd_soc_jack_report causes a null
 pointer access
From: mnlife <178316538@qq.com>
To: lgirdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 open list <linux-kernel@vger.kernel.org>, mnlife qiao <mnlife@foxmail.com>,
 alsa-devel <alsa-devel@alsa-project.org>
Date: Sat, 18 Jul 2020 22:56:01 +0800
MIME-Version: 1.0
X-Priority: 3
X-OQ-MSGID: <1595083783859.spo1p3mpmusubtqmg122sc05@android.mail.163.com>
X-CUSTOM-MAIL-MASTER-SENT-ID: MailMasterAndroid-9157-1595084160290-29ad05e9-077d-4748-b098-3c9d378b36a0
Content-Type: multipart/mixed;
 boundary="__MESSAGE_BODY_PART__1_5225840673225486787"
Message-Id: <20200718145743.09573F8016F@alsa1.perex.cz>
X-Mailman-Approved-At: Mon, 20 Jul 2020 09:34:10 +0200
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "nmlife.qiao@gmail.com" <nmlife.qiao@gmail.com>,
 mnlife qiao <mnlife@foxmail.com>
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

--__MESSAGE_BODY_PART__1_5225840673225486787
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

RnJvbTogbW5saWZlIDxtbmxpZmVAZm94bWFpbC5jb20+IFdoZW4gc25kX3NvY19jYXJkX2phY2tf
bmV3IGlzIG5vdCBjYWxsZWQgb3IgdGhlIGNhbGwgZmFpbHMsIGNhbGxpbmcgdGhpcyBmdW5jdGlv
biBjYXVzZXMgYSBudWxsIHBvaW50ZXIgYWNjZXNzIFNpZ25lZC1vZmYtYnk6IG1ubGlmZSA8bW5s
aWZlQGZveG1haWwuY29tPiAtLS0gc291bmQvc29jL3NvYy1qYWNrLmMgfCAyICstIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKSBkaWZmIC0tZ2l0IGEvc291bmQv
c29jL3NvYy1qYWNrLmMgYi9zb3VuZC9zb2Mvc29jLWphY2suYyBpbmRleCAwZjE4MjBmMzZiNGQu
LjUxYjc5OWVlOThiNyAxMDA2NDQgLS0tIGEvc291bmQvc29jL3NvYy1qYWNrLmMgKysrIGIvc291
bmQvc29jL3NvYy1qYWNrLmMgQEAgLTQ0LDcgKzQ0LDcgQEAgdm9pZCBzbmRfc29jX2phY2tfcmVw
b3J0KHN0cnVjdCBzbmRfc29jX2phY2sgKmphY2ssIGludCBzdGF0dXMsIGludCBtYXNrKSDCoCDC
oCDCoHVuc2lnbmVkIGludCBzeW5jID0gMDsgwqAgwqAgwqBpbnQgZW5hYmxlOyAtwqAgwqAgwqBp
ZiAoIWphY2spICvCoCDCoCDCoGlmICghamFjayB8fCAhamFjay0+amFjaykgwqAgwqAgwqDCoCDC
oCDCoHJldHVybjsgwqAgwqAgwqB0cmFjZV9zbmRfc29jX2phY2tfcmVwb3J0KGphY2ssIG1hc2ss
IHN0YXR1cyk7IC0tIDIuMTcuMSAu

--__MESSAGE_BODY_PART__1_5225840673225486787
Content-Type: text/x-diff;
 name="0001-ASoC-soc-jack-calling-snd_soc_jack_report-causes-a-n.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ASoC-soc-jack-calling-snd_soc_jack_report-causes-a-n.patch"

RnJvbSAxY2Q2ZWQ4Y2QxYzg1MThkNmJkMzBiZGMwYjFjZjk5OGEzYWJlMzJkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBtbmxpZmUgPG1ubGlmZUBmb3htYWlsLmNvbT4KRGF0ZTogRnJp
LCAxMCBKdWwgMjAyMCAyMTozMTowOCArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIEFTb0M6IHNvYy1q
YWNrOiBjYWxsaW5nIHNuZF9zb2NfamFja19yZXBvcnQgY2F1c2VzIGEgbnVsbAogcG9pbnRlciBh
Y2Nlc3MKQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PSJ1dGYtOCIKCldoZW4gc25k
X3NvY19jYXJkX2phY2tfbmV3IGlzIG5vdCBjYWxsZWQgb3IgdGhlIGNhbGwgZmFpbHMsCmNhbGxp
bmcgdGhpcyBmdW5jdGlvbiBjYXVzZXMgYSBudWxsIHBvaW50ZXIgYWNjZXNzCgpTaWduZWQtb2Zm
LWJ5OiBtbmxpZmUgPG1ubGlmZUBmb3htYWlsLmNvbT4KLS0tCiBzb3VuZC9zb2Mvc29jLWphY2su
YyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9zb2MtamFjay5jIGIvc291bmQvc29jL3NvYy1qYWNrLmMK
aW5kZXggMGYxODIwZjM2YjRkLi41MWI3OTllZTk4YjcgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9z
b2MtamFjay5jCisrKyBiL3NvdW5kL3NvYy9zb2MtamFjay5jCkBAIC00NCw3ICs0NCw3IEBAIHZv
aWQgc25kX3NvY19qYWNrX3JlcG9ydChzdHJ1Y3Qgc25kX3NvY19qYWNrICpqYWNrLCBpbnQgc3Rh
dHVzLCBpbnQgbWFzaykKIAl1bnNpZ25lZCBpbnQgc3luYyA9IDA7CiAJaW50IGVuYWJsZTsKIAot
CWlmICghamFjaykKKwlpZiAoIWphY2sgfHwgIWphY2stPmphY2spCiAJCXJldHVybjsKIAl0cmFj
ZV9zbmRfc29jX2phY2tfcmVwb3J0KGphY2ssIG1hc2ssIHN0YXR1cyk7CiAKLS0gCjIuMTcuMQoK

--__MESSAGE_BODY_PART__1_5225840673225486787--

