Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D467309FF
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jun 2023 23:48:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 221251EF;
	Wed, 14 Jun 2023 23:47:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 221251EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686779309;
	bh=d0693GQiU00N+/S9NIvhFUhLdkstGyYaVSqNZ4OkxLs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=g4/a+tGhofdb30jR70fFndOn6MH9zJMyd/YSHAzjQ2jcy3C4THXT71IgZLLp6LHdn
	 /rmjIck4gcujW4AsWAYt1TovgPp+a+DXeWu4nXPB93OOT2spFiPIcQef9N5GH7vB3g
	 7iSKzL4rYYT9JgKECLlvkDKYlGg2IxB5+SIAF3Jg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D13BFF800BA; Wed, 14 Jun 2023 23:47:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42F31F80132;
	Wed, 14 Jun 2023 23:47:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67BC8F80149; Wed, 14 Jun 2023 23:47:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id E025EF80130
	for <alsa-devel@alsa-project.org>; Wed, 14 Jun 2023 23:47:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E025EF80130
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1686779246190426588-webhooks-bot@alsa-project.org>
References: <1686779246190426588-webhooks-bot@alsa-project.org>
Subject: params argument to `SNDRV_PCM_IOCTL_SW_PARAMS` should be pointer
Message-Id: <20230614214732.67BC8F80149@alsa1.perex.cz>
Date: Wed, 14 Jun 2023 23:47:32 +0200 (CEST)
Message-ID-Hash: 6UPWOI47YMZQAEJUS3LGEL7HTTU5K6LL
X-Message-ID-Hash: 6UPWOI47YMZQAEJUS3LGEL7HTTU5K6LL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6UPWOI47YMZQAEJUS3LGEL7HTTU5K6LL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #329 was opened from dancrossnyc:

Commit 2115cdb4d added a call to the `SNDRV_PCM_IOCTL_SW_PARAMS` ioctl on line 675 of src/pcm/pcm_hw.c, but passes the `sw_params` argument by value; this should be passed by pointer.

I ran across this in the context of the direwolf software modem for amateur radio; debugging details are in https://groups.io/g/direwolf/message/8286.

The patch is trivial; I will send a PR.

Thanks!

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/329
Repository URL: https://github.com/alsa-project/alsa-lib
