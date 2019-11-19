Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D5410282A
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 16:34:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D9A81696;
	Tue, 19 Nov 2019 16:33:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D9A81696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574177646;
	bh=fYzoYhMwL2WfO8e8ZNk2O0q0PSBrr3EedhyhiiaMD1s=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eJz6Uq+rAq6maCGErLnr0rWlwv2f5ALXU4XPWL3FHbJluJRYHI02Jh5QK1e5iHzmj
	 PBagqxKB9ZDEFhfWUU/FVyKHd+ED+R/PckAIU8oIzhW7jguR9ItS8sGwYbhuQQevUi
	 ZypQFGwN8MLKne5DhPt6JWNmu+HqfG6BP1XOgU7k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B352BF80138;
	Tue, 19 Nov 2019 16:32:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 222F0F80138; Tue, 19 Nov 2019 16:32:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0DE1F80135
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 16:32:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0DE1F80135
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="DzwVxgeR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574177534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ni9nwTblHVBDYpWat/VpLxfVjLoPdWwpwuF9TwAAsE=;
 b=DzwVxgeRUBxTfy2jxPfsCrddWNX9cqtAeFHn+JWuYgFVWs/LND5pKlWoMVWjYFC23X8aj9
 9+07JzPxJ6uF028j8D1PwDYnq7Pqyb3VnWXobJTwEfKj6Vd/V5FForl+MjMQVasvIltMTC
 HXiH0Y7MklGBeEqzucgWI/P6t8WXFsM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-AaZ8lJyqPaGTupsJmZ1DfQ-1; Tue, 19 Nov 2019 10:32:11 -0500
Received: by mail-wr1-f71.google.com with SMTP id 4so18518236wrf.19
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 07:32:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gDMTd1PLpx338lpQuza0elriOS1cX9HugDWLiTnNgIM=;
 b=sZyk6neuvDhEBFRcZQngC8zuxwHc9RfxR1mKKpDDE20r9eyziVRM4f9RENXYa1m+Qa
 /rSuHHx8XQlwXC0NXhIND7vxFCw6N7HIbxmmtzzBhVOrqqanIooKLMo2rtKgvHs4j3NL
 m46W5fezpicNL+PjUblKGUjM/EdFCu7+Ne91HPCxnXXZS8WUcgcarw4PmjwrswZZfEA+
 cbi6iq69m7R43CwgACkcsvRPBqSWLzQVGyQpMKPPNjWDULnN3U8iK5gRRTlWY2i3s/AM
 ipUCC3Q81TJV11jEh02mOCj2rRcuXtAAhXsvNTWMK6lxs4QefVfAB2u0jm8bmc3CgL0j
 FpYA==
X-Gm-Message-State: APjAAAUWQ5wXNj725B9SaiS4uMpyE6CYrIZZy4p/YfQqY4ntRkQ8lo5A
 D0Awwq9NZVfqww6U2wfqXW9pWRuxwvT65kK+SDhdwUuELKOPp9J3R7DTMDA1wgcDu6zWFr/PlQx
 qDDVwCsH7fkF0xw++n52CTWs=
X-Received: by 2002:adf:afef:: with SMTP id y47mr36946693wrd.190.1574177529239; 
 Tue, 19 Nov 2019 07:32:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqyckefuL0oCR3XgPLSg1iwxh4YPVEMR1rBZHn+NXkTDozu7p9RUfnuSLKceppQ9tmt1wb0BaQ==
X-Received: by 2002:adf:afef:: with SMTP id y47mr36946659wrd.190.1574177528953; 
 Tue, 19 Nov 2019 07:32:08 -0800 (PST)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id o189sm3656187wmo.23.2019.11.19.07.32.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Nov 2019 07:32:08 -0800 (PST)
To: Jaroslav Kysela <perex@perex.cz>
References: <20191119104822.15053-1-hdegoede@redhat.com>
 <3a473499-4fb2-dabd-3816-5edd1332f46e@perex.cz>
 <56edc7da-ba0f-1ffe-6b31-6eb6b570580d@redhat.com>
 <8d5a2fa8-9294-bee4-1cef-24bcf2c325a9@perex.cz>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <13c01b25-809f-cbc7-8e5f-db3ac8e99172@redhat.com>
