Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C2C149FCE
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jan 2020 09:23:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68939166D;
	Mon, 27 Jan 2020 09:22:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68939166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580113399;
	bh=J6AsqPM7ml3q2wjUy7YGL8+EaMy7DiKPoLkW8kBxvlw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bqmTDQh4Wc+6tGvyzCoJNNgksTG2nSLpAcYAdc2rk6YGNabq4Eze9pcK9GxUk5Twh
	 fKD0vTwVeKDjKQf/sOo/3J9g8QlZrt/w/Bc9uWyweosqXd7QXrQsMQSNa9FiEkKzfA
	 2Qfaf0v04yAW7ghUWGXBNpAd2SmUFaCvLaSaNT84=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C51CF80218;
	Mon, 27 Jan 2020 09:21:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C21DBF8021E; Mon, 27 Jan 2020 09:21:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D97DBF80082
 for <alsa-devel@alsa-project.org>; Mon, 27 Jan 2020 09:21:30 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id C31A3A003F;
 Mon, 27 Jan 2020 09:21:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz C31A3A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1580113289; bh=+cg6GQivVVSXSLfD73yFlNTFhUqkrBCdy+Xm2UdzSUM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=BvlO95Ktd+G5uylzIBJkQMD0fjDfGdvrdmtAuk62EyDyL9ktZ97u18bHc7S3Db0ES
 yd0/ph7Qc1kMDc3PoMae3zT9l4h2jGj0qZ9F5S/iAf4LILMXfcEKR0mLnDOnPp5Wdl
 2l+cNlqBdIe8+ceyrtgICVFcxX8pUazM/DvtmSFI=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 27 Jan 2020 09:21:26 +0100 (CET)
To: Michal Feix <michal@feix.family>, alsa-devel@alsa-project.org
References: <ebe959a0-5272-e7bd-6001-1ce598f7f6be@feix.family>
 <44ba763e-f3d2-3fa2-eea6-9ebb7317a3bd@linux.intel.com>
 <cc4fc82d-5b01-d5f9-7771-ba2b5daa5829@feix.family>
 <e45892ff-d142-33ef-ee3c-1ce2cc64a0ce@perex.cz>
 <14ded854-55a2-931f-073a-23a15f745acb@feix.family>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <de49ff43-f1e2-18e8-0b54-eeb6d77a65e7@perex.cz>
Date: Mon, 27 Jan 2020 09:21:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <14ded854-55a2-931f-073a-23a15f745acb@feix.family>
Content-Language: en-US
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

