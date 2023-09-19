Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C207A610F
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 13:20:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DD12E0E;
	Tue, 19 Sep 2023 13:19:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DD12E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695122401;
	bh=BUFH8kp44u8h9iO3b/j058kfVeD0z8pcJ+KnoHGOdq4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=qf8rMnBn1oVCxQz9mAESyV19E2uuVESyPOUhJjVERXC3o4cj65/3b7cWBgQLCZPbV
	 j+gs0+WZ98uCcUcGBrGBi5WrNl++T6vn2sXdJ3wA3SpzSBOe6L+VjwuU9oABPUa19m
	 Fh1Y0QU0UJKf1Hguaz5q072YqatvZBK/AHN1dF+M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE833F80494; Tue, 19 Sep 2023 13:19:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 126A4F801F5;
	Tue, 19 Sep 2023 13:19:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F325F8025A; Tue, 19 Sep 2023 13:19:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 71DB3F80125
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 13:19:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71DB3F80125
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1695122341086722851-webhooks-bot@alsa-project.org>
References: <1695122341086722851-webhooks-bot@alsa-project.org>
Subject: topology.c: error: 'LC_ALL' undeclared - compiling alsa-utils 1.2.10
 with musl
Message-Id: <20230919111905.6F325F8025A@alsa1.perex.cz>
Date: Tue, 19 Sep 2023 13:19:05 +0200 (CEST)
Message-ID-Hash: WYMS56WGODDGCDAU2NGKTCY6DJZVFYRC
X-Message-ID-Hash: WYMS56WGODDGCDAU2NGKTCY6DJZVFYRC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WYMS56WGODDGCDAU2NGKTCY6DJZVFYRC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #239 was edited from michaelopdenacker:

I'm facing the below issue trying to compile alsa-utils with the musl C library with the Yocto Project Poky master branch:

x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/mike/work/yocto/poky/build/tmp/work/core2-64-poky-linux-musl/alsa-utils/1.2.10/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../alsa-utils-1.2.10/topology -I../include  -Wall -I../../alsa-utils-1.2.10/include -DALSA_TOPOLOGY_PLUGIN_DIR=\"/usr/lib/alsa-topology\"   -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/mike/work/yocto/poky/build/tmp/work/core2-64-poky-linux-musl/alsa-utils/1.2.10/alsa-utils-1.2.10=/usr/src/debug/alsa-utils/1.2.10-r0  -fdebug-prefix-map=/home/mike/work/yocto/poky/build/tmp/work/core2-64-poky-linux-musl/alsa-utils/1.2.10/alsa-utils-1.2.10=/usr/src/debug/alsa-utils/1.2.10-r0  -fmacro-prefix-map=/home/mike/work/yocto/poky/build/tmp/work/core2-64-poky-linux-musl/alsa-utils/1.2.10/build=/usr/src/debug/alsa-utils/1.2.10-r0  -fdebug-prefix
 -map=/home/mike/work/yocto/poky/build/tmp/work/core2-64-poky-linux-musl/alsa-utils/1.2.10/build=/usr/src/debug/alsa-utils/1.2.10-r0  -fdebug-prefix-map=/home/mike/work/yocto/poky/build/tmp/work/core2-64-poky-linux-musl/alsa-utils/1.2.10/recipe-sysroot=  -fmacro-prefix-map=/home/mike/work/yocto/poky/build/tmp/work/core2-64-poky-linux-musl/alsa-utils/1.2.10/recipe-sysroot=  -fdebug-prefix-map=/home/mike/work/yocto/poky/build/tmp/work/core2-64-poky-linux-musl/alsa-utils/1.2.10/recipe-sysroot-native=  -c -o pre-process-dai.o ../../alsa-utils-1.2.10/topology/pre-process-dai.c
| ../../alsa-utils-1.2.10/topology/topology.c: In function 'main':
| ../../alsa-utils-1.2.10/topology/topology.c:442:9: warning: implicit declaration of function 'setlocale' [-Wimplicit-function-declaration]
|   442 |         setlocale(LC_ALL, "");
|       |         ^~~~~~~~~
| ../../alsa-utils-1.2.10/topology/topology.c:442:19: error: 'LC_ALL' undeclared (first use in this function)
|   442 |         setlocale(LC_ALL, "");
|       |                   ^~~~~~

Including <locale.h> in topology.c makes the error go away.
I'll send a patch shortly.
Michael

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/239
Repository URL: https://github.com/alsa-project/alsa-utils
