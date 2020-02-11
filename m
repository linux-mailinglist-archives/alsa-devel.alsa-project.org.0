Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9410158C9E
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 11:24:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83DD01665;
	Tue, 11 Feb 2020 11:23:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83DD01665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581416646;
	bh=juDTutxUmTbKNKmp9kzSP5vpDsX8vA0WT4r+4E8UJZE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BOoz2oR73v+5YzaqG6fWFQEQjRVYsUoVVb0s6CcVMuXsfZOob7zt/5KBRicj5H5bh
	 cKbYmRwb8xulFInVWI2WrM247xiUUFKyV/+Ifza4guSJQlnjGxrBvL/gp1NPLuTfa0
	 yWzQMgktW7ylXgBeK6QzHKE6WU1U1vkMtT7yvuOY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66EF9F80146;
	Tue, 11 Feb 2020 11:22:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04411F80145; Tue, 11 Feb 2020 11:22:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.emlix.com (mx1.emlix.com [188.40.240.192])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81F9BF800E7;
 Tue, 11 Feb 2020 11:22:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81F9BF800E7
Received: from mailer.emlix.com (unknown [81.20.119.6])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.emlix.com (Postfix) with ESMTPS id B53CB5FB81;
 Tue, 11 Feb 2020 11:22:18 +0100 (CET)
From: Rolf Eike Beer <eb@emlix.com>
To: patch@alsa-project.org
Date: Tue, 11 Feb 2020 11:22:18 +0100
Message-ID: <5948808.FfnTCzJfH2@devpool35>
Organization: emlix GmbH
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH] do not set close-on-exec flag on descriptor if
	it was already set
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

VGhlcmUgaXMgbm8gbmVlZCB0byBzZXQgdGhpcyBhZ2FpbiBpZiBPX0NMT0VYRUMgaXMgc3VwcG9y
dGVkLgoKU2lnbmVkLW9mZi1ieTogUm9sZiBFaWtlIEJlZXIgPGViQGVtbGl4LmNvbT4KLS0tCiBp
bmNsdWRlL2xvY2FsLmggfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9sb2NhbC5oIGIvaW5jbHVkZS9sb2NhbC5oCmluZGV4IGVhMGVj
MzJkLi5lZDZiYTkzNiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9sb2NhbC5oCisrKyBiL2luY2x1ZGUv
bG9jYWwuaApAQCAtMzIwLDggKzMyMCwxMCBAQCBzdGF0aWMgaW5saW5lIGludCBzbmRfb3Blbl9k
ZXZpY2UoY29uc3QgY2hhciAqZmlsZW5hbWUsIGludCBmbW9kZSkKIAkJCWZkID0gcnNtX29wZW5f
ZGV2aWNlKGZpbGVuYW1lLCBmbW9kZSk7CiAJfQogI2VuZGlmCisjaWZuZGVmIE9fQ0xPRVhFQwog
CWlmIChmZCA+PSAwKQogCQlmY250bChmZCwgRl9TRVRGRCwgRkRfQ0xPRVhFQyk7CisjZW5kaWYK
IAlyZXR1cm4gZmQ7CiB9CiAKLS0gCjIuMjUuMAoKCi0tIApSb2xmIEVpa2UgQmVlciwgZW1saXgg
R21iSCwgaHR0cDovL3d3dy5lbWxpeC5jb20KRm9uICs0OSA1NTEgMzA2NjQtMCwgRmF4ICs0OSA1
NTEgMzA2NjQtMTEKR290aGFlciBQbGF0eiAzLCAzNzA4MyBHw7Z0dGluZ2VuLCBHZXJtYW55ClNp
dHogZGVyIEdlc2VsbHNjaGFmdDogR8O2dHRpbmdlbiwgQW10c2dlcmljaHQgR8O2dHRpbmdlbiBI
UiBCIDMxNjAKR2VzY2jDpGZ0c2bDvGhydW5nOiBIZWlrZSBKb3JkYW4sIERyLiBVd2UgS3JhY2tl
IOKAkyBVc3QtSWROci46IERFIDIwNSAxOTggMDU1CgplbWxpeCAtIHNtYXJ0IGVtYmVkZGVkIG9w
ZW4gc291cmNlCgpCZXN1Y2hlbiBTaWUgdW5zIGF1ZiBkZXIgRW1iZWRkZWQgV29ybGQgMjAyMCBp
biBOw7xybmJlcmchCi0+IEhhbGxlIDQsIFN0YW5kIDM2OAoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNh
LWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
