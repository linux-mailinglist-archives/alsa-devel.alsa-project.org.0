Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D79A889423
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 08:47:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69C26192A;
	Mon, 25 Mar 2024 08:47:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69C26192A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711352877;
	bh=z46hbfjTVVX4m58eLYRj7eugSfpKM/GGZCC2g7R75WU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=hNUlGlkJXQ4VJ/5mHNbfvfC2C38M8b2g9fz7wBXQ8rt4yB697MM10zgggVFROji+E
	 DB/ndedZr4vCgU2WInpwDmimBPA4CkyV7+LRshLwVvZEz7ZDvu5yR2LTAz0aBw9QWC
	 Sn2/N5enJBx67NSNYUeYs8r1haBzn+8B/LBmQFq8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1220DF8057F; Mon, 25 Mar 2024 08:47:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 650B6F80580;
	Mon, 25 Mar 2024 08:47:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C93EBF80236; Mon, 25 Mar 2024 08:47:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 13012F8015B
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 08:47:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13012F8015B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1711352837484479427-webhooks-bot@alsa-project.org>
References: <1711352837484479427-webhooks-bot@alsa-project.org>
Subject: aplay: fix S24_LE wav header
Message-Id: <20240325074720.C93EBF80236@alsa1.perex.cz>
Date: Mon, 25 Mar 2024 08:47:20 +0100 (CET)
Message-ID-Hash: 72DDPQ7WHHCBVFDAQHGSDM4GAXQ57DMF
X-Message-ID-Hash: 72DDPQ7WHHCBVFDAQHGSDM4GAXQ57DMF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/72DDPQ7WHHCBVFDAQHGSDM4GAXQ57DMF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #260 was opened from psi-sue:

S24_LE is 32 bits in width storing 24 bits of data and 8 bytes of padding So wav header needs to be 32 bits not 24

Request URL   : https://github.com/alsa-project/alsa-utils/pull/260
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/260.patch
Repository URL: https://github.com/alsa-project/alsa-utils
