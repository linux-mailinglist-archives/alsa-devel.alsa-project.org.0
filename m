Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8111F19E305
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Apr 2020 07:39:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24EA2167A;
	Sat,  4 Apr 2020 07:38:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24EA2167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585978742;
	bh=Ny0Shu1cTJGwBMcN37gZ+mlcLcxUnj7VWxh03EYpRmQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fD0FlwahHUR7TgLISGq+vB6YrykR6+lbrl43GrPQVv/oCbvU6qOe3mAShMTSADmBk
	 fuQ3ZUBU1EhsM66vHUXjrp/E6ANmNocjrpgoiapuTlcVxkGNRTO+d6aIz9pfSHB1mu
	 I9+0ZVofNqQ/gz2Es6Ywbo7B0SPKNNxRnmEm9SyA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE0DCF80131;
	Sat,  4 Apr 2020 07:37:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E064F80148; Sat,  4 Apr 2020 07:37:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 5D0DCF80131
 for <alsa-devel@alsa-project.org>; Sat,  4 Apr 2020 07:37:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D0DCF80131
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1585978625896482944-webhooks-bot@alsa-project.org>
References: <1585978625896482944-webhooks-bot@alsa-project.org>
Subject: alsa-gobject: fix annotations for constructors
Message-Id: <20200404053715.2E064F80148@alsa1.perex.cz>
Date: Sat,  4 Apr 2020 07:37:15 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #12 was opened from takaswie:

Some constructor functions have redundant or invalid annotations.

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/12
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/12.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
