Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE8E7A5F04
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 12:06:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D830BDF1;
	Tue, 19 Sep 2023 12:05:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D830BDF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695117992;
	bh=oKs4RbpFpguYZ9F1uenIC6QCY1m9ANfJmA9gYaI/vPE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=erfmRjmhyBsqvw+j3sH+KCMqDvtqzIlILtSNn7Dp+VTxiQSDljSnaevV29udy7der
	 rP9tn0Zbt/0xIOoqg91l4pvcfquuUnIufUpG2wMd4bFjZxmX9cg94/NlYd23457Mxn
	 Y/+eH79AxU94QbnP45BMJ6MognwRW+UM/Myyxa8Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43B57F8025A; Tue, 19 Sep 2023 12:05:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BEAD4F801F5;
	Tue, 19 Sep 2023 12:05:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DC82F8025A; Tue, 19 Sep 2023 12:05:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AA4FF80125
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 12:05:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AA4FF80125
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1695117935078450680-webhooks-bot@alsa-project.org>
References: <1695117935078450680-webhooks-bot@alsa-project.org>
Subject: nhlt-dmic-info.c: error: unknown type name 'u_int8_t' - compiling
 alsa-utils 1.2.10 with musl
Message-Id: <20230919100538.5DC82F8025A@alsa1.perex.cz>
Date: Tue, 19 Sep 2023 12:05:38 +0200 (CEST)
Message-ID-Hash: FJA3PEIKNRGYGK7YB4XEWVSVYGDASRJO
X-Message-ID-Hash: FJA3PEIKNRGYGK7YB4XEWVSVYGDASRJO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FJA3PEIKNRGYGK7YB4XEWVSVYGDASRJO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #238 was opened from michaelopdenacker:

I'm facing the below issue trying to compile alsa-utils with the musl C library with the Yocto Project Poky master branch:

| x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/mike/work/yocto/poky/build/tmp/work/core2-64-poky-linux-musl/alsa-utils/1.2.10/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../alsa-utils-1.2.10/nhlt -I../include  -I../../alsa-utils-1.2.10/include   -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/mike/work/yocto/poky/build/tmp/work/core2-64-poky-linux-musl/alsa-utils/1.2.10/alsa-utils-1.2.10=/usr/src/debug/alsa-utils/1.2.10-r0  -fdebug-prefix-map=/home/mike/work/yocto/poky/build/tmp/work/core2-64-poky-linux-musl/alsa-utils/1.2.10/alsa-utils-1.2.10=/usr/src/debug/alsa-utils/1.2.10-r0  -fmacro-prefix-map=/home/mike/work/yocto/poky/build/tmp/work/core2-64-poky-linux-musl/alsa-utils/1.2.10/build=/usr/src/debug/alsa-utils/1.2.10-r0  -fdebug-prefix-map=/home/mike/work/yocto/poky/build/tmp/work/core2-64-poky-l
 inux-musl/alsa-utils/1.2.10/build=/usr/src/debug/alsa-utils/1.2.10-r0  -fdebug-prefix-map=/home/mike/work/yocto/poky/build/tmp/work/core2-64-poky-linux-musl/alsa-utils/1.2.10/recipe-sysroot=  -fmacro-prefix-map=/home/mike/work/yocto/poky/build/tmp/work/core2-64-poky-linux-musl/alsa-utils/1.2.10/recipe-sysroot=  -fdebug-prefix-map=/home/mike/work/yocto/poky/build/tmp/work/core2-64-poky-linux-musl/alsa-utils/1.2.10/recipe-sysroot-native=  -c -o nhlt-dmic-info.o ../../alsa-utils-1.2.10/nhlt/nhlt-dmic-info.c
| ../../alsa-utils-1.2.10/nhlt/nhlt-dmic-info.c:48:36: error: unknown type name 'u_int8_t'; did you mean 'uint8_t'?
|    48 | static const char *microphone_type(u_int8_t type)
|       |                                    ^~~~~~~~
|       |                                    uint8_t.
...

Including <sys/types.h> from nhlt/nhlt-dmic-info.c solves this issue.
I'll send a patch shortly.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/238
Repository URL: https://github.com/alsa-project/alsa-utils
