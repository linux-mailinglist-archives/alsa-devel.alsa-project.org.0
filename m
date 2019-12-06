Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7BA114EE6
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Dec 2019 11:17:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C4EF167D;
	Fri,  6 Dec 2019 11:16:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C4EF167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575627453;
	bh=uNz3Spa1R8sG0Lz03oiTdWUA8CDMANpPvgkNe9S0jDo=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gEO+hRSxqEnsIiS3WFZFqaDT8NxIzogxoSUbW/eEiKaW3OPRmZwbB0xxhK9ocEK4x
	 GHnV25dfDQWgUy8kc0mtw95bkQciLsAgV2+AuBUBc0fMQAuMFoSErUmSqw0xOLltMx
	 60+6dDq2qdD2JNzoHQGdHA3eKPLv0bLgUQ7//9XA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF93AF802A7;
	Fri,  6 Dec 2019 11:08:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 256D0F80108; Fri,  6 Dec 2019 06:23:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F23FF80108
 for <alsa-devel@alsa-project.org>; Fri,  6 Dec 2019 06:23:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F23FF80108
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=vvdntech-in.20150623.gappssmtp.com
 header.i=@vvdntech-in.20150623.gappssmtp.com header.b="vmocgNii"
Received: by mail-ot1-x330.google.com with SMTP id 59so4778219otp.12
 for <alsa-devel@alsa-project.org>; Thu, 05 Dec 2019 21:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vvdntech-in.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=jRbFxJ1BhRQ1lXq13rtOAs+WdVcnotWQ1v8QWmWlj3M=;
 b=vmocgNiiNynTR3MwQ0oCNhJoZJMA6NBJXyQocW0gVzRuEjjs9dVihvqvzdx+t2KU2a
 /fhbpgdKuB1cJq+QDKMi+8PGxr+g1ctBDE5w8r01U66smiBHMUxKKV+/e7vLOjZ+6Xqm
 y5msfX7j9gzPGu9j45WmAloTeCDMrTh5M0nwD9ImbMYnqD2nSSsDV0O06toM3/BDeLyH
 I4iLrNte4Tfyq5SxwomPmMbN2xoteR2Xv1lddiYTAVdVEAW2uIPy10Y2gwTAFtPqoaU+
 DLaERG0OfQ69cfpVYgrCyXsSmnmefp8M49adInbtU7yxmzSLbMj4FHkClin/ojCB8C8C
 yuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=jRbFxJ1BhRQ1lXq13rtOAs+WdVcnotWQ1v8QWmWlj3M=;
 b=Ljk3g2zOVV5x3AYg/O89QVxNiAuXbP1U/9pkLnUlbQWczX2BWs4T3xOQUaVeUTsNqW
 oVQHD1hD1uYfEjhsKGI0QMxfvwASO48k7nZi77W7bMF0vs6aBYyYAfBkbT4yHPW71Jsw
 hKIcU9KbLu/pbLfBT/lwfbOLHbru+Zjzg7tXETnNi+zgkFfMvdxDWXJ4coMpMYd5/ujT
 dcxCViNYtjYzguEp4LVgHEOySZLrXMk7gIiCZtm/gaKKrjKpyBwPQk7DYTICjycUn1Xz
 zh0w8JsnCPOVhs8w5Hw3xEBtzFTo68h4mKiBE88a3G1NgLvzEyAOA6UpV+w93faR7/oe
 t4lQ==
X-Gm-Message-State: APjAAAWurXR0tab012dj6DKxm1Quu+i9bTQ9nwX9wGM02yCM/SG/evM8
 XKaK1fZDyIDv53OqhriKEcOmW0HiXy6SLBF0LBjBomgTIizoinK5JOcsA6VchBtj51WL6XPw/pN
 aoRLPLpUnzeCDv5Qb2qnkduEUHxRA3ZVqy4I=
X-Google-Smtp-Source: APXvYqwvP2PeR5FJr7eS4gNp6ioDpnXhz78e5NL0xvQTb7zsA4uwQy4HA7GPoyb0rYrB1EB9gcExZ5IoTSASoxmsqtA=
X-Received: by 2002:a9d:74c7:: with SMTP id a7mr9996679otl.7.1575609789229;
 Thu, 05 Dec 2019 21:23:09 -0800 (PST)
MIME-Version: 1.0
From: Mohan Prasath Ramamoorthy <mohan.prasath@vvdntech.in>
Date: Fri, 6 Dec 2019 10:52:58 +0530
Message-ID: <CAMM7-fe=NAH_tEFsE+RV-eA1KLkhaim_3w4YK3wjqDYea_2TtA@mail.gmail.com>
To: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Fri, 06 Dec 2019 11:07:58 +0100
Subject: [alsa-devel] Playback issue while recording simultaneously
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

