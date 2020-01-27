Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B689414A0EF
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jan 2020 10:34:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C4E51665;
	Mon, 27 Jan 2020 10:33:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C4E51665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580117687;
	bh=q31yVrLq5jt8T1BY/yYAzve7HUXdnCNwIW0rKNJAQ+M=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vfn3+uZ75ui642GGkuBa7z2Qd3d3D8CsK3f1CL48S3/KQO9jWzcITfME/5QQ7jPsE
	 X/pL/yW/QW1gy9Fl68X+VDA13zKTN6vqdyWn7VNHfW6qbiSFKCSEZPHMhWh4C+x09Y
	 3HgH+T3qsoaws7n+/tMGfdZGAgGTFVQcyMuY0J3E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 048B3F80218;
	Mon, 27 Jan 2020 10:33:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 122A6F8021E; Mon, 27 Jan 2020 10:33:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from server.feix.family (server.feix.family [80.240.19.227])
 by alsa1.perex.cz (Postfix) with ESMTP id 2B877F800C8
 for <alsa-devel@alsa-project.org>; Mon, 27 Jan 2020 10:32:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B877F800C8
To: alsa-devel@alsa-project.org, perex@perex.cz
References: <ebe959a0-5272-e7bd-6001-1ce598f7f6be@feix.family>
 <44ba763e-f3d2-3fa2-eea6-9ebb7317a3bd@linux.intel.com>
 <cc4fc82d-5b01-d5f9-7771-ba2b5daa5829@feix.family>
 <e45892ff-d142-33ef-ee3c-1ce2cc64a0ce@perex.cz>
 <14ded854-55a2-931f-073a-23a15f745acb@feix.family>
 <de49ff43-f1e2-18e8-0b54-eeb6d77a65e7@perex.cz>
From: Michal Feix <michal@feix.family>
Message-ID: <fa168f85-c94c-fa6a-765e-f1000b0a2d3a@feix.family>
Date: Mon, 27 Jan 2020 10:32:58 +0100
MIME-Version: 1.0
In-Reply-To: <de49ff43-f1e2-18e8-0b54-eeb6d77a65e7@perex.cz>
Content-Language: en-US
Cc: pierre-louis.bossart@linux.intel.com
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

