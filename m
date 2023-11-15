Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E217EBF37
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Nov 2023 10:13:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F47F820;
	Wed, 15 Nov 2023 10:12:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F47F820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700039629;
	bh=LoDzrhLmahUdb1kT/HgTd6XnM+P2NKDSYCP857Y0hxM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=nLu0T3RE3jpmfADN7GBd0I7zznQ2WFQQTV2gFqJsDkZlqDhq++gqK5MhcAV7W/UFL
	 VhyptgFa5irURVW7a1dB1ct344rroj1vAacJt1YwxW30Wu9QfkOB1o9yq8PIWsJMcT
	 q6c1udTHOwA/U2Twyz6hyaEA85s8plR92nwaluvA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA526F80551; Wed, 15 Nov 2023 10:12:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 50D3EF8016E;
	Wed, 15 Nov 2023 10:12:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FBF1F801D5; Wed, 15 Nov 2023 10:12:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id E6D64F80093
	for <alsa-devel@alsa-project.org>; Wed, 15 Nov 2023 10:12:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6D64F80093
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1700039569007141590-webhooks-bot@alsa-project.org>
References: <1700039569007141590-webhooks-bot@alsa-project.org>
Subject: 90-alsa-restore.rules causes unwanted volume restore
Message-Id: <20231115091254.8FBF1F801D5@alsa1.perex.cz>
Date: Wed, 15 Nov 2023 10:12:54 +0100 (CET)
Message-ID-Hash: BZD7VQHUAMGTJTYQBZSW2PI5WXLOO4WX
X-Message-ID-Hash: BZD7VQHUAMGTJTYQBZSW2PI5WXLOO4WX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BZD7VQHUAMGTJTYQBZSW2PI5WXLOO4WX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #244 was opened from hrdl-github:

Since ef0e588c76fbad4112193d311e51a60d18b44282, `alsactl restore $attr{device/number}` has been used instead of `alsactl restore $attr{number}`. On my system this results in an empty expansion, causing unwanted changes in volume (see https://gitlab.freedesktop.org/pipewire/wireplumber/-/issues/516). The `card*` kernel does have a `number` attribute though:

```
  looking at device '/devices/pci0000:00/0000:00:1f.3/sound/card1/controlC1':
    KERNEL=="controlC1"
    SUBSYSTEM=="sound"
    DRIVER==""
    ATTR{power/control}=="auto"
    ATTR{power/runtime_active_time}=="0"
    ATTR{power/runtime_status}=="unsupported"
    ATTR{power/runtime_suspended_time}=="0"

  looking at parent device '/devices/pci0000:00/0000:00:1f.3/sound/card1':
    KERNELS=="card1"
    SUBSYSTEMS=="sound"
    DRIVERS==""
    ATTRS{id}=="PCH"
    ATTRS{number}=="1"
    ATTRS{power/control}=="auto"
    ATTRS{power/runtime_active_time}=="0"
    ATTRS{power/runtime_status}=="unsupported"
    ATTRS{power/runtime_suspended_time}=="0"
```

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/244
Repository URL: https://github.com/alsa-project/alsa-utils
