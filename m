Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B7A798E65
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Sep 2023 20:50:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7AC084B;
	Fri,  8 Sep 2023 20:49:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7AC084B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694199025;
	bh=TMr/3p/TqnqPe3Lscp+MbI4YgggDqY1wqO1wFlCuiQY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=jEJeO6x6uZXwj/QVoKZq6CGS2NQs+ntgD5rfEwGcr6M02d/vSpYSSoASlk343pWsC
	 6GTc0+D7pgscf/wEvnRL7mCjRO7QbLN36K3fL2A+fu+PpaVEfXosk31rm546Z0XMpb
	 vow5VwDvNSNpyt/uLh4fKYEcRMtdUFG3wTIBC8bM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21383F80431; Fri,  8 Sep 2023 20:49:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD21AF80431;
	Fri,  8 Sep 2023 20:49:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25E56F80494; Fri,  8 Sep 2023 20:49:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DEADF80431
	for <alsa-devel@alsa-project.org>; Fri,  8 Sep 2023 20:49:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DEADF80431
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1694198964325707197-webhooks-bot@alsa-project.org>
References: <1694198964325707197-webhooks-bot@alsa-project.org>
Subject: Left audio channel very loud when external sound card was unplugged,
 volume not reflected properly in alsamixer
Message-Id: <20230908184931.25E56F80494@alsa1.perex.cz>
Date: Fri,  8 Sep 2023 20:49:31 +0200 (CEST)
Message-ID-Hash: BE35EARXR46HUSARXVHILWH5SYWVLLQK
X-Message-ID-Hash: BE35EARXR46HUSARXVHILWH5SYWVLLQK
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #235 was opened from WildRikku:

I'm reporting this here because alsamixer is at least part of the issue. I'd be thankful for help finding the whole issue and I can report elsewhere if necessary.

After plugging in my external sound card, the left channel is WAY louder than the right channel but `alsamixer` does not reflect this. I then correct it by setting the left channel to zero in `alsamixer` and back to what it should be. Note that it showed the value it should have before already, it just wasn't true! The volume is then correct until I unplug my sound card the next time and plug it in again. The issue also happens when I turn off the power supply of the USB dock the external sound card is plugged into. My device is a Steam Deck so I cannot use the external sound card without a dock.

#### Steps for reproducing this issue:

1. Unplug external sound card from the dock or send Steam Deck to stand-by and unplug the power supply
2. Plug sound card in or plug power supply in and turn on Steam Deck
3. left channel is now very loud but `alsamixer` shows equal value for left and right channel

Maybe related: When using `alsactl restore` I get

```
alsactl: set_control:1475: Cannot write control '2:0:0:Left Speaker Port Blocked Status:0' : Operation not permitted
alsactl: set_control:1475: Cannot write control '2:0:0:Left Speaker Open / Short Status:0' : Operation not permitted
alsactl: set_control:1475: Cannot write control '2:0:0:Right Speaker Port Blocked Status:0' : Operation not permitted
alsactl: set_control:1475: Cannot write control '2:0:0:Right Speaker Open / Short Status:0' : Operation not permitted
```

alsa-info output: https://alsa-project.org/db/?f=69b87861217a0e554cb4786c64d4a0c461177fdd

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/235
Repository URL: https://github.com/alsa-project/alsa-utils
