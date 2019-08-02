Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A837F50E
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 12:31:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F8FA171D;
	Fri,  2 Aug 2019 12:30:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F8FA171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564741904;
	bh=G1naz90OeVAl0bTV2J6JwG7JOSwe6U0TVpo7FI4XlAo=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eZELT8TAomk4r790X+r3jiobWokf+AHV3O3hCurvI5gwAzo2g6mEM6fUOGXuzq/qE
	 c9AmQClpuOTSVV9SBeg5Uq7AY9ND0Y2/YuEe4aD8nGb/04TcWZJV+zMEBRPYj6rdbM
	 tnLMvS3rPPrITEfenU/EcEyXIMdg5TDse6fjqYlg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43DF2F8049B;
	Fri,  2 Aug 2019 12:30:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 621D7F8048F; Fri,  2 Aug 2019 12:29:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from w1.tutanota.de (w1.tutanota.de [81.3.6.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97230F800F3
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 12:29:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97230F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="key not found in DNS" (0-bit key) header.d=tutanota.com
 header.i=@tutanota.com header.b="0/CXMAwG"
Received: from w2.tutanota.de (unknown [192.168.1.163])
 by w1.tutanota.de (Postfix) with ESMTP id 77367FBF1F0
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 10:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1564741792; 
 s=s1; d=tutanota.com;
 h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=up3Km6lGwdJ0VOMnST57itpTi7HL9HOJ5XJqr1rFfYs=;
 b=0/CXMAwGZN52VmmHPZ46lblKFKZuR86nNks6Kb3TubIwIy1zSaOwbAkpLJhJlYsM
 MA5yXn83+LQ54oQS/rpqpr/WswZ7UmF+0KPy+qB44Jz1f1Nu9j+srOTkcT98OLTu6GH
 krtoRUiHFZe5gPRySYsTlSFQNp/HVRPHetuN1BQzs5mwyq9dQGUA2pYXGnuRO+/8pUz
 yTx0ZqKoBjHmkGN0a3xyJKc9vHNGSwnbCAN2wnaZ/EYwmkH9iMpGCHzH4JNNOqG+4s8
 wi5rcAfN3ILAI5PQYLeUmq63gAcjCwDaIIkrM2hPqBaOAqvt+vRQo4T4ZR+aVeOLANY
 /NZN0t+y6w==
Date: Fri, 2 Aug 2019 12:29:52 +0200 (CEST)
From: <lukasbf@tutanota.com>
To: <alsa-devel@alsa-project.org>
Message-ID: <LlGsDvv--3-1@tutanota.com>
MIME-Version: 1.0
Subject: [alsa-devel] Audio issue with chtnau8824
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

CkhlbGxvIEFMU0EgZGV2cywgCgpJIGFtIHNvcnJ5IHRvIGFubm95IGJ1dCBteSBuZXcgTGFwdG9w
IHNlZW1zIHRvIG1ha2UgYSBzdHJhbmdlIG5vaXNlIGV2ZXJ5dGltZSBteSBzb3VuZCBzeXN0ZW0g
dHJpZXMgdG8gZG8gc29tZXRoaW5nLgoKVGhpcyBpcyB0aGUgc291bmQsIFdhcm5pbmcsIHByb2Jh
Ymx5IGxvdWQhCgoKaHR0cHM6Ly95b3V0dS5iZS9XNzduQm5EYjRkRSA8aHR0cHM6Ly95b3V0dS5i
ZS9XNzduQm5EYjRkRT4KCgpodHRwczovL3lvdXR1LmJlL2xrcnoyc0RuVWNBIDxodHRwczovL3lv
dXR1LmJlL2xrcnoyc0RuVWNBPgoKCkkgc3VzcGVjdCBpdCBoYXMgdG8gZG8gc29tZXRoaW5nIHdp
dGggdGhlIGRyaXZlci9hbHNhLgoKCmkgaGF2ZSB0aGUgd2hvbGUgd2Vla2VuZCBmcmVlIHNvIGkg
Y2FuIHNlbmQgZGlhZ25vc3RpY3MgbGlrZSB0aGlzLAoKCmh0dHA6Ly9hbHNhLXByb2plY3Qub3Jn
L2RiLz9mPTRhYWRmZTkyNzVhOWRjNmU0NjY5YzhiZTQzMDFlZWMxMTA2NGI3ZjAgPGh0dHA6Ly9h
bHNhLXByb2plY3Qub3JnL2RiLz9mPTRhYWRmZTkyNzVhOWRjNmU0NjY5YzhiZTQzMDFlZWMxMTA2
NGI3ZjA+CgoKSXQgd291bGQgYmUgbmljZSB0byBnZXQgbXkgc291bmRjYXJkIHdvcmtpbmcsIG1h
eWJlIGkgZm91bmQgc29tZXRoaW5nIGltcG9ydGFudC4KCgoKClRoYW5rIHlvdSBmb3IgeW91ciBX
b3JrLAoKCkx1a2FzIEZyaWVkcmljaMKgCgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBh
bHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYWxzYS1kZXZlbAo=
