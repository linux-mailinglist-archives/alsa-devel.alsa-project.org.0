Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 053877834B8
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 23:12:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E4EE836;
	Mon, 21 Aug 2023 23:11:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E4EE836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692652356;
	bh=m4z+v6dbwQ9Phv4FVkMuIIpC8Co8nzNQAPcl/2nmNsY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=r+fiDbhn3IZitz6HHvqktL1pszGDUzw/olivViY1ndPwK0rD7l2nHWq3V9Y0Y2QMJ
	 XWgVWINd9OQ95YWxWFjYKsSPaqPut/5f2YLjOTTAXBbo/29unEgG9sOxkqN2h3+3u/
	 okQp9dSytJJ09k//KyYAtoSxGy5PGuV996JyQ8j4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6437F8016C; Mon, 21 Aug 2023 23:11:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A232F8016C;
	Mon, 21 Aug 2023 23:11:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 825A6F80199; Mon, 21 Aug 2023 23:11:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 3456EF800BF
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 23:11:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3456EF800BF
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1692652294032554388-webhooks-bot@alsa-project.org>
References: <1692652294032554388-webhooks-bot@alsa-project.org>
Subject: Add a config for the Allen & Heath Zedi 10 mixer.
Message-Id: <20230821211141.825A6F80199@alsa1.perex.cz>
Date: Mon, 21 Aug 2023 23:11:41 +0200 (CEST)
Message-ID-Hash: X4TZHT4E7E52724YZ2F7RLJHLH3DQJNO
X-Message-ID-Hash: X4TZHT4E7E52724YZ2F7RLJHLH3DQJNO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X4TZHT4E7E52724YZ2F7RLJHLH3DQJNO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #341 was opened from pololevu:

[alsa-info.txt](https://github.com/alsa-project/alsa-ucm-conf/files/12402535/alsa-info.txt)
The mixer has an embedded 4x4 USB interface, this config surfaces the mixer channels as 4 mono inputs, 2 stereo inputs and 2 stereo outputs. Config based on the Behringer Flow8 config.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/341
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/341.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
