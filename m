Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D566D5382
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 23:32:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB07D1FE;
	Mon,  3 Apr 2023 23:31:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB07D1FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680557523;
	bh=jP5iEi31KoRo3JT49d7BE4vjlqL9w/riY7gql/MRdO4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ka9uD61u3wkjffah0N8YmVHIEYx+ayX5BQAu/RQbEFmFeWSExwmsGUydBWVfHr6HO
	 ans5lnyndvyGxUeyTsMwHa9PBlHwhMOG9eJDDhT6eFW3DpQnWkqqomdiBOufDYp2UP
	 HXc6h5xthEUExy8TLZ+LdygYG+2VAiuLUEEAHsFo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CED2BF8052E;
	Mon,  3 Apr 2023 23:30:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 762B5F80533; Mon,  3 Apr 2023 23:30:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 278A6F8028B
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 23:30:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 278A6F8028B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1680557441664847612-webhooks-bot@alsa-project.org>
References: <1680557441664847612-webhooks-bot@alsa-project.org>
Subject: topology: nhlt: ssp-nhlt: Set link clock source based on bclk_freq
Message-Id: <20230403213044.762B5F80533@alsa1.perex.cz>
Date: Mon,  3 Apr 2023 23:30:44 +0200 (CEST)
Message-ID-Hash: 4HBA3YCYEJMXRFD7GCAGLM3UNU5ZHLZY
X-Message-ID-Hash: 4HBA3YCYEJMXRFD7GCAGLM3UNU5ZHLZY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4HBA3YCYEJMXRFD7GCAGLM3UNU5ZHLZY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #198 was opened from ranj063:

There is no need to set this in topology as this can be derived based on whether the bit clock frequency is derived from 19.2MHz or 24.576MHz.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/198
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/198.patch
Repository URL: https://github.com/alsa-project/alsa-utils
