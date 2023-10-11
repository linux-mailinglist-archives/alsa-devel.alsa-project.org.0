Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B92A57C50B9
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Oct 2023 13:02:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FB851564;
	Wed, 11 Oct 2023 13:01:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FB851564
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697022130;
	bh=iGWVmjfdUKqM4UM8C6uGbbQLvABx5Cx/WJC+FU33Pss=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=AhpOJehnj9kz8DCpDmb9PYhMhW/QHTn7jwxTU1onNeW/JgEQBldH+4pBLR5UAmToW
	 wh47DqKHcm/liYaHBfpNaV+pT3wnxAWbo0kJxro+3ViJ+d9AkAbvnVoHM50gdeQeFW
	 LseKclwq0TWwTdyoAPJrNDnb4nxPqk6I2OW8866Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91CDBF80536; Wed, 11 Oct 2023 13:01:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B18EF8027B;
	Wed, 11 Oct 2023 13:01:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59985F80310; Wed, 11 Oct 2023 12:53:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AF98F80130
	for <alsa-devel@alsa-project.org>; Wed, 11 Oct 2023 12:52:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AF98F80130
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1697021549814815760-webhooks-bot@alsa-project.org>
References: <1697021549814815760-webhooks-bot@alsa-project.org>
Subject: Realtek ALC 4080 on MSI MPG B650 Carbon WiFi
Message-Id: <20231011105334.59985F80310@alsa1.perex.cz>
Date: Wed, 11 Oct 2023 12:53:34 +0200 (CEST)
Message-ID-Hash: Q4KS7RF55GKPIF5O4DW5COFY2EWMNUM4
X-Message-ID-Hash: Q4KS7RF55GKPIF5O4DW5COFY2EWMNUM4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q4KS7RF55GKPIF5O4DW5COFY2EWMNUM4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #359 was opened from TeamFahQ:

I have Realtek ALC 4080 on an MSI MPG B650 Carbon WiFi and the chip is not getting recognized. I havve seen similar post with this exact issue on similar motherboards and the fix is to change the usb id. Unfortunately, I'm not sure which is the usb id I need
`Bus 001 Device 003: ID 0db0:70d3 Micro Star International USB Audio
Bus 002 Device 003: ID 0bda:0411 Realtek Semiconductor Corp. Hub
Bus 001 Device 004: ID 0bda:5411 Realtek Semiconductor Corp. RTS5411 Hub`
Assumably, it would be the first one I listed, but being this is a Realtek device, could it be either of the other 2?

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/359
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
