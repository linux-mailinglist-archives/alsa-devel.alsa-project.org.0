Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E85A790FEF
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 04:14:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A39E47F1;
	Mon,  4 Sep 2023 04:13:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A39E47F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693793649;
	bh=QG2oYivlpGdU7wMjig869eSlAAajhsMZTCQjPKFjJQU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=MIvZG3JNo8Ajh93YePIDZ3VkKmiTxkwZ09Avl6XYncpiRS4Fb32sqbWkqdsMTDWEt
	 o8BzOYvCPoqQJyKa7uFvOudHzo4AohzDm75ofHydaTNR3DAbOPzI01XCIPtqZDVdcK
	 lB7tEVcQE+oWVIUPC1eI7KmX8Npa9tS5bYjwVOCs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91705F80431; Mon,  4 Sep 2023 04:13:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8749F80431;
	Mon,  4 Sep 2023 04:13:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0516F8047D; Mon,  4 Sep 2023 04:13:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 45013F80141
	for <alsa-devel@alsa-project.org>; Mon,  4 Sep 2023 04:13:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45013F80141
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1693793584749669313-webhooks-bot@alsa-project.org>
References: <1693793584749669313-webhooks-bot@alsa-project.org>
Subject: Alsa Lib segfaults when built statically
Message-Id: <20230904021306.D0516F8047D@alsa1.perex.cz>
Date: Mon,  4 Sep 2023 04:13:06 +0200 (CEST)
Message-ID-Hash: QCL6S2N6O4MGYOEWRCBBN64FPKQC3LCT
X-Message-ID-Hash: QCL6S2N6O4MGYOEWRCBBN64FPKQC3LCT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QCL6S2N6O4MGYOEWRCBBN64FPKQC3LCT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #349 was edited from cybersoulK:

I am building a game that uses alsa. All of my linux players segfault. This has been going for over 1 year.
Alsa-lib is built statically on a ubuntu machine with the following commands:

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

One of my players was able to provide me with a core dump that might be helpful to track down the fault:

<img width="770" alt="image" src="https://github.com/alsa-project/alsa-lib/assets/102260392/7390b851-47a1-4e50-a33b-e33254dddabc">

[coredump.txt](https://github.com/alsa-project/alsa-lib/files/12508784/coredump.txt)

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/349
Repository URL: https://github.com/alsa-project/alsa-lib
