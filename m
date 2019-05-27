Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC3A2BB29
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2019 22:12:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CE5417AB;
	Mon, 27 May 2019 22:11:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CE5417AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558987928;
	bh=07KB7gWiiBQ+nH0XRnGQxirGZ/oB8mUPWbI8x4vFy5A=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sbt0tU/KcK/e9jip4CZRG66lvUh57lfZP5+eFNBim3yfV9bd+RLxqp+jGBDYm3ixs
	 uapwapKySaBBVqZkY56oTSdUdxz2aWUrJrDqrMv4iTpwc+zsL4AReWa+EF0SvpLpMA
	 f6ARJ0v6zNvfKlw0f+C7T0bu5vUsODOg6MQZz3t8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AA0FF896F8;
	Mon, 27 May 2019 22:10:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 482ABF896E4; Mon, 27 May 2019 22:10:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F1C3F8065A
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 22:10:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F1C3F8065A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GZKzgwTs"
Received: by mail-wr1-x442.google.com with SMTP id r7so17846281wrr.13
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 13:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IDHZvbW5fijbJYqS49AHo5wrH49+8LRhFk5frtH+czs=;
 b=GZKzgwTsjl8oDnFeiCt7vuI5aKIZrQGAleaeM2RbFDLBcE9pCZz3wszFrErQsWBnev
 xSbVzEZkH2YIhlzU20dYu8H/77rmwr3ucbJ/J1cuUJlE5C0VAX9rBpt20D39GCFY75wf
 lYEKs/3NJdkjm+UP7hWIbHgH3wOipDJei5ZPnkCCbmVcVCYIekcFrMo+w26484791vB+
 7KFRFV3gUpScnOmLUqx2fD8JRCpt3zN9HWJLpQ9sauIyM17VnROccWPEBmyao3iCoWDd
 sGOip2GMuXO9TSwCmuU+AHhg4P4He2itS162rxpyd9g6ZhUghIQmqJcRDcocS3sgVhqY
 sA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IDHZvbW5fijbJYqS49AHo5wrH49+8LRhFk5frtH+czs=;
 b=BLPnyY61yFyf9ADsb2iFT6/sNW1C/dWBiTGNB/M/M4BUeMQ8cRHDqLILhwKoSXYhoY
 bkXNvDK2IWLY2acPKyPK27WwfZZd5tqeFy2qyRA2o9De87m8/V0q3bfmx2Up+vOzVqQw
 UpvDGjWjoufq2jgBVRZhUZoWVAMtDdqGq8hjGzaEDMfZ7VOMRHT4Dm9mTEzL9CnHY5bW
 +/VcC4mUc8wJ+eWVds7E5Pt6ZRlnbsMy1xK38VKA6ZDXDtY/wF9VzqARKkW9reF64TtJ
 dbXBixA+B/192ncD9vYfRSs/4GmSWMr0VUi46LSDT+6Tju57bWGbDie8Nz9MTr+6iwNZ
 Vs5g==
X-Gm-Message-State: APjAAAXwLiJO+5sbFcVmZs1AeEuFkS8cmxyKtVubVpBU+8Z7GSMnk5lP
 AXZrnO5HQVyS8p3uP7WB09w=
X-Google-Smtp-Source: APXvYqyqpFAqUTi8dpMrKnZvZz7bKtAJFVOE03EyjPbv+ISOjv5Cl5nD4sOql4lDIlCwc/mR9Ktrjg==
X-Received: by 2002:adf:ff88:: with SMTP id j8mr1844331wrr.317.1558987812061; 
 Mon, 27 May 2019 13:10:12 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
 by smtp.gmail.com with ESMTPSA id s127sm308523wmf.48.2019.05.27.13.10.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 May 2019 13:10:11 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 27 May 2019 22:06:20 +0200
Message-Id: <20190527200627.8635-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v4 0/7] Allwinner H6 SPDIF support
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

