Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E78C47295EE
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 11:53:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC5BD3E8;
	Fri,  9 Jun 2023 11:52:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC5BD3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686304426;
	bh=ZnGUtlwO4qCpIi8g41/7PueAiGCnAxXv0Y8E8TAdQ9Y=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=WnBdKfQlE8x9NytfAE8RG8RFVDqszlABtWOPPUK2oU/r6hEY3/gQGJnwhW0xQTPw7
	 z3f0I0M0JyP2x5AafbxF1BI7cxoblZnLASm+c/8UPdyE0+3tF5WviAC5cdOZkWddDf
	 7cify1O2p8lOWdsePaliuULtRJSofgIXkVNGGo2c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38F9CF80199; Fri,  9 Jun 2023 11:52:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD98AF8016C;
	Fri,  9 Jun 2023 11:52:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DEC4F80199; Fri,  9 Jun 2023 11:52:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 11820F800ED
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 11:52:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11820F800ED
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1686304368177361012-webhooks-bot@alsa-project.org>
References: <1686304368177361012-webhooks-bot@alsa-project.org>
Subject: ucm2: MediaTek: mt8390-evk: Add alsa-ucm support
Message-Id: <20230609095253.3DEC4F80199@alsa1.perex.cz>
Date: Fri,  9 Jun 2023 11:52:53 +0200 (CEST)
Message-ID-Hash: BY5CKDZ5QJVM764ZMRNYZJIMF3HHXIHN
X-Message-ID-Hash: BY5CKDZ5QJVM764ZMRNYZJIMF3HHXIHN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BY5CKDZ5QJVM764ZMRNYZJIMF3HHXIHN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #321 was opened from zoran055:

Add alsa-ucm support for the MediaTek mt8390-evk platform.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/321
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/321.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
