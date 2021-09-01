Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B835A3FDFCC
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Sep 2021 18:24:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55DB716E4;
	Wed,  1 Sep 2021 18:23:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55DB716E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630513470;
	bh=+HexKu43nAm+AppvQsa4VMNmV+utX1+/8CPtDBoi/Bo=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=nFydKwL171XbXUW8t3cuECnpv72zMiSKGMzbf0vxMuz+VoGzge0/qUjvt1WLDSN0P
	 7SfTbQXvPlnjhIjgZl4jg1eW2bXilyNBtKz97UTate8b6yJieBVLBbe41IdO3tRGKb
	 t22rXZY41LgxHN+9fXdNSVBS3aiUBSRdIkSBFYgA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0597F80256;
	Wed,  1 Sep 2021 18:23:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D9EEF80254; Wed,  1 Sep 2021 18:23:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE430F8020D
 for <alsa-devel@alsa-project.org>; Wed,  1 Sep 2021 18:23:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE430F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="M0a+iHAx"
Date: Wed, 01 Sep 2021 16:23:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1630513385;
 bh=RIIfgFukHkv4b48POTrwHUvDt3mMjGYypmeQ5sq7whg=;
 h=Date:To:From:Reply-To:Subject:From;
 b=M0a+iHAx1IvCwu1lCm90uGqy1Pxl2N5mdfOhkZ7UhhjV5UY+K6YYWyl9zqdIKtXyb
 Eyv8fZbcGD76h+kf+SFzKNSp6aFpHeeTMrA8vFmXMpc0O6/gSUt+77ZU333CIf4WXO
 AEwCn6EZW4LsLhT0ufuEIuoPADEiomx5Wxj28snc=
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
From: smesgr <smesgr@protonmail.com>
Subject: Asus Xonar SE front-panel audio support quirks snd_usb_audio
Message-ID: <AocgHmB2Ef4GBJ23rjESzap7qD-DEoZebCYfPBi6khX9i8EdCi2r2Grku-4IY3YBSOD2Bc1HeZFxI-lujMMGKlgW88wh1uwjLbdlXpfd96U=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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
Reply-To: smesgr <smesgr@protonmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

R3JlZXRpbmdzLAoKSSBoYXZlIGJvdXJnaHQgYSBBc3VzIFhvbmFyIFNFICg5MFlBMDBUMC1NMFVB
MDApIHdoaWNoIGlzIG9ubHkgd29ya2luZyBwYXJ0aWFsbHkuIFdoaWxlIHRoZSByZWFyIGNvbm5l
Y3RvcnMgc2VlbXMgdG8gd29yayB0aGUgZnJvbnQgaGVhZGVyIGlzIG5vdC4gSSBmb3VuZCBzb21l
IHJlcG9ydHMgc2NhdHRlcmVkIGFyb3VuZCB0aGUgaW50ZXJuZXQgd2l0aCB0aGUgc2FtZSBpc3N1
ZSBidXQgd2l0aG91dCBhIHNvbHV0aW9uLgoKSXQgaXMgYSBQQ0llIGNhcmQgd2l0aCBhbiBwY2ll
LXRvLXVzYiBpbnRlcmZhY2UuIFRodXMgdGhlIGNhcmQgaXMgcmVwb3J0ZWQgYXMgYSB1c2IgZGV2
aWNlOgpJRCAwYjA1OjE4OWQgQVNVU1RlayBDb21wdXRlciwgSW5jLiBYb25hciBTb3VuZENhcmQK
ClRoZSBjYXJkIGhhcyBzZXZlcmFsIGF1ZGlvIEVuZHBvaW50cyBFUCA1IHRvIEVQIDkgYW5kIGFu
IGFkZGl0b25hbCBISUQgRVAgNC4gQWxsIHRoZSByZWFyIGNvbm5lY3RvcnMgc2VlbXMgdG8gd29y
ay4gQ2FuJ3QgdGVzdCB0aGUgU1BESUYgYnV0IGZvdW5kIGEgU0Ugc3BlY2ZpYyBxdWlyayBpbiB0
aGUgYWxzYSBVU0IgY29uZmlndXJhdGlvbiBmb3IgdGhlIFNEUElGIFBDTSB0aHVzIGFzc3VtZSB0
aGlzIGlzc3VlIHdhcyBhbHJlYWR5IGZpeGVkLgpFUCA1IC0+IEF1ZGlvIE91dApFUCA2IC0+IFNE
UElGCkVQIDggLT4gTGluZSBJbgpUaGUgcmVhciBjb25uZWN0b3IgZG9uJ3QgaGF2ZSBhIHBsdWct
aW4tZGV0ZWN0b3IsIHRoZSBmcm9udC1wYW5lbCBoYXMgYW5kIGlzIHdvcmtpbmc6Cm5vZGUgaHc6
MSwgIzE2ICgwLDAsMCxIZWFkcGhvbmUgLSBPdXRwdXQgSmFjaywwKSBWQUxVRQpub2RlIGh3OjEs
ICMzMSAoMCwwLDAsTWljIC0gSW5wdXQgSmFjaywxKSBWQUxVRQoKSW4gc3RlcmVvIGNvbmZpZ3Vy
YXRpb24gdGhlIGNhcmQgaGFzICJoZWFkcGhvbmVzIiBhbmQgInNwZWFrZXIiLiBUaGUgRnJvbnQg
UGFuZWwgaW5wdXQgbm9yIG91dHB1dCBpcyB3b3JraW5nLiBJZiBoZWFkcGhvbmVzIGlzIHNlbGVj
dGVkIHRoZSByZWFyIGlzIGRpc2FibGVkIGJ1dCB0aGUgZnJvbnQgaGVhZGVyIGlzIG5vdCB3b3Jr
aW5nLiBTaWRlIG5vdGUgdGhlIGRlZmF1bHQgTWljcm9zb2Z0IGRyaXZlciBoYXMgdGhlIHNhbWUg
aXNzdWUgc28gSSBhc3N1bWUgdGhlIGNhcmQgdXNiIGNvbmZpZ3VyYXRpb24gaXMgZmF1bHR5LgpJ
IGluc3RhbGxlZCB0aGUgQVNVUyBkcml2ZXIgYW5kIHRyYWNrZWQgdGhlIFVTQiBtZXNzYWdlcyB3
aXRoIHdpcmVzaGFyayBpbiBhIFdpbmRvd3MgVk0uIEkgbm90aWNlZCB0aGUgQXN1cyBkcml2ZXIg
dXNlcyB0aG9zZSBhZGRpdGlvbmFsIHBvc3RzCkVQIDcgLT4gRnJvbnQgQXVkaW8gT3V0CkVQIDkg
LT4gRnJvbnQgQXVkaW8gSW4KCk5laXRoZXIgdGhlIGRlZmF1bHQgV2luZG93cywgbm9yIGFsc2Eg
dXNlIHRob3NlIEVQLiBJcyB0aGVyZSBhIHdheSB0byBmb3JjZSB0aGUgYWxzYSBkcml2ZXIgdG8g
dXNlIEVQNy85IHRvIGZ1cnRoZXIgYW5hbHlzZSB0aGlzIGlzc3VlPwoKQmVzdCBSZWdhcmRzClNt
ZXNncgoKU2VudCB3aXRoIFByb3Rvbk1haWwgU2VjdXJlIEVtYWlsLg==
