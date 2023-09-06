Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F79879374D
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Sep 2023 10:45:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46973832;
	Wed,  6 Sep 2023 10:44:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46973832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693989905;
	bh=H2kAQdudJx9k/1ebC+VS/zv0nAZNuOjY2wBatTHUvwc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=EGD4XDfsqhtObHsJM9LU7802X+VluPvGwxkfzp9se6ExLneHQ7OT336C2xsJdBknt
	 xH0H8IGIi1cyuLSVMjmf4VE3OY9X3vjcjlRgdUY0IB/lsI/gjUs8I4MAa2ysKsgNWI
	 phF43CK/zUes1mn7Xc0LogludjJhH0VVMMayat0k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA880F80236; Wed,  6 Sep 2023 10:44:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17989F8047D;
	Wed,  6 Sep 2023 10:44:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E31EF80494; Wed,  6 Sep 2023 10:44:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FE1BF800AA
	for <alsa-devel@alsa-project.org>; Wed,  6 Sep 2023 10:44:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FE1BF800AA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1693989845056578636-webhooks-bot@alsa-project.org>
References: <1693989845056578636-webhooks-bot@alsa-project.org>
Subject: Channels are swaped in alsamixer with asus strix raid dlx audio card
Message-Id: <20230906084410.0E31EF80494@alsa1.perex.cz>
Date: Wed,  6 Sep 2023 10:44:10 +0200 (CEST)
Message-ID-Hash: JLV5JWI4KVBEC6UF3LCSVL5RC6XLYEJX
X-Message-ID-Hash: JLV5JWI4KVBEC6UF3LCSVL5RC6XLYEJX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JLV5JWI4KVBEC6UF3LCSVL5RC6XLYEJX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #349 was opened from raveit65:

First, i hope this is the right repository for the issue.
I am using a 2.1 loudspeaker setup with fedora 38 and pipewire sound server.
With alsamixer or qasmixer the subwoofer channel is swaped.
With a 2.1 channel setup the subwoofer channel in qasmixer is silent.
With a 5.1 channel setup the subwoofer channel is swapped with the back/right channel, and the subwoofer channel seems only mute/un-mute the subwoofer. But the volume itself is controlled by the back/right channel.
I am thinking that the middle/front channel is also swapped with back/left channel, but not tested because i don't have an (active) middle/front speaker.
It looks like a channel rooting issue but i don't have the knowledge about alsa to fix that with a asound.conf.
The card is a usb-audio device. Beside from this issue the card works well under linux. I don't use the control box for headphones.
I am happy to provide more information if requested.
If you think this is alsa related i can close this kernel bug report. https://bugzilla.kernel.org/show_bug.cgi?id=217868
alsa-info:
[alsa-info.txt](https://github.com/alsa-project/alsa-ucm-conf/files/12535277/alsa-info.txt)

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/349
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
