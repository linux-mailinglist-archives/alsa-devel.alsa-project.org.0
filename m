Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE8183B85D
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jan 2024 04:36:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1D3F82C;
	Thu, 25 Jan 2024 04:36:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1D3F82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706153772;
	bh=PKbz2iskz6MjYCchd3n6D+CIC9W9HUloFT41AuP/oik=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=iIjM5I4xGpE3cgs4XuGXPrjkJxKxWZnIwhKKG3fRdwSGucKatQSuNvqxNQqgKxAh8
	 DN1T/Qm+iaL4VwJfZWEvPjVvrruaDC8BYRP8FpwStkX395NetlO+P6wmnN2Tb/F0YE
	 vfLPW+XaatAvjWKqf5Wlnce1v45O8r1s44WQbk2I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 042F3F800C1; Thu, 25 Jan 2024 04:35:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4046BF802BE;
	Thu, 25 Jan 2024 04:35:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C892F8028D; Thu, 25 Jan 2024 04:35:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id C7191F80149
	for <alsa-devel@alsa-project.org>; Thu, 25 Jan 2024 04:35:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7191F80149
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1706153727390721321-webhooks-bot@alsa-project.org>
References: <1706153727390721321-webhooks-bot@alsa-project.org>
Subject: ucm: MediaTek: mt8395-evk: Add HDMIRX config
Message-Id: <20240125033534.6C892F8028D@alsa1.perex.cz>
Date: Thu, 25 Jan 2024 04:35:34 +0100 (CET)
Message-ID-Hash: KXWCTKY7RANVWAO3A7TW53VA4EIBOBSA
X-Message-ID-Hash: KXWCTKY7RANVWAO3A7TW53VA4EIBOBSA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KXWCTKY7RANVWAO3A7TW53VA4EIBOBSA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #389 was opened from zoran055:

Add HDMI RX config and modify the priority value
of the capture devices.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/389
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/389.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
