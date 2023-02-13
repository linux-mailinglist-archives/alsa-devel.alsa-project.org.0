Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF97693EE3
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 08:22:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D48A83E;
	Mon, 13 Feb 2023 08:21:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D48A83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676272941;
	bh=T+UrjplORrYkWJtAQiIhrpzBxB2EGE/tYN1lzKxub/c=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZWdXVt5ycyrtnJy3GxIMPGsgnBXe0asUzw/7G7DGBiq0IrSZwSSynMOWGxbPoG6vw
	 ox9xuCWmxwzG1GDWj8G9yYsd8zQkLiCnqg/wfouTti8kjfeGl97+uW0pjFMdAhmn/x
	 FkwYX4+cxfcSq4LbGRGEJpKvHlRFx5Lk17Unbs20=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44EE0F804B0;
	Mon, 13 Feb 2023 08:21:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9110F804B4; Mon, 13 Feb 2023 08:21:25 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 1DC17F80038
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 08:21:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DC17F80038
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 31D7L8f24014769,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 31D7L8f24014769
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Mon, 13 Feb 2023 15:21:08 +0800
Received: from RTEXDAG02.realtek.com.tw (172.21.6.101) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.9; Mon, 13 Feb 2023 15:20:17 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXDAG02.realtek.com.tw (172.21.6.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 13 Feb 2023 15:20:17 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::98d2:65f8:dcdf:fa31]) by
 RTEXMBS01.realtek.com.tw ([fe80::98d2:65f8:dcdf:fa31%5]) with mapi id
 15.01.2375.007; Mon, 13 Feb 2023 15:20:17 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Subject: Fixed GPIO2 value assigned
Thread-Topic: Fixed GPIO2 value assigned
Thread-Index: Adk/eld4jS79g2j4Ss+qnOp+8ESigg==
Date: Mon, 13 Feb 2023 07:20:17 +0000
Message-ID: <8d02bb9ac8134f878cd08607fdf088fd@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.106]
x-kse-serverinfo: RTEXDAG02.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?us-ascii?Q?Clean,_bases:_2023/2/13_=3F=3F_06:00:00?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: multipart/mixed;
	boundary="_002_8d02bb9ac8134f878cd08607fdf088fdrealtekcom_"
MIME-Version: 1.0
Message-ID-Hash: DWWITKHGTFDDH7XU2T5RX46KGVGGRTWH
X-Message-ID-Hash: DWWITKHGTFDDH7XU2T5RX46KGVGGRTWH
X-MailFrom: kailang@realtek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DWWITKHGTFDDH7XU2T5RX46KGVGGRTWH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_8d02bb9ac8134f878cd08607fdf088fdrealtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

This fix was GPIO2 value 0x3 change to 0x4.
GPIO2 GPIO1 GPIO0
  1     0    0    =3D=3D> 0x4 =3D=3D> GPIO2 HIGH

GPIO2 GPIO1 GPIO0
  0     1    1    =3D=3D> 0x3 =3D=3D> GPIO0 and GPIO1 HIGH

BR,
Kailang


--_002_8d02bb9ac8134f878cd08607fdf088fdrealtekcom_
Content-Type: application/octet-stream; name="0000-gpio2-high.patch"
Content-Description: 0000-gpio2-high.patch
Content-Disposition: attachment; filename="0000-gpio2-high.patch"; size=855;
	creation-date="Wed, 18 Jan 2023 08:36:19 GMT";
	modification-date="Mon, 13 Feb 2023 07:09:24 GMT"
Content-Transfer-Encoding: base64

RnJvbSA3NmVjYjZiNDU5N2RhZjJkMDM0YWU3Zjk1NjZmY2U2MTFiYjcyZDcyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IE1vbiwgMTMgRmViIDIwMjMgMTQ6NTQ6MjIgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIGZpeGVkIHdyb25nIGdwaW8gYXNzaWduZWQKCkdQSU8yIFBJTiB1c2Ug
Zm9yIG91dHB1dC4gTWFzayBEaXIgYW5kIERhdGEgbmVlZCB0byBhc3NpZ24gZm9yIDB4NC4gTm90
IDB4My4KVGhpcyBmaXhlZCB3YXMgZm9yIExlbm92byBEZXNrdG9wKDB4MTdhYTEwNTYpLiBHUElP
MiB1c2UgZm9yIEFNUCBlbmFibGUuCgpTaWduZWQtb2ZmLWJ5OiBLYWlsYW5nIFlhbmcgPGthaWxh
bmdAcmVhbHRlay5jb20+CgpkaWZmIC0tZ2l0IGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVr
LmMgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwppbmRleCAxMTM0YTQ5M2QyMjUuLjE0
Yjg0YTFmNDNkMyAxMDA2NDQKLS0tIGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKKysr
IGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKQEAgLTgzMiw3ICs4MzIsNyBAQCBzdGF0
aWMgaW50IGFsY19zdWJzeXN0ZW1faWQoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMsIGNvbnN0IGhk
YV9uaWRfdCAqcG9ydHMpCiAJCQlhbGNfc2V0dXBfZ3Bpbyhjb2RlYywgMHgwMik7CiAJCQlicmVh
azsKIAkJY2FzZSA3OgotCQkJYWxjX3NldHVwX2dwaW8oY29kZWMsIDB4MDMpOworCQkJYWxjX3Nl
dHVwX2dwaW8oY29kZWMsIDB4MDQpOwogCQkJYnJlYWs7CiAJCWNhc2UgNToKIAkJZGVmYXVsdDoK

--_002_8d02bb9ac8134f878cd08607fdf088fdrealtekcom_--
