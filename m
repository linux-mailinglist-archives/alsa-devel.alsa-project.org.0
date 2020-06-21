Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E38202BAC
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Jun 2020 19:06:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 334DF16A3;
	Sun, 21 Jun 2020 19:05:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 334DF16A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592759196;
	bh=aO2PqFOwpVTvEDqqOKIznBfSt9BaNwGhNLVYwaeGxqs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aarTDSig+WB7kFIFI2E7HdniDcsMHGx90QuMWjirmEF9qewCZQIAlmZn99xBgAJju
	 Ii4va2P2f2X2xEr6mOwtv64jhZk/BW9G2Zb2oEBbWZWoGYORQK8UPf2ouKbL8z6saR
	 14/+wmq9Hl45fgqmfKtuW0vcLMhgRW3MXMsP7bGA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47D10F8010E;
	Sun, 21 Jun 2020 19:04:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6891DF8023E; Sun, 21 Jun 2020 19:04:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 7F0E4F800D0
 for <alsa-devel@alsa-project.org>; Sun, 21 Jun 2020 19:04:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F0E4F800D0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1592759085928977013-webhooks-bot@alsa-project.org>
References: <1592759085928977013-webhooks-bot@alsa-project.org>
Subject: alsa-gobject: reorder documentation sections
Message-Id: <20200621170450.6891DF8023E@alsa1.perex.cz>
Date: Sun, 21 Jun 2020 19:04:50 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #45 was opened from takaswie:

For better documentation, this patchset reorders sections of ALSATimer/ALSASeq documentation.

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/45
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/45.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
