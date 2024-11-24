Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 838929D6F37
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Nov 2024 14:04:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8D7684D;
	Sun, 24 Nov 2024 14:04:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8D7684D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732453470;
	bh=jwRdIxoyJMwRB9dV2GauN1tZ6AtXqrC5iKzIK3w32ig=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=JqRSuTSomifmCAzOBxFCCdWPDz+BfwrsCTAkqXRzJAO8ku1qvogAALRdZDnYHmM9h
	 HnwJMT6DI6ZIZ5qXRLLU0hmfSxHKncEttja72n6G7UPrfecyjgVkqxmDFjJXM7qdSg
	 Y5EsiJSXZKIqbmvz6l1rZn4S3pbB222sImxZbheI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64928F805BA; Sun, 24 Nov 2024 14:03:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CBDDF805AF;
	Sun, 24 Nov 2024 14:03:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF3E6F80496; Sun, 24 Nov 2024 14:03:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id DFD06F800F0
	for <alsa-devel@alsa-project.org>; Sun, 24 Nov 2024 14:03:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFD06F800F0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1732453427260947466-webhooks-bot@alsa-project.org>
References: <1732453427260947466-webhooks-bot@alsa-project.org>
Subject: UCM Configuration for Roland BridgeCastX
Message-Id: <20241124130353.DF3E6F80496@alsa1.perex.cz>
Date: Sun, 24 Nov 2024 14:03:53 +0100 (CET)
Message-ID-Hash: MPECPIJDHSOQPL72CWEMT3UCOOQ3QABX
X-Message-ID-Hash: MPECPIJDHSOQPL72CWEMT3UCOOQ3QABX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MPECPIJDHSOQPL72CWEMT3UCOOQ3QABX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #469 was edited from Konna1337:

Added Configuration for the X version of Bridge Cast. Config is based on the non X version but it's wired differently and has two more Hardware Channels. It's for the 2.0 Firmware of the Device. The "Game" channel has a virtual 5.1 mode which doesn't work properly and isn't configured.  

- Added condition to USB-Audio.conf
- Added BridgeCastXV2.conf
- Added BridgeCastXV2-Hifi.conf with configuration for channels

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/469
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/469.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
