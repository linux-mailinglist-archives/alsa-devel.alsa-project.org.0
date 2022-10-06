Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1B05F6E33
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Oct 2022 21:27:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD2F51669;
	Thu,  6 Oct 2022 21:26:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD2F51669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665084427;
	bh=EO2doqcnT7igtDEVNP1rkjg3aKE72xMucbpv+H6Ohao=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=abIuxyjaDVZvEDgrGEeSv8Me4b9EH1tYQdDE9DFHQJHE+3DdJnAWoU6OCHz0lg8Z0
	 tIHnGwaTM4WXZlkup7A40fedfX9Ec0FpKXBP83DJ+wOkOfG+1kjAVYPTcC4ua1K5SP
	 6VQjpnMsISbaQupODPnxUymD3I/8Hs8KHHz88elQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 239BBF802BE;
	Thu,  6 Oct 2022 21:26:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A27FF800BF; Thu,  6 Oct 2022 21:26:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id C0125F800BF
 for <alsa-devel@alsa-project.org>; Thu,  6 Oct 2022 21:26:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0125F800BF
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1665084367332529068-webhooks-bot@alsa-project.org>
References: <1665084367332529068-webhooks-bot@alsa-project.org>
Subject: Add Arturia Minifuse 1 Support
Message-Id: <20221006192610.1A27FF800BF@alsa1.perex.cz>
Date: Thu,  6 Oct 2022 21:26:10 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #226 was opened from nodens:

Arturia Minifuse 1 is a stripped-down version of Minifuse 2:
- 1 Input
- 2 Outputs
- Loopback interface to ease recording of the computer output

(attempt at fixing #220)

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/226
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/226.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
