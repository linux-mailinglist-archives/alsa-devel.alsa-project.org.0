Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA739E9B85
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2024 17:24:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C968EB76;
	Mon,  9 Dec 2024 17:24:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C968EB76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733761470;
	bh=Va6Ca8Fq61eulefvKJ5c5nnIWRuhn8eJhinhgPj7KU0=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=f2ElDv4qxBWsMmdtkUDkki4qi9SvtdWLWrO0GaLM2vTCulpfYBJ4Gt8aBC2Q3heuh
	 nwzCWb4FWAEMElyKsW2zv8TC7WmyjiVoj4nsu1B87aLhGNCae1zF79nrpbHyfHS5Dm
	 cAPAPmikyIrTUUnpajQRusRl3OLCtWvfOuMvvlHs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 186BFF805F1; Mon,  9 Dec 2024 17:23:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75679F805EE;
	Mon,  9 Dec 2024 17:23:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8E43F8047C; Thu,  5 Dec 2024 09:37:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by alsa1.perex.cz (Postfix) with ESMTP id 9365EF8032D
	for <alsa-devel@alsa-project.org>; Thu,  5 Dec 2024 09:37:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9365EF8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=dEpz60P3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=vYA7a74jbVrVUjOG060Nff8O+vQKIuZW4ufAhVwW7Ew=; b=d
	Epz60P3aJKIcGTfZrp6IhbBdybnUKFxT5ekhPWcb1sbdYYTgei90UzeQf1LW1Zf2
	4weQp2iaPpBCGUlp9siizd1/Ez8wNHkBYVxF18rzbDuekIZtTSak0LA/5HwFLKHA
	qzjI6SxpURgOQ5feJr//6U+BA+tpb5CQioL59DvroI=
Received: from wangdich9700$163.com ( [116.128.244.169] ) by
 ajax-webmail-wmsvr-40-137 (Coremail) ; Thu, 5 Dec 2024 16:37:21 +0800 (CST)
X-Originating-IP: [116.128.244.169]
Date: Thu, 5 Dec 2024 16:37:21 +0800 (CST)
From: wangdicheng <wangdich9700@163.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org
Subject: scsi: aic7xxx: Fix build 'aicasm' warning
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
X-NTES-SC: 
 AL_Qu2YAf+TuEAv5yKQZOkfmkcSj+c3UcW4vPQn2YBeOpx6jBLo8w8beHBMGEXc1ueOFCG3rheYezFp2MdCfLRkcYU1+YgisZ+FExZmgBJYqHum1A==
Content-Type: multipart/mixed;
	boundary="----=_Part_137630_1842439076.1733387841289"
MIME-Version: 1.0
Message-ID: <109c7d1a.8e5a.19395f76f09.Coremail.wangdich9700@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: iSgvCgDXfy5CZlFnNFU4AA--.23134W
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/1tbiow6mT2dJZauPBQACss
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-MailFrom: wangdich9700@163.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VYO5X6VGALH352XCCU5JUAAXHI3GO3SY
X-Message-ID-Hash: VYO5X6VGALH352XCCU5JUAAXHI3GO3SY
X-Mailman-Approved-At: Mon, 09 Dec 2024 16:23:53 +0000
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VYO5X6VGALH352XCCU5JUAAXHI3GO3SY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

------=_Part_137630_1842439076.1733387841289
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

Cg==
------=_Part_137630_1842439076.1733387841289
Content-Type: application/octet-stream;
	name=0001-scsi-aic7xxx-Fix-build-aicasm-warning.patch
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-scsi-aic7xxx-Fix-build-aicasm-warning.patch"