Kkg2IERNQSBzdXBwb3J0IElTIFJFUVVJUkVEKgoKQWxsd2lubmVyIEg2IFNvQyBoYXMgYSBTUERJ
RiBjb250cm9sbGVyIGNhbGxlZCBPbmUgV2lyZSBBdWRpbyAoT1dBKSB3aGljaAppcyBkaWZmZXJl
bnQgZnJvbSB0aGUgcHJldmlvdXMgSDMgZ2VuZXJhdGlvbiBhbmQgbm90IGNvbXBhdGlibGUuCgpE
aWZmZXJlbmNlIGFyZSBhbiBpbmNyZWFzZSBvZiBmaWZvIHNpemVzLCBzb21lIG1lbW9yeSBtYXBw
aW5nIGFyZSBkaWZmZXJlbnQKYW5kIHRoZXJlIGlzIG5vdyB0aGUgcG9zc2liaWxpdHkgdG8gb3V0
cHV0IHRoZSBtYXN0ZXIgY2xvY2sgb24gYSBwaW4uCgpBY3R1YWxseSBhbGwgdGhlc2UgZmVhdHVy
ZXMgYXJlIHVudXNlZCBhbmQgb25seSBhIGJpdCBmb3IgZmx1c2hpbmcgdGhlIFRYCmZpZm8gaXMg
cmVxdWlyZWQuCgpBbHNvIHRoaXMgc2VyaWVzIHJlcXVpcmVzIHRoZSBETUEgd29ya2luZyBvbiBI
NiwgYSBmaXJzdCB2ZXJzaW9uIGhhcyBiZWVuCnN1Ym1pdHRlZCBieSBKZXJuZWogxaBrcmFiZWNb
MV0gYnV0IGhhcyBub3QgYmVlbiBhY2NlcHRlZCB5ZXQuCgpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsu
a2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LWFybS1rZXJuZWwvbGlzdC8/c2VyaWVzPTg5MDExCgpD
aGFuZ2VzIHNpbmNlIHYzOgogLSByZW5hbWUgcmVnX2ZjdGxfZnR4IHRvIHZhbF9mY3RsX2Z0eAog
LSByZWJhc2UgdGhpcyBzZXJpZXMgb24gc291bmQtbmV4dAogLSBmaXggZHQtYmluZGluZ3MgZHVl
IHRvIGNoYW5nZSBpbiBzb3VuZC1uZXh0CiAtIGNoYW5nZSBub2RlIG5hbWUgc291bmRfc3BkaWYg
dG8gc291bmQtc3BkaWYKCkNoYW5nZXMgc2luY2UgdjI6CiAtIFNwbGl0IHF1aXJrcyBhbmQgSDYg
c3VwcG9ydCBwYXRjaAogLSBBZGQgc3BlY2lmaWMgc2VjdGlvbiBmb3IgcXVpcmtzIGNvbW1lbnQK
CkNoYW5nZXMgc2luY2UgdjE6CiAtIFJlbW92ZSBIMyBjb21wYXRpYmxlCiAtIEFkZCBUWCBmaWZv
IGJpdCBmbHVzaCBxdWlya3MKIC0gQWRkIEg2IGJpbmRpbmdzIGluIFNQRElGIGRyaXZlcgoKQ2zD
qW1lbnQgUMOpcm9uICg3KToKICBkdC1iaW5kaW5nczogc291bmQ6IHN1bjRpLXNwZGlmOiBBZGQg
QWxsd2lubmVyIEg2IGNvbXBhdGlibGUKICBBU29DOiBzdW40aS1zcGRpZjogTW92ZSBxdWlya3Mg
dG8gdGhlIHRvcAogIEFTb0M6IHN1bjRpLXNwZGlmOiBBZGQgVFggZmlmbyBiaXQgZmx1c2ggcXVp
cmtzCiAgQVNvQzogc3VuNGktc3BkaWY6IEFkZCBzdXBwb3J0IGZvciBINiBTb0MKICBhcm02NDog
ZHRzOiBhbGx3aW5uZXI6IEFkZCBTUERJRiBub2RlIGZvciBBbGx3aW5uZXIgSDYKICBhcm02NDog
ZHRzOiBhbGx3aW5uZXI6IGg2OiBFbmFibGUgU1BESUYgZm9yIEJlZWxpbmsgR1MxCiAgYXJtNjQ6
IGRlZmNvbmZpZzogRW5hYmxlIFN1bjRpIFNQRElGIG1vZHVsZQoKIC4uLi9zb3VuZC9hbGx3aW5u
ZXIsc3VuNGktYTEwLXNwZGlmLnlhbWwgICAgICB8ICAxICsKIC4uLi9kdHMvYWxsd2lubmVyL3N1
bjUwaS1oNi1iZWVsaW5rLWdzMS5kdHMgICB8ICA0ICsrCiBhcmNoL2FybTY0L2Jvb3QvZHRzL2Fs
bHdpbm5lci9zdW41MGktaDYuZHRzaSAgfCAzOCArKysrKysrKysrKysrKwogYXJjaC9hcm02NC9j
b25maWdzL2RlZmNvbmZpZyAgICAgICAgICAgICAgICAgIHwgIDEgKwogc291bmQvc29jL3N1bnhp
L3N1bjRpLXNwZGlmLmMgICAgICAgICAgICAgICAgIHwgNDkgKysrKysrKysrKysrKysrKy0tLQog
NSBmaWxlcyBjaGFuZ2VkLCA4NyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxz
YS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8v
bWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
