Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4488D9C4871
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2024 22:48:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C0C514DF;
	Mon, 11 Nov 2024 22:47:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C0C514DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731361682;
	bh=LKNRRs0TrHkupJkgF9W1r6G3Ht6SYDtEfjtG2re5cgw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=k0m3bw1rJxWyD31dJ0OFJeKV0X8pCA6NW8cNbbjpDM+R+c3P9mlFMgQCZsVAqoTE6
	 0g0Zwkh8hT6CAjIWRMHaCinp3DyKLURzEi5QJntfbNaZOP+6vAGWvhb/x8BX4h3h17
	 ZANdCTiZAnINhIfXaLrhvZbtv1BcAkPxCwOzbQSo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 211D9F805AF; Mon, 11 Nov 2024 22:47:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE810F805AD;
	Mon, 11 Nov 2024 22:47:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABCC4F80199; Mon, 11 Nov 2024 22:47:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 2532FF800BD
	for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2024 22:47:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2532FF800BD
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1731361636306850672-webhooks-bot@alsa-project.org>
References: <1731361636306850672-webhooks-bot@alsa-project.org>
Subject: `amixer sset Master` doesnt increase and decrease both sides equally
Message-Id: <20241111214720.ABCC4F80199@alsa1.perex.cz>
Date: Mon, 11 Nov 2024 22:47:20 +0100 (CET)
Message-ID-Hash: LFI6VVUFIYVIEMVU7JSK26WVSU4ACH5P
X-Message-ID-Hash: LFI6VVUFIYVIEMVU7JSK26WVSU4ACH5P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LFI6VVUFIYVIEMVU7JSK26WVSU4ACH5P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #279 was opened from lquenti:

I look through the issues, man pages and internet and hope I didn't miss anything. Please tell me if its a user error.

Whenever I use `amixer sset Master` to increase volume, it will not increase them evenly.

Here is a before

![before](https://github.com/user-attachments/assets/4ccfa220-608c-4407-9f6e-fc1d27f1a91b)

and after

![after](https://github.com/user-attachments/assets/250ab254-d46a-44e4-a201-58f9224b6293)

Interestingly amixer seem to think that it is still evenly balanced, although alsamixer shows that it is unbalanced afterwards.

---

Interestingly, when decreasing, the unevenness flips to the other side.

[Other people also seem to struggle with it](https://stackoverflow.com/questions/69826139/using-amixer-to-set-audio-makes-left-and-right-unbalanced) 

Thank you so much. If it is something somewhat simple to fix, I can also write a fix myself, but for now I am unsure what the problem is.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/279
Repository URL: https://github.com/alsa-project/alsa-utils
