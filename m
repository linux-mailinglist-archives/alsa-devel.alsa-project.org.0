Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F22A1C81
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:15:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 650BD167A;
	Thu, 29 Aug 2019 16:14:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 650BD167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567088120;
	bh=Dv8UmoLcXn2tcrQ3glSfXgCzxDsLn7P38mw0/1wIIKM=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Fjuch8Ueh4XuMV8b+2l1KnvIfQHMgy7owK3ErE7xhQTG5E81iWPu9Qz92UuVxDRSW
	 n2KYHenhY++IKWrvUywND8axybeyGGG96eY9OvBVwHnJo/zUOCNDyMfxWQjabcBBin
	 PF++jUktgfkiGhyBOq4W0fsllUziTOrzMwLXVvOs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13DC0F896E4;
	Wed, 28 Aug 2019 07:59:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 397B0F801ED; Tue, 27 Aug 2019 16:31:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from p3plsmtpa06-09.prod.phx3.secureserver.net
 (p3plsmtpa06-09.prod.phx3.secureserver.net [173.201.192.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 026F8F801ED
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 16:31:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 026F8F801ED
Received: from [10.5.10.195] ([167.142.128.25]) by :SMTPAUTH: with ESMTPSA
 id 2cVXiK6pocyCe2cVYiZfth; Tue, 27 Aug 2019 07:31:41 -0700
To: alsa-devel@alsa-project.org
From: John Menninger <john@profscience.com>
Message-ID: <09e98941-e416-3a9d-22af-d1eabe7c33f5@profscience.com>
Date: Tue, 27 Aug 2019 09:31:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
X-CMAE-Envelope: MS4wfDkZ9bIbC3rMG1/1PyOLLXlYO+uky1zk2RffiGZvB25d+A/1vz77P4qtk7Ps+vs1hUObMP73vjENem1U4bkWwCta87yP6GjptT01sKhuDTvh3fp1M7ZS
 3FIrqss/A9zOwpDI2nG6meGsgyE+Zxed6xNXjPd3i1ZYroOkL04yzOxdo7hHDvcuB9ids6itXlFr5g==
X-Mailman-Approved-At: Wed, 28 Aug 2019 07:58:25 +0200
Subject: [alsa-devel] pulse audio problem
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

SW4gZ29pbmcgb3ZlciBteSBVYnVudHUgMTYuMDQgKDY0Yml0KSBzeXN0ZW0gbG9nIEkgZm91bmQg
dGhlIGZvbGxvd2luZzoKCiJBdWcgMjcgMDA6MDI6MjIgRGVza3RvcDY0IHB1bHNlYXVkaW9bMjcy
Nl06IFthbHNhLXNpbmstQUxDODg5QSBBbmFsb2ddIAphbHNhLXV0aWwuYzogc25kX3BjbV9hdmFp
bCgpIHJldHVybmVkIGEgdmFsdWUgdGhhdCBpcyBleGNlcHRpb25hbGx5IApsYXJnZTogMjI4NDEy
MCBieXRlcyAoMTI5NDggbXMpLgoKIkF1ZyAyNyAwMDowMjoyOSBEZXNrdG9wNjQgcHVsc2VhdWRp
b1syNzI2XTogW2Fsc2Etc2luay1BTEM4ODlBIEFuYWxvZ10gCmFsc2EtdXRpbC5jOiBNb3N0IGxp
a2VseSB0aGlzIGlzIGEgYnVnIGluIHRoZSBBTFNBIGRyaXZlciAKJ3NuZF9oZGFfaW50ZWwnLiBQ
bGVhc2UgcmVwb3J0IHRoaXMgaXNzdWUgdG8gdGhlIEFMU0EgZGV2ZWxvcGVycy4iCgpJIGhhdmUg
bm8gaWRlYSBob3cgdG8gbWFuYWdlIGFueSBwcm9ibGVtIHRoYXQgbWlnaHQgaGF2ZSBjYXVzZWQg
dGhpcyAKbm90aWZpY2F0aW9uIGFuZCBJIHdvdWxkIGFwcHJlY2lhdGUgYW55IGFkdmljZSB5b3Ug
bWF5IGhhdmUuCgogwqAgLS0gdGhhbmtzLCBKb2huIE1lbm5pbmdlcgoKLS0gCkpvaG4gTWVubmlu
Z2VyCjczNSBHZW9yZ2UgU3QuCklvd2EgQ2l0eSwgSW93YSA1MjI0NgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QK
QWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
