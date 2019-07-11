Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E4665E13
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jul 2019 18:59:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E26F1607;
	Thu, 11 Jul 2019 18:58:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E26F1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562864362;
	bh=cd4jeuslLmm0fbQl1FghqY4+qHTmlnCIxbM1tGs4OnY=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pcCuUjzzk25rujjbjYGBtpZCytM6S8dRG0duaw1lHad0gcvRReeibSXNy72r8ZOPC
	 nKKmN+37IReV3qkEEzyGX8ukkl2z8SDu3yB7ryYMr/RKQrNN0WBr6WF2JCqNlb2gfI
	 4MjKtGmgdTvcTBGwRbROF0pDRsH+11ZNw82ZAOI8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E99B4F80323;
	Thu, 11 Jul 2019 18:57:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC9E5F802FB; Thu, 11 Jul 2019 18:55:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PDS_NO_HELO_DNS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB3D1F800D8
 for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2019 18:55:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB3D1F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CWOOpGMA"
Received: by mail-wr1-x443.google.com with SMTP id j8so2983882wrj.9
 for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2019 09:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=5OJ2QZW2dveVAivi5p4skJMu6scW553I05id0qCcY5o=;
 b=CWOOpGMAV4TkevEXhXHYUfQxxzN2h1WpIGH5WC1pZ8ISMgrKKnrwhxn0+Upw4bEBxi
 jOlZYNNw3H7QytMBTS2HrlJyRa+q2JVPvOmzbvc1DUPqCB2Ka7HcF5BGQyx0/ukWddqZ
 FIDE3aiseA9NYl1awPYNJNsbYO8J450sAAyjQy0NMoVnU67ChROcsYOz73OGjstuil5Y
 TbReyra+693P+Qrjhsn3eG5gmi4RccEwo+fUMPlw4MpzIHj+JGjJ6Z51nLW8RO3CpAHV
 xKXn9UjKVuMHdZGhCEiiajnwodDSwa4viEtH+KMvS1HSUvFcFRGQSK6djZXiiqqt7ANF
 a2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=5OJ2QZW2dveVAivi5p4skJMu6scW553I05id0qCcY5o=;
 b=ancHJhkg2ZRnvWIlkVkj3oO/Sv2NB9h5ScVZM6LrNJBPsUQv6E5dWsqotZPgX+TNQW
 7NVpvjtCAbLdG0RybLGeWRrDRuKYQ7FVk2kcptkmOTSE8mleUxcoXWP73Gx9jZGpZRkr
 QSLV/W9qUxgSbQOKVm1x9RuMKe/KpHqau0YR5HjxgXYQDzJ3tHtXxouZz4p9GxhwOq5h
 v7cxn4ERnLuAYdMqP+D9yyY2AE4R71EebOjGMh/II1ZL8SqapQzFGQ6O0vSy7ivCvHkK
 jlEUcPZpi3TVOUoxtH4X2BytZK8ormLW8AMRpJ9zvuPXbULKCqGUBrIietV/iTshHVFK
 Kqyw==
X-Gm-Message-State: APjAAAU/CZg8YkvR8yqH4sfooNCfUuPhohSh+m+BM9ak1gftCDVc77ZF
 zljxymPt0VSPQAF89VjNZ/9UNedc340YWPhB8GA=
X-Google-Smtp-Source: APXvYqzMXzSQzDzof8XoIfuCWfv4QJa2NyLRzxV39Zu+Lu0mP9vf8GKH3ty0kmnmMNgOxJjtSsDKYg3zW0HiHTJULTM=
X-Received: by 2002:adf:db46:: with SMTP id f6mr6173521wrj.212.1562864142864; 
 Thu, 11 Jul 2019 09:55:42 -0700 (PDT)
MIME-Version: 1.0
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 11 Jul 2019 19:55:31 +0300
Message-ID: <CAEnQRZB2SnyzdZw_qEn+gofDi293m2d8nq5gmMBkyn52v2GRkw@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "S.j. Wang" <shengjiu.wang@nxp.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>
Subject: [alsa-devel] How to treat old style platform components
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

SEkgTW9yaW1vdG8tc2FuLAoKSSdtIHVzaW5nIHNpbXBsZS1jYXJkIHdpdGggYW4gb3V0IG9mIHRy
ZWUgUENNIERNQSBkcml2ZXIgd2hpY2gKYmFzaWNhbGx5IGp1c3QgZG9lcyB0aGlzOgoKCnN0YXRp
YyBzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnRfZHJpdmVyIGlteF9zb2NfcGxhdGZvcm0gPSB7Ci5v
cHPCuyAgIMK7ICAgICAgID0gJmlteF9wY21fb3BzLAogLnBjbV9uZXfCuyAgICAgICA9IGlteF9w
Y21fbmV3LAp9OwoKVGhlbiBzb21ld2hlcmUgaW4gdGhlIERBSSBkcml2ZXIgd2UgY2FsbDoKCmRl
dm1fc25kX3NvY19yZWdpc3Rlcl9jb21wb25lbnQoZGV2LCAmaW14X3NvY19wbGF0Zm9ybSwgTlVM
TCwgMCk7CgpJJ20gdXNpbmcgc2ltcGxlLWNhcmQgd2l0aCB0aGUgZm9sbG93aW5nIGNvbmZpZ3Vy
YXRpb246CgpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9u
ZXh0L2xpbnV4LW5leHQuZ2l0L3RyZWUvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14
OG1tLWV2ay5kdHMjbjQxCgpBZnRlciBsYXRlc3QgY2hhbmdlcyBpdCBzZWVtcyB0aGF0IGlteF9w
Y21fb3BzLT5vcGVuKCkgZnVuY3Rpb24gaXMgbm8KbG9uZ2VyIGNhbGxlZC4KCkFueSBpZGVhPwoK
UGxlYXNlIGZlZWwgZnJlZSB0byBub3Qgd2FzdGUgYW55IHRpbWUgb24gdGhpcywgYXMgd2UgYXJl
IHVzaW5nIGFuIG91dApvZiB0cmVlIGRyaXZlci4KCnRoYW5rcywKRGFuaWVsLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcg
bGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