RG5lIDIzLiAwMS4gMjAgdiAxNToyMCBNaWNoYWwgRmVpeCBuYXBzYWwoYSk6Cj4+IERuZSAyMy4g
MDEuIDIwIHYgMTU6MTAgTWljaGFsIEZlaXggbmFwc2FsKGEpOgo+Pj4+IE9uIDEvMjMvMjAgNjo0
OSBBTSwgTWljaGFsIEZlaXggd3JvdGU6Cj4+Pj4+IEhlbGxvLAo+Pj4+Pgo+Pj4+PiB0aGVyZSBp
cyBubyBzb3VuZCB3b3JraW5nIHZpYSBzcGVha2VycyBvciBoZWFkcGhvbmVzIGphY2sgb24gQXN1
cyBUMTAwVEFNLiBTb3VuZCB3b3JrcyBjb3JyZWN0bHkgdmlhIEhETUkgb3IgQmx1ZXRvb3RoIGhl
YWRwaG9uZXMuIFRoZSBjaGlwIG9uIHRoaXMgQmF5dHJhaWwgbWFjaGluZSBpcyBjb3JyZWN0bHkg
cmVjb2duaXplZCBhcyBieXRjcl9ydDU2NDAuIMKgRnJvbSBkbWVzZzoKPj4+Pj4KPj4+Pj4gYnl0
Y3JfcnQ1NjQwIGJ5dGNyX3J0NTY0MDogcXVpcmsgRE1JQzFfTUFQIGVuYWJsZWQKPj4+Pj4gYnl0
Y3JfcnQ1NjQwIGJ5dGNyX3J0NTY0MDogcXVpcmsgcmVhbHRlayxqYWNrLWRldGVjdC1zb3VyY2Ug
Mwo+Pj4+PiBieXRjcl9ydDU2NDAgYnl0Y3JfcnQ1NjQwOiBxdWlyayByZWFsdGVrLG92ZXItY3Vy
cmVudC10aHJlc2hvbGQtbWljcm9hbXAgMjAwMAo+Pj4+PiBieXRjcl9ydDU2NDAgYnl0Y3JfcnQ1
NjQwOiBxdWlyayByZWFsdGVrLG92ZXItY3VycmVudC1zY2FsZS1mYWN0b3IgMQo+Pj4+PiBieXRj
cl9ydDU2NDAgYnl0Y3JfcnQ1NjQwOiBxdWlyayBNQ0xLX0VOIGVuYWJsZWQKPj4+Pj4gYnl0Y3Jf
cnQ1NjQwIGJ5dGNyX3J0NTY0MDogc25kLXNvYy1kdW1teS1kYWkgPC0+IG1lZGlhLWNwdS1kYWkg
bWFwcGluZyBvawo+Pj4+PiBieXRjcl9ydDU2NDAgYnl0Y3JfcnQ1NjQwOiBzbmQtc29jLWR1bW15
LWRhaSA8LT4gZGVlcGJ1ZmZlci1jcHUtZGFpIG1hcHBpbmcgb2sKPj4+Pj4gYnl0Y3JfcnQ1NjQw
IGJ5dGNyX3J0NTY0MDogcnQ1NjQwLWFpZjEgPC0+IHNzcDItcG9ydCBtYXBwaW5nIG9rCj4+Pj4+
IGlucHV0OiBieXRjci1ydDU2NDAgSGVhZHNldCBhcyAvZGV2aWNlcy9wbGF0Zm9ybS84MDg2MEYy
ODowMC9ieXRjcl9ydDU2NDAvc291bmQvY2FyZDAvaW5wdXQxNwo+Pj4+Pgo+Pj4+PiBBZnRlciBi
b290dXAsIGtlcm5lbCBsb2cgaXMgZmlsbGVkIHdpdGg6ICJCYXl0cmFpbCBBdWRpbyBQb3J0OiBB
U29DOiBubyBiYWNrZW5kIERBSXMgZW5hYmxlZCBmb3IgQmF5dHJhaWwgQXVkaW8gUG9ydCIgbWVz
c2FnZXMuIEkgZG8gdW5kZXJzdGFuZCB0aGlzIGlzIGR1ZSB0byB0aGUgbWlzc2luZyBVQ00gcHJv
ZmlsZSBmb3IgdGhlIG1hY2hpbmUuCj4+Pj4KPj4+PiB3aGF0IGRvIHlvdSBtZWFuIHdpdGggJ21p
c3NpbmcgVUNNIHByb2ZpbGUnPyBJdCdzIGJlZW4gYXZhaWxhYmxlIGZvciBtYW55IG1vb25zLCBh
bmQgd2Ugd29ya2VkIHdpdGggSmFyb3NsYXYvSGFucyB0byB1cGRhdGUgZm9yIFVDTXYyLgo+Pj4+
Cj4+Pj4gWW91IHNob3VsZCBiZSBhYmxlIHRvIHVzZSBhbHNhLXVjbSBhbmQgY29uZmlndXJlIHRo
aW5ncyBtYW51YWxseSwgZS5nLgo+Pj4+Cj4+Pj4gYWxzYXVjbSAtYyBieXRjci1ydDU2NDAgc2V0
IF92ZXJiIEhpRmkgc2V0IF9lbmFkZXYgSGVhZHBob25lcwo+Pj4+Cj4+Pj4gYWxzYXVjbSAtYyBi
eXRjci1ydDU2NDAgc2V0IF92ZXJiIEhpRmkgc2V0IF9lbmFkZXYgU3BlYWtlcgo+Pj4+Cj4+Pgo+
Pj4gVGhhbmtzIFBpZXJyZS4gSSdtIGF3YXJlIG9mIHRoZSB3b3JrIGRvbmUgcHJldmlvdXNseSBv
biBBc3VzIFQxMDAuIE5vdCBzdXJlLCBpZiBBc3VzIFQxMDBUQU0gaXMgYW55IHNpZ25pZmljYW50
bHkgZGlmZmVyZW50LiBKdXN0IHRyaWVkIHlvdXIgc3VnZ2VzdGVkIGNvbW1hbmRzIGFzIHJvb3Qg
dXNlcjoKPj4+Cj4+PiAjIGFsc2F1Y20gLWMgYnl0Y3ItcnQ1NjQwIHNldCBfdmVyYiBIaUZpIHNl
dCBfZW5hZGV2IEhlYWRwaG9uZXMKPj4+IEFMU0EgbGliIHVjbV9zdWJzLmM6MjE1Oih1Y19tZ3Jf
Z2V0X3N1YnN0aXR1dGVkX3ZhbHVlKSB2YXJpYWJsZSAnJHtDYXJkQ29tcG9uZW50c30nIGlzIG5v
dCBkZWZpbmVkIGluIHRoaXMgY29udGV4dCEKPj4+IEFMU0EgbGliIG1haW4uYzo5NjA6KHNuZF91
c2VfY2FzZV9tZ3Jfb3BlbikgZXJyb3I6IGZhaWxlZCB0byBpbXBvcnQgYnl0Y3ItcnQ1NjQwIHVz
ZSBjYXNlIGNvbmZpZ3VyYXRpb24gLTIyCj4+PiBhbHNhdWNtOiBlcnJvciBmYWlsZWQgdG8gb3Bl
biBzb3VuZCBjYXJkIGJ5dGNyLXJ0NTY0MDogSW52YWxpZCBhcmd1bWVudAo+Pj4KPj4+ICMgYWxz
YXVjbSAtYyBieXRjci1ydDU2NDAgc2V0IF92ZXJiIEhpRmkgc2V0IF9lbmFkZXYgU3BlYWtlcgo+
Pj4gQUxTQSBsaWIgdWNtX3N1YnMuYzoyMTU6KHVjX21ncl9nZXRfc3Vic3RpdHV0ZWRfdmFsdWUp
IHZhcmlhYmxlICcke0NhcmRDb21wb25lbnRzfScgaXMgbm90IGRlZmluZWQgaW4gdGhpcyBjb250
ZXh0IQo+Pj4gQUxTQSBsaWIgbWFpbi5jOjk2MDooc25kX3VzZV9jYXNlX21ncl9vcGVuKSBlcnJv
cjogZmFpbGVkIHRvIGltcG9ydCBieXRjci1ydDU2NDAgdXNlIGNhc2UgY29uZmlndXJhdGlvbiAt
MjIKPj4+IGFsc2F1Y206IGVycm9yIGZhaWxlZCB0byBvcGVuIHNvdW5kIGNhcmQgYnl0Y3ItcnQ1
NjQwOiBJbnZhbGlkIGFyZ3VtZW50Cj4+Cj4+IFRyeSB0aGlzOgo+Pgo+PiBhbHNhdWNtIC1jIGh3
OjAgc2V0IF92ZXJiIEhpRmkgc2V0IF9lbmFkZXYgU3BlYWtlcgo+Pgo+PiAgIMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBUaGFuayB5b3UsCj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgSmFyb3NsYXYKPj4KPiAKPiBObyBsdWNrLgo+IAo+ICMgYWxzYXVj
bSAtYyBodzowIHNldCBfdmVyYiBIaUZpIHNldCBfZW5hZGV2IFNwZWFrZXIKPiBBTFNBIGxpYiB1
Y21fc3Vicy5jOjIxNToodWNfbWdyX2dldF9zdWJzdGl0dXRlZF92YWx1ZSkgdmFyaWFibGUgJyR7
Q2FyZENvbXBvbmVudHN9JyBpcyBub3QgZGVmaW5lZCBpbiB0aGlzIGNvbnRleHQhCj4gQUxTQSBs
aWIgbWFpbi5jOjk2MDooc25kX3VzZV9jYXNlX21ncl9vcGVuKSBlcnJvcjogZmFpbGVkIHRvIGlt
cG9ydCBodzowIHVzZSBjYXNlIGNvbmZpZ3VyYXRpb24gLTIyCj4gYWxzYXVjbTogZXJyb3IgZmFp
bGVkIHRvIG9wZW4gc291bmQgY2FyZCBodzowOiBJbnZhbGlkIGFyZ3VtZW50CgpJIHRoaW5rIHRo
YXQgdGhpcyBpc3N1ZSBpcyBmaXhlZCBpbiB0aGUgbm90LXlldC1yZWxlYXNlZCBjb2RlIGluIGFs
c2EtbGliLgoKCQkJCQkJSmFyb3NsYXYKCi0tIApKYXJvc2xhdiBLeXNlbGEgPHBlcmV4QHBlcmV4
LmN6PgpMaW51eCBTb3VuZCBNYWludGFpbmVyOyBBTFNBIFByb2plY3Q7IFJlZCBIYXQsIEluYy4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZl
bCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1h
bi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
