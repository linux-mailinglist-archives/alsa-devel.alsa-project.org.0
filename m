Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD6723128E
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jul 2020 21:29:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C64D61739;
	Tue, 28 Jul 2020 21:29:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C64D61739
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595964596;
	bh=2CQkSF3z2Khr3ozs8hZxvRORlmBNOttbUHW3xO2homg=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=gqQQhz0vmyHyWgA9xuy777XYcmGVIdoMKYHRg0EHaxyR3maxBfWJyxoKO6AiNl8U/
	 B657D1YcRNNe2oNQVfRe7zPmYC+zAYJ+7Ij90ECYvw6+MaoxLGZ4rCxckQX2nA/E5J
	 t/KzdsX7aMHtVFd2/iXlUOxFFM+khVjnIhA0AzjM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02DAEF802BE;
	Tue, 28 Jul 2020 21:27:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01BA6F802BD; Tue, 28 Jul 2020 21:27:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from schnee.saar.de (schnee.saar.de [192.109.53.243])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB862F8027B
 for <alsa-devel@alsa-project.org>; Tue, 28 Jul 2020 21:27:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB862F8027B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=marzen.de header.i=@marzen.de
 header.b="DvwDoVys"
Received: from bubu.intern.marzen.de (bubu.intern.marzen.de [10.66.53.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by schnee.saar.de (Postfix) with ESMTPS id A4B0063F63
 for <alsa-devel@alsa-project.org>; Tue, 28 Jul 2020 21:27:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marzen.de; s=201902;
 t=1595964462; bh=2CQkSF3z2Khr3ozs8hZxvRORlmBNOttbUHW3xO2homg=;
 h=Date:From:Reply-To:To:Subject:From;
 b=DvwDoVysC108Vk5JwwVcZMWXrtUA0Zkltq/tLiuhLM+I7ZQplYSvHPy1UoHfy3mqm
 7RGQV98NnC4uUbDchKj1ONr/iI42NiCwcsXVdjfkC4LrkkIRcDOEv3bvdrhi4DSnmn
 Ns6zHAuwXv/sBim9iZ2OqIsczJXib9zi/iOsYhKw=
Date: Tue, 28 Jul 2020 21:27:42 +0200 (CEST)
From: Holger Marzen <holger@marzen.de>
X-X-Sender: hm@bubu.intern.marzen.de
To: alsa-devel@alsa-project.org
Subject: MOTU Ultralite AVB: Modulo-8 output channel hopping
Message-ID: <alpine.DEB.2.20.2007282123270.14500@bubu.intern.marzen.de>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1219487617-1595925347=:4307"
Content-ID: <alpine.DEB.2.20.2007282123271.14500@bubu.intern.marzen.de>
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
Reply-To: holger@marzen.de
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--8323329-1219487617-1595925347=:4307
Content-Type: text/plain; charset=US-ASCII
Content-ID: <alpine.DEB.2.20.2007282123272.14500@bubu.intern.marzen.de>

Hi all,

I am using the MOTU Ultralite AVB USB audio interface. With recent
firmwares MOTU uses implicit feedback. Kernel 5.8-rc6 can handle it when
I apply the attached patch with the MOTU signatures.

But both with the old and the new firmware there is an occasional modulo
8 output channel hopping. What goes out to system:playback_1 in jackd
ends on channel 1, 9 or 17 in the interface. Same for system:playback_2.

I can force a hop when changing jackd's buffer size on the fly with
jack_bufsize.

One user reports this issue with ALSA clients, too, so it's probably no
jackd issue.

Since I never found this issue reported from a Windows or Mac user
it may be buried deep in the ALSA kernel code.

For me it seems that flaws/timeouts in the USB communication force this
hopping in the ALSA kernel.

Any ideas how to find out where the hopping happens?
sound/usb/endpoint.c ?
sound/usb/stream.c?

Regards
Holger
--8323329-1219487617-1595925347=:4307
Content-Type: text/plain; name=drumbell_avb-patch_for_linux_5.8.rc6.txt; charset=us-ascii
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.DEB.2.20.2007281035470.4307@bubu.intern.marzen.de>
Content-Description: 
Content-Disposition: attachment; filename=drumbell_avb-patch_for_linux_5.8.rc6.txt

LS0tIHNvdW5kL3VzYi9jbG9jay5jLm9yaWcJMjAyMC0wNy0yNSAyMzozOToy
My42ODY5MTU5NTUgKzAyMDANCisrKyBzb3VuZC91c2IvY2xvY2suYwkyMDIw
LTA3LTI2IDAwOjAzOjIwLjA3NzAzNDYyNiArMDIwMA0KQEAgLTE4Niw3ICsx
ODYsOCBAQA0KIAkgKiBTYW1wbGUgcmF0ZSBjaGFuZ2VzIHRha2VzIG1vcmUg
dGhhbiAyIHNlY29uZHMgZm9yIHRoaXMgZGV2aWNlLiBDbG9jaw0KIAkgKiB2
YWxpZGl0eSByZXF1ZXN0IHJldHVybnMgZmFsc2UgZHVyaW5nIHRoYXQgcGVy
aW9kLg0KIAkgKi8NCi0JaWYgKGNoaXAtPnVzYl9pZCA9PSBVU0JfSUQoMHgw
N2ZkLCAweDAwMDQpKSB7DQorICBpZiAoY2hpcC0+dXNiX2lkID09IFVTQl9J
RCgweDA3ZmQsIDB4MDAwNCkgfHwNCisgICAgICBjaGlwLT51c2JfaWQgPT0g
VVNCX0lEKDB4MDdmZCwgMHgwMDA1KSkgew0KIAkJY291bnQgPSAwOw0KIA0K
IAkJd2hpbGUgKCghcmV0KSAmJiAoY291bnQgPCA1MCkpIHsNCi0tLSBzb3Vu
ZC91c2IvcGNtLmMub3JpZwkyMDIwLTA3LTI1IDIzOjQyOjU3LjI2NzE5Njgx
OSArMDIwMA0KKysrIHNvdW5kL3VzYi9wY20uYwkyMDIwLTA3LTI1IDIzOjQy
OjI4Ljk1ODU3Nzc5OCArMDIwMA0KQEAgLTM2Niw2ICszNjYsMTAgQEANCiAJ
CWVwID0gMHg4NDsNCiAJCWlmbnVtID0gMDsNCiAJCWdvdG8gYWRkX3N5bmNf
ZXBfZnJvbV9pZm51bTsNCisgIGNhc2UgVVNCX0lEKDB4MDdmZCwgMHgwMDA1
KTogLyogTU9UVSBBVkIgU2VyaWVzICovDQorICAgIGVwID0gMHg4NzsNCisg
ICAgaWZudW0gPSAyOw0KKyAgICBnb3RvIGFkZF9zeW5jX2VwX2Zyb21faWZu
dW07DQogCWNhc2UgVVNCX0lEKDB4MDdmZCwgMHgwMDA4KTogLyogTU9UVSBN
IFNlcmllcyAqLw0KIAljYXNlIFVTQl9JRCgweDMxZTksIDB4MDAwMik6IC8q
IFNvbGlkIFN0YXRlIExvZ2ljIFNTTDIrICovDQogCWNhc2UgVVNCX0lEKDB4
MGQ5YSwgMHgwMGRmKTogLyogUlRYNjAwMSAqLw0K

--8323329-1219487617-1595925347=:4307--
