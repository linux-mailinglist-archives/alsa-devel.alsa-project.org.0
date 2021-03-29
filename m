Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F95834C23C
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Mar 2021 05:34:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22EED1655;
	Mon, 29 Mar 2021 05:33:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22EED1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616988883;
	bh=C30JKT7rHyDnJv8JTTkNh0AM4xyhP8kfaUX/0kcwp1A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lL/aYzQ1rRw5Of32THVDuq0dezhROb2QY4oDjSIrme0c5UPxcwXcGFCUpCWeQ92eV
	 6JYJmWdwEs06DfkPWr+uqxQMEpkB9VSyDqVoI7hox1Id7go4pnMo32IDHv+JJUBs/I
	 J06nqU4t9mPp7KErzjAAq/0DgPhcLhPKWJBaBlg0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67A57F80141;
	Mon, 29 Mar 2021 05:33:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC0D4F80141; Mon, 29 Mar 2021 05:33:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=HTML_MESSAGE,
 MIME_BAD_LINEBREAK,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mxct.zte.com.cn (mx7.zte.com.cn [202.103.147.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18BAFF800B9
 for <alsa-devel@alsa-project.org>; Mon, 29 Mar 2021 05:33:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18BAFF800B9
Received: from mse-fl2.zte.com.cn (unknown [10.30.14.239])
 by Forcepoint Email with ESMTPS id 17FB47B9E187D20EAB8B;
 Mon, 29 Mar 2021 11:32:57 +0800 (CST)
Received: from kjyxapp04.zte.com.cn ([10.30.12.203])
 by mse-fl2.zte.com.cn with SMTP id 12T3WeRd088418;
 Mon, 29 Mar 2021 11:32:40 +0800 (GMT-8)
 (envelope-from wang.yi59@zte.com.cn)
Received: from fox-host8.localdomain (unknown [10.234.72.110])
 by smtp (Zmail) with SMTP; Mon, 29 Mar 2021 11:32:40 +0800
X-Zmail-TransId: 3e8860614a57021-c6673
From: root <wang.yi59@zte.com.cn>
To: perex@perex.cz
Subject: [PATCH] ALSA: core: remove redundant spin_lock pair in
 snd_card_disconnect
Date: Mon, 29 Mar 2021 11:36:47 +0800
Message-Id: <1616989007-34429-1-git-send-email-wang.yi59@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
Mime-Version: 1.0
X-MAIL: mse-fl2.zte.com.cn 12T3WeRd088418
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64 
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: wang.yi59@zte.com.cn, alsa-devel@alsa-project.org, wang.liang82@zte.com.cn,
 tiwai@suse.com, linux-kernel@vger.kernel.org, Jia Zhou <zhou.jia2@zte.com.cn>,
 xue.zhihong@zte.com.cn
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

RnJvbTogSmlhIFpob3UgPHpob3UuamlhMkB6dGUuY29tLmNuPg0KDQptb2RpZmljYXRpb24gaW4g
Y29tbWl0IDJhM2Y3MjIxYWNkZCAoIkFMU0E6IGNvcmU6IEZpeCBjYXJkIHJhY2VzIGJldHdlZW4N
CnJlZ2lzdGVyIGFuZCBkaXNjb25uZWN0IikgcmVzdWx0aW5nIGluIHRoaXMgcHJvYmxlbS4NCg0K
U2lnbmVkLW9mZi1ieTogSmlhIFpob3UgPHpob3UuamlhMkB6dGUuY29tLmNuPg0KU2lnbmVkLW9m
Zi1ieTogWWkgV2FuZyA8d2FuZy55aTU5QHp0ZS5jb20uY24+DQotLS0NCiBzb3VuZC9jb3JlL2lu
aXQuYyB8IDIgLS0NCiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdp
dCBhL3NvdW5kL2NvcmUvaW5pdC5jIGIvc291bmQvY29yZS9pbml0LmMNCmluZGV4IDAxOGNlNGVm
MS4uOWY1MjcwYzkwIDEwMDY0NA0KLS0tIGEvc291bmQvY29yZS9pbml0LmMNCisrKyBiL3NvdW5k
L2NvcmUvaW5pdC5jDQpAQCAtMzkwLDEwICszOTAsOCBAQCBpbnQgc25kX2NhcmRfZGlzY29ubmVj
dChzdHJ1Y3Qgc25kX2NhcmQgKmNhcmQpDQogCQlyZXR1cm4gMDsNCiAJfQ0KIAljYXJkLT5zaHV0
ZG93biA9IDE7DQotCXNwaW5fdW5sb2NrKCZjYXJkLT5maWxlc19sb2NrKTsNCiANCiAJLyogcmVw
bGFjZSBmaWxlLT5mX29wIHdpdGggc3BlY2lhbCBkdW1teSBvcGVyYXRpb25zICovDQotCXNwaW5f
bG9jaygmY2FyZC0+ZmlsZXNfbG9jayk7DQogCWxpc3RfZm9yX2VhY2hfZW50cnkobWZpbGUsICZj
YXJkLT5maWxlc19saXN0LCBsaXN0KSB7DQogCQkvKiBpdCdzIGNyaXRpY2FsIHBhcnQsIHVzZSBl
bmRsZXNzIGxvb3AgKi8NCiAJCS8qIHdlIGhhdmUgbm8gcm9vbSB0byBmYWlsICovDQotLSANCjIu
MTguNA==

