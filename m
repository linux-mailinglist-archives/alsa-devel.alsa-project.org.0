Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB119A093B
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Oct 2024 14:21:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE79684D;
	Wed, 16 Oct 2024 14:21:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE79684D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729081278;
	bh=ZPv2WR+x7KJWhOEPlPsrT/WGKadP2NCxpr7oHTBoIPs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=PEucq1eEr2t9Hr3mTCV81hRl1QARWdFAZ4aCVVFt4TYokWEecYm+ta2TeUwbgVXXc
	 eqL2YejfF4BZPraeRPfkaLzrQJYtappLHJDceVEfsbY8tyrOd8U4XEnxDAZ5K2s4h8
	 Jza/ZjVjNEgcllKX68afPtsqYE7ZONwSGkpjbgJI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D107EF805B5; Wed, 16 Oct 2024 14:20:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EBCDF805AB;
	Wed, 16 Oct 2024 14:20:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A21C4F80448; Wed, 16 Oct 2024 14:20:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id ECB7DF80104
	for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2024 14:20:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECB7DF80104
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1729081238298296928-webhooks-bot@alsa-project.org>
References: <1729081238298296928-webhooks-bot@alsa-project.org>
Subject: MUSL static build - conf.c still insists on using dynamic link
 libraries
Message-Id: <20241016122040.A21C4F80448@alsa1.perex.cz>
Date: Wed, 16 Oct 2024 14:20:40 +0200 (CEST)
Message-ID-Hash: UC5H4SGBNYMHCMB5UCXSPY2BS4SZSPL2
X-Message-ID-Hash: UC5H4SGBNYMHCMB5UCXSPY2BS4SZSPL2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UC5H4SGBNYMHCMB5UCXSPY2BS4SZSPL2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #411 was opened from pietervandermeer:

alsa-lib v 1.2.12

configured for musl static build like so:

```CC=arm-linux-musleabihf-gcc ./configure --enable-shared=no --enable-static=yes --with-pic --host=armv7-unknown-linux-musleabihf --prefix=/home/vagrant/alsa-lib-1.2.12/build --libdir=/usr/lib/arm-linux-musleabihf --includedir=/usr/include/arm-linux-musleabihf/```

This builds and links fine against my executable. But when I run it, there's an issue:

```
INFO opening alsa audio playback device [hw:CARD=sndrpihifiberry,DEV=0]
ALSA lib conf.c:3558:(snd_config_hooks_call) Cannot open shared library (null) ((null): Dynamic loading not supported)
ALSA lib conf.c:4026:(snd_config_update_r) hooks failed, removing configuration
WARN Not found playback device, error ALSA function 'snd_pcm_open' failed with error 'No such file or directory (2)'. Trying next..
```

Note the "cannot open shared library". Well, yes, because you should be configured as 100% static, as per configure arguments ```--enable-shared=no --enable-static=yes```

Upon inspecting the code in ```conf.c```, there are various functions like ```snd_config_hooks_call()``` that just call ```snd_dlopen()``` and ```snd_dlsym()```.

Right now I'm just replacing these with ```strcmp``` on the function_name followed by a static function call to the respective function. But I don't know how much work I'll need, and of course it is really hacky. 

It would be great if a 100% static build was supported.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/411
Repository URL: https://github.com/alsa-project/alsa-lib
