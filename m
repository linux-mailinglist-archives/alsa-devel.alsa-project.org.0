Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E0911054D
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 20:40:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F66C166E;
	Tue,  3 Dec 2019 20:39:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F66C166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575402015;
	bh=549bxElXvOlmlFTMkEV2JKMbvBHH3NsKq5IoKqOpnQM=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a8H1qgQQz9TtQhvznB34CC6BfhF/KU72LVOyy6SSeZpDNrdQaxWKZVMM9IsWR03aB
	 0uuIBC8xANab7z/tuyjojOniiRsv3Zp33uUni4YRDYKpCVpUmJmXTNCNEo/FN2GpDM
	 9WZVMc2pVLj7bc5v2MYFTBjy71h0BpUXB3CcBVZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17060F80229;
	Tue,  3 Dec 2019 20:38:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 129BDF80227; Tue,  3 Dec 2019 20:38:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id C0ECBF800F0
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 20:38:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0ECBF800F0
MIME-Version: 1.0
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1575401900181029081-webhooks-bot@alsa-project.org>
References: <1575401900181029081-webhooks-bot@alsa-project.org>
Message-Id: <20191203193825.129BDF80227@alsa1.perex.cz>
Date: Tue,  3 Dec 2019 20:38:25 +0100 (CET)
Subject: [alsa-devel] Build failure without alsa-topology
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-utils issue #33 was opened from ffontaine:

Commit c8fdd38c74de2e8b7b2b5a4576787d5e9b4ae807 breaks build of alsa-utils on buildroot because $(ALSA_TOPOLOGY_LIBS) is set to an empty value by https://github.com/alsa-project/alsa-lib/commits/master/utils/alsa.m4 if --enable-alsa-topology is not passed:
```
/home/br-user/autobuild/run/instance-0/output/host/bin/arm-linux-gnueabihf-gcc  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2     -o alsatplg topology.o  -lasound -lm -ldl -lpthread
topology.o: In function `main':
topology.c:(.text.startup+0x184): undefined reference to `snd_tplg_new'
topology.c:(.text.startup+0x194): undefined reference to `snd_tplg_verbose'
topology.c:(.text.startup+0x1a4): undefined reference to `snd_tplg_build_file'
topology.c:(.text.startup+0x1b4): undefined reference to `snd_tplg_free'
topology.c:(.text.startup+0x218): undefined reference to `snd_tplg_free'
```

More information can be found here: http://autobuild.buildroot.org/results/d0f/d0fb760669b02b813115af04adcf24530d35f4e1/build-end.log

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/33
Repository URL: https://github.com/alsa-project/alsa-utils
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
