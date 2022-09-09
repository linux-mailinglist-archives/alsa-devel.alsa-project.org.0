Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1E55B31C2
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 10:33:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9450B1686;
	Fri,  9 Sep 2022 10:32:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9450B1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662712391;
	bh=hfo8CnkfR0MgtMuIPw7dQaRQA5aYzERVm9K+1XsHS5s=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J3zRSBbcarwuyBdXRlJ4Jk1puCWMfTSq3dlv0acsCIXIfZMLpRPgGWQecWhGhltwo
	 dwrZKGM7JtThcPOLQxxcZLWJM+6Eequfjc+8Trhlz9pYk0XBv3f6REzlFuJN07a/Uq
	 e5/8xzfwUjwzcIi+Jk7J60Zky4XKHSwVoIpPRGmI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07621F8032B;
	Fri,  9 Sep 2022 10:32:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A05CF8023A; Fri,  9 Sep 2022 10:32:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id DA429F8011C
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 10:32:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA429F8011C
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1662712325330811024-webhooks-bot@alsa-project.org>
References: <1662712325330811024-webhooks-bot@alsa-project.org>
Subject: po: Add Georgian translation
Message-Id: <20220909083209.6A05CF8023A@alsa1.perex.cz>
Date: Fri,  9 Sep 2022 10:32:09 +0200 (CEST)
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

alsa-project/alsa-utils pull request #169 was opened from NorwayFun:

po: Add Georgian translation

Request URL   : https://github.com/alsa-project/alsa-utils/pull/169
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/169.patch
Repository URL: https://github.com/alsa-project/alsa-utils
