Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1598CBBCC
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2024 09:15:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26113820;
	Wed, 22 May 2024 09:15:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26113820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716362150;
	bh=YUuSb3M+YDhe87tbwaPAdic78RPEhF9U2pGA/xP66lc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=kjmRUswBIKE5hZtnzimtim0o3xf6F4Rm3086Igh3fePeVlMDh/wET44f+fbg7774G
	 Xas5jHFvC0CctCTiQsQ6K40avoWYYxnyCaqnBpUjTbLQ65rAyEmlwD70wP06l6SDFL
	 TeXpj8ZvoFIxptlWubwQiuvic8TlEHjoqgz+gdvc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F12CF805AD; Wed, 22 May 2024 09:15:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DFD7EF80588;
	Wed, 22 May 2024 09:15:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D139F8026A; Wed, 22 May 2024 09:14:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 254F4F800BA
	for <alsa-devel@alsa-project.org>; Wed, 22 May 2024 09:14:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 254F4F800BA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1716362072660927057-webhooks-bot@alsa-project.org>
References: <1716362072660927057-webhooks-bot@alsa-project.org>
Subject: UCM2: Intel: sof-hda-dsp: Control SOF processing from UCM
Message-Id: <20240522071439.7D139F8026A@alsa1.perex.cz>
Date: Wed, 22 May 2024 09:14:39 +0200 (CEST)
Message-ID-Hash: 7CXEDICTLGGQ6JP5MPZ7B3KYJ5TKFSFC
X-Message-ID-Hash: 7CXEDICTLGGQ6JP5MPZ7B3KYJ5TKFSFC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7CXEDICTLGGQ6JP5MPZ7B3KYJ5TKFSFC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #419 was opened from singalsu:

This is a set of patches to control with UCMv2 audio processing in Sound Open Firmware (SOF). The settings are generic, mostly pass-through mode, except for speaker where a generic high-pass filter and DRC boost are applied.

All the filters can be set up with a bespoke tuned version per product for a better audio experience.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/419
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/419.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
