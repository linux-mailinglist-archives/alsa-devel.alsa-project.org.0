Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CABE988BFE8
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 11:50:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56D9A2346;
	Tue, 26 Mar 2024 11:50:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56D9A2346
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711450248;
	bh=BTbRGJAnKTYul/QPH4Z5mYgCJggmgAjnfIqeHdypb8s=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=RmmuI+841UCJwdBzhN59fnECRHA/rfLek3BeE/hELjfHCvQ/84zYkt+7EdkpqQW7c
	 VISEhP31B87le+zPOOLp9TApsdWM17OWOOyDacT8b5w/jzbPUx9OIGKnA8bQJqOuTv
	 PKL74s692Qp/sESXV7NKImjkpstLenKp2nv+SNxI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E50ADF805A1; Tue, 26 Mar 2024 11:50:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 757D4F805A1;
	Tue, 26 Mar 2024 11:50:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72791F8025F; Tue, 26 Mar 2024 11:50:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id BD01CF80093
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 11:50:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD01CF80093
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1711450206756598473-webhooks-bot@alsa-project.org>
References: <1711450206756598473-webhooks-bot@alsa-project.org>
Subject: ucm2: MediaTek: mt8195-sof: Add support for Tomato RT5682s variant
Message-Id: <20240326105010.72791F8025F@alsa1.perex.cz>
Date: Tue, 26 Mar 2024 11:50:10 +0100 (CET)
Message-ID-Hash: A2YJZG7AUMJ5CZLPAHYMYMVXDQ56CWY7
X-Message-ID-Hash: A2YJZG7AUMJ5CZLPAHYMYMVXDQ56CWY7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A2YJZG7AUMJ5CZLPAHYMYMVXDQ56CWY7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #406 was opened from kholk:

A later revision of the MT8195 Cherry Tomato Chromebook (Acer Chromebook Spin 513 CP513-2H, Revision 3 and 4) are using the RT5682s codec instead of RT5682i.

The differences are only about a couple of missing switches, where the 'i' variant had a switch for the L/R Headphone output and a configurable DAC L/R Mux, while the 's' one misses the mux control and solely relies on the main Headphone Switch.

This configuration has been tested on Arch Linux with Pipewire 10.03 + WirePlumber.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/406
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/406.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
