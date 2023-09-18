Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 231F77A4579
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Sep 2023 11:07:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C7B21EC;
	Mon, 18 Sep 2023 11:06:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C7B21EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695028021;
	bh=1jSrtDsI/ztD1oIKyJYAA9EitYy68n6oA9zojXbTgso=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=UhWghuyDTqHVMBhaGLmn7EleAUz9hLI7y0bv6nJa0FEWVCcufVteAXuVrJVpYy8Gp
	 Wltp05UOmxi7qP2lMMN+Qw5xEfDV8ju8vFmoRArU0hZ00qtuvUR2i994Eb9xBaiUi+
	 UTz0HfXNs1xcVb/d8zT7HjxZEOXk0aRB9gmBsPj0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70197F80551; Mon, 18 Sep 2023 11:06:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 26751F801D5;
	Mon, 18 Sep 2023 11:06:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0682BF801F5; Mon, 18 Sep 2023 11:06:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 5770DF80125
	for <alsa-devel@alsa-project.org>; Mon, 18 Sep 2023 11:06:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5770DF80125
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1695027964347604990-webhooks-bot@alsa-project.org>
References: <1695027964347604990-webhooks-bot@alsa-project.org>
Subject: bat: really skip analysis of the first period and update related
 comment
Message-Id: <20230918090607.0682BF801F5@alsa1.perex.cz>
Date: Mon, 18 Sep 2023 11:06:07 +0200 (CEST)
Message-ID-Hash: 3L67BOOLXLVFT55KCHZ4W7B66HRW33W3
X-Message-ID-Hash: 3L67BOOLXLVFT55KCHZ4W7B66HRW33W3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3L67BOOLXLVFT55KCHZ4W7B66HRW33W3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #237 was edited from dbrignoli:

Prior to this change bat/analyze.c would skip the last period of the recording, contrary to the comment in the code which stated the first period was meant to be skipped.

The comment has been updated to state that both the first and last period are skipped and the code has been updated to match.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/237
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/237.patch
Repository URL: https://github.com/alsa-project/alsa-utils
