Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D5F79F396
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 23:15:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B21FE950;
	Wed, 13 Sep 2023 23:14:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B21FE950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694639745;
	bh=3dLbzjuPE4S/e/gNZpQ9X1MRDIZJUBKJrmoMdnWDFpo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Mij42nl6dstAO/62kvVnYw2PZy80NAogb9WSbS6SxlfOUpYcuxBca9UYubAlnI/5F
	 J6RLUbsQETsM3k7bt57YXqm3fvEsX7HfrOdmOstsVbgc9i/o+tVwWcrLxH9C4GMVZD
	 Uiu8glvzsqEEhUv8Z7v9Tve+fhBVkpFI4EEINxHA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C615F80552; Wed, 13 Sep 2023 23:14:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A925CF80246;
	Wed, 13 Sep 2023 23:14:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E47F1F80425; Wed, 13 Sep 2023 23:14:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 41FF8F8007C
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 23:14:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41FF8F8007C
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1694639680870551348-webhooks-bot@alsa-project.org>
References: <1694639680870551348-webhooks-bot@alsa-project.org>
Subject: USB-Audio, Generic config file is missing
Message-Id: <20230913211442.E47F1F80425@alsa1.perex.cz>
Date: Wed, 13 Sep 2023 23:14:42 +0200 (CEST)
Message-ID-Hash: X4BT74PU3KBVQGHBZNXYIREL6IBSLUQ7
X-Message-ID-Hash: X4BT74PU3KBVQGHBZNXYIREL6IBSLUQ7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X4BT74PU3KBVQGHBZNXYIREL6IBSLUQ7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #353 was opened from smangels:

* the intermediate config file is missing, it is referenced in ucm2/USB-Audio/USB-Audio.conf file but wasn't in place.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/353
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
