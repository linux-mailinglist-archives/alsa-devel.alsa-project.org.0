Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DD3432DE
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 07:56:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 986B617E3;
	Thu, 13 Jun 2019 07:55:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 986B617E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560405384;
	bh=aC5e2A3qkweP6Vt76SpodobYdq9RgRD0nhiCnHw1ixk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e1+U7fTeoylEZ5YJoa8Z80U42wIyvZeih7pD1KbKLeZM18w4aIHTJT1VReMc8nCBH
	 DQ8/X2QXkv76egIep0hqLgO5KwaT7rBojVUnciNeQAcwrHOhlfeQuqHW4C9SvcevYq
	 QufmJng5cWxynYu8RE5dwRgZKObHJnmYoULuavDM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DB8FF89703;
	Thu, 13 Jun 2019 07:54:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A46AF89703; Thu, 13 Jun 2019 07:54:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8DC6CF80791
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 07:54:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DC6CF80791
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net
 header.b="Zd+Mzms/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1560405271;
 bh=1dAGHUueS6C5OhkGMXwaQNwuD7gryhjTrrUX1I74dbA=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=Zd+Mzms/6Wn37jTxFbTPG2dvYGcY8kE0u2Qk/KXe4ZSOqYpCsLJLMSmjxOVB5JXGl
 NiCxeBvxs6WHknEe8BmNqff/qfyzT3Hxmpu1usNOuowJqmSiO5z+vZZU/se7ojshfy
 tIYgCzyRDWH7euo9hNBIMnxlZQ9OEFUHMzbh03ag=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [47.69.32.234] ([47.69.32.234]) by web-mail.gmx.net
 (3c-app-gmx-bs72.server.lan [172.19.170.208]) (via HTTP); Thu, 13 Jun 2019
 07:54:31 +0200
MIME-Version: 1.0
Message-ID: <trinity-bf4e0eb4-e575-4dfc-9315-bc322b7b7f19-1560405271802@3c-app-gmx-bs72>
From: "Ralf Beck" <musical_snake@gmx.de>
To: alsa-devel@alsa-project.org
Date: Thu, 13 Jun 2019 07:54:31 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:UPU8Eoe0qriFQ7krhd/yRkcpLpXOrT9xuuKsxDsa9dTW14FsEN9q41PU53/rYEmcCPR6S
 Vg3m3Gj9Lh0MA8ySMgL7jHy6XpcLJfzFeXZAya0wkbhrc6h3nvm8Zlpti6alxNmFHxCdL8tZ+920
 JTNWtthGJ7sGhjnRUP79IyPnAvYuAKUdtXY4c07hKWL1zHi0gEYlgQHtu5Gw6qeUCbPObt879aH3
 ltoq0WWpHbYO7bfGe8eHjNunhpSBk58uRE7KGB7ekh9OslDNst1Y3TLAAWApT4LVbzDQb43fefOk
 UY=
X-UI-Out-Filterresults: notjunk:1;V03:K0:wTnZPMKYpV8=:RK0ox06liASw+E4IQ0x4WL
 obJ/bsGdTs7kA2cn43kmy4FRioH/WCz2WKbLPzS7uh1LKFjA6Cy/31CvPn/QxfAc4TDlFEZGB
 qXG/ZGul3uNu3qRBT0MKhqQJYCD9pBWGQS/obgJOd2dBcOXGvgce6Hg9dhiByrhAxfzR03i06
 BSiH0ZyFrY3nV1dMOHrT3QS7s8ZwKU2hurbxHYLGMDK445L2Ta4pCSgYVJOIvK/VeH6P/Iwb2
 xXmN0UWQrqxug8D1jeXzxIKT3CRLAZH3mQ6EC6gHQ8bAkMBdB5DEZnC1ktSFgScENPDia+tr1
 oh2AWAV1btUyLjwe47cHfLdAICLmjvXMnbc9WEgWi4JhtBVK7ZOsQccscCzK6k11BZKVncK4U
 E+nJnd+jYGdjgOJN8K8vr/B9uNZuqN2vKSD77uxNzPRmpkFjW+heSiCBLa1CSGm6Va4w26xWt
 whf1vMrWQ8RvcLUGF+LYwy5OmJ7dNBPsXPBXxFdaevbH3+SicqKkVU+qnTCKAvUwECYcxlhdX
 LKMK5ZIDSwvosiDDxBeao6BFUfVVUY/JpVVt/F59iB0umAZaIpWQTNBbrhxzQALtSxMuXZFYw
 ZrQbuwyWy04VXzQGb0VfW7wp9/Qhwa47joe/3kmZQJ+vN6gkaOJ1CMQA==
