Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AED11472A5
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jan 2020 21:36:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0138167F;
	Thu, 23 Jan 2020 21:35:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0138167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579811782;
	bh=WTdfiP7+9LyKrCnOQQ1640TKkcHAR1jE6UjXpU8BjsI=;
	h=In-Reply-To:References:To:From:Date:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DhtHrPK3EfGv4gSleciVE5By3NtsphyeDO2JGmbRuEH3I39ZnxYrvb7kTGpSfErrD
	 N5ENIvK3cGojmFpaFhiF+E2k2ipaXOeCQRIv1xeqdwbH3A97BeGUJ/8PSHL0tl/xt7
	 2Ffp5nZ7dCCWlxV3+TJ7cpy4v3tX5SeBbpcvWBXY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D105CF80271;
	Thu, 23 Jan 2020 21:33:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FF54F800BA; Thu, 23 Jan 2020 21:33:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.0
Received: from herc.mirbsd.org (herc.mirbsd.org
 [IPv6:2001:470:1f15:10c:202:b3ff:feb7:54e8])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C7ABF800BA
 for <alsa-devel@alsa-project.org>; Thu, 23 Jan 2020 21:33:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C7ABF800BA
Received: from herc.mirbsd.org (tg@localhost [IPv6:::1])
 by herc.mirbsd.org (8.14.9/8.14.5) with ESMTP id 00NKWWeX016306
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Thu, 23 Jan 2020 20:32:34 GMT
Received: (from tg@localhost)
 by herc.mirbsd.org (8.14.9/8.14.5/Submit) id 00NKWWwd018015;
 Thu, 23 Jan 2020 20:32:32 GMT
Message-Id: <202001232032.00NKWWwd018015@herc.mirbsd.org>
X-Authentication-Warning: herc.mirbsd.org: tg set sender to t.glaser@tarent.de
 using -f
In-Reply-To: <alpine.DEB.2.22.394.2001232123580.6327@tglase-nb.lan.tarent.de>
References: <alpine.DEB.2.22.394.2001232123580.6327@tglase-nb.lan.tarent.de>
 <alpine.DEB.2.21.1911202147000.2011@tglase.lan.tarent.de>
 <s5hzhgpsl7b.wl-tiwai@suse.de>
 <alpine.DEB.2.21.1911211536340.23653@tglase-nb.lan.tarent.de>
 <s5hmuco3unv.wl-tiwai@suse.de>
 <157133531799.6063.9249463816269134459.reportbug@tglase.lan.tarent.de>
To: alsa-devel@alsa-project.org
MIME-Version: 1.0
From: mirabilos <t.glaser@tarent.de>
Date: Thu, 23 Jan 2020 21:21:21 +0100
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by herc.mirbsd.org id
 00NKWWwd018015
Cc: 870396@bugs.debian.org
Subject: [alsa-devel] [PATCH 3/3] test: explicitly cast time types to types
 printf can handle
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

