Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD71146B24
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jan 2020 15:22:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DDCA1696;
	Thu, 23 Jan 2020 15:21:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DDCA1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579789342;
	bh=8NT52fDFRa44j7U7TTokYEtBN1CxP8Zjt1B9fNhtkUc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WzQr7eF5GGQLwPS4Aixyz0oOzeAbwluKbaVCQzfFbLLaf87fpVCc5th2tZhr14ljU
	 SqN7hdRPZ+eSLVawnmhmmuK0tlj+sr20WriLW6w702kMsIUjdu7QDq6tmPsboIB18G
	 MDxVEzLblDWqxMP5DiOn9zu8uteqofC89rzlfHb4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F93CF801D9;
	Thu, 23 Jan 2020 15:20:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17CA1F801D9; Thu, 23 Jan 2020 15:20:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from server.feix.family (server.feix.family [80.240.19.227])
 by alsa1.perex.cz (Postfix) with ESMTP id B6507F800E7
 for <alsa-devel@alsa-project.org>; Thu, 23 Jan 2020 15:20:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6507F800E7
To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
References: <ebe959a0-5272-e7bd-6001-1ce598f7f6be@feix.family>
 <44ba763e-f3d2-3fa2-eea6-9ebb7317a3bd@linux.intel.com>
 <cc4fc82d-5b01-d5f9-7771-ba2b5daa5829@feix.family>
 <e45892ff-d142-33ef-ee3c-1ce2cc64a0ce@perex.cz>
From: Michal Feix <michal@feix.family>
Message-ID: <14ded854-55a2-931f-073a-23a15f745acb@feix.family>
Date: Thu, 23 Jan 2020 15:20:32 +0100
MIME-Version: 1.0
In-Reply-To: <e45892ff-d142-33ef-ee3c-1ce2cc64a0ce@perex.cz>
Content-Language: cs
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] ASUS T100TAM UCM
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

