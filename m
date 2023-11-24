Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 422117F758E
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Nov 2023 14:50:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC380E74;
	Fri, 24 Nov 2023 14:50:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC380E74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700833830;
	bh=F3xJdRChfgjmhlp0/Nj9LprhhfinswVL3TCugN5qh3A=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=oo6lNx+ti9kKO5oUMFWWP57t81qo23CqxK3OfDywvXNlJQUbxMZ1EHPdSrApfMnuD
	 nc2zCuxbEUYhySnnpo6QIbzU/qepJHTRs5sSBP9qE4uYu/oMFCxZoc5x9PNBUbEnyy
	 HKOV1LAbvjTcCDWwdsCdOsBFDTe2doL3i0bleM4A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14A28F8057C; Fri, 24 Nov 2023 14:49:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38A39F8057A;
	Fri, 24 Nov 2023 14:49:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD058F802E8; Fri, 24 Nov 2023 14:49:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 96644F80249
	for <alsa-devel@alsa-project.org>; Fri, 24 Nov 2023 14:49:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96644F80249
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1700833789782852650-webhooks-bot@alsa-project.org>
References: <1700833789782852650-webhooks-bot@alsa-project.org>
Subject: pcm: clarify documentation of poll descriptor usage
Message-Id: <20231124134954.BD058F802E8@alsa1.perex.cz>
Date: Fri, 24 Nov 2023 14:49:54 +0100 (CET)
Message-ID-Hash: TIXAUFG7EXM2QKHBU7FGHZVHZB6X2XHZ
X-Message-ID-Hash: TIXAUFG7EXM2QKHBU7FGHZVHZB6X2XHZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TIXAUFG7EXM2QKHBU7FGHZVHZB6X2XHZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib pull request #370 was opened from z-s-e:

This is based on my understanding of the intended behavior and the test/pcm.c example code.

There needs to be more clarifiaction regarding the exact semantics of the value of the revents output parameter of
snd_pcm_poll_descriptors_revents, since there are events that do not necessarily correspond to POLLIN or POLLOUT (such as period events), but I believe this is a lot less obvious and needs confirmation first.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/370
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/370.patch
Repository URL: https://github.com/alsa-project/alsa-lib
