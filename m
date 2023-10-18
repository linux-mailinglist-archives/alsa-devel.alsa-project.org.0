Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB18F7CEB8B
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 01:02:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6185D1DC;
	Thu, 19 Oct 2023 01:01:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6185D1DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697670129;
	bh=vubtu3FBNwxkiUgW8lKRHs5BHAAA6l/1m689RXU+dJ8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=rFsp/mUuIPx7m9bu6XPmbaFpi4jXo++C5PA7ux48Q7sXpR+bsCt1Wt3Av4GkBXe7D
	 O1tpULRZP8wnhG78fn41Bcqr8tD82dsTsefoHI3XtRdWcZaRkw2W87Y5ELxqAVuxSX
	 0CnTkYdBh6DsRLu6kOb2m1BnFdP0AwfDSjO79kWE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CAF7F80536; Thu, 19 Oct 2023 01:01:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB9E5F8024E;
	Thu, 19 Oct 2023 01:01:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B844F8025F; Thu, 19 Oct 2023 01:01:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 730BAF80166
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 01:01:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 730BAF80166
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1697670062091358185-webhooks-bot@alsa-project.org>
References: <1697670062091358185-webhooks-bot@alsa-project.org>
Subject: ucm2: add acpd7219m98357
Message-Id: <20231018230114.7B844F8025F@alsa1.perex.cz>
Date: Thu, 19 Oct 2023 01:01:14 +0200 (CEST)
Message-ID-Hash: ZXICWFTQNSSBGOS46WQ5VLI3KWKYWJD6
X-Message-ID-Hash: ZXICWFTQNSSBGOS46WQ5VLI3KWKYWJD6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZXICWFTQNSSBGOS46WQ5VLI3KWKYWJD6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #361 was opened from WeirdTreeThing:

For "grunt" chromebooks

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/361
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/361.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