Subject: Re: [alsa-devel] (no subject)
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

Ckphcm9zbGF2IEt5c2VsYSB3cm90ZToKPkkganVzdCBkb24ndCB0aGluayB0aGF0IHRoZSBtbWFw
IHRyYW5zZmVyIG1vZGUgaXMgdGhlIGN1bHByaXQgb2YgdGhlIHByb2JsZW1zLgo+VGhlIHByb2Js
ZW0gaXMgdGhhdCB0aGUgUENJIGNhcmRzIG9mZi1sb2FkcyB0aGUgRE1BIHRyYW5zZmVycyBjb21w
bGV0ZWx5Cj53aXRob3V0IHRoZSBleHRyYSBmcmFtaW5nIHJlcXVpcmVkIGZvciB0aG9zZSBzZXJp
YWwgaGFyZHdhcmUgaW50ZXJmYWNlcyB3aGljaAo+YXJlIGhhbmRsZWQgaW4gdGhlIGF1ZGlvIGRy
aXZlciBhbmQgdGhlIG90aGVyIGtlcm5lbCBzdGFja3MgKFVTQiBldGMuKS4KClRoZSBzb3VyY2Ug
b2YgYWxsIGV2aWwgaXMgdGhlIHJpbmcgYnVmZmVyLgpJdCBwcmV2ZW50cyBhbGwgZGV2aWNlcyB0
aGF0IHJlcXVpcmUgcGFja2V0IGhlYWRlcnMgKEZpcmV3aXJlL25ldHdvcmsgYmFzZWQgc29sdXRp
b25zKSBvciB0aGF0CnVzZSBhIHZhcmlhYmxlIGFtb3VudCBvZiBmcmFtZXMgcGVyIHBhY2tldCAo
YWxsIGFzeW5jaHJvbm91cyBkZXZpY2VzLCBlc3BlY2lhbGx5IGFzeW5jaHJvbm91cyBVU0IgSVNP
IGVuZHBvaW50cykKZnJvbSBtYXBwaW5nIHRoZWlyIGRhdGEgZGlyZWN0bHkgaW50byB1c2Vyc3Bh
cyBtZW1vcnkgd2l0aG91dCBldmVyIHRvdWNoaW5nIHRoZSBhdWRpbyBkYXRhIGluIGl0LgoKV2hp
bGUgdGhpcyBkb2Vzbid0IGh1cnQgcGVyZm9ybWFuY2UgdG8gbXVjaCB3aXRoIGRldmljZXMgdGhh
dCBvZmZlciBvbmx5IGEgZmV3IGNoYW5uZWxzLAppdCBoYXMgYSBtYXNzaXZlIGVmZmVjdCBvbiBu
ZXR3b3JrIGJhc2VkIGRldmljZXMgd2l0aCBwb3NzaWJseSBodW5kcmVkcyBvZiBjaGFubmVscyBv
ZiB3aGljaCBvbmx5CmEgc21hbGwgbnVtYmVyIGlzIHVzZWQgKGUuZy4gcmVjb3JkIGVuYWJsZWQp
IGF0IGEgdGltZS4KClRoZSByaW5nYnVmZmVyIHNob3VsZCBiZSByZXBsYWNlZCBieSBhIGJ1ZmZl
ciB0aGF0IGhvbGRzIHRoZSBwYWNrZXRzIGFuZCBhIGRlc2NyaXB0b3IgZm9yIGhvdyB0byBmaW5k
IHRoZSBkYXRhIGluIGl0LiBCdHcsIGFsc2EgdXNlcyBzb21ldGhpbmcgc2ltaWxhciBhbHJlYWR5
IGZvciB0aGUgbW1hcCBoYW5kbGluZy4KClRoZSBkZXNjcmlwdG9yIHNob3VsZCBjb25zaXN0IG9m
CnggcGVyaW9kcywgY29udGFpbmluZyB5IGNodW5rcyB3aXRoIGEgbWF4IHNpemUsIGNvbnRhaW5p
bmcgeiBjaGFubmVscywgZWFjaCBvZiB0aGUgY2hhbm5lbCBkZXNjcmliZWQgYnkgYSBzdGFydCBh
ZGRyZXNzIGFuZCBzdGVwIHZhbHVlIHdpdGhpbiB0aGF0IGNodW5rLgoKRXhhbXBsZXM6ClBDSSBk
ZXZpY2U7IDIgcGVyaW9kcywgMSBjaHVua3MgcGVyIHBlcmlvZCwgbWF4IHNpemUgNjQgZnJhbWVz
IHBlciBjaHVuaywgMiBjaGFubmVscyBwZXIgY2h1bmsKVVNCIGRldmljZTogMiBwZXJpb2RzLCA4
IGNodW5rcyAobWljcm9mcmFtZXMpIG1heCBzaXplIDggZnJhbWVzIChpZiBhdCA0NC4xLzQ4a0h6
KSwgMiBjaGFubmVscyBwZXIgY2h1bmssClNhbWUgZm9yIEZpcmV3aXJlLCBBVkIgKGVhY2ggY2h1
bmsgcG9zc2libHkgY29udGFpbmluZyBzZXZlcmFsIEFWQiBzdHJlYW1zLCBpLmUuIGV0aGVybmV0
IHBhY2tldHMpLCBldGMuCgpQZXJpb2QgZWxhcHNlZCA9PiB0aGUgbnVtYmVyIG9mIGNodW5rcyBm
b3JtaW5nIGEgcGVyaW9kIGhhdmUgYmVlbiByZWNlaXZlZAoKc25kX3BjbV9hdmFpbChfdXBkYXRl
KSA9PiByZXR1cm4gdGhlIHN1bSBvZiBhY3R1YWwgZnJhbWVzIG9mIHRoZSBwZXJpb2QKCnNuZF9w
Y21fbW1hcF9jb21taXQgPT4gcmV0dXJuIHRoZSBkZXNjcmlwdG9yIGZvciBvbmUgY2h1bmssIHRo
ZSBudW1iZXIgb2YgZnJhbWVzIG9mIHRoZSBjaHVuayBhbmQgYSBjaGFubmVsIG1hcCBmb3IgdGhl
IGNodW5rLiBUaGUgcmVhc29uIGZvciB0aGUgbGF0dGVyIGlzIHRoYXQgb24gZXRoZXJuZXQgYmFz
ZWQgZGV2aWNlcyAoQVZCKSB0aGVyZSBpcyBibyBndWFyYW50ZWUgdGhhdCBzdHJlYW1zIG9mIGRp
ZmZlcmVudCBlbmRwb2ludHMgYXJlIHJlY2VpdmVkIGluIHRoZSBzYW1lIG9yZGVyIChidXQgaW4g
dGhlIHNhbWUgaW50ZXJ2YWwgd2luZG93KS4KQWxzYSBjbGllbnRzIHNob3VsZCB0aGVuIGxvb3Ag
dW50aWwgdGhleSBoYXZlIHByb2Nlc3NlZCBhbGwgZnJhbWVzIHRoYXIgaGF2ZSBiZWVuIHJlcG9y
dGVkIGJ5IHNuZF9wY21fYXZhaWwgKGluc3RlYWQgb2YgYSBwZXJpb2Qgc2l6ZSBudW1iZXIgb2Yg
ZnJhbWVzKS4KCkFoLCBhbmQgQU04MjQgcmF3IGF1ZGlvIGZvcm1hdCwgdXNlZCBieSBmaXJld2ly
ZSBhbmQgQVZCLCBzaG91bGQgYnkgYWRkZWQgdG8gdGhlIGxpc3Qgb2YgYXVkaW8gZm9ybWF0cywg
c28gY29udmVyc2lvbiBjYW4gYmUgZG9uZSBpbiB1c2Vyc3BhY2UuCgpSYWxmCgoKwqAKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWls
aW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNh
LXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
