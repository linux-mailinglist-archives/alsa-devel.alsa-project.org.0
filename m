Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0244739C4B0
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Jun 2021 03:00:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DCB71731;
	Sat,  5 Jun 2021 02:59:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DCB71731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622854809;
	bh=W5H9PG84S3qnJcpHLAyaDOSjIjj2nHRQUjLXu7hW9c0=;
	h=To:Subject:In-Reply-To:From:Date:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=SfS/UjMeDzjauyyj1+on+EbteArqnxdhAokR1+zkBtQDPnMtwG7iDopshTllr97zI
	 i84sPR3H2CUmKKYnqyt1bYfHmwgWwb53Va9LX5k+BsssH5y8vCJWqWIfWDW7TBp+y1
	 1XwmPvAEtU6qXcckrP5jbTjK+gx4u8tpUaxHxXIc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BA6EF80424;
	Sat,  5 Jun 2021 02:58:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 571AFF802C4; Sat,  5 Jun 2021 02:58:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=MSGID_FROM_MTA_HEADER,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-m17641.qiye.163.com (mail-m17641.qiye.163.com
 [59.111.176.41])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7ECF3F8016D
 for <alsa-devel@alsa-project.org>; Sat,  5 Jun 2021 02:58:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7ECF3F8016D
Received: from vivo.com (localhost [127.0.0.1])
 by mail-m17641.qiye.163.com (Hmail) with ESMTP id 33A2E6007C;
 Sat,  5 Jun 2021 08:58:31 +0800 (CST)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Message-ID: <ACAAVAAeDkjqA4*JP7kOYqp2.3.1622854711099.Hmail.wanjiabing@vivo.com>
To: Mark Brown <broonie@kernel.org>
Subject: =?UTF-8?B?UmU6UmU6IFtQQVRDSF0gQVNvQzogUmVtb3ZlIHVubmVlZGVkIHNlbWljb2xvbiBpbiByazgxN19jb2RlYy5j?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 58.213.83.158
In-Reply-To: <20210604142652.GA915@sirena.org.uk>
MIME-Version: 1.0
Received: from wanjiabing@vivo.com( [58.213.83.158) ] by ajax-webmail (
 [127.0.0.1] ) ; Sat, 5 Jun 2021 08:58:31 +0800 (GMT+08:00)
From: Jiabing Wan <wanjiabing@vivo.com>
Date: Sat, 5 Jun 2021 08:58:31 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQh0YTFZJGkhDTUlNGhgaSU9VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKQ1VLWQY+
X-HM-Sender-Digest: e1kJHlYWEh9ZQU1PS01PQk9LTENMN1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
 WUc6ODo6LTo6Hj8QEQo6T1ExK0wQNCIKC0lVSFVKTUlJQ05PTEpKT05CVTMWGhIXVQwaFRESGhkS
 FRw7DRINFFUYFBZFWVdZEgtZQVlOQ1VJSkhVQ0hVSk5DWVdZCAFZQUlNQ0g3Bg++
X-HM-Tid: 0a79d9adb7b1d997kuws33a2e6007c
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Chris Morgan <macromorgan@hotmail.com>, Lee Jones <lee.jones@linaro.org>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

IApIaSwgTWFyawoKPk9uIEZyaSwgSnVuIDA0LCAyMDIxIGF0IDExOjAwOjIzQU0gKzA4MDAsIFdh
biBKaWFiaW5nIHdyb3RlOgo+PiBGaXggZm9sbG93aW5nIGNvY2NpY2hlY2sgd2FybmluZzoKPj4g
Li9zb3VuZC9zb2MvY29kZWNzL3JrODE3X2NvZGVjLmM6NDk6Mi0zOiBVbm5lZWRlZCBzZW1pY29s
b24KPgo+VGhpcyBkb2Vzbid0IGFwcGx5IGFnYWluc3QgY3VycmVudCBjb2RlLCBwbGVhc2UgY2hl
Y2sgYW5kIHJlc2VuZC4KCkkgZml4ZWQgdGhpcyBiYXNlZCBvbiBuZXh0LTIwMjEwNjAzLgpBbmQg
dGhpcyBhbHNvIGFwcGxpZXMgYWdhaW5zdCBuZXh0LTIwMjEwNjA0LgoKSXQgbWlnaHQgYmUgbXkg
ZmF1bHQgdGhhdCBJIGRpZG4ndCBkZWNyaWJlIHRoZSB2ZXJzaW9uIGNsZWFybHkuCgpTaG91bGQg
SSB3cml0ZSBzb21lIGRlc2NyaXB0aW9uIGF0IHN1YmplY3QgbGluZSB3aGVuIHdvcmtpbmcgb24g
QVNvQyBvZiAgbGludXgtbmV4dD8KClRoYW5rcywKSmlhYmluZw0KDQo=
