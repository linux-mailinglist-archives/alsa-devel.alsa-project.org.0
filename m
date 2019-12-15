Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0293911FADD
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Dec 2019 20:54:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83F951674;
	Sun, 15 Dec 2019 20:53:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83F951674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576439659;
	bh=Jn0/LieDNh3fCHXa//VQwyi3pI77J+49YhStk9OtOfU=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ANmbt8/6+jJ5Sq8yGsApSASUo4jbEuf4eamRgKSeMObzlZteNEGFpr++CFjl404A0
	 HjBa9oWJ+pWewRbB2/rMX/rEUdowWgHHciQB9wi/eSmGbM6xiBtnO+sQXG60qHSj+u
	 PPAZBW+50nkmFtEc4ISdrz1r+JkJ71VrWJjXEmfI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D09BBF80268;
	Sun, 15 Dec 2019 20:51:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 992DBF80234; Sun, 15 Dec 2019 19:58:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from larkos.de (larkos.de [188.68.52.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51982F800CE
 for <alsa-devel@alsa-project.org>; Sun, 15 Dec 2019 19:57:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51982F800CE
Received: from a89-182-230-81.net-htp.de ([89.182.230.81]
 helo=[192.168.178.12])
 by larkos.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <martin@larkos.de>)
 id 1igZ5Y-0007Ur-Qr; Sun, 15 Dec 2019 19:57:57 +0100
From: Martin Regner <martin@larkos.de>
To: tiwai@suse.de
References: <20191202074947.1617-1-tiwai@suse.de>
Message-ID: <e3420134-e0a8-db0e-90b9-258573c4de39@larkos.de>
Date: Sun, 15 Dec 2019 19:57:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191202074947.1617-1-tiwai@suse.de>
Content-Language: de-DE
X-Mailman-Approved-At: Sun, 15 Dec 2019 20:51:50 +0100
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] ALSA: hda: Modify stream stripe mask only
 when needed
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

SGkgYWdhaW4sCgppIGRpZCBhIGxpdHRsZSBiaXQgb2YgcmVzZWFyY2ggYW5kIG15IGN1cnJlbnQg
c29sdXRpb24gaXMgdGhpcyBwYXRjaDoKCgpkaWZmIC1ydSBhL2luY2x1ZGUvc291bmQvaGRhdWRp
by5oIGIvaW5jbHVkZS9zb3VuZC9oZGF1ZGlvLmgKLS0tIGEvaW5jbHVkZS9zb3VuZC9oZGF1ZGlv
LmjCoMKgIDIwMTktMTItMTUgMTk6NDk6MTUuNzc1Njg5ODczICswMTAwCisrKyBiL2luY2x1ZGUv
c291bmQvaGRhdWRpby5owqDCoCAyMDE5LTEyLTE1IDE5OjQ4OjIzLjQ3NDY4ODU0NSArMDEwMApA
QCAtNDkzLDcgKzQ5Myw3IEBACiDCoMKgwqDCoMKgwqDCoCBib29sIHByZXBhcmVkOjE7CiDCoMKg
wqDCoMKgwqDCoCBib29sIG5vX3BlcmlvZF93YWtldXA6MTsKIMKgwqDCoMKgwqDCoMKgIGJvb2wg
bG9ja2VkOjE7Ci3CoMKgwqDCoMKgwqAgYm9vbCBzdHJpcGU6MTvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC8qIGFwcGx5IHN0cmlwZSBjb250cm9sICovCivCoMKgwqDCoMKgwqAg
Ym9vbCBzdHJpcGU6MDvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIGFwcGx5
IHN0cmlwZSBjb250cm9sICovCgogwqDCoMKgwqDCoMKgwqAgLyogdGltZXN0YW1wICovCiDCoMKg
wqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIHN0YXJ0X3dhbGxjbGs7wqDCoMKgIC8qIHN0YXJ0ICsg
bWluaW11bSB3YWxsY2xrICovCmRpZmYgLXJ1IGEvc291bmQvaGRhL2hkYWNfc3RyZWFtLmMgYi9z
b3VuZC9oZGEvaGRhY19zdHJlYW0uYwotLS0gYS9zb3VuZC9oZGEvaGRhY19zdHJlYW0uY8KgwqAg
MjAxOS0xMi0xNSAxOToxNTozNy41MTI1ODM1MjMgKzAxMDAKKysrIGIvc291bmQvaGRhL2hkYWNf
c3RyZWFtLmPCoMKgIDIwMTktMTItMTUgMTk6MTU6NDguOTc2NTg0NTkwICswMTAwCkBAIC0xMjIs
NyArMTIyLDYgQEAKIMKgwqDCoMKgwqDCoMKgIHNuZF9oZGFjX3N0cmVhbV93cml0ZWIoYXp4X2Rl
diwgU0RfU1RTLCBTRF9JTlRfTUFTSyk7IC8qIHRvIGJlIApzdXJlICovCiDCoMKgwqDCoMKgwqDC
oCBpZiAoYXp4X2Rldi0+c3RyaXBlKSB7CiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
c25kX2hkYWNfc3RyZWFtX3VwZGF0ZWIoYXp4X2RldiwgU0RfQ1RMXzNCLCAKU0RfQ1RMX1NUUklQ
RV9NQVNLLCAwKTsKLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYXp4X2Rldi0+c3RyaXBl
ID0gMDsKIMKgwqDCoMKgwqDCoMKgIH0KIMKgwqDCoMKgwqDCoMKgIGF6eF9kZXYtPnJ1bm5pbmcg
PSBmYWxzZTsKIMKgfQoKSSBkb24ndCByZWFsbHkgdW5kZXJzdGFuZCB0aGUgYXBwcm9hY2ggaW4g
dGhlIG9yaWdpbmFsIGNvbW1pdC4gQXMgZmFyIGFzIAppIHVuZGVyc3RhbmQgdGhpcywgdGhlIHN0
cmlwZSBwcm9wZXJ0eSBpcyBpbml0aWFsbHkgc2V0IHRvIDEuCkluIHRoZSBwYXRjaF9oZG1pLmMg
aXQgaXMgc2V0IHRvIDEgaWYgdGhlIEFDX1dDQVBfU1RSSVBFIGZsYWcgaXMgc2V0LiAKRmluYWxs
eSBpdCBpcyBzZXQgdG8gMCBpbiB0aGUgZnVuY3Rpb24gc25kX2hkYWNfc3RyZWFtX2NsZWFyLgoK
V2l0aCB0aGlzIHBhdGNoIHRoZSBzdHJpcGUgcHJvcGVydHkgaXMgaW5pdGlhbGx5IDAsIHNldCB0
byAxIGlmIHRoZSAKQUNfV0NBUF9TVFJJUEUgZmxhZyBpcyBzZXQgYW5kIG5ldmVyIHRvdWNoZWQg
YWdhaW4uCgpVbmZvcnR1bmF0bHkgaSBjYW4ndCB0ZXN0IHRoaXMgb24gYW5vdGhlciBtYWNoaW5l
LgoKS2luZCByZWdhcmRzCgpNYXJ0aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1w
cm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2Fsc2EtZGV2ZWwK
