Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AD812474B
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 13:53:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D331165E;
	Wed, 18 Dec 2019 13:52:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D331165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576673619;
	bh=yNm3172+EoUG7fAnIH2hogCNl6U86TXLQ1khapsLJ9I=;
	h=To:From:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jUABNsFImdfATq7HVS4dFVMlmAqZNHMkQDItfTvzZakjLJvEjJwJ8cXlXpSsLmx4o
	 oM0ZqGhG1Egroirzc92tfPu0QYDdn31BswW4SY9ikCaATEtKpMXaMUqIgZ20Q+ZhXz
	 aJYlOVfbuwguxrP0+DbteVmJEc76EK381pJGagBk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E618F80255;
	Wed, 18 Dec 2019 13:51:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37555F8022C; Wed, 18 Dec 2019 13:51:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54294F80059
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 13:51:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54294F80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="nAKkVnO2"
Received: by mail-pl1-x62a.google.com with SMTP id f20so941240plj.5
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 04:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=FMyD/MSNBBcC50DW1kZoGY+MZ7/XSIpSWlAzw7z2Gug=;
 b=nAKkVnO2bx3KrwBfj56Elor9wqVHO6jodhd/FOFJKacDC7l0XAoQrxBs9MfazgF/AV
 EKEigUJZi/3afJMLyRehUQ06HTvgKYwi5p1l7WVzxbNzetGkY1IpZirTYWxc1goN4Eat
 KGeGTFnuQEINBdTdDGTjAwwofiHqPjfEtgs6VSqL/OKZ5xtZtCRKRAVQTN7F73dhKlxP
 cPNO3GBbsxtlp5BxgTtRo1QOoqLv1PhXvz53+TQWGdRlQ2x+qE8B6uKNfWOsWVqJr3Sf
 wuD97upmUsnAUkGvtufIMP3E5znuJhi8L5L/bePaqCTp41DN5UxQRI3XJD/BtCB13lb5
 IAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=FMyD/MSNBBcC50DW1kZoGY+MZ7/XSIpSWlAzw7z2Gug=;
 b=JL3B/N873hle8EnGdLXVtcslE9g4CH/A3s04eeDe1bApbczw2w+LO3+PunW/mqnS81
 Ai//e1Fziu8Qf0+g76we7Jag5IqTHxSnb2y4tVgW1dCwrdsV9wgXZClmtn8xYY6B3Zw4
 Dja9mgvj44e4p+X7IxMK6Falecg0LrUFa9Q717iwdC7cejn92JnxDzjE8Mh/0AyET1bf
 naj2pCzv+2LN+R+z3/sSQvEkeBQMyCYRYwHn+fMeQ9CkOf0TKXltvlpZKlfidzYKnQk/
 FDEDHZU6EwqMOFU0DJh7v2fHiZwgDr/2TLzV8J7JKn0kqIQbFbyIA+2KQjeVE4HrisqI
 qm4A==
X-Gm-Message-State: APjAAAWftkE1G0J6yBuD2bW7bhCd5xM4j2nKHI9MrB+bvz3ONgS7+WXZ
 4FM8DgvlxdHtdYJX+OkVFDA=
X-Google-Smtp-Source: APXvYqxSw2W89Z1ed38sk+l/HZwuj1/iISIxcDi+mToLA+B8DJ8+lORbUmCuM7OZ4G31ALZIWr8a/w==
X-Received: by 2002:a17:902:8649:: with SMTP id
 y9mr2607392plt.67.1576673503966; 
 Wed, 18 Dec 2019 04:51:43 -0800 (PST)
Received: from ?IPv6:2402:f000:1:1501:200:5efe:166.111.139.103?
 ([2402:f000:1:1501:200:5efe:a66f:8b67])
 by smtp.gmail.com with ESMTPSA id z13sm2920796pjz.15.2019.12.18.04.51.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Dec 2019 04:51:43 -0800 (PST)
To: arnaud.pouliquen@st.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
From: Jia-Ju Bai <baijiaju1990@gmail.com>
Message-ID: <739176c9-d889-0093-129c-25ff9c57b63b@gmail.com>
Date: Wed, 18 Dec 2019 20:51:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, LKML <linux-kernel@vger.kernel.org>
Subject: [alsa-devel] [BUG] ALSA: soc: sti: a possible
 sleep-in-atomic-context bug in uni_player_ctl_iec958_put()
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

VGhlIGRyaXZlciBtYXkgc2xlZXAgd2hpbGUgaG9sZGluZyBhIHNwaW5sb2NrLgpUaGUgZnVuY3Rp
b24gY2FsbCBwYXRoIChmcm9tIGJvdHRvbSB0byB0b3ApIGluIExpbnV4IDQuMTkgaXM6Cgpzb3Vu
ZC9zb2Mvc3RpL3VuaXBlcmlmX3BsYXllci5jLCAyMjk6CiDCoMKgwqAgbXV0ZXhfbG9jayBpbiB1
bmlfcGxheWVyX3NldF9jaGFubmVsX3N0YXR1cwpzb3VuZC9zb2Mvc3RpL3VuaXBlcmlmX3BsYXll
ci5jLCA2MDg6CiDCoMKgwqAgdW5pX3BsYXllcl9zZXRfY2hhbm5lbF9zdGF0dXMgaW4gdW5pX3Bs
YXllcl9jdGxfaWVjOTU4X3B1dApzb3VuZC9zb2Mvc3RpL3VuaXBlcmlmX3BsYXllci5jLCA2MDM6
CiDCoMKgwqAgX3Jhd19zcGluX2xvY2tfaXJxc2F2ZSBpbiB1bmlfcGxheWVyX2N0bF9pZWM5NThf
cHV0CgptdXRleF9sb2NrKCkgY2FuIHNsZWVwIGF0IHJ1bnRpbWUuCgpJIGFtIG5vdCBzdXJlIGhv
dyB0byBwcm9wZXJseSBmaXggdGhpcyBwb3NzaWJsZSBidWcsIHNvIEkgb25seSByZXBvcnQgaXQu
CgpUaGlzIGJ1ZyBpcyBmb3VuZCBieSBhIHN0YXRpYyBhbmFseXNpcyB0b29sIFNUQ2hlY2sgd3Jp
dHRlbiBieSBteXNlbGYuCgoKQmVzdCB3aXNoZXMsCkppYS1KdSBCYWkKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QK
QWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
