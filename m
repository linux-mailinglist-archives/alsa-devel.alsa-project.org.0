Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA0C8C0495
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 20:48:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3054EB60;
	Wed,  8 May 2024 20:47:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3054EB60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715194079;
	bh=SzTZCfjBuw/1ITIzvCZJM9K5Z86ngtWwAOwkZXtM0YY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=if84GNs8iuk1W3jG0hABJ8xanqiMereqvhCc8XgVSiyoBxfLKCXzFdgGsWVlwGwqx
	 QHEpgICd/XfkHxrFEqR+zU0cHWVixGXBpd5noKBaZSB7P3d1zJs2qlJ7N90UFPeN2p
	 kd+MiyAWe367ej1qYC/Idb9G41RXbj9y0RLivojU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C45C6F8057B; Wed,  8 May 2024 20:47:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51EA4F805A0;
	Wed,  8 May 2024 20:47:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B34B2F8049C; Wed,  8 May 2024 20:47:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 12335F8003A
	for <alsa-devel@alsa-project.org>; Wed,  8 May 2024 20:47:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12335F8003A
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1715194037191637516-webhooks-bot@alsa-project.org>
References: <1715194037191637516-webhooks-bot@alsa-project.org>
Subject: Motu 828 (28 x 32) support
Message-Id: <20240508184722.B34B2F8049C@alsa1.perex.cz>
Date: Wed,  8 May 2024 20:47:22 +0200 (CEST)
Message-ID-Hash: QJS7E5B2ITDMASJRUCGXE3W6NIWPFVJE
X-Message-ID-Hash: QJS7E5B2ITDMASJRUCGXE3W6NIWPFVJE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QJS7E5B2ITDMASJRUCGXE3W6NIWPFVJE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #415 was opened from beatboxa:

The newest [Motu 828 (28x32)](https://motu.com/en-us/products/828/) does not appear to have a UCM yet.  It is a class compliant USB device; so as a result, it generally "works" at a very basic level; but default channel mappings and profiles do not. 

The system appears to default to only 2 channels in and 2 channels out.  So, for example, surround playback seems to mix into either the left or right channel.

In qpwgraph, it shows 30 inputs (I believe this includes an additional 2-channel loopback at the end) and 32 outputs, all marked as "AUX#," where # starts with 0.  I was able to identify which AUX# corresponds to which input or output on the device, through the use of qpwgraph and the device's built-in digital VU meter.

I have tried to create a UCM or even an asoundrc; but I have no idea what I'm doing.  The documentation and examples are not intuitive for me.

Could I collaborate with someone in order to get this audio interface supported?  I'd be happy to run any commands and tests you advise on.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/415
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
