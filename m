Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8C46066CA
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 19:11:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 082CDB3BF;
	Thu, 20 Oct 2022 19:10:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 082CDB3BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666285883;
	bh=DXlgXdZQEcThNVAWPNUVTWRsS7xlJKew6WyE2k6+/eI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pfiw5DD1WTAv8Qe1im/4cma7B41SIlLGiz+YyYNq+zG8ZqgIKfscjV3ngAWw+aTuz
	 BU6d+UA7aqPJHacZZiPXUq1yQRzlhjxobmtN4EllcvG7LZ44MXaKVb9hAsTqTEF6Sw
	 VKLxdw0crO1BuHV0hME+eitUF6YBBDeWaeWveyxA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82A6BF800B5;
	Thu, 20 Oct 2022 19:10:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEAD3F800B5; Thu, 20 Oct 2022 19:10:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 PRX_BODY_30,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 19656F800B5
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 19:10:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19656F800B5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1666285823060836077-webhooks-bot@alsa-project.org>
References: <1666285823060836077-webhooks-bot@alsa-project.org>
Subject: add --wildcards to tar options in README
Message-Id: <20221020171026.BEAD3F800B5@alsa1.perex.cz>
Date: Thu, 20 Oct 2022 19:10:26 +0200 (CEST)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #232 was opened from nodens:

Without it, at least on some recent tar version, it won't work: --wildcards is the default only for exclusions, not for member selection. This tends to confuse users, even though it's just an example (e.g #220)

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/232
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/232.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