Date: Tue, 19 Nov 2019 16:32:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <8d5a2fa8-9294-bee4-1cef-24bcf2c325a9@perex.cz>
Content-Language: en-US
X-MC-Unique: AaZ8lJyqPaGTupsJmZ1DfQ-1
X-Mimecast-Spam-Score: 0
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH alsa-lib 1/4] ucm: Fix opening of
 master-configs by the card's longname
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

SGksCgpPbiAxOS0xMS0yMDE5IDE0OjIxLCBKYXJvc2xhdiBLeXNlbGEgd3JvdGU6Cj4gRG5lIDE5
LiAxMS4gMTkgdiAxMzo0MCBIYW5zIGRlIEdvZWRlIG5hcHNhbChhKToKPj4gSGksCj4+Cj4+IE9u
IDE5LTExLTIwMTkgMTM6MjMsIEphcm9zbGF2IEt5c2VsYSB3cm90ZToKPj4+IERuZSAxOS4gMTEu
IDE5IHYgMTE6NDggSGFucyBkZSBHb2VkZSBuYXBzYWwoYSk6Cj4+Pj4gUHJpb3IgdG8gY29tbWl0
IGFiYTIyNjBhZTdiNSAoInVjbTogc3dpdGNoIHRvIHVjbTIgZGlyZWN0b3J5IGFuZCB2MiBmb3Jt
YXQsCj4+Pj4ga2VlcCBiYWNrd2FyZCBjb21wYXRpYmlsaXR5IikuCj4+Pj4KPj4+PiBUaGUgZmls
ZW5hbWUgYnVpbGQgaW4gcGFyc2VfdmVyYl9maWxlKCkgd2FzIGJ1aWxkIGxpa2UgdGhpczoKPj4+
PiA8cHJlZml4Pi88dWNfbWdyLT5jb25mX2ZpbGVfbmFtZT4vPGZpbGU+Cj4+Pj4KPj4+PiBXaGVy
ZSB1Y19tZ3ItPmNvbmZfZmlsZV9uYW1lIHdvdWxkIGNvbnRhaW4gZWl0aGVyIHRoZSBjYXJkX25h
bWUgb3IgdGhlCj4+Pj4gY2FyZCdzIGxvbmduYW1lIGRlcGVuZGluZyBvbiB0aGUgZGV0ZWN0aW9u
IG9mIGEgbG9uZ25hbWUgYmFzZWQgY29uZmlnIGluCj4+Pj4gdWNfbWdyX2ltcG9ydF9tYXN0ZXJf
Y29uZmlnKCkuCj4+Pj4KPj4+PiBXaGlsZSB0aGUgZmlsZW5hbWUgdXNlZCBpbiBsb2FkX21hc3Rl
cl9jb25maWcoKSB3YXMgYnVpbGQgbGlrZSB0aGlzOgo+Pj4+IDxwcmVmaXg+LzxjYXJkX25hbWU+
LzxjYXJkX25hbWU+LmNvbmYKPj4+Pgo+Pj4+IEFuZCB1Y19tZ3JfaW1wb3J0X21hc3Rlcl9jb25m
aWcoKSBmaXJzdCBjYWxscyBsb2FkX21hc3Rlcl9jb25maWcoKQo+Pj4+IHdpdGggdGhlIGNhcmQn
cyBsb25nbmFtZSBhbmQgaWYgdGhhdCBzdWNjZWVkcyBpdCBvdmVyd3JpdGVzCj4+Pj4gdWNfbWdy
LT5jb25mX2ZpbGVfbmFtZSB3aXRoIHRoZSBsb25nbmFtZSBzbyB0aGF0IHRoZSBzdWJzZXF1ZW50
IHVzZXMKPj4+PiBvZiB1Y19tZ3ItPmNvbmZfZmlsZV9uYW1lIGluIHBhcnNlX3ZlcmJfZmlsZSgp
IGNvcnJlY3RseSB1c2UgdGhlIGxvbmduYW1lLgo+Pj4+Cj4+Pj4gQnV0IHRoZSBuZXcgY29uZmln
dXJhdGlvbl9maWxlbmFtZSgpIGhlbHBlciBhZGRlZCBpbiBjb21taXQgYWJhMjI2MGFlN2I1Cj4+
Pj4gX2Fsd2F5c18gYnVpbGRzIHRoZSBmaWxlbmFtZSBsaWtlIHRoaXM6Cj4+Pj4gPHByZWZpeD4v
PHVjX21nci0+Y29uZl9maWxlX25hbWU+LzxmaWxlPjxzdWZmaXg+Cj4+Pj4KPj4+PiBUaGlzIGJy
ZWFrcyB0aGUgbG9hZGluZyBvZiB0aGUgbWFzdGVyLWNvbmZpZyBieSBpdHMgbG9uZ25hbWUsIGFz
IHdoZW4KPj4+PiB0aGUgbG9uZ25hbWUgaXMgdHJpZWQgdWNfbWdyLT5jb25mX2ZpbGVfbmFtZSBz
dGlsbCBjb250YWlucyB0aGUgY2FyZF9uYW1lLgo+Pj4KPj4+IEhpIEhhbnMsCj4+Pgo+Pj4gVGhp
cyBuZXcgYmVoYXZpb3VyIHdhcyBpbnRlbmRlZCBmb3IgdWNtMi4gSSBhcHBsaWVkIGFsbCBmb3Vy
IHlvdXIgcGF0Y2hlcywgYW5kIGFkZGVkIDEwYTYzZTA5M2M0YTk4YWNmYTliY2RmZGQwNjkzOGJj
ZDg3NGIwMDggb24gdG9wIHdoaWNoIHNob3VsZCBrZWVwIHRoZQo+Pj4gbmV3IGJlaGF2aW91ciBm
b3IgdjIgY29uZmlncy4KPj4KPj4gQWggSSBzZWUuCj4+Cj4+IFRoZXJlIGlzIGEgYnVnIGluIHRo
ZSBjb21taXQgeW91IGFkZGVkIG9uIHRvcCB0aG91Z2gsCj4+IHdoZW4gbG9hZF9tYXN0ZXJfY29u
ZmlnKCkgZ2V0cyBjYWxsZWQgd2l0aCBsb25nbmFtZSA9PSAxCj4+IGFuZCBBTFNBX0NPTkZJR19V
Q00yX1ZBUiBpcyBub3Qgc2V0IGFuZCBBTFNBX0NPTkZJR19VQ01fVkFSCj4+IGlzIHNldCwgdGhl
biB0aGUgaWYgY29uZGl0aW9uIGluIHRoZSBibG9jayBpcyBmYWxzZSwgc28gaXQgbmV2ZXIgZXhl
Y3V0ZXM6Cj4+Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChnZXRlbnYoQUxT
QV9DT05GSUdfVUNNMl9WQVIpIHx8ICFnZXRlbnYoQUxTQV9DT05GSUdfVUNNX1ZBUikpIHsKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVjX21nci0+Y29u
Zl9mb3JtYXQgPSAyOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgY29uZmlndXJhdGlvbl9maWxlbmFtZSh1Y19tZ3IsIGZpbGVuYW1lLCBzaXplb2YoZmls
ZW5hbWUpLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVjX21nci0+Y29u
Zl9maWxlX25hbWUsIGNhcmRfbmFtZSwgIi5jb25mIik7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIH0KPj4KPj4gQ2F1c2luZyB0aGUgbmV4dCBibG9jayB0byBhbHNvIG5vdCBleGVj
dXRlOgo+Pgo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAodWNfbWdyLT5jb25m
X2Zvcm1hdCA+PSAyICYmIGFjY2VzcyhmaWxlbmFtZSwgUl9PSykgIT0gMCkgewo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogdHJ5IHRoZSBvbGQgdWNt
IGRpcmVjdG9yeSAqLwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgdWNfbWdyLT5jb25mX2Zvcm1hdCA9IDE7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25maWd1cmF0aW9uX2ZpbGVuYW1lKHVjX21nciwgZmls
ZW5hbWUsIHNpemVvZihmaWxlbmFtZSksCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgY2FyZF9uYW1lLCBjYXJkX25hbWUsICIuY29uZiIpOwo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGFjY2VzcyhmaWxlbmFtZSwgUl9PSykg
IT0gMCkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT0VOVDsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfQo+Pgo+PiBDYXVzaW5nIGxvYWRfbWFzdGVyX2NvbmZpZygpIHRvIGNvbnRpbnVlIHdp
dGggYW4gdW5pbml0aWFsaXplZCBmaWxlbmFtZS4KPj4KPj4gSSB0aGluayB5b3Ugd2FudGVkIHRo
ZSBmb2xsb3dpbmcgY29uZGl0aW9uIGZvciB0aGUgc2Vjb25kIGJsb2NrOgo+Pgo+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICh1Y19tZ3ItPmNvbmZfZm9ybWF0ID09IDAg
fHwgYWNjZXNzKGZpbGVuYW1lLCBSX09LKSAhPSAwKSB7Cj4+Cj4+IEFsc28gZG9uJ3QgeW91IHdh
bnQgdGhlIHNhbWUgYmVoYXZvciB3cnQgZm9yY2luZyB0aGUgY29uZl9mb3JtYXQgYmFzZWQKPj4g
b24gZW52LiB3aGVuIHRyeWluZyB0aGUgc2hvcnRuYW1lID8KPj4KPj4gSSB0aGluayB5b3UgY2Fu
IG1vdmUgdGhlIGVudGlyZSBibG9jayB1bmRlciBpZiAobG9uZ25hbWUpIHRvIGJlIHVuY29uZGl0
aW9uYWwsCj4+IHNpbmNlIGNvbmZfZmlsZV9uYW1lID09IGNhcmRfbmFtZSBmb3IgdGhlIHNob3J0
bmFtZSBjYXNlIHVzaW5nIHRoZSBsb25nbmFtZQo+PiBwYXRoIGluIHRoZSBzaG9ydG5hbWUgY2Fz
ZSB0b28gaXMgZmluZS4gVGhlbiB5b3UgYWx3YXlzIGNhbGwgY29uZmlndXJhdGlvbl9maWxlbmFt
ZQo+PiB3aXRoIGNvbmZfZm9ybWF0IHNldCBhbmQgYWxsIHRoZSBoYW5kbGluZyBmb3IgY29uZl9m
b3JtYXQgbm90IGJlaW5nIHNldCAoYW5kCj4+IGZvciBvdmVycmlkaW5nIGl0KSBjYW4gYmUgZHJv
cHBlZCBmcm9tIGNvbmZpZ3VyYXRpb25fZmlsZW5hbWUoKSB0aGVuLgo+IAo+IFRoYW5rcyBhZ2Fp
biwgZml4ZWQgaW4gMWQ4NDhhYjczOWYwZDIwNzA5ODYyN2QyYmE2NjQyMWIzZWM3NWVlYiAuCj4g
Cj4+Cj4+PiBJdCdzIHRpbWUgdG8gY3JlYXRlIHRoZSAxLjIuMS4xIGJ1Z2ZpeCBhbHNhLWxpYiBy
ZWxlYXNlLCBJIGd1ZXNzLgo+Pgo+PiBZZXMgdGhhdCBpcyBhIGdvb2QgaWRlYSAob25jZSB0aGUg
YWJvdmUgaXMgcmVzb2x2ZWQpLgo+IAo+IFRoZSB0YXIgYmFsbCBpcyBpbiBmdHA6Ly9mdHAuYWxz
YS1wcm9qZWN0Lm9yZy9wdWIvdGVzdGluZyAuCgpUaGFua3MsIEkndmUgZ2l2ZW4gdGhpcyBhIHF1
aWNrIHRlc3Qgc3BpbiwgdGhlIDEuMi4xLjEgdGFyYmFsIGxvb2tzIGdvb2QgdG8gbWUuCgpSZWdh
cmRzLAoKSGFucwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0
dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZl
bAo=
