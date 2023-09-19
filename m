Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 893FD7A604D
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 12:56:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF00CDF5;
	Tue, 19 Sep 2023 12:55:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF00CDF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695120977;
	bh=LJpBEn3pfSHJ78h9OnCxiasCyMuk8i/0oj6iXmMx7ZM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=PcV6cNlc2XSP55GlNu9lxdlSAZEczkV49xHHKQbmK4DgsqmamgpOfSJI/bQ79fglI
	 atILE/SyzW0VAV5ck/zA16f0aF97E6f+v75B+6Tayjm82d9gOU9ik6wZWeM3DET5BS
	 7a0wz5zOKtvwS90NljmwSMsaVU9FMdgH49izLz/g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24C64F80549; Tue, 19 Sep 2023 12:55:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BFB93F801F5;
	Tue, 19 Sep 2023 12:54:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51A1AF8025A; Tue, 19 Sep 2023 12:54:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=KHOP_HELO_FCRDNS,MISSING_DATE,
	MISSING_MID,SPF_HELO_NONE shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id C488DF800F4
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 12:54:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C488DF800F4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1695120894436670065-webhooks-bot@alsa-project.org>
References: <1695120894436670065-webhooks-bot@alsa-project.org>
Subject: topology/topology.c: error: 'LC_ALL' undeclared - compiling
 alsa-utils 1.2.10 with musl
Message-Id: <20230919105456.51A1AF8025A@alsa1.perex.cz>
Date: Tue, 19 Sep 2023 12:54:56 +0200 (CEST)
Message-ID-Hash: TDSXCL7YBZMWHQUHYNQDK6LQQUOTPQV4
X-Message-ID-Hash: TDSXCL7YBZMWHQUHYNQDK6LQQUOTPQV4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TDSXCL7YBZMWHQUHYNQDK6LQQUOTPQV4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #239 was opened from michaelopdenacker:

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