RGVhciBBbGwsCgpXZSBhcmUgd29ya2luZyBvbiBleHRlcm5hbCBtb2R1bGVzIG9mIG1pY3JvcGhv
bmUgYW5kIHNwZWFrZXIgYW5kIHdlCmFyZSB1c2luZyB0aGUga2VybmVsIHZlcnNpb24gMy4xMC45
NgoKV2UgYXJlIHJlY29yZGluZyB3aXRoIGNvbW1hbmRzIGxpa2UgYXJlY29yZCBhbmQgYXBsYXkg
Zm9yIHJlY29yZGluZwphbmQgcGxheWJhY2sgcmVzcGVjdGl2ZWx5LgoKV2hpbGUgZG9pbmcgdGhl
IGJlbG93IGV4cGVyaW1lbnRzIHdlIGNvdWxkIGFibGUgdG8gb2JzZXJ2ZSBhbiBpc3N1ZSBhcyBi
ZWxvdywKCjEuIFdpdGggb25seSByZWNvcmRpbmcgYW5kIG5vdCBwbGF5YmFjayB3ZSBoYXZlbid0
IGZhY2VkIGFueSBpc3N1ZXMuCjIuIFdpdGggb25seSBwbGF5YmFjayBhbmQgbm90IHJlY29yZGlu
ZyB3ZSBoYXZlbid0IGZhY2VkIGFueSBpc3N1ZXMuCgozLiBCeSBzdGFydGluZyBhbiBpbmZpbml0
ZSByZWNvcmRpbmcgaW4gdGhlIGJhY2tncm91bmQgYW5kIGJ5IGRvaW5nIGEKcGxheWJhY2sgb2Yg
dGhlIGF1ZGlvIGZpbGUoMzBzZWNvbmRzLCB0aGUgc2FtcGxpbmcgcmF0ZSBvZiAyMjA1MCwgdGhl
CmNoYW5uZWwgaXMgc3RlcmVvKSwgYWZ0ZXIgc29tZSBpdGVyYXRpb25zLCB3ZSBhcmUgZmFjaW5n
IGEgYmVsb3cgZXJyb3IKYW5kIHdlIGNvdWxkIG5vdCBhYmxlIHRvIGxpc3RlbiB0byB0aGUgYXVk
aW8uCgpFcnJvcjogYXBsYXk6IHBjbV93cml0ZToxOTQwOiB3cml0ZSBlcnJvcjogSW5wdXQvb3V0
cHV0IGVycm9yCgpCZWxvdyBhcmUgdGhlIHJlc3BlY3RpdmUgY29tbWFuZHMgZm9yIHJlY29yZGlu
ZyBhbmQgcGxheWJhY2ssCgoxLiBhcmVjb3JkIC1EIGh3OjAsMCAtYyAyIC1mIHMxNl9sZSAtciA4
MDAwIC9ob21lL3VidW50dS9taWNfdGVzdGluZy53YXYgJgoyLiBhcGxheSAtRCBodzowLDMgYXVk
aW9fMjJrX2MyLndhdgoKQnV0IHdoZW4gdGhlIGlzc3VlcyBjb21lLCB3ZSBqdXN0IHN0b3BwZWQg
cmVjb3JkaW5nIGFuZCByZXN0YXJ0ZWQgdGhlCnJlY29yZGluZyBpbiB0aGUgYmFja2dyb3VuZC4g
QWZ0ZXIgdGhpcywgdGhlIHBsYXliYWNrIGlzIHdvcmtpbmcgZmluZS4KCkFsc28sIGR1cmluZyB0
aGUgaXNzdWUgY2FtZSwgd2UgaGF2ZSBjaGVja2VkIGZvciB0aGUgYmVsb3cgcHJvcGVydGllcywK
CjEuIEkyUyBoYXMgYmVlbiBlbmFibGVkLiBDaGVja2VkIHVuZGVyIHRoZSBmaWxlOgovc3lzL2tl
cm5lbC9kZWJ1Zy9jbG9jay9jbG9ja190cmVlCjIuIERyaXZlciBjYWxsYmFja3MgaGF2ZSBiZWVu
IGNhbGxlZC4gKENoZWNrZWQgd2l0aCB0aGUga2VybmVsIGxvZ3NbZG1lc2ddKQoKV2Ugd291bGQg
bGlrZSB0byBrbm93IHRoZSByZWFzb24gYmVoaW5kIHRoaXMgZXJyb3IuPwoKLS0KCldpdGggQmVz
dCBSZWdhcmRzLAoKTW9oYW4gUHJhc2F0aAoKVlZETiBUZWNobm9sb2dpZXMgUHZ0IEx0ZAoKQ2Vs
bDogKzkxIDk2Mjk3Njg5MTkKCldlYjogd3d3LnZ2ZG50ZWNoLmNvbQoKLS0gCgoKX0Rpc2NsYWlt
ZXI6wqBfwqkgMjAxOSBWVkROIFRlY2hub2xvZ2llcyBQdnQuIEx0ZC4gVGhpcyBlLW1haWwgY29u
dGFpbnMgClBSSVZJTEVHRUQgQU5EIENPTkZJREVOVElBTCBJTkZPUk1BVElPTiBpbnRlbmRlZCBz
b2xlbHkgZm9yIHRoZSB1c2Ugb2YgdGhlIAphZGRyZXNzZWUocykuIElmIHlvdSBhcmUgbm90IHRo
ZSBpbnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBub3RpZnkgdGhlIApzZW5kZXIgYnkgZS1tYWls
IGFuZCBkZWxldGUgdGhlIG9yaWdpbmFsIG1lc3NhZ2UuIEZ1cnRoZXIsIHlvdSBhcmUgbm90IHRv
IApjb3B5LCBkaXNjbG9zZSwgb3IgZGlzdHJpYnV0ZSB0aGlzIGUtbWFpbCBvciBpdHMgY29udGVu
dHMgdG8gYW55IG90aGVyIApwZXJzb24gYW5kIGFueSBzdWNoIGFjdGlvbnMgYXJlIHVubGF3ZnVs
Ll8KXwpfCl8KX18KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0
dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZl
bAo=
