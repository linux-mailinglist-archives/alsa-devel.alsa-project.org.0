Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 352B32C6035
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Nov 2020 07:47:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3AED1815;
	Fri, 27 Nov 2020 07:46:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3AED1815
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606459659;
	bh=Pt+V+h665Voq/3VdzVFpUSUAsYn5q/wqxS+SWE43RwI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=trd1fFBmGGmGPvdSjGr4t+iZehA2rM3o2CYPH2Hm35N3N2hLYyPjD1fe4bnLp4wrT
	 fZB9JvR5Y5PpWPDaRYLOoAa4WnVhRr0DdgngTuhBT5vhGW+if5wnRdPQ0RIokHW6Db
	 9+ku8uAatesGlPzzhF4SMF9C9OSgm9gTYreAQDdI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBFE3F80218;
	Fri, 27 Nov 2020 07:46:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C254F8019D; Fri, 27 Nov 2020 07:46:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=PRX_APP_ATTACH, SPF_HELO_NONE, 
 SPF_PASS autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E69EDF800EA
 for <alsa-devel@alsa-project.org>; Fri, 27 Nov 2020 07:45:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E69EDF800EA
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 0AR6jo483014456,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb04.realtek.com.tw[172.21.6.97])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 0AR6jo483014456
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 27 Nov 2020 14:45:50 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXMB04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Fri, 27 Nov 2020 14:45:50 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.36) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 27 Nov 2020 14:45:49 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::513b:ca8:6e55:15a2]) by
 RTEXMBS01.realtek.com.tw ([fe80::513b:ca8:6e55:15a2%8]) with mapi id
 15.01.2106.003; Fri, 27 Nov 2020 14:45:49 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
Subject: new codec support of ALC897
Thread-Topic: new codec support of ALC897
Thread-Index: AdbEiMRfUeQc6GRDQsC/S9vHMGOxbg==
Date: Fri, 27 Nov 2020 06:45:49 +0000
Message-ID: <3b00520f304842aab8291eb8d9191bd8@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.96]
Content-Type: multipart/mixed;
 boundary="_002_3b00520f304842aab8291eb8d9191bd8realtekcom_"
MIME-Version: 1.0
Cc: " \(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
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

--_002_3b00520f304842aab8291eb8d9191bd8realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Attach was the enable patch for ALC897.

BR,
Kailang

--_002_3b00520f304842aab8291eb8d9191bd8realtekcom_
Content-Type: application/octet-stream; name="0000-alc897-support.patch"
Content-Description: 0000-alc897-support.patch
Content-Disposition: attachment; filename="0000-alc897-support.patch";
	size=1216; creation-date="Fri, 27 Nov 2020 06:42:43 GMT";
	modification-date="Fri, 27 Nov 2020 06:43:53 GMT"
Content-Transfer-Encoding: base64

RnJvbSA3ZDYyNjU0NzQxNDRkNzdmM2Y4Zjc0YTM5ZjEwODFjOTRlNTIzNzFhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IEZyaSwgMjcgTm92IDIwMjAgMTQ6Mzk6MjMgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIEFkZCBuZXcgY29kZWMgc3VwcG9ydGVkIGZvciBBTEM4OTcKCkVuYWJs
ZSBuZXcgY29kZWMgc3VwcG9ydGVkIGZvciBBTEM4OTcuCgpTaWduZWQtb2ZmLWJ5OiBLYWlsYW5n
IFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CmRpZmYgLS1naXQgYS9zb3VuZC9wY2kvaGRhL3Bh
dGNoX3JlYWx0ZWsuYyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCmluZGV4IDM0YWQy
NGQyYzk3MC4uZmNkMWZiMThlY2U5IDEwMDY0NAotLS0gYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3Jl
YWx0ZWsuYworKysgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwpAQCAtNDQ2LDYgKzQ0
Niw3IEBAIHN0YXRpYyB2b2lkIGFsY19maWxsX2VhcGRfY29lZihzdHJ1Y3QgaGRhX2NvZGVjICpj
b2RlYykKIAkJCWFsY191cGRhdGVfY29lZl9pZHgoY29kZWMsIDB4NywgMTw8NSwgMCk7CiAJCWJy
ZWFrOwogCWNhc2UgMHgxMGVjMDg5MjoKKwljYXNlIDB4MTBlYzA4OTc6CiAJCWFsY191cGRhdGVf
Y29lZl9pZHgoY29kZWMsIDB4NywgMTw8NSwgMCk7CiAJCWJyZWFrOwogCWNhc2UgMHgxMGVjMDg5
OToKQEAgLTEwMjE0LDYgKzEwMjE1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBoZGFfZGV2aWNl
X2lkIHNuZF9oZGFfaWRfcmVhbHRla1tdID0gewogCUhEQV9DT0RFQ19FTlRSWSgweDEwZWMwODg4
LCAiQUxDODg4IiwgcGF0Y2hfYWxjODgyKSwKIAlIREFfQ09ERUNfRU5UUlkoMHgxMGVjMDg4OSwg
IkFMQzg4OSIsIHBhdGNoX2FsYzg4MiksCiAJSERBX0NPREVDX0VOVFJZKDB4MTBlYzA4OTIsICJB
TEM4OTIiLCBwYXRjaF9hbGM2NjIpLAorCUhEQV9DT0RFQ19FTlRSWSgweDEwZWMwODk3LCAiQUxD
ODk3IiwgcGF0Y2hfYWxjNjYyKSwKIAlIREFfQ09ERUNfRU5UUlkoMHgxMGVjMDg5OSwgIkFMQzg5
OCIsIHBhdGNoX2FsYzg4MiksCiAJSERBX0NPREVDX0VOVFJZKDB4MTBlYzA5MDAsICJBTEMxMTUw
IiwgcGF0Y2hfYWxjODgyKSwKIAlIREFfQ09ERUNfRU5UUlkoMHgxMGVjMGIwMCwgIkFMQ1MxMjAw
QSIsIHBhdGNoX2FsYzg4MiksCg==

--_002_3b00520f304842aab8291eb8d9191bd8realtekcom_--
