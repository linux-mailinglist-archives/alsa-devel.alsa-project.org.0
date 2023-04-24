Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1E86DE534
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Apr 2023 22:00:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3B03EDC;
	Tue, 11 Apr 2023 21:59:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3B03EDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681243219;
	bh=IbMZONGlXDXXSrsZuI3as5CXI3Ebary6IJAhsMy/qvQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=MKZIn/ALIR7nE3K552J9g7826ENUoLggQrspzlv6bRGiLaCwaVREnLqqYqUSx7h5j
	 fb6uHTxC4+ol5HRaD3pJWk3sMlpMTR1R3GHtOwAu3G9TNXhhJ78jrbdlxKrXHIZJqH
	 d/+akCLcmCkbNaFot3VUNJh77MpjWcWpduIKjqL4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EBB3DF8025E;
	Tue, 11 Apr 2023 21:59:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A5BBF8032B; Tue, 11 Apr 2023 21:59:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 204B2F80149
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 21:59:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 204B2F80149
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1681243160681095839-webhooks-bot@alsa-project.org>
References: <1681243160681095839-webhooks-bot@alsa-project.org>
Subject: New configuration for Audient EVO4
Message-Id: <20230411195924.3A5BBF8032B@alsa1.perex.cz>
Date: Tue, 11 Apr 2023 21:59:24 +0200 (CEST)
Message-ID-Hash: IGRJVEWUSIWCKF6CZIRSFQSOG35FCSAP
X-Message-ID-Hash: IGRJVEWUSIWCKF6CZIRSFQSOG35FCSAP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IGRJVEWUSIWCKF6CZIRSFQSOG35FCSAP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #303 was opened from mbainter:

I'd like to assemble a UCM2 configuration for the EVO4 similar to what is present for the id44.  These are very similar, except the EVO has [two Mic preamps instead of just one](https://audient.com/id4-vs-evo4/). I am trying to build off of the id44 profile, but the docs are a bit thin.

If someone can help me work through this, I'd be happy to submit a PR with the configuration (which could then be a reasonable basis for the EVO8 and 16 as well, if anyone has those and wants to contribute).

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/303
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
