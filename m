Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66897A4A534
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Feb 2025 22:45:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 898D4602B7;
	Fri, 28 Feb 2025 22:45:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 898D4602B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1740779117;
	bh=AUcvbZAU9O72ga5tS/xFRZVvyUOqzdnbCUkY5iETjwg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=gRa98e5XvcDAp/eKYaUFpjR3/PRAN55LQj84/J2WGki6juWIe+acHIXY676xSGHQp
	 +ShFEBR/pq4WFNWl64VIQJqyWUTXYMN/4pQ/r3BJzsTceY5bovZnJwcbX0BUXnree/
	 lcCaWUSG+JHGi6beRZAsmYvG01fimC22GYgx+kmc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B20E9F805C5; Fri, 28 Feb 2025 22:44:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 843F7F805BF;
	Fri, 28 Feb 2025 22:44:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92ED0F8025A; Fri, 28 Feb 2025 22:44:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id EBD5FF800C1
	for <alsa-devel@alsa-project.org>; Fri, 28 Feb 2025 22:44:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBD5FF800C1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1740779076633643866-webhooks-bot@alsa-project.org>
References: <1740779076633643866-webhooks-bot@alsa-project.org>
Subject: Build with gettext-0.24 intermittently fails
Message-Id: <20250228214438.92ED0F8025A@alsa1.perex.cz>
Date: Fri, 28 Feb 2025 22:44:38 +0100 (CET)
Message-ID-Hash: CVVYTG2P767C2YEPSU53N74UGKL54SX4
X-Message-ID-Hash: CVVYTG2P767C2YEPSU53N74UGKL54SX4
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CVVYTG2P767C2YEPSU53N74UGKL54SX4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #294 was edited from heitbaum:

After Autoconf the errors are as follows. The Makefile is not honouring / passing the builddir through. This is a build being done in a subdirectory.

``` 
Making all in po
make[2]: Entering directory '/build/build.LibreELEC-Generic.x86_64-13.0-devel/build/alsa-utils-1.2.13/.x86_64-libreelec-linux-gnu/po'
make[2]: *** No rule to make target '/config.status', needed by 'Makefile'.  Stop.
make[2]: Leaving directory '/build/build.LibreELEC-Generic.x86_64-13.0-devel/build/alsa-utils-1.2.13/.x86_64-libreelec-linux-gnu/po'
make[1]: *** [Makefile:471: all-recursive] Error 1
make[1]: Leaving directory '/build/build.LibreELEC-Generic.x86_64-13.0-devel/build/alsa-utils-1.2.13/.x86_64-libreelec-linux-gnu'
```

- This is occurring just like https://github.com/zapping-vbi/zvbi/issues/57
- now testing to see if the change to `AM_GNU_GETTEXT_VERSION([0.24])` fixes the issue

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/294
Repository URL: https://github.com/alsa-project/alsa-utils
