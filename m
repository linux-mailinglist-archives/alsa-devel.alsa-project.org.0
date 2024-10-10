Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1127C998E45
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Oct 2024 19:20:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DAC8850;
	Thu, 10 Oct 2024 19:20:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DAC8850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728580823;
	bh=YQdj60ujtQyn1cbDFb7gsoKS6EUMbd6ScsXCk1LqH9w=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=sK6CWDUfRTYFVWD9BAdVu3MRdGYzrD0EVi965TpYOC8I9nprQyazH3VEz0+T+mbsi
	 MtjU8URuCLKA8ROiL5CozbCCyJ4/gLaHLpSmad9XZeyMelaTuHmpwzR2Mn+VEP2Pqd
	 Yqe0PwKLVBSLyYOTbh5Mk/2RmWXh8DUKFoF22F7M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F03BAF805B5; Thu, 10 Oct 2024 19:19:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D164AF80580;
	Thu, 10 Oct 2024 19:19:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4ABCAF80528; Thu, 10 Oct 2024 19:19:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 76703F8001E
	for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2024 19:19:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76703F8001E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1728580783682696104-webhooks-bot@alsa-project.org>
References: <1728580783682696104-webhooks-bot@alsa-project.org>
Subject: Add Toradex Hardware Configuration Files
Message-Id: <20241010171946.4ABCAF80528@alsa1.perex.cz>
Date: Thu, 10 Oct 2024 19:19:46 +0200 (CEST)
Message-ID-Hash: PBUI7G7GBTHUSG2SEHJQ5QWPIJLJDVCV
X-Message-ID-Hash: PBUI7G7GBTHUSG2SEHJQ5QWPIJLJDVCV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PBUI7G7GBTHUSG2SEHJQ5QWPIJLJDVCV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #448 was opened from hiagofranco:

Add necessary configuration files related to Toradex Hardware.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/448
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/448.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