RG5lIDI3LiAwMS4gMjAgdiA5OjIxIEphcm9zbGF2IEt5c2VsYSBuYXBzYWwoYSk6Cj4gRG5lIDIz
LiAwMS4gMjAgdiAxNToyMCBNaWNoYWwgRmVpeCBuYXBzYWwoYSk6Cj4+PiBEbmUgMjMuIDAxLiAy
MCB2IDE1OjEwIE1pY2hhbCBGZWl4IG5hcHNhbChhKToKPj4+Pj4gT24gMS8yMy8yMCA2OjQ5IEFN
LCBNaWNoYWwgRmVpeCB3cm90ZToKPj4+Pj4+IEhlbGxvLAo+Pj4+Pj4KPj4+Pj4+IHRoZXJlIGlz
IG5vIHNvdW5kIHdvcmtpbmcgdmlhIHNwZWFrZXJzIG9yIGhlYWRwaG9uZXMgamFjayBvbiBBc3Vz
IFQxMDBUQU0uIFNvdW5kIHdvcmtzIGNvcnJlY3RseSB2aWEgSERNSSBvciBCbHVldG9vdGggaGVh
ZHBob25lcy4gVGhlIGNoaXAgb24gdGhpcyBCYXl0cmFpbCBtYWNoaW5lIGlzIGNvcnJlY3RseSBy
ZWNvZ25pemVkIGFzIGJ5dGNyX3J0NTY0MC4gwqBGcm9tIGRtZXNnOgo+Pj4+Pj4KPj4+Pj4+IGJ5
dGNyX3J0NTY0MCBieXRjcl9ydDU2NDA6IHF1aXJrIERNSUMxX01BUCBlbmFibGVkCj4+Pj4+PiBi
eXRjcl9ydDU2NDAgYnl0Y3JfcnQ1NjQwOiBxdWlyayByZWFsdGVrLGphY2stZGV0ZWN0LXNvdXJj
ZSAzCj4+Pj4+PiBieXRjcl9ydDU2NDAgYnl0Y3JfcnQ1NjQwOiBxdWlyayByZWFsdGVrLG92ZXIt
Y3VycmVudC10aHJlc2hvbGQtbWljcm9hbXAgMjAwMAo+Pj4+Pj4gYnl0Y3JfcnQ1NjQwIGJ5dGNy
X3J0NTY0MDogcXVpcmsgcmVhbHRlayxvdmVyLWN1cnJlbnQtc2NhbGUtZmFjdG9yIDEKPj4+Pj4+
IGJ5dGNyX3J0NTY0MCBieXRjcl9ydDU2NDA6IHF1aXJrIE1DTEtfRU4gZW5hYmxlZAo+Pj4+Pj4g
Ynl0Y3JfcnQ1NjQwIGJ5dGNyX3J0NTY0MDogc25kLXNvYy1kdW1teS1kYWkgPC0+IG1lZGlhLWNw
dS1kYWkgbWFwcGluZyBvawo+Pj4+Pj4gYnl0Y3JfcnQ1NjQwIGJ5dGNyX3J0NTY0MDogc25kLXNv
Yy1kdW1teS1kYWkgPC0+IGRlZXBidWZmZXItY3B1LWRhaSBtYXBwaW5nIG9rCj4+Pj4+PiBieXRj
cl9ydDU2NDAgYnl0Y3JfcnQ1NjQwOiBydDU2NDAtYWlmMSA8LT4gc3NwMi1wb3J0IG1hcHBpbmcg
b2sKPj4+Pj4+IGlucHV0OiBieXRjci1ydDU2NDAgSGVhZHNldCBhcyAvZGV2aWNlcy9wbGF0Zm9y
bS84MDg2MEYyODowMC9ieXRjcl9ydDU2NDAvc291bmQvY2FyZDAvaW5wdXQxNwo+Pj4+Pj4KPj4+
Pj4+IEFmdGVyIGJvb3R1cCwga2VybmVsIGxvZyBpcyBmaWxsZWQgd2l0aDogIkJheXRyYWlsIEF1
ZGlvIFBvcnQ6IEFTb0M6IG5vIGJhY2tlbmQgREFJcyBlbmFibGVkIGZvciBCYXl0cmFpbCBBdWRp
byBQb3J0IiBtZXNzYWdlcy4gSSBkbyB1bmRlcnN0YW5kIHRoaXMgaXMgZHVlIHRvIHRoZSBtaXNz
aW5nIFVDTSBwcm9maWxlIGZvciB0aGUgbWFjaGluZS4KPj4+Pj4KPj4+Pj4gd2hhdCBkbyB5b3Ug
bWVhbiB3aXRoICdtaXNzaW5nIFVDTSBwcm9maWxlJz8gSXQncyBiZWVuIGF2YWlsYWJsZSBmb3Ig
bWFueSBtb29ucywgYW5kIHdlIHdvcmtlZCB3aXRoIEphcm9zbGF2L0hhbnMgdG8gdXBkYXRlIGZv
ciBVQ012Mi4KPj4+Pj4KPj4+Pj4gWW91IHNob3VsZCBiZSBhYmxlIHRvIHVzZSBhbHNhLXVjbSBh
bmQgY29uZmlndXJlIHRoaW5ncyBtYW51YWxseSwgZS5nLgo+Pj4+Pgo+Pj4+PiBhbHNhdWNtIC1j
IGJ5dGNyLXJ0NTY0MCBzZXQgX3ZlcmIgSGlGaSBzZXQgX2VuYWRldiBIZWFkcGhvbmVzCj4+Pj4+
Cj4+Pj4+IGFsc2F1Y20gLWMgYnl0Y3ItcnQ1NjQwIHNldCBfdmVyYiBIaUZpIHNldCBfZW5hZGV2
IFNwZWFrZXIKPj4+Pj4KPj4+Pgo+Pj4+IFRoYW5rcyBQaWVycmUuIEknbSBhd2FyZSBvZiB0aGUg
d29yayBkb25lIHByZXZpb3VzbHkgb24gQXN1cyBUMTAwLiBOb3Qgc3VyZSwgaWYgQXN1cyBUMTAw
VEFNIGlzIGFueSBzaWduaWZpY2FudGx5IGRpZmZlcmVudC4gSnVzdCB0cmllZCB5b3VyIHN1Z2dl
c3RlZCBjb21tYW5kcyBhcyByb290IHVzZXI6Cj4+Pj4KPj4+PiAjIGFsc2F1Y20gLWMgYnl0Y3It
cnQ1NjQwIHNldCBfdmVyYiBIaUZpIHNldCBfZW5hZGV2IEhlYWRwaG9uZXMKPj4+PiBBTFNBIGxp
YiB1Y21fc3Vicy5jOjIxNToodWNfbWdyX2dldF9zdWJzdGl0dXRlZF92YWx1ZSkgdmFyaWFibGUg
JyR7Q2FyZENvbXBvbmVudHN9JyBpcyBub3QgZGVmaW5lZCBpbiB0aGlzIGNvbnRleHQhCj4+Pj4g
QUxTQSBsaWIgbWFpbi5jOjk2MDooc25kX3VzZV9jYXNlX21ncl9vcGVuKSBlcnJvcjogZmFpbGVk
IHRvIGltcG9ydCBieXRjci1ydDU2NDAgdXNlIGNhc2UgY29uZmlndXJhdGlvbiAtMjIKPj4+PiBh
bHNhdWNtOiBlcnJvciBmYWlsZWQgdG8gb3BlbiBzb3VuZCBjYXJkIGJ5dGNyLXJ0NTY0MDogSW52
YWxpZCBhcmd1bWVudAo+Pj4+Cj4+Pj4gIyBhbHNhdWNtIC1jIGJ5dGNyLXJ0NTY0MCBzZXQgX3Zl
cmIgSGlGaSBzZXQgX2VuYWRldiBTcGVha2VyCj4+Pj4gQUxTQSBsaWIgdWNtX3N1YnMuYzoyMTU6
KHVjX21ncl9nZXRfc3Vic3RpdHV0ZWRfdmFsdWUpIHZhcmlhYmxlICcke0NhcmRDb21wb25lbnRz
fScgaXMgbm90IGRlZmluZWQgaW4gdGhpcyBjb250ZXh0IQo+Pj4+IEFMU0EgbGliIG1haW4uYzo5
NjA6KHNuZF91c2VfY2FzZV9tZ3Jfb3BlbikgZXJyb3I6IGZhaWxlZCB0byBpbXBvcnQgYnl0Y3It
cnQ1NjQwIHVzZSBjYXNlIGNvbmZpZ3VyYXRpb24gLTIyCj4+Pj4gYWxzYXVjbTogZXJyb3IgZmFp
bGVkIHRvIG9wZW4gc291bmQgY2FyZCBieXRjci1ydDU2NDA6IEludmFsaWQgYXJndW1lbnQKPj4+
Cj4+PiBUcnkgdGhpczoKPj4+Cj4+PiBhbHNhdWNtIC1jIGh3OjAgc2V0IF92ZXJiIEhpRmkgc2V0
IF9lbmFkZXYgU3BlYWtlcgo+Pj4KPj4+IMKgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBUaGFuayB5b3UsCj4+PiDCoCDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBKYXJvc2xhdgo+Pj4KPj4KPj4gTm8gbHVjay4KPj4KPj4gIyBhbHNhdWNtIC1jIGh3OjAgc2V0
IF92ZXJiIEhpRmkgc2V0IF9lbmFkZXYgU3BlYWtlcgo+PiBBTFNBIGxpYiB1Y21fc3Vicy5jOjIx
NToodWNfbWdyX2dldF9zdWJzdGl0dXRlZF92YWx1ZSkgdmFyaWFibGUgJyR7Q2FyZENvbXBvbmVu
dHN9JyBpcyBub3QgZGVmaW5lZCBpbiB0aGlzIGNvbnRleHQhCj4+IEFMU0EgbGliIG1haW4uYzo5
NjA6KHNuZF91c2VfY2FzZV9tZ3Jfb3BlbikgZXJyb3I6IGZhaWxlZCB0byBpbXBvcnQgaHc6MCB1
c2UgY2FzZSBjb25maWd1cmF0aW9uIC0yMgo+PiBhbHNhdWNtOiBlcnJvciBmYWlsZWQgdG8gb3Bl
biBzb3VuZCBjYXJkIGh3OjA6IEludmFsaWQgYXJndW1lbnQKPiAKPiBJIHRoaW5rIHRoYXQgdGhp
cyBpc3N1ZSBpcyBmaXhlZCBpbiB0aGUgbm90LXlldC1yZWxlYXNlZCBjb2RlIGluIGFsc2EtbGli
LgoKRG9lcyB0aGF0IG1lYW4gdGhhdCBieSBmaXhpbmcgInRoaXMgaXNzdWUiIGFsc2F1Y20gc2hv
dWxkIGJlIGFibGUgdG8gY29ycmVjdGx5IGxvYWQgdGhlIFVDTTIgcHJvZmlsZSBvbiB0aGlzIEFz
dXMgZGV2aWNlPyBPciBpcyB0aGlzIGZpeCBzdXBwb3NlZCB0byBtYWtlIGFsc2F1Y20gc2hvd2lu
ZyBzb21ldGhpbmcgbW9yZSByZWFzb25hYmxlPwoKT24gbXkgb3RoZXIgbWFjaGluZSB3aXRoIGRp
ZmZlcmVudCBzb3VuZCBjYXJkIChIREEgSW50ZWwgUENIKSAiYWxzYXVjbSBsaXN0Y2FyZHMiIGlz
IGFsc28gc2hvd2luZyB0aGUgc2FtZSBlcnJvciwgYnV0IHNvdW5kIGlzIHdvcmtpbmcgcGVyZmVj
dGx5LgoKLS0KTWljaGFsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9y
ZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2Et
ZGV2ZWwK
