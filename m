Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7C6ACDD93
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Jun 2025 14:13:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96DD2601F6;
	Wed,  4 Jun 2025 14:12:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96DD2601F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749039177;
	bh=pTNoso6F3h4XPueGb/OB6k4YfmjgjbS4fl/u9V/Th0I=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=oHwfv+fGFvKl41Ptfx5Q0amObdQssv0iHlo7jjgFREsnYEs4En4CVHar6KlDI8sZe
	 xyDiJEqmeD1JunT59FaanBdBagtOcarMJZRUe21RdhMXJ+wxFU7+zC7ojiYSNG0xLy
	 bTy84cyqOM9GddfhTP451AwkBkyaKJ7rd3sbumkc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DB2CF805C0; Wed,  4 Jun 2025 14:12:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 739BCF805BF;
	Wed,  4 Jun 2025 14:12:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96105F8028B; Wed,  4 Jun 2025 14:12:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id DD7C0F800FA
	for <alsa-devel@alsa-project.org>; Wed,  4 Jun 2025 14:12:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD7C0F800FA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1845d5d3e47f1a00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/571@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/571@alsa-project.org>
Subject: Intel: avs: Add new UCMs after recent kernel work
Date: Wed,  4 Jun 2025 14:12:18 +0200 (CEST)
Message-ID-Hash: ZFQ2S7O3FVVD77LLQBS5UXIR5XWRSCSS
X-Message-ID-Hash: ZFQ2S7O3FVVD77LLQBS5UXIR5XWRSCSS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZFQ2S7O3FVVD77LLQBS5UXIR5XWRSCSS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #571 was opened from amadeuszslawinski-intel:

After recent work to rename cards [1], userspace expects different card names and device numbers.

[1] https://lore.kernel.org/linux-sound/20250407124154.1713039-1-amadeuszx.slawinski@linux.intel.com/

There is one problem with HDMI not working. As far as I can tell, this is due to macro not handling pcm=0 correctly, but I have no idea how to fix that.
```
numid=1,iface=CARD,name='HDMI/DP Jack'
numid=7,iface=CARD,name='HDMI/DP,pcm=1 Jack'
numid=13,iface=CARD,name='HDMI/DP,pcm=2 Jack'
```

```
 DefineMacro.HDMI.If.hdmi {
        Condition {
                Type ControlExists
                Control "iface=CARD,name='HDMI/DP,pcm=${var:__Device} Jack'"
        }
```

I've opted for adding files instead of moving and editing them, because there may be users who currently use old card names.

Main differences are:
* HDAudio macros can now be used for HD-Audio card
* DMIC now automatically constraints number of channels, so no need for two separate files
* rewrote some files to make use of conditional syntax

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/571
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/571.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
