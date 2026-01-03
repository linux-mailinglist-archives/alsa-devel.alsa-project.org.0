Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CEECF06B7
	for <lists+alsa-devel@lfdr.de>; Sat, 03 Jan 2026 23:22:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D184601BA;
	Sat,  3 Jan 2026 23:21:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D184601BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1767478923;
	bh=oV68q1kZsyK0lmo0dNZ/N2Wsn2Gc6WPz7qNtn5LxqH8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=acUs3fJ5t3AyDCt8CV/NavBStLParkJSZS9Zgy7FcK44wHJjHgA3GUt/n76Z5070G
	 y/JT1Ej7EVKQBKNsrTvZSPkvd7l+WGOk4AZ3eK6PLchT6n/70RiNF7eSDPkOoU81TP
	 kuutsfuTFkrJpFYzeCsF3MfhT7L3kPAQq3kJNfBw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BFDCF805E1; Sat,  3 Jan 2026 23:21:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CCFAF805C8;
	Sat,  3 Jan 2026 23:21:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15360F80236; Sat,  3 Jan 2026 23:21:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id A7C82F8010B
	for <alsa-devel@alsa-project.org>; Sat,  3 Jan 2026 23:21:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7C82F8010B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <188758aafa6a6500-webhooks-bot@alsa-project.org>
In-Reply-To: <188758aaf8512800-webhooks-bot@alsa-project.org>
References: <188758aaf8512800-webhooks-bot@alsa-project.org>
Subject: Bluetooth: Suddenly corrupted SCO packet
Date: Sat,  3 Jan 2026 23:21:18 +0100 (CET)
Message-ID-Hash: E3MQVZSIAKH6MF7CNJCH3PW7Y6AQDSEG
X-Message-ID-Hash: E3MQVZSIAKH6MF7CNJCH3PW7Y6AQDSEG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E3MQVZSIAKH6MF7CNJCH3PW7Y6AQDSEG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #674 was opened from wwidesoft:

Bluetooth headset stopped working after upgrading package alsa-ucm-conf to version 1.2.15.1-1 (Arch Linux kernel 6.18.2-zen2-1-zen 64-bit)

downgrading to version 1.2.14-2 solved the issue

**dmesg**

kernel: Bluetooth: hci0: corrupted SCO packet
kernel: Bluetooth: hci0: SCO packet for unknown connection handle 257

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/674
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