PiBEbmUgMjMuIDAxLiAyMCB2IDE1OjEwIE1pY2hhbCBGZWl4IG5hcHNhbChhKToKPj4+IE9uIDEv
MjMvMjAgNjo0OSBBTSwgTWljaGFsIEZlaXggd3JvdGU6Cj4+Pj4gSGVsbG8sCj4+Pj4KPj4+PiB0
aGVyZSBpcyBubyBzb3VuZCB3b3JraW5nIHZpYSBzcGVha2VycyBvciBoZWFkcGhvbmVzIGphY2sg
b24gQXN1cyBUMTAwVEFNLiBTb3VuZCB3b3JrcyBjb3JyZWN0bHkgdmlhIEhETUkgb3IgQmx1ZXRv
b3RoIGhlYWRwaG9uZXMuIFRoZSBjaGlwIG9uIHRoaXMgQmF5dHJhaWwgbWFjaGluZSBpcyBjb3Jy
ZWN0bHkgcmVjb2duaXplZCBhcyBieXRjcl9ydDU2NDAuIMKgRnJvbSBkbWVzZzoKPj4+Pgo+Pj4+
IGJ5dGNyX3J0NTY0MCBieXRjcl9ydDU2NDA6IHF1aXJrIERNSUMxX01BUCBlbmFibGVkCj4+Pj4g
Ynl0Y3JfcnQ1NjQwIGJ5dGNyX3J0NTY0MDogcXVpcmsgcmVhbHRlayxqYWNrLWRldGVjdC1zb3Vy
Y2UgMwo+Pj4+IGJ5dGNyX3J0NTY0MCBieXRjcl9ydDU2NDA6IHF1aXJrIHJlYWx0ZWssb3Zlci1j
dXJyZW50LXRocmVzaG9sZC1taWNyb2FtcCAyMDAwCj4+Pj4gYnl0Y3JfcnQ1NjQwIGJ5dGNyX3J0
NTY0MDogcXVpcmsgcmVhbHRlayxvdmVyLWN1cnJlbnQtc2NhbGUtZmFjdG9yIDEKPj4+PiBieXRj
cl9ydDU2NDAgYnl0Y3JfcnQ1NjQwOiBxdWlyayBNQ0xLX0VOIGVuYWJsZWQKPj4+PiBieXRjcl9y
dDU2NDAgYnl0Y3JfcnQ1NjQwOiBzbmQtc29jLWR1bW15LWRhaSA8LT4gbWVkaWEtY3B1LWRhaSBt
YXBwaW5nIG9rCj4+Pj4gYnl0Y3JfcnQ1NjQwIGJ5dGNyX3J0NTY0MDogc25kLXNvYy1kdW1teS1k
YWkgPC0+IGRlZXBidWZmZXItY3B1LWRhaSBtYXBwaW5nIG9rCj4+Pj4gYnl0Y3JfcnQ1NjQwIGJ5
dGNyX3J0NTY0MDogcnQ1NjQwLWFpZjEgPC0+IHNzcDItcG9ydCBtYXBwaW5nIG9rCj4+Pj4gaW5w
dXQ6IGJ5dGNyLXJ0NTY0MCBIZWFkc2V0IGFzIC9kZXZpY2VzL3BsYXRmb3JtLzgwODYwRjI4OjAw
L2J5dGNyX3J0NTY0MC9zb3VuZC9jYXJkMC9pbnB1dDE3Cj4+Pj4KPj4+PiBBZnRlciBib290dXAs
IGtlcm5lbCBsb2cgaXMgZmlsbGVkIHdpdGg6ICJCYXl0cmFpbCBBdWRpbyBQb3J0OiBBU29DOiBu
byBiYWNrZW5kIERBSXMgZW5hYmxlZCBmb3IgQmF5dHJhaWwgQXVkaW8gUG9ydCIgbWVzc2FnZXMu
IEkgZG8gdW5kZXJzdGFuZCB0aGlzIGlzIGR1ZSB0byB0aGUgbWlzc2luZyBVQ00gcHJvZmlsZSBm
b3IgdGhlIG1hY2hpbmUuCj4+Pgo+Pj4gd2hhdCBkbyB5b3UgbWVhbiB3aXRoICdtaXNzaW5nIFVD
TSBwcm9maWxlJz8gSXQncyBiZWVuIGF2YWlsYWJsZSBmb3IgbWFueSBtb29ucywgYW5kIHdlIHdv
cmtlZCB3aXRoIEphcm9zbGF2L0hhbnMgdG8gdXBkYXRlIGZvciBVQ012Mi4KPj4+Cj4+PiBZb3Ug
c2hvdWxkIGJlIGFibGUgdG8gdXNlIGFsc2EtdWNtIGFuZCBjb25maWd1cmUgdGhpbmdzIG1hbnVh
bGx5LCBlLmcuCj4+Pgo+Pj4gYWxzYXVjbSAtYyBieXRjci1ydDU2NDAgc2V0IF92ZXJiIEhpRmkg
c2V0IF9lbmFkZXYgSGVhZHBob25lcwo+Pj4KPj4+IGFsc2F1Y20gLWMgYnl0Y3ItcnQ1NjQwIHNl
dCBfdmVyYiBIaUZpIHNldCBfZW5hZGV2IFNwZWFrZXIKPj4+Cj4+Cj4+IFRoYW5rcyBQaWVycmUu
IEknbSBhd2FyZSBvZiB0aGUgd29yayBkb25lIHByZXZpb3VzbHkgb24gQXN1cyBUMTAwLiBOb3Qg
c3VyZSwgaWYgQXN1cyBUMTAwVEFNIGlzIGFueSBzaWduaWZpY2FudGx5IGRpZmZlcmVudC4gSnVz
dCB0cmllZCB5b3VyIHN1Z2dlc3RlZCBjb21tYW5kcyBhcyByb290IHVzZXI6Cj4+Cj4+ICMgYWxz
YXVjbSAtYyBieXRjci1ydDU2NDAgc2V0IF92ZXJiIEhpRmkgc2V0IF9lbmFkZXYgSGVhZHBob25l
cwo+PiBBTFNBIGxpYiB1Y21fc3Vicy5jOjIxNToodWNfbWdyX2dldF9zdWJzdGl0dXRlZF92YWx1
ZSkgdmFyaWFibGUgJyR7Q2FyZENvbXBvbmVudHN9JyBpcyBub3QgZGVmaW5lZCBpbiB0aGlzIGNv
bnRleHQhCj4+IEFMU0EgbGliIG1haW4uYzo5NjA6KHNuZF91c2VfY2FzZV9tZ3Jfb3BlbikgZXJy
b3I6IGZhaWxlZCB0byBpbXBvcnQgYnl0Y3ItcnQ1NjQwIHVzZSBjYXNlIGNvbmZpZ3VyYXRpb24g
LTIyCj4+IGFsc2F1Y206IGVycm9yIGZhaWxlZCB0byBvcGVuIHNvdW5kIGNhcmQgYnl0Y3ItcnQ1
NjQwOiBJbnZhbGlkIGFyZ3VtZW50Cj4+Cj4+ICMgYWxzYXVjbSAtYyBieXRjci1ydDU2NDAgc2V0
IF92ZXJiIEhpRmkgc2V0IF9lbmFkZXYgU3BlYWtlcgo+PiBBTFNBIGxpYiB1Y21fc3Vicy5jOjIx
NToodWNfbWdyX2dldF9zdWJzdGl0dXRlZF92YWx1ZSkgdmFyaWFibGUgJyR7Q2FyZENvbXBvbmVu
dHN9JyBpcyBub3QgZGVmaW5lZCBpbiB0aGlzIGNvbnRleHQhCj4+IEFMU0EgbGliIG1haW4uYzo5
NjA6KHNuZF91c2VfY2FzZV9tZ3Jfb3BlbikgZXJyb3I6IGZhaWxlZCB0byBpbXBvcnQgYnl0Y3It
cnQ1NjQwIHVzZSBjYXNlIGNvbmZpZ3VyYXRpb24gLTIyCj4+IGFsc2F1Y206IGVycm9yIGZhaWxl
ZCB0byBvcGVuIHNvdW5kIGNhcmQgYnl0Y3ItcnQ1NjQwOiBJbnZhbGlkIGFyZ3VtZW50Cj4gCj4g
VHJ5IHRoaXM6Cj4gCj4gYWxzYXVjbSAtYyBodzowIHNldCBfdmVyYiBIaUZpIHNldCBfZW5hZGV2
IFNwZWFrZXIKPiAKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFRoYW5rIHlvdSwK
PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSmFyb3NsYXYKPiAKCk5v
IGx1Y2suCgojIGFsc2F1Y20gLWMgaHc6MCBzZXQgX3ZlcmIgSGlGaSBzZXQgX2VuYWRldiBTcGVh
a2VyCkFMU0EgbGliIHVjbV9zdWJzLmM6MjE1Oih1Y19tZ3JfZ2V0X3N1YnN0aXR1dGVkX3ZhbHVl
KSB2YXJpYWJsZSAnJHtDYXJkQ29tcG9uZW50c30nIGlzIG5vdCBkZWZpbmVkIGluIHRoaXMgY29u
dGV4dCEKQUxTQSBsaWIgbWFpbi5jOjk2MDooc25kX3VzZV9jYXNlX21ncl9vcGVuKSBlcnJvcjog
ZmFpbGVkIHRvIGltcG9ydCBodzowIHVzZSBjYXNlIGNvbmZpZ3VyYXRpb24gLTIyCmFsc2F1Y206
IGVycm9yIGZhaWxlZCB0byBvcGVuIHNvdW5kIGNhcmQgaHc6MDogSW52YWxpZCBhcmd1bWVudAoK
LS0KTWljaGFsIEZlaXgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3Jn
Cmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1k
ZXZlbAo=
