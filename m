Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF4D8407D7
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 15:07:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5788D74C;
	Mon, 29 Jan 2024 15:07:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5788D74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706537265;
	bh=MAVvgqIhQOuBt0dFxyqV8Xea2Ut63tuXZk7Xfu/eCco=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=m3s9dZZ3QLEnkd8p3Su2H2ZXokPwxlZtxiXXawc/kw0x6Yzg9viqnXpOoSvyj3VTN
	 1JVLrCb0WZ96AlmMOJN+LDxzCjNMFgaBfZNAH4OYYLuh8mDEOj6wSo59HHLGBcGIGT
	 9AE+JA1pcl/z+06DbQJqQZqJsst6rIP+1xG34OjQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78330F800FB; Mon, 29 Jan 2024 15:07:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74DE4F805A8;
	Mon, 29 Jan 2024 15:07:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A055FF80563; Mon, 29 Jan 2024 15:07:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id DAFC6F800FB
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 15:07:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAFC6F800FB
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1706537224591555834-webhooks-bot@alsa-project.org>
References: <1706537224591555834-webhooks-bot@alsa-project.org>
Subject: pcm: document interaction of drain silence and sw silence parameter
Message-Id: <20240129140709.A055FF80563@alsa1.perex.cz>
Date: Mon, 29 Jan 2024 15:07:09 +0100 (CET)
Message-ID-Hash: Z2N3TX3GSDRZTA6XRZBGEBPIHTGVIUKJ
X-Message-ID-Hash: Z2N3TX3GSDRZTA6XRZBGEBPIHTGVIUKJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z2N3TX3GSDRZTA6XRZBGEBPIHTGVIUKJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib pull request #381 was opened from z-s-e:

I'm not sure this is the best way to describe the interaction, but I think this needs to be mentioned in some form at least.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/381
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/381.patch
Repository URL: https://github.com/alsa-project/alsa-lib
