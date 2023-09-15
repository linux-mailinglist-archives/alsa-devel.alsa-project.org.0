Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 878CD7A1724
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 09:18:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04952846;
	Fri, 15 Sep 2023 09:18:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04952846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694762333;
	bh=AdG46M455u51ofYccz2tBGaCIgY+4nNmFbLn8HuNc50=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jGenmgEYGTS9pGKvnjWDQ0pxNt27zglJa4Tbz2JmHQ09Dnf9mwwzLUpmnGBJdTlqv
	 aPTBcPgT0zZ1s5XCmD2oWUMGVJYm/QuRuvciPRq8QDTRvyqEa4nvHTQbiRzqcOXKs4
	 5ddeK951u6N/CT3ckUq75DpeE9fNCgkvdvWj3sDI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6ED33F80141; Fri, 15 Sep 2023 09:18:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3052AF80246;
	Fri, 15 Sep 2023 09:18:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBFC5F80425; Fri, 15 Sep 2023 09:17:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39EF9F801F5
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 09:17:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39EF9F801F5
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 38F7HU3o82258100,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.92/5.92) with ESMTPS id 38F7HU3o82258100
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Sep 2023 15:17:30 +0800
Received: from RTEXMBS06.realtek.com.tw (172.21.6.99) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Fri, 15 Sep 2023 15:16:44 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Fri, 15 Sep 2023 15:16:43 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::9cb8:8d5:b6b3:213b]) by
 RTEXMBS01.realtek.com.tw ([fe80::9cb8:8d5:b6b3:213b%5]) with mapi id
 15.01.2375.007; Fri, 15 Sep 2023 15:16:43 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: Lenovo ThinkCentre M70q pop noise
Thread-Topic: Lenovo ThinkCentre M70q pop noise
Thread-Index: AdnnpGORWUtxBbJkQV6ky4vW/lO5LA==
Date: Fri, 15 Sep 2023 07:16:43 +0000
Message-ID: <315900e2efef42fd9855eacfeb443abd@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-originating-ip: [172.22.102.106]
x-kse-serverinfo: RTEXMBS06.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: multipart/mixed;
	boundary="_002_315900e2efef42fd9855eacfeb443abdrealtekcom_"
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: MXR5WGBQWSTJXOGSXHIJJOR43VYFITIZ
X-Message-ID-Hash: MXR5WGBQWSTJXOGSXHIJJOR43VYFITIZ
X-MailFrom: kailang@realtek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MXR5WGBQWSTJXOGSXHIJJOR43VYFITIZ/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_315900e2efef42fd9855eacfeb443abdrealtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Attach was a patch for solving boot up pop noise.

BR,
Kailang

--_002_315900e2efef42fd9855eacfeb443abdrealtekcom_
Content-Type: application/octet-stream; name="0000-dis-power-save.patch"
Content-Description: 0000-dis-power-save.patch
Content-Disposition: attachment; filename="0000-dis-power-save.patch";
	size=1043; creation-date="Wed, 06 Sep 2023 23:27:26 GMT";
	modification-date="Fri, 15 Sep 2023 07:13:23 GMT"
Content-Transfer-Encoding: base64

RnJvbSA4ODAxOGQxMWI1NGY1M2FiNjRiOTc5NTg0Y2E0YjlmY2I0NmI2ZTQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFRodSwgNyBTZXAgMjAyMyAxNToyNDozNCArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIEFMU0E6
IGhkYS9yZWFsdGVrIC0gRGlzYWJsZSBwb3dlciBzYXZlIGZvciBzb2x2aW5nIHBvcCBpc3N1ZQoK
TGVub3ZvIFRoaW5rQ2VudHJlIE03MHEgaGFkIGJvb3QgdXAgcG9wIG5vaXNlLgpEaXNhYmxlIHBv
d2VyIHNhdmUgd2lsbCBzb2x2ZSBwb3AgaXNzdWUuCgpTaWduZWQtb2ZmLWJ5OiBLYWlsYW5nIFlh
bmcgPGthaWxhbmdAcmVhbHRlay5jb20+CmRpZmYgLS1naXQgYS9zb3VuZC9wY2kvaGRhL2hkYV9p
bnRlbC5jIGIvc291bmQvcGNpL2hkYS9oZGFfaW50ZWwuYwppbmRleCA3NjVkOTVlNzk4NjEuLmMw
NzVhMmQ5ZjFmYSAxMDA2NDQKLS0tIGEvc291bmQvcGNpL2hkYS9oZGFfaW50ZWwuYworKysgYi9z
b3VuZC9wY2kvaGRhL2hkYV9pbnRlbC5jCkBAIC0yMjExLDYgKzIyMTEsNyBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IHNuZF9wY2lfcXVpcmsgcG93ZXJfc2F2ZV9kZW55bGlzdFtdID0gewogCVNORF9Q
Q0lfUVVJUksoMHg4MDg2LCAweDIwNjgsICJJbnRlbCBOVUM3aTNCTkIiLCAwKSwKIAkvKiBodHRw
czovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTE5ODYxMSAqLwogCVNORF9Q
Q0lfUVVJUksoMHgxN2FhLCAweDIyMjcsICJMZW5vdm8gWDEgQ2FyYm9uIDNyZCBHZW4iLCAwKSwK
KwlTTkRfUENJX1FVSVJLKDB4MTdhYSwgMHgzMTZlLCAiTGVub3ZvIFRoaW5rQ2VudHJlIE03MHEi
LCAwKSwKIAkvKiBodHRwczovL2J1Z3ppbGxhLnJlZGhhdC5jb20vc2hvd19idWcuY2dpP2lkPTE2
ODk2MjMgKi8KIAlTTkRfUENJX1FVSVJLKDB4MTdhYSwgMHgzNjdiLCAiTGVub3ZvIElkZWFDZW50
cmUgQjU1MCIsIDApLAogCS8qIGh0dHBzOi8vYnVnemlsbGEucmVkaGF0LmNvbS9zaG93X2J1Zy5j
Z2k/aWQ9MTU3Mjk3NSAqLwo=

--_002_315900e2efef42fd9855eacfeb443abdrealtekcom_--