QWxzbyAoYXMgcmVxdWVzdGVkIGJ5IFRha2FzaGkgSXdhaSksIGNvbnZlcnQgdGltZWRpZmYoKSB0
byB0aW1lX3QsCmFzIGl04oCZcyB0aGUgcHJvcGVyIHJldHVybiB0eXBlLgoKU2lnbmVkLW9mZi1i
eTogbWlyYWJpbG9zIDx0Z0BkZWJpYW4ub3JnPgotLS0KIHRlc3QvbGF0ZW5jeS5jICAgICB8IDEw
ICsrKysrLS0tLS0KIHRlc3QvcXVldWVfdGltZXIuYyB8IDEwICsrKysrLS0tLS0KIDIgZmlsZXMg
Y2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
dGVzdC9sYXRlbmN5LmMgYi90ZXN0L2xhdGVuY3kuYwppbmRleCAyOThiYWI4YS4uY2YzOWQzMTkg
MTAwNjQ0Ci0tLSBhL3Rlc3QvbGF0ZW5jeS5jCisrKyBiL3Rlc3QvbGF0ZW5jeS5jCkBAIC0zMjUs
NyArMzI1LDcgQEAgdm9pZCBzZXRzY2hlZHVsZXIodm9pZCkKIAlwcmludGYoIiEhIVNjaGVkdWxl
ciBzZXQgdG8gUm91bmQgUm9iaW4gd2l0aCBwcmlvcml0eSAlaSBGQUlMRUQhISFcbiIsIHNjaGVk
X3BhcmFtLnNjaGVkX3ByaW9yaXR5KTsKIH0KIAotbG9uZyB0aW1lZGlmZihzbmRfdGltZXN0YW1w
X3QgdDEsIHNuZF90aW1lc3RhbXBfdCB0MikKK3RpbWVfdCB0aW1lZGlmZihzbmRfdGltZXN0YW1w
X3QgdDEsIHNuZF90aW1lc3RhbXBfdCB0MikKIHsKIAlzaWduZWQgbG9uZyBsOwogCkBAIC02ODMs
MTIgKzY4MywxMiBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQogCQlzbmRfcGNt
X25vbmJsb2NrKHBoYW5kbGUsICFibG9jayA/IDEgOiAwKTsKIAkJaWYgKG9rKSB7CiAjaWYgMQot
CQkJcHJpbnRmKCJQbGF5YmFjayB0aW1lID0gJWxpLiVpLCBSZWNvcmQgdGltZSA9ICVsaS4laSwg
ZGlmZiA9ICVsaVxuIiwKLQkJCSAgICAgICBwX3RzdGFtcC50dl9zZWMsCisJCQlwcmludGYoIlBs
YXliYWNrIHRpbWUgPSAlbGxpLiVpLCBSZWNvcmQgdGltZSA9ICVsbGkuJWksIGRpZmYgPSAlbGxp
XG4iLAorCQkJICAgICAgIChsb25nIGxvbmcpcF90c3RhbXAudHZfc2VjLAogCQkJICAgICAgIChp
bnQpcF90c3RhbXAudHZfdXNlYywKLQkJCSAgICAgICBjX3RzdGFtcC50dl9zZWMsCisJCQkgICAg
ICAgKGxvbmcgbG9uZyljX3RzdGFtcC50dl9zZWMsCiAJCQkgICAgICAgKGludCljX3RzdGFtcC50
dl91c2VjLAotCQkJICAgICAgIHRpbWVkaWZmKHBfdHN0YW1wLCBjX3RzdGFtcCkpOworCQkJICAg
ICAgIChsb25nIGxvbmcpdGltZWRpZmYocF90c3RhbXAsIGNfdHN0YW1wKSk7CiAjZW5kaWYKIAkJ
CWJyZWFrOwogCQl9CmRpZmYgLS1naXQgYS90ZXN0L3F1ZXVlX3RpbWVyLmMgYi90ZXN0L3F1ZXVl
X3RpbWVyLmMKaW5kZXggYzRmZmIxOTIuLmM1Y2U1ODY2IDEwMDY0NAotLS0gYS90ZXN0L3F1ZXVl
X3RpbWVyLmMKKysrIGIvdGVzdC9xdWV1ZV90aW1lci5jCkBAIC05OSwxMSArOTksMTEgQEAgbWFp
bihpbnQgYXJnYyBBVFRSSUJVVEVfVU5VU0VELCBjaGFyICoqYXJndiBBVFRSSUJVVEVfVU5VU0VE
KQogCW5vcm1hbGl6ZSgmZGlmZmRpZmYpOwogCXByZXZkaWZmID0gZGlmZjsKIAotCWZwcmludGYo
c3RkZXJyLCAiIHJlYWwgdGltZTogJTEybGQgc2VjICU4bGQgdXNlY1xucXVldWUgdGltZTogJTEy
bGQgc2VjICU4bGQgdXNlY1xuICAgICAgZGlmZjogJTEybGQgc2VjICU4bGQgdXNlY1xuICBkaWZm
ZGlmZjogJTEybGQgc2VjICU4bGQgdXNlY1xuIiwKLQkJdHYudHZfc2VjLCB0di50dl91c2VjLAot
CQkobG9uZylydGltZS0+dHZfc2VjLCAobG9uZylydGltZS0+dHZfbnNlYyAvIDEwMDAsCi0JCWRp
ZmYudHZfc2VjLCBkaWZmLnR2X3VzZWMsCi0JCShsb25nKWRpZmZkaWZmLnR2X3NlYywgKGxvbmcp
ZGlmZmRpZmYudHZfdXNlYyk7CisJZnByaW50ZihzdGRlcnIsICIgcmVhbCB0aW1lOiAlMTJsbGQg
c2VjICU4bGQgdXNlY1xucXVldWUgdGltZTogJTEybGxkIHNlYyAlOGxkIHVzZWNcbiAgICAgIGRp
ZmY6ICUxMmxsZCBzZWMgJThsZCB1c2VjXG4gIGRpZmZkaWZmOiAlMTJsbGQgc2VjICU4bGQgdXNl
Y1xuIiwKKwkJKGxvbmcgbG9uZyl0di50dl9zZWMsIChsb25nKXR2LnR2X3VzZWMsCisJCShsb25n
IGxvbmcpcnRpbWUtPnR2X3NlYywgKGxvbmcpcnRpbWUtPnR2X25zZWMgLyAxMDAwLAorCQkobG9u
ZyBsb25nKWRpZmYudHZfc2VjLCAobG9uZylkaWZmLnR2X3VzZWMsCisJCShsb25nIGxvbmcpZGlm
ZmRpZmYudHZfc2VjLCAobG9uZylkaWZmZGlmZi50dl91c2VjKTsKIAogCWlmIChkaWZmZGlmZi50
dl91c2VjID4gIDUwMDAgfHwKIAkgICAgZGlmZmRpZmYudHZfdXNlYyA8IC01MDAwKSB7Ci0tIAoy
LjI1LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFs
c2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczov
L21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
