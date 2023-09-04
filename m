Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B56F7790FEC
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 04:10:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37D50886;
	Mon,  4 Sep 2023 04:09:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37D50886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693793437;
	bh=goRLX7b6iOG/+kPqB8E0uowqHqFYL16mKFwQH5DNcUQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=rvAugkDlZKS7N1lV/LRrqvDRnogiPkJeDBxoK41ZHC0yXBNXGaxiKfcUXGoy+r5cj
	 HF8YX8AbD18oPdanASvaeAKT2GmwPixQYt4FSgfqfOBS6eTvegZHDbVWYCobjN5JFZ
	 N/s3nl68GfHBjaNvu1dBXu5eG18m7BaH19df0Ucw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3E0FF80527; Mon,  4 Sep 2023 04:09:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6558AF80537;
	Mon,  4 Sep 2023 04:09:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6D0AF80567; Mon,  4 Sep 2023 04:09:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 25EDDF80558
	for <alsa-devel@alsa-project.org>; Mon,  4 Sep 2023 04:09:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25EDDF80558
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1693793360123435974-webhooks-bot@alsa-project.org>
References: <1693793360123435974-webhooks-bot@alsa-project.org>
Subject: Alsa Lib segfaults when built statically
Message-Id: <20230904020921.A6D0AF80567@alsa1.perex.cz>
Date: Mon,  4 Sep 2023 04:09:21 +0200 (CEST)
Message-ID-Hash: YPK6PGF3SQSF7BYREJN5OHRCW7Y4DHKE
X-Message-ID-Hash: YPK6PGF3SQSF7BYREJN5OHRCW7Y4DHKE
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YPK6PGF3SQSF7BYREJN5OHRCW7Y4DHKE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #349 was edited from cybersoulK:

I am building a game that uses alsa. All of my linux players segfault.
Alsa Lib is built statically on a ubuntu machine with the following commands:

```
git clone https://github.com/alsa-project/alsa-lib
cd alsa-lib

apt-get update
apt-get install libtool
apt-get install make
apt install autoconf

autoreconf -i
./configure --disable-shared
make
```

Then i use libasound.a to build my Rust executable (On my mac machine).

I do the same process to build openssl for linux and it works great.


So There definitely is an issue when building alsa lib statically.

One of my players was able to provide me with a core dump that might be helpful to track the fault:

<img width="770" alt="image" src="https://github.com/alsa-project/alsa-lib/assets/102260392/7390b851-47a1-4e50-a33b-e33254dddabc">

[coredump.txt](https://github.com/alsa-project/alsa-lib/files/12508784/coredump.txt)

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/349
Repository URL: https://github.com/alsa-project/alsa-lib
