Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A641B5B6
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Apr 2019 10:53:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FE98869;
	Sun, 28 Apr 2019 10:53:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FE98869
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556441635;
	bh=fzwF/sWRzds9IGaK3QyhJbXK0WVgqWujMuujnjU5HKM=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=Z33hek5y+iY5GrQ/n8GppxnWt/f7wdUiArC6a2DIcsoIflqc8q6zbY7QBGOez70Zf
	 GCP8U0cRPtsYfiVTcs7dTJxKAmG2OrTSjreQ9abd7uslyAqQVY1V9Dg3T7beLL6kSV
	 9ymBXPBJdByW7Hu47/2wHkE50X9SfDYVCuQtgzKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4394F8070B;
	Sun, 28 Apr 2019 10:52:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37C05F80CAD; Sun, 28 Apr 2019 10:52:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 FREEMAIL_REPLYTO_END_DIGIT,HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-40135.protonmail.ch (mail-40135.protonmail.ch
 [185.70.40.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF41BF8070B
 for <alsa-devel@alsa-project.org>; Sun, 28 Apr 2019 10:52:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF41BF8070B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="hK95k0rL"
Date: Sun, 28 Apr 2019 08:52:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1556441524;
 bh=UJ2CwpRRr1HtaiqQVh/yUbHv2Cjix2y7/kQDdkx/Of0=;
 h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
 b=hK95k0rL34ZmndiZS39wLaL8D9VAVOqLStiZvEDsNT9vmGCSC9qLDxnA9O5VzrJwz
 ET/IEbF9I5JVsK0AtKCoBXByPllnjVPd6uPg2h7pexSd4bOLqpBYtpbrkcdXX9cuMR
 +o1DZz4i3Xf47ny+kX1rrOlAG/IaZWffvme+o/KA=
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
From: rodomar705@protonmail.com
Message-ID: <LOmN8-is-EK_Ws4Y_Q3fq4ne5rp40VgVe3i7_cqyaPPhPEhr1q__8yqZWYrsJPeQwCqJZPc-jl6PuajfEeE8dr14lR89eps3TkMvxPCEE-k=@protonmail.com>
Feedback-ID: BQ4VuaCwHB-LXBt9BwJToU1WLX9WgOQnr65-38AVcxd5MKpp9RCBDcVRKt_OKP9ezKz8EXM2FzpTMK6YBUVuWg==:Ext:ProtonMail
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] (No Subject)
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
Reply-To: rodomar705@protonmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

QWxyZWFkeSBzZW50IHRvIGFsc2EtdXNlciwgaG93ZXZlciBhIGRldmVsb3BlciBhc2tlZCB0byBz
ZW5kIHRoaXMgYWxzbyBvbiBkZXZlbCwgc28gaGVyZSBpdCBpczoKCkkgaGF2ZSBhdWRpbyBzdHV0
dGVycyB3aXRoIGFuIEFMQzg5MiBSZWFsdGVrIENoaXBzZXQgb24gYSBCNDUwIEdBTUlORyBFTElU
RSBib2FyZCBmcm9tIEdpZ2FieXRlIGR1cmluZyBhY3F1aXNpdGlvbiAoYXQgbGVhc3Qgd2l0aCBt
aWNyb3Bob25lIGlucHV0LCBib3RoIGZyb250IGFuZCBiYWNrLiBMaW5lIGluIG5vdCB0ZXN0ZWQp
LiBObyBpc3N1ZXMgd2l0aCBXaW5kb3dzLgoKQWZ0ZXIgb3BlbmluZyBhbiBpc3N1ZSBhbmQgdGVz
dGluZyB3aXRoIGEgUHVsc2VBdWRpbyBkZXZlbG9wZXIsIGhlIGhhcyBkZXRlcm1pbmVkIHRoYXQg
dGhlIGlzc3VlIGlzIG5vdCB3aXRoaW4gUHVsc2VBdWRpbywgYnV0IG9uIEFMU0EuCgpUaGVyZSBh
cmUgYWxyZWFkeSB0d28gaXNzdWVzIGFib3V0IHRoYXQgb24gdGhlIGJ1ZyB0cmFja2VyIG9uIExp
bnV4LCBuYW1lbHkgdGhpcyB0d286CgpBTEM4OTI6IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9y
Zy9zaG93X2J1Zy5jZ2k/aWQ9MjAzMzUxCkFMQzEyMjA6IGh0dHBzOi8vYnVnemlsbGEua2VybmVs
Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTk1MzAzCgpUbyBtZSBib3RoIGFwcGVhcnMgdG8gYmUgaWRl
bnRpY2FsLCBmb3IgdGhpcyByZWFzb24gZXZlbiBpZiBJIGhhdmUgYSBBTEM4OTIgSeKAmXZlIHBv
c3RlZCBvbiB0aGUgc2Vjb25kIG9uZSwganVzdCBiZWNhdXNlIGl0IGhhZCBtb3JlIHBvc3RzLgoK
VGhlIHBhcnRpY3VsYXIgdGhpbmcgaXMgdGhhdCBhY3F1aXJpbmcgd2l0aCBQdWxzZUF1ZGlvIG9u
IEF1ZGFjaXR5IHNob3cgdGhlIHByb2JsZW0sIGhvd2V2ZXIgdXNpbmcgQUxTQSBkaXJlY3RseSB0
aGUgaXNzdWUgaXMgbm90IHByZXNlbnQuIFRyeWluZyB1c2luZyBhcmVjb3JkIHN0aWxsIHByZXNl
bnQgdGhlIGlzc3VlIGZyb20gUHVsc2VBdWRpby4KClRyaWVkIHRvIHBsYXkgd2l0aCB0aGUgcGFy
YW1ldGVycyAvc3lzL2RldmljZXMvYXVkaW8gdG8gbm8gYXZhaWwuIENvbXBhcmVkIHRoZSBwaW5j
b25maWdzIGZyb20gV2luZG93cywgdGhleSBhcmUgaWRlbnRpY2FsLgoKQ2FuIHNvbWVvbmUgdHJ5
IHRvIGhlbHAgbWUgZml4IHRoZSBpc3N1ZT8KClNlbnQgd2l0aCBbUHJvdG9uTWFpbF0oaHR0cHM6
Ly9wcm90b25tYWlsLmNvbSkgU2VjdXJlIEVtYWlsLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVs
QGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbHNhLWRldmVsCg==
