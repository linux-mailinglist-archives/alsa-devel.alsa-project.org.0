Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A51961BF1F
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2019 23:27:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C69016DE;
	Mon, 13 May 2019 23:26:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C69016DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557782849;
	bh=kCeeFUvIWySo2rGAVXG0rHHT3918PMtgs71HRN+c4uU=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TL1D1wwdA5AevfoqRaTPxbZYiLDAtLfdafNps4obRPG2F5jEQudrDnP91kdjat59F
	 ShsLax9JPJ3V4xX2bqZYWCW6jdcgH1Qiy6c7YbGV1Igise03Dlzp5Zq8G66RimaOIN
	 Pbd1dktvGMNLFZZVBQXZNP30HOUUUAf1vMEEr3kQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CD9EF8968A;
	Mon, 13 May 2019 23:25:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89B16F89684; Mon, 13 May 2019 23:25:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00D4EF8961A
 for <alsa-devel@alsa-project.org>; Mon, 13 May 2019 23:25:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00D4EF8961A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hUHE7k7S"
Received: by mail-lf1-x144.google.com with SMTP id x132so10189927lfd.0
 for <alsa-devel@alsa-project.org>; Mon, 13 May 2019 14:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:from:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=E0M4b/oNVCZIuhWzeXXOi1GoImm5Zvzo38NHJpzr4Fg=;
 b=hUHE7k7Shb4wYdC3YkQQWLkXcKfi7HLRHgIMOJiPmCjeOGHFyp0fsQF+ra72pM4VX7
 x8q04j2c8ZOodNGTYlCxwaeG7ZNfELrs2TZzlyuZa4sytzNols6g6Qoi4L6sokv7Zlme
 xMPne0Z58vw4qWqqgbO7btVDyea49rclF+6ml4EnJX3leY548GAqyhNIsKTgIEP+0xTD
 +1iDvHQblyQXq6wEDm+Yd/9c2NJST3wDJwdZXZIie3do1rFMJMuX8iq4rgo0bNVyeuYu
 ZCtKf4/Sz4l+9JF/Zf1fy7fFoMlwaxIdxM8VqR8xWJxAAbDN4fer/4eL4rZxEF5bUXW/
 HpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:from:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=E0M4b/oNVCZIuhWzeXXOi1GoImm5Zvzo38NHJpzr4Fg=;
 b=VZdCaBet9dzDPgm33WuiFZzyKJVl4euRLZ+S5vNknz3CPv99ssXOGuqT2OZq1uUzlJ
 vZZcgU60xemqODOhwpzNZZ2596S1pzF4YfVS3tmAxMSNnex1VxqYx/jxxwldfBRkaeXk
 LdEdhqvUBoqKjXRjwKmWgnmTZIicK1W26KTVljLYZ324HQ1DcLMFFiTVgs8Sdx+kB1zm
 pHOLL2JZCIDdIaEMV4KlAFWsYvuKOJ1N3pXnit0/XABqxPxJ4sIZm0kVUmk7J/HP6Wjw
 8czBRvhm3Xw6uulkdoj2Gsu1l8Zsm9frUAuKU1p3NhfVRRtkVJnPIoyGkrdTFjKOMR19
 mKSg==
X-Gm-Message-State: APjAAAUkdCs3ZGT7R6mojI+TdRbJByXIVGzGbqQ4l5rTaGjlj92murN9
 Xnnalp6Hy2f6ix/u9vTrN66cfcxm
X-Google-Smtp-Source: APXvYqyXMR1Szbd/w69/Dfc+DaLLatMwOgak/6r4D69swTzqiihHtDPu/KZ/+eNuBAoUoS0YY+wNBQ==
X-Received: by 2002:a19:ca02:: with SMTP id a2mr14442656lfg.88.1557782738421; 
 Mon, 13 May 2019 14:25:38 -0700 (PDT)
Received: from [192.168.0.94] (31-178-116-31.dynamic.chello.pl.
 [31.178.116.31])
 by smtp.googlemail.com with ESMTPSA id j19sm3444537lfj.52.2019.05.13.14.25.37
 for <alsa-devel@alsa-project.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 May 2019 14:25:37 -0700 (PDT)
To: alsa-devel@alsa-project.org
From: =?UTF-8?Q?Micha=c5=82_Wadowski?= <wadosm@gmail.com>
Message-ID: <158b63b9-ff73-7f53-de83-5a7b8a21b250@gmail.com>
Date: Mon, 13 May 2019 23:25:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: pl-PL
Subject: [alsa-devel] [PATCH] Fix for Lenovo B50-70 inverted internal
	microphone bug.
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

