Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5C3792097
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Sep 2023 08:46:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C779852;
	Tue,  5 Sep 2023 08:45:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C779852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693896386;
	bh=iZhJ/jdiTO1ZzrD+vieeLbOm1d8kY3qYiaWu/08juyA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=hytYHCjiyV0DkZ4ElOnGorqMNrUI0UJHyxRrS6wjnX021Wlf9IBMNS2zUkhuz+5GK
	 uWy/QePyV16ZZpaqj7vpe6zRuN9jgwnvI2ifc82ihkdP8jZmUy4VRNe1ZDaAgTz+Z8
	 2ULl5hFgY91RUetDcSh863yranWdciiCIkcJZPE8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F980F80527; Tue,  5 Sep 2023 08:45:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 222F0F80431;
	Tue,  5 Sep 2023 08:45:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 323DAF80494; Tue,  5 Sep 2023 08:45:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=KHOP_HELO_FCRDNS,MISSING_DATE,
	MISSING_MID,SPF_HELO_NONE shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 94DB0F80141
	for <alsa-devel@alsa-project.org>; Tue,  5 Sep 2023 08:45:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94DB0F80141
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - reopened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1693896328932979107-webhooks-bot@alsa-project.org>
References: <1693896328932979107-webhooks-bot@alsa-project.org>
Subject: Alsa Lib segfaults when built statically
Message-Id: <20230905064533.323DAF80494@alsa1.perex.cz>
Date: Tue,  5 Sep 2023 08:45:33 +0200 (CEST)
Message-ID-Hash: S4SH3IWOS7DDJURWN2IORM7CDVSWNW4T
X-Message-ID-Hash: S4SH3IWOS7DDJURWN2IORM7CDVSWNW4T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S4SH3IWOS7DDJURWN2IORM7CDVSWNW4T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #349 was reopened from cybersoulK:

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
