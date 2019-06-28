Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69ABB59444
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2019 08:37:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBD1D167B;
	Fri, 28 Jun 2019 08:36:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBD1D167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561703867;
	bh=N00NySHaUL5L8Vie8z0d7/DzHo54tWpEa8nsO8fNTYs=;
	h=From:In-Reply-To:Date:References:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NjTyqs3yEGaJuMtd7eL62V3U2Em0FI1joGExLxwKofI6AhPQ2uFTOS1Z/aR53EbT8
	 Nth2IRb1ap4VKpx83HHdBH2IcoDJ65iipEVYP6OUuVYgah4tuCJuFUiD3LHu1miJT5
	 WL2c3k8zkfEOXt8zPcpHEEeWnAeX5Q26usaJapdM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 589EAF896CB;
	Fri, 28 Jun 2019 08:36:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E57DEF896B9; Fri, 28 Jun 2019 08:35:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F0B7F80C0B
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 08:35:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F0B7F80C0B
Received: from mail-pl1-f198.google.com ([209.85.214.198])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <kai.heng.feng@canonical.com>)
 id 1hgkUF-0006YW-JB
 for alsa-devel@alsa-project.org; Fri, 28 Jun 2019 06:35:55 +0000
Received: by mail-pl1-f198.google.com with SMTP id bb9so2942459plb.2
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 23:35:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=rg763IUCOLn//QYbXaACukPUtIg7NLpq/IpQFYmUqJE=;
 b=XzoK3VsYRP8TOGH9YEDcRs10Zp8KDaNcnCCWEDjhAQRJpOuE6WMcm8zyMkl/znmGfV
 kUyq+laD2yRu1T7McquaIQKR5SX28odVH95kK/jXvjJbmqSkBWL6YHF+ZJuN1XKbIgOk
 mdhIoFRyImIOPLbxoEdURSvD1EOnDxG3lYLwK4RutPwxW/l8XOwj2z/GCuWUPS5Fmv5E
 8DDaA4Eg4GsnKsWlB8VWhwvCF8FToEppMSf13NeU1mM4osm0Uben+AIrKyPyy+5tCvDD
 KCtp4o8MhX7GcDw0WFRNI2fewTb3IpNu41KwtWAEam1gPoZhP1vzppQvgGTrkPW4CCdS
 +PEg==
X-Gm-Message-State: APjAAAU8TFZxD0OwcoB5hfxsj2o0W1RSf6EmuXxwSXNyn49czyrNIpcz
 PPwjDzv/z7EPnmU49EjD4pTV24fa/rot45XOkGQny+z10uHel94JouLt8tWRYXnUMGpqAOQbmg6
 Rf2b/pSGHZWJNGvDUogB5gNl7RCEYwodtHz3yZwTf
X-Received: by 2002:a17:902:b187:: with SMTP id
 s7mr9423324plr.309.1561703754366; 
 Thu, 27 Jun 2019 23:35:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz/yhCRthlAYn0qft94ePOe14fr0LxwjUI5ovriF1juSlUqvtRTiY4W+tbeXRLlc/X6/7OijQ==
X-Received: by 2002:a17:902:b187:: with SMTP id
 s7mr9423296plr.309.1561703753996; 
 Thu, 27 Jun 2019 23:35:53 -0700 (PDT)
Received: from 2001-b011-380f-3511-c09f-cbfd-7c09-2630.dynamic-ip6.hinet.net
 (2001-b011-380f-3511-c09f-cbfd-7c09-2630.dynamic-ip6.hinet.net.
 [2001:b011:380f:3511:c09f:cbfd:7c09:2630])
 by smtp.gmail.com with ESMTPSA id s43sm1175750pjb.10.2019.06.27.23.35.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jun 2019 23:35:53 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <156113479576.29306.8491703251507627705.malone@gac.canonical.com>
Date: Fri, 28 Jun 2019 14:35:51 +0800
Message-Id: <B0FDD5B2-EA6F-4ABC-8BF5-6231AA31EB70@canonical.com>
References: <156097935391.32250.14918304155094222078.malonedeb@chaenomeles.canonical.com>
 <156113479576.29306.8491703251507627705.malone@gac.canonical.com>
To: conmanx360@gmail.com
X-Mailer: Apple Mail (2.3445.104.11)
Cc: alsa-devel@alsa-project.org, linux-kernel <linux-kernel@vger.kernel.org>
Subject: [alsa-devel] ca0132 audio in Ubuntu 19.04 only after Windows 10
 started, missing ctefx-r3di.bin
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="yes"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

SGkgQ29ubm9yLAoKVGhlIGJ1ZyB3YXMgZmlsZWQgYXQgTGF1bmNocGFkIFsxXSwgSSB0aGluayB0
aGUgbW9zdCBub3RhYmxlIGVycm9yIGlzClsgICAgMy43Njg2NjddIHNuZF9oZGFfaW50ZWwgMDAw
MDowMDoxZi4zOiBEaXJlY3QgZmlybXdhcmUgbG9hZCBmb3IgIApjdGVmeC1yM2RpLmJpbiBmYWls
ZWQgd2l0aCBlcnJvciAtMgoKVGhlIGZpcm13YXJlIGlzIGluZGVlZCBsaXN0ZWQgaW4gcGF0Y2hf
Y2EwMTMyLmMsIGJ1dCBsb29rcyBsaWtlIHRoZXJl4oCZcyBubyAgCmNvcnJlc3BvbmRpbmcgZmls
ZSBpbiBsaW51eC1maXJtd2FyZS4KCkNhbiB5b3UgcGxlYXNlIHRha2UgYSBsb29rIGF0IHRoZSBi
dWc/CgpbMV0gaHR0cHM6Ly9idWdzLmxhdW5jaHBhZC5uZXQvYnVncy8xODMzNDcwCgpLYWktSGVu
ZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1k
ZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFp
bG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
