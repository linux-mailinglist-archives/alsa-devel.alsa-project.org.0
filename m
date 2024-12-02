Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F38269E0788
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Dec 2024 16:50:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 722B61939;
	Mon,  2 Dec 2024 16:50:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 722B61939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733154629;
	bh=0lm2xHQei0v8BAkN9+8VHtxMUqfdYKgpNCFV8e4LiOs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=fimHFcVYn6JFTHOKWyrteNFPYH/SL8DCmYkh1EVEaEx1ye14r5hHjardxx7f0bSxb
	 sp/IRynkfL7jS/4EN9NN30hqu0gAm1SzR7g3a4KDhlGoCMPbKIzA+gOOKDiTQQ6vyU
	 yQD/cpaFUjKI2sDWSbIRxcFSr5isuc4lMFIJy52A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C28CBF805BE; Mon,  2 Dec 2024 16:49:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 268B0F805B5;
	Mon,  2 Dec 2024 16:49:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75310F80272; Mon,  2 Dec 2024 16:49:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id DBADEF80073
	for <alsa-devel@alsa-project.org>; Mon,  2 Dec 2024 16:49:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBADEF80073
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1733154591433354855-webhooks-bot@alsa-project.org>
References: <1733154591433354855-webhooks-bot@alsa-project.org>
Subject: alsa-lib-1.2.13 prevents chromium-131.0.6778.85 from playing audio on
 gentoo.
Message-Id: <20241202154954.75310F80272@alsa1.perex.cz>
Date: Mon,  2 Dec 2024 16:49:54 +0100 (CET)
Message-ID-Hash: 6QWQOEI32DZPMT2Q4VKFIZSHXTIZT2NU
X-Message-ID-Hash: 6QWQOEI32DZPMT2Q4VKFIZSHXTIZT2NU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6QWQOEI32DZPMT2Q4VKFIZSHXTIZT2NU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #425 was opened from haoyi-codes:

I have recently compiled chromium against alsa-lib-1.2.13 for two different systems, however I am unable to play audio. The terminal output shows:

System 1:

```
Failed to create secure directory (/run/user/1011//pulse): Permission denied
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/pcm/pcm_dmix.c:1000:(snd_pcm_dmix_open) unable to open slave
[6429:6429:1130/194540.301739:ERROR:alsa_util.cc(204)] PcmOpen: default,No such file or directory
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/pcm/pcm_dmix.c:1000:(snd_pcm_dmix_open) unable to open slave
[6429:6429:1130/194540.302803:ERROR:alsa_util.cc(204)] PcmOpen: plug:default,No such file or directory
libpng warning: iCCP: known incorrect sRGB profile
Warning: disabling flag --expose_wasm due to conflicting flags
Warning: disabling flag --expose_wasm due to conflicting flags
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/pcm/pcm_dmix.c:1000:(snd_pcm_dmix_open) unable to open slave
[6429:6429:1130/194614.580896:ERROR:alsa_util.cc(204)] PcmOpen: default,No such file or directory
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/pcm/pcm_dmix.c:1000:(snd_pcm_dmix_open) unable to open slave
[6429:6429:1130/194614.582080:ERROR:alsa_util.cc(204)] PcmOpen: plug:default,No such file or directory
libpng warning: iCCP: known incorrect sRGB profile
```

System 2:

```
socket(): Operation not permitted
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
[2516:2516:1129/230412.353283:ERROR:alsa_util.cc(204)] PcmOpen: default,No such file or directory
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
[2516:2516:1129/230412.353697:ERROR:alsa_util.cc(204)] PcmOpen: plug:default,No such file or directory
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
libpng warning: iCCP: known incorrect sRGB profile
libpng warning: iCCP: known incorrect sRGB profile
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
[2516:2516:1129/230432.095492:ERROR:alsa_util.cc(204)] PcmOpen: default,No such file or directory
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4029:(snd_config_hooks_call) Cannot open shared library (null) (Error loading shared library /lib/libasound.so.2: Permission denied)
ALSA lib /var/tmp/portage/media-libs/alsa-lib-1.2.13/work/alsa-lib-1.2.13/src/conf.c:4650:(snd_config_update_r) hooks failed, removing configuration
[2516:2516:1129/230432.095901:ERROR:alsa_util.cc(204)] PcmOpen: plug:default,No such file or directory
libpng warning: iCCP: known incorrect sRGB profile
```

After downgrading alsa-lib to 1.2.12 and recompiling chromium I was able to play audio just fine.

Further information can also be found at: https://bugs.gentoo.org/945749

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/425
Repository URL: https://github.com/alsa-project/alsa-lib