RnJvbSAyMTViNmIzOWIyZDYyMGVhZDZmMjgwNTc0ZjExZGQ4ZjFhZTZiNTVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiB3YW5nZGljaGVuZyA8d2FuZ2RpY2hlbmdAa3lsaW5vcy5jbj4K
RGF0ZTogVGh1LCA1IERlYyAyMDI0IDEzOjAxOjExICswODAwClN1YmplY3Q6IFtQQVRDSF0gc2Nz
aTogYWljN3h4eDogRml4IGJ1aWxkICdhaWNhc20nIHdhcm5pbmcKTUlNRS1WZXJzaW9uOiAxLjAK
Q29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CkNvbnRlbnQtVHJhbnNmZXIt
RW5jb2Rpbmc6IDhiaXQKCldoZW4gYnVpbGRpbmcgd2l0aCBDT05GSUdfQUlDN1hYWF9CVUlMRF9G
SVJNV0FSRT15IG9yCkNPTkZJR19BSUM3OVhYX0JVSUxEX0ZJUk1XQVJFPXksICB0aGUgd2Fybmlu
ZyBtZXNzYWdlIGlzIGFzIGZvbGxvdzoKCiAgYWljYXNtX2dyYW0udGFiLmM6MTcyMjoxNjogd2Fy
bmluZzogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24KICAgIOKAmHl5bGV44oCZIFst
V2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQoKICBhaWNhc21fbWFjcm9fZ3JhbS5jOjY4
OjI1OiB3YXJuaW5nOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbgogICAg4oCYbW1s
ZXjigJkgWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCgogIGFpY2FzbV9zY2FuLmw6
NDE3OjY6IHdhcm5pbmc6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uCiAgICDigJht
bV9zd2l0Y2hfdG9fYnVmZmVy4oCZCgogIGFpY2FzbV9zY2FuLmw6NDE4OjY6IHdhcm5pbmc6IGlt
cGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uCiAgICDigJhtbXBhcnNl4oCZCgogIGFpY2Fz
bV9zY2FuLmw6NDIxOjY6IHdhcm5pbmc6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9u
CiAgICDigJhtbV9kZWxldGVfYnVmZmVy4oCZCgpUaGUgc29sdXRpb24gaXMgdG8gYWRkIHRoZSBj
b3JyZXNwb25kaW5nIGZ1bmN0aW9uIGRlY2xhcmF0aW9uIHRvIHRoZQpjb3JyZXNwb25kaW5nIGZp
bGUuCgpTaWduZWQtb2ZmLWJ5OiB3YW5nZGljaGVuZyA8d2FuZ2RpY2hlbmdAa3lsaW5vcy5jbj4K
U2lnbmVkLW9mZi1ieTogaHVhbmdsZWkgPGh1YW5nbGVpQGt5bGlub3MuY24+Ci0tLQogZHJpdmVy
cy9zY3NpL2FpYzd4eHgvYWljYXNtL2FpY2FzbV9ncmFtLnkgICAgICAgfCAxICsKIGRyaXZlcnMv
c2NzaS9haWM3eHh4L2FpY2FzbS9haWNhc21fbWFjcm9fZ3JhbS55IHwgMSArCiBkcml2ZXJzL3Nj
c2kvYWljN3h4eC9haWNhc20vYWljYXNtX3NjYW4ubCAgICAgICB8IDMgKysrCiAzIGZpbGVzIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc2NzaS9haWM3eHh4
L2FpY2FzbS9haWNhc21fZ3JhbS55IGIvZHJpdmVycy9zY3NpL2FpYzd4eHgvYWljYXNtL2FpY2Fz
bV9ncmFtLnkKaW5kZXggNjUxODJhZDljZGY4Li5iMWM5Y2U0NzdjYmQgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvc2NzaS9haWM3eHh4L2FpY2FzbS9haWNhc21fZ3JhbS55CisrKyBiL2RyaXZlcnMvc2Nz
aS9haWM3eHh4L2FpY2FzbS9haWNhc21fZ3JhbS55CkBAIC0xMDIsNiArMTAyLDcgQEAgc3RhdGlj
IHZvaWQgYWRkX2NvbmRpdGlvbmFsKHN5bWJvbF90ICpzeW1ib2wpOwogc3RhdGljIHZvaWQgYWRk
X3ZlcnNpb24oY29uc3QgY2hhciAqdmVyc3RyaW5nKTsKIHN0YXRpYyBpbnQgIGlzX2Rvd25sb2Fk
X2NvbnN0KGV4cHJlc3Npb25fdCAqaW1tZWQpOwogc3RhdGljIGludCAgaXNfbG9jYXRpb25fYWRk
cmVzcyhzeW1ib2xfdCAqc3ltYm9sKTsKK2ludCB5eWxleCgpOwogdm9pZCB5eWVycm9yKGNvbnN0
IGNoYXIgKnN0cmluZyk7CiAKICNkZWZpbmUgU1JBTV9TWU1OQU1FICJTUkFNX0JBU0UiCmRpZmYg
LS1naXQgYS9kcml2ZXJzL3Njc2kvYWljN3h4eC9haWNhc20vYWljYXNtX21hY3JvX2dyYW0ueSBi
L2RyaXZlcnMvc2NzaS9haWM3eHh4L2FpY2FzbS9haWNhc21fbWFjcm9fZ3JhbS55CmluZGV4IDhj
MDQ3OTg2NWYwNC4uNWM3MzUwZWI1YjVjIDEwMDY0NAotLS0gYS9kcml2ZXJzL3Njc2kvYWljN3h4
eC9haWNhc20vYWljYXNtX21hY3JvX2dyYW0ueQorKysgYi9kcml2ZXJzL3Njc2kvYWljN3h4eC9h
aWNhc20vYWljYXNtX21hY3JvX2dyYW0ueQpAQCAtNjEsNiArNjEsNyBAQAogc3RhdGljIHN5bWJv
bF90ICptYWNyb19zeW1ib2w7CiAKIHN0YXRpYyB2b2lkIGFkZF9tYWNyb19hcmcoY29uc3QgY2hh
ciAqYXJndGV4dCwgaW50IHBvc2l0aW9uKTsKK2ludCBtbWxleCgpOwogdm9pZCBtbWVycm9yKGNv
bnN0IGNoYXIgKnN0cmluZyk7CiAKICV9CmRpZmYgLS1naXQgYS9kcml2ZXJzL3Njc2kvYWljN3h4
eC9haWNhc20vYWljYXNtX3NjYW4ubCBiL2RyaXZlcnMvc2NzaS9haWM3eHh4L2FpY2FzbS9haWNh
c21fc2Nhbi5sCmluZGV4IGM3OGQ0ZjY4ZWVhNS4uZmM3ZTZjNTgxNDhkIDEwMDY0NAotLS0gYS9k
cml2ZXJzL3Njc2kvYWljN3h4eC9haWNhc20vYWljYXNtX3NjYW4ubAorKysgYi9kcml2ZXJzL3Nj
c2kvYWljN3h4eC9haWNhc20vYWljYXNtX3NjYW4ubApAQCAtNjQsNiArNjQsOSBAQCBzdGF0aWMg
Y2hhciAqc3RyaW5nX2J1Zl9wdHI7CiBzdGF0aWMgaW50ICBwYXJyZW5fY291bnQ7CiBzdGF0aWMg
aW50ICBxdW90ZV9jb3VudDsKIHN0YXRpYyBjaGFyIGJ1ZlsyNTVdOwordm9pZCBtbV9zd2l0Y2hf
dG9fYnVmZmVyKFlZX0JVRkZFUl9TVEFURSk7Cit2b2lkIG1tcGFyc2UoKTsKK3ZvaWQgbW1fZGVs
ZXRlX2J1ZmZlcihZWV9CVUZGRVJfU1RBVEUpOwogJX0KIAogUEFUSAkJKFsvXSpbLUEtWmEtejAt
OV8uXSkrCi0tIAoyLjI1LjEKCg==
------=_Part_137630_1842439076.1733387841289--