QWRkIHBhdGNoIGZvciByZWFsdGVrIGNvZGVjIGluIExlbm92byBCNTAtNzAuCkJ1Z3ppbGxhOiBo
dHRwczovL2J1Z3MubGF1bmNocGFkLm5ldC91YnVudHUvK3NvdXJjZS9hbHNhLWRyaXZlci8rYnVn
LzE1MjQyMTUKClNpZ25lZC1vZmYtYnk6IE1pY2hhxYIgV2Fkb3dza2kgPHdhZG9zbUBnbWFpbC5j
b20+Ci0tLQogc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMgfCA3ICsrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9zb3VuZC9wY2kvaGRhL3Bh
dGNoX3JlYWx0ZWsuYyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCmluZGV4IDQyY2Qz
OTQ1ZTBkZS4uMzZjMThhNWJhMjg4IDEwMDY0NAotLS0gYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3Jl
YWx0ZWsuYworKysgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwpAQCAtNTY3Niw2ICs1
Njc2LDcgQEAgZW51bSB7CiAJQUxDMjMzX0ZJWFVQX0VBUERfQ09FRl9BTkRfTUlDX05PX1BSRVNF
TkNFLAogCUFMQzIzM19GSVhVUF9MRU5PVk9fTVVMVElfQ09ERUNTLAogCUFMQzIzM19GSVhVUF9B
Q0VSX0hFQURTRVRfTUlDLAorCUFMQzIzM19GSVhVUF9JTlZfRE1JQywKIAlBTEMyOTRfRklYVVBf
TEVOT1ZPX01JQ19MT0NBVElPTiwKIAlBTEMyMjVfRklYVVBfREVMTF9XWVNFX01JQ19OT19QUkVT
RU5DRSwKIAlBTEM3MDBfRklYVVBfSU5URUxfUkVGRVJFTkNFLApAQCAtNjM4NCw2ICs2Mzg1LDEw
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaGRhX2ZpeHVwIGFsYzI2OV9maXh1cHNbXSA9IHsKIAkJ
LnR5cGUgPSBIREFfRklYVVBfRlVOQywKIAkJLnYuZnVuYyA9IGFsYzIzM19maXh1cF9sZW5vdm9f
bGluZTJfbWljX2hvdGtleSwKIAl9LAorCVtBTEMyMzNfRklYVVBfSU5WX0RNSUNdID0geworCQku
dHlwZSA9IEhEQV9GSVhVUF9GVU5DLAorCQkudi5mdW5jID0gYWxjX2ZpeHVwX2ludl9kbWljLAor
CX0sCiAJW0FMQzI1NV9GSVhVUF9ERUxMX1NQS19OT0lTRV0gPSB7CiAJCS50eXBlID0gSERBX0ZJ
WFVQX0ZVTkMsCiAJCS52LmZ1bmMgPSBhbGNfZml4dXBfZGlzYWJsZV9hYW1peCwKQEAgLTY5NzUs
NiArNjk4MCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3BjaV9xdWlyayBhbGMyNjlfZml4
dXBfdGJsW10gPSB7CiAJU05EX1BDSV9RVUlSSygweDE3YWEsIDB4MzEzYywgIlRoaW5rQ2VudHJl
IFN0YXRpb24iLCBBTEMyOTRfRklYVVBfTEVOT1ZPX01JQ19MT0NBVElPTiksCiAJU05EX1BDSV9R
VUlSSygweDE3YWEsIDB4MzkwMiwgIkxlbm92byBFNTAtODAiLCBBTEMyNjlfRklYVVBfRE1JQ19U
SElOS1BBRF9BQ1BJKSwKIAlTTkRfUENJX1FVSVJLKDB4MTdhYSwgMHgzOTc3LCAiSWRlYVBhZCBT
MjEwIiwgQUxDMjgzX0ZJWFVQX0lOVF9NSUMpLAorCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDM5
NzgsICJMZW5vdm8gQjUwLTcwIiwgQUxDMjMzX0ZJWFVQX0lOVl9ETUlDKSwKIAlTTkRfUENJX1FV
SVJLKDB4MTdhYSwgMHgzOTc4LCAiSWRlYVBhZCBZNDEwUCIsIEFMQzI2OV9GSVhVUF9OT19TSFVU
VVApLAogCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDUwMTMsICJUaGlua3BhZCIsIEFMQzI2OV9G
SVhVUF9MSU1JVF9JTlRfTUlDX0JPT1NUKSwKIAlTTkRfUENJX1FVSVJLKDB4MTdhYSwgMHg1MDFh
LCAiVGhpbmtwYWQiLCBBTEMyODNfRklYVVBfSU5UX01JQyksCkBAIC03MTU3LDYgKzcxNjMsNyBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IGhkYV9tb2RlbF9maXh1cCBhbGMyNjlfZml4dXBfbW9kZWxz
W10gPSB7CiAJey5pZCA9IEFMQzI1Nl9GSVhVUF9BU1VTX0FJT19HUElPMiwgLm5hbWUgPSAiYWxj
MjU2LWFzdXMtYWlvIn0sCiAJey5pZCA9IEFMQzIzM19GSVhVUF9BU1VTX01JQ19OT19QUkVTRU5D
RSwgLm5hbWUgPSAiYWxjMjMzLWFzdXMifSwKIAl7LmlkID0gQUxDMjMzX0ZJWFVQX0VBUERfQ09F
Rl9BTkRfTUlDX05PX1BSRVNFTkNFLCAubmFtZSA9ICJhbGMyMzMtZWFwZCJ9LAorCXsuaWQgPSBB
TEMyMzNfRklYVVBfSU5WX0RNSUMsIC5uYW1lID0gImFjbDIzMy1pbnYtZG1pYyJ9LAogCXsuaWQg
PSBBTEMyOTRfRklYVVBfTEVOT1ZPX01JQ19MT0NBVElPTiwgLm5hbWUgPSAiYWxjMjk0LWxlbm92
by1taWMifSwKIAl7LmlkID0gQUxDMjI1X0ZJWFVQX0RFTExfV1lTRV9NSUNfTk9fUFJFU0VOQ0Us
IC5uYW1lID0gImFsYzIyNS13eXNlIn0sCiAJey5pZCA9IEFMQzI3NF9GSVhVUF9ERUxMX0FJT19M
SU5FT1VUX1ZFUkIsIC5uYW1lID0gImFsYzI3NC1kZWxsLWFpbyJ9LAotLSAKMi43LjQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFp
bGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxz
YS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
