Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA176C217B
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 20:32:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 282161E0;
	Mon, 20 Mar 2023 20:31:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 282161E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679340728;
	bh=GNMjYfCviVGTEm37uSLHOParFI4RukrwcwnZwEzbcc4=;
	h=Date:From:To:Subject:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mgfCGkzWxoUBK6cx+kSgVGLwYg1pg6RTC+8UAWEdOQcPf/sTWpruRUr40+xIQFX0w
	 Ske+SFlLT2OYotaNdzjqIcoRTKeu2tRRk0sndD7Ab5+Ig0AJaLJkzFBrdCJA9SnnCD
	 X5nycD88Y2b3tz6qAxMV+tMBl3Zdczl43jXx//Ik=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F57AF804B1;
	Mon, 20 Mar 2023 20:30:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38716F8027B; Sun, 19 Mar 2023 11:55:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from m13109.mail.163.com (m13109.mail.163.com [220.181.13.109])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C59CF800C9
	for <alsa-devel@alsa-project.org>; Sun, 19 Mar 2023 11:55:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C59CF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=nQA0bl2Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=dD6MV+G/SIdq94DH+XTmLsRCLPO1iNrIHG2O1jptODM=; b=n
	QA0bl2Zvry7uvhez04VbRZNLxOgTNcNqZhgoRDhtP3nUtWJqCpi1bHG6ZiccwWfz
	Z0cRXebbIPaBYgQfXTDgxGjOkb8E9D1Yoj1hweiilvvOzF38BYWtivm5qBIUQW3o
	eeOjebr2YqjxP2j1xCus8YiWj4Ka7EV5OUfKNPpZKw=
Received: from sensor1010$163.com ( [120.245.132.192] ) by
 ajax-webmail-wmsvr109 (Coremail) ; Sun, 19 Mar 2023 18:55:48 +0800 (CST)
X-Originating-IP: [120.245.132.192]
Date: Sun, 19 Mar 2023 18:55:48 +0800 (CST)
From: lizhe  <sensor1010@163.com>
To: tiwai@suse.de
Subject: Re:Re: [PATCH v5] serial: linflexuart: remove redundant uart type
 assignment
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2023 www.mailtech.cn 163com
In-Reply-To: <ddcf396b-7b91-00f3-8c16-7de5dc891aef@kernel.org>
References: <20230104164311.3788-1-sensor1010@163.com>
 <ddcf396b-7b91-00f3-8c16-7de5dc891aef@kernel.org>
X-NTES-SC: 
 AL_QuycC/6ZvEsv7ieQZOkXn0kShuc8WcC4v/Qv345RP5k0oyvu2gQsY1lmBGPMysmCMRCplj6TYBNFzs9xRoJgWoBNkBqSxfMFpIE06jfOxm9e
MIME-Version: 1.0
Message-ID: <e5498ef.1620.186f982de31.Coremail.sensor1010@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: bcGowACXer006hZk4ngbAA--.35990W
X-CM-SenderInfo: 5vhq20jurqiii6rwjhhfrp/xtbBdAc3q1gi5mvYSQACsL
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-MailFrom: sensor1010@163.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: YYWWFCL4ZRQHTN2NIXBNWXM2OE5CDNPP
X-Message-ID-Hash: YYWWFCL4ZRQHTN2NIXBNWXM2OE5CDNPP
X-Mailman-Approved-At: Mon, 20 Mar 2023 19:30:07 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
CC: tiwai@suse.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YYWWFCL4ZRQHTN2NIXBNWXM2OE5CDNPP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

CgoKSEkgOiAKICAgICAgTXkgbmFtZSBpcyBMaSB6aGUuIGkgYW0gY2hpbmVzZQoKCgoKCgoKCgoK
CgoKCkF0IDIwMjMtMDEtMDUgMTQ6MzI6MDcsICJKaXJpIFNsYWJ5IiA8amlyaXNsYWJ5QGtlcm5l
bC5vcmc+IHdyb3RlOgo+T24gMDQuIDAxLiAyMywgMTc6NDMsIExJWkhFIHdyb3RlOgo+PiBpbiBs
aW5mbGV4X2NvbmZpZ19wb3J0KCkgdGhlIG1lbWJlciB2YXJpYWJsZSB0eXBlIHdpbGwgYmUKPj4g
YXNzaWduZWQgYWdhaW4uIHNlZSBsaW5mbGV4X2Nvbm5maWdfcG9ydCgpCj4KPlBsZWFzZSB1c2Ug
Y2FwaXRhbHMgd2hlbiB5b3Ugc3RhcnQgYSBzZW50ZW5jZS4gQW5kIHBlcmlvZHMgYXQgdGhlIGVu
ZHMgCj5vZiB0aGVtLgo+Cj4+IFNpZ25lZC1vZmYtYnk6IExJWkhFIDxzZW5zb3IxMDEwQDE2My5j
b20+Cj4KPk5vLCBMaXpoZSB3YXMgZmluZSAob3IgdXNlIHlvdXIgQ2hpbmVzZSBuYW1lLiBXZSBz
dXBwb3J0IHVuaWNvZGUgc28gdGhhdCAKPndvdWxkIGJlIGZpbmUgdG9vLCBhcyBHcmVnIHN0YXRl
ZCkuCj4KPkJ1dCB5b3UgZGlkbid0IGluY2x1ZGUgY2hhbmdlbG9nIHRvIHlvdXIgcHJldmlvdXMg
djEtdjQgcGF0Y2hlczsgYXMgCj5zdGF0ZWQgYnkgSWxwby4KPgo+PiBMaW5rOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMjAyMzAxMDMxNzA5NDguMzc3Ny0xLXNlbnNvcjEwMTBAMTYzLmNv
bS8KPj4gLS0tCj4+ICAgZHJpdmVycy90dHkvc2VyaWFsL2ZzbF9saW5mbGV4dWFydC5jIHwgMSAt
Cj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPj4gCj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3R0eS9zZXJpYWwvZnNsX2xpbmZsZXh1YXJ0LmMgYi9kcml2ZXJzL3R0eS9zZXJpYWwv
ZnNsX2xpbmZsZXh1YXJ0LmMKPj4gaW5kZXggNmZjMjFiNjY4NGU2Li4zNDQwMGNjNmFjN2YgMTAw
NjQ0Cj4+IC0tLSBhL2RyaXZlcnMvdHR5L3NlcmlhbC9mc2xfbGluZmxleHVhcnQuYwo+PiArKysg
Yi9kcml2ZXJzL3R0eS9zZXJpYWwvZnNsX2xpbmZsZXh1YXJ0LmMKPj4gQEAgLTgzNyw3ICs4Mzcs
NiBAQCBzdGF0aWMgaW50IGxpbmZsZXhfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKPj4gICAJCXJldHVybiBQVFJfRVJSKHNwb3J0LT5tZW1iYXNlKTsKPj4gICAKPj4gICAJc3Bv
cnQtPmRldiA9ICZwZGV2LT5kZXY7Cj4+IC0Jc3BvcnQtPnR5cGUgPSBQT1JUX0xJTkZMRVhVQVJU
Owo+PiAgIAlzcG9ydC0+aW90eXBlID0gVVBJT19NRU07Cj4+ICAgCXNwb3J0LT5pcnEgPSBwbGF0
Zm9ybV9nZXRfaXJxKHBkZXYsIDApOwo+PiAgIAlzcG9ydC0+b3BzID0gJmxpbmZsZXhfcG9wczsK
Pgo+LS0gCj5qcwo+c3VzZSBsYWJzCg==
