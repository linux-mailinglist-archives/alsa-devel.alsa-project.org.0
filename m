Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF91983944D
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jan 2024 17:07:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6577984C;
	Tue, 23 Jan 2024 17:07:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6577984C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706026054;
	bh=+gWhJTV2X7HiF+UUaHLtNhZd3rQJFw65YRZSrrUJ9nk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=M8LIO9Tq/sIJ92hk4GpGN8jaR0FwxsDR6EGVlQIMFyoInERKK6HjKDKsG5vx3c+KU
	 9rIg5HmR28Nvwp26viVk+7LycCe8Ye565aHRQlorRcN1DPYYpqxojkhBYo70wJY1ci
	 LUv6qUPxa4LJX6O/EZqWv61xg9wVGArNGyH76HCQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0FC0F805AF; Tue, 23 Jan 2024 17:07:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5751F8057D;
	Tue, 23 Jan 2024 17:07:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE5B1F8028D; Tue, 23 Jan 2024 17:07:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 15D26F800C1
	for <alsa-devel@alsa-project.org>; Tue, 23 Jan 2024 17:07:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15D26F800C1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1706026020263633728-webhooks-bot@alsa-project.org>
References: <1706026020263633728-webhooks-bot@alsa-project.org>
Subject: Add support for Asus ROG Maximus Z790 Apex Encore motherboard
Message-Id: <20240123160708.AE5B1F8028D@alsa1.perex.cz>
Date: Tue, 23 Jan 2024 17:07:08 +0100 (CET)
Message-ID-Hash: CLR2ZYTEYUYSUFXB4MRTUPYIIDY5YD5Z
X-Message-ID-Hash: CLR2ZYTEYUYSUFXB4MRTUPYIIDY5YD5Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CLR2ZYTEYUYSUFXB4MRTUPYIIDY5YD5Z/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #388 was opened from jrouvier:

The Asus ROG Maximus Z790 Apex Encore motherboard is yet another Asus board with a Realtek ALC4080 chip.  This adds the USB device id for this chip as it appears on this motherboard, which is needed to enable the rear microphone port.

My [alsa-info.txt](https://github.com/alsa-project/alsa-ucm-conf/files/14026974/alsa-info.txt) details attached.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/388
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/388.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
