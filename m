Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D4F1F6001
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jun 2020 04:29:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D80C1612;
	Thu, 11 Jun 2020 04:28:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D80C1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591842564;
	bh=Tjs+m+L3qEBaopv/GQ5538fVB4u1zATo3wM9a9h5Hcc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eK471StWLOWqHDpIddjgWo0ta5SVROY2IYxMRQWx2iRzUEXlXLf8jw4tqVBvLLWh3
	 4XoWBRUWnD4t7fcFdLFkUHhEou199Mtr2o9RCI19CoI8xuWNTq6v5hTFI7CQKx58wd
	 pDLVDLPOtRE5FUncYaBffEtcI8J8aEhpJrS+x0Ec=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 687F4F800CC;
	Thu, 11 Jun 2020 04:27:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1316FF80058; Thu, 11 Jun 2020 04:26:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id ABB2DF80058
 for <alsa-devel@alsa-project.org>; Thu, 11 Jun 2020 04:21:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABB2DF80058
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1591842110172178030-webhooks-bot@alsa-project.org>
References: <1591842110172178030-webhooks-bot@alsa-project.org>
Subject: alsa-gobject: seq: misc fixes (take 2)
Message-Id: <20200611022630.1316FF80058@alsa1.perex.cz>
Date: Thu, 11 Jun 2020 04:26:28 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #29 was opened from takaswie:

This patchset includes misc fixes for ALSASeq.

Especially the execution of g-ir-scanner to generate ALSASeq-0.0 becomes to expect ALSATimer-0.0 is available. Although it is expected, it results in Python 3 gir loader (PyGObject) loading ALSATimer-0.0 before loading ALSASeq-0.0. Any test for ALSASeq-0.0 is going to fail because ALSATimer-0.0 is not available before installing. To solve the issue, the patchset includes the patch to change test procedure to arrange environment variables.

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/29
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/29.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
