Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF67704AF6
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 12:44:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACCF711C;
	Tue, 16 May 2023 12:43:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACCF711C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684233841;
	bh=cZqK/bDTueXYfCVOZdDBi7llsOr0ZkU7iipfO881oFM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=uUO4hUEZvfXslt3I1QltnqjKWWX1oRgxY3+WRBmzOvBIzRLsCEiVKNcZnSuounaSA
	 QPePM4vVlvcISVRUfiBUFoLxQKvxTURBn4DM38y10dTEso899g81mmnr9JbhwppPTK
	 6YVWhumyzFCX2ynBNAYhXrEPZqjBEnWrjDNEtH48=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A475F80548; Tue, 16 May 2023 12:43:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DCF05F8025A;
	Tue, 16 May 2023 12:43:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37A94F80272; Tue, 16 May 2023 12:43:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 46BE4F80087
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 12:42:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46BE4F80087
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1684233779714470863-webhooks-bot@alsa-project.org>
References: <1684233779714470863-webhooks-bot@alsa-project.org>
Subject: Apple USB-C dongle cannot output 44100hz
Message-Id: <20230516104307.37A94F80272@alsa1.perex.cz>
Date: Tue, 16 May 2023 12:43:07 +0200 (CEST)
Message-ID-Hash: CCXQ2DRMUT4QAGMNTVI37YAKXJROJ6P3
X-Message-ID-Hash: CCXQ2DRMUT4QAGMNTVI37YAKXJROJ6P3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CCXQ2DRMUT4QAGMNTVI37YAKXJROJ6P3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #322 was opened from tw-hx:

I have the same issue as outlined here, with an A2049 Apple USB-C to 3.5mm dongle:
https://github.com/mikebrady/shairport-sync/issues/1504

Running Arch Linux with kernel 6.3.1-arch2-1, alsa-lib 1.2.9-1. Pipewire reports that the output is locked to 48000hz when it should be switching to 41000hz, and ALSA reports that this is the only detected supported rate:

```
$ cat /proc/asound/card0/stream0
Playback:
  Status: Running
    Interface = 1
    Altset = 1
    Packet Size = 288
    Momentary freq = 48000 Hz (0x30.0000)
  Interface 1
    Altset 1
    Format: S24_3LE
    Channels: 2
    Endpoint: 0x02 (2 OUT) (SYNC)
    Rates: 48000 - 48000 (continuous)
    Bits: 0
    Channel map: FL FR
  Interface 1
    Altset 2
    Format: S16_LE
    Channels: 2
    Endpoint: 0x02 (2 OUT) (SYNC)
    Rates: 48000 - 48000 (continuous)
    Bits: 0
    Channel map: FL FR
```

Thanks if this can be fixed. It seems like a regression between Linux 4.x and 5.x, and halfway through the above thread the user [quantonian](https://github.com/quantonian) added the device to the ALSA quirks table and has posted a patch.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/322
Repository URL: https://github.com/alsa-project/alsa-lib
