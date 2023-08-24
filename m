Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 938DF787B95
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 00:43:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC38E84D;
	Fri, 25 Aug 2023 00:42:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC38E84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692917000;
	bh=aHh8Z3nd+yndis+WoMYg83bgrHr+LOyicbQvOJ90IWQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=bgRxuIGQyRRzH9JCea/62l3hsCbPsu6Jaigagj8ZDV7/OO0VCT0JhJGNPLELlv8Ad
	 Vzwa2MS/Ixx+fXKHdmz+h2Y7XWMchbaMm4J8c4wlovVxztGqkNJ2/u1/wAnEAYzJVq
	 JVJ6w9qYqNjDlIw07NiQM7qlmQXUWI1g2lApm1mQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E09FBF800F5; Fri, 25 Aug 2023 00:42:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BEC9F800BF;
	Fri, 25 Aug 2023 00:42:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2E57F800D1; Fri, 25 Aug 2023 00:42:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B6D3F800AE
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 00:41:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B6D3F800AE
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1692916919651937962-webhooks-bot@alsa-project.org>
References: <1692916919651937962-webhooks-bot@alsa-project.org>
Subject: connecting second HDMI/DVI monitor mostly makes Samsung TV sound
 disappear
Message-Id: <20230824224202.F2E57F800D1@alsa1.perex.cz>
Date: Fri, 25 Aug 2023 00:42:02 +0200 (CEST)
Message-ID-Hash: XZJ3F3XPHJ3Y26VOB4RR72JB33U2BKD2
X-Message-ID-Hash: XZJ3F3XPHJ3Y26VOB4RR72JB33U2BKD2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XZJ3F3XPHJ3Y26VOB4RR72JB33U2BKD2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #347 was opened from chemelnucfin:

This is the same issue I posted in Pipewire: https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/3420
But I think this issue might be relevant here also so wanted to try here also.

A brief summary is that my Samsung TV loses sound when I connect either HDMI to HDMI or HDMI to DVI to any of 2 Acer and 1 Samsung monitor, but an LG monitor has no problem.  The sound on the TV always comes back when I disconnect the (non-working) monitor.  

I have attached  _wpctl status_ for both when I connect LG and Acer monitors,
[0824_acer_mon_wpctl_status.txt](https://github.com/alsa-project/alsa-lib/files/12433813/08241457_acer_mon_wpctl_status.txt)
[0824_LG_mon_wpctl_status.txt](https://github.com/alsa-project/alsa-lib/files/12433814/08241457_LG_mon_wpctl_status.txt)
and also _alsa_info.sh_ for both monitors.  
[0824_acer_mon_alsa.txt](https://github.com/alsa-project/alsa-lib/files/12433816/0824_alsa_acer_mon.txt)
[0824_LG_mon_alsa.txt](https://github.com/alsa-project/alsa-lib/files/12433815/0824_alsa_LG_mon.txt)

Please let me know if you need any other information or if there are better places for help to investigate the issue.

A brief search of HDMI showed this 
https://github.com/alsa-project/alsa-lib/issues/95
and 3 other issues which seem less relevant
https://github.com/alsa-project/alsa-lib/issues/233
https://github.com/alsa-project/alsa-lib/issues/209
https://github.com/alsa-project/alsa-lib/issues/112

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/347
Repository URL: https://github.com/alsa-project/alsa-lib
