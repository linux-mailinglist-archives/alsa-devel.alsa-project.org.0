Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E136C6507
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 11:30:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D60C4EC6;
	Thu, 23 Mar 2023 11:29:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D60C4EC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679567410;
	bh=fmIKawZ140JZ5ogbMXxu7K2015LHiaqk8W8I7VjNZKE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=kdQhuXvKiMV0dkUw976z475R9XRTNwsWpcM66XaL90/gYmWNRZkfIAAQCFIkGjGyF
	 lvapP+cK9KVZMq9WxU/n4TCAtUhM+2+opW04pcZH6ojXxctSMG5XtfGd+ThxW4VUQQ
	 T5eSM2nexQz57OE4ADDz9nDL1w2qxw2QqGIzGlN4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D3EDF800C9;
	Thu, 23 Mar 2023 11:29:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6134DF802E8; Thu, 23 Mar 2023 11:29:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id DA693F800C9
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 11:29:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA693F800C9
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1679567349042479277-webhooks-bot@alsa-project.org>
References: <1679567349042479277-webhooks-bot@alsa-project.org>
Subject: ucm2: codecs: va-macro: fix dmic1 mux setting
Message-Id: <20230323102914.6134DF802E8@alsa1.perex.cz>
Date: Thu, 23 Mar 2023 11:29:14 +0100 (CET)
Message-ID-Hash: IYHAIGNUTVZ4LZEBL3CEB6LC7DLM6TP5
X-Message-ID-Hash: IYHAIGNUTVZ4LZEBL3CEB6LC7DLM6TP5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IYHAIGNUTVZ4LZEBL3CEB6LC7DLM6TP5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #294 was opened from Srinivas-Kandagatla:

Looks like there was a typo in setting up dmic1 mux. Without this dmic01 selection would only do single channel record instead of 2 channel recording.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/294
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/294.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
