Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA4245039B
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Nov 2021 12:37:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A75F1682;
	Mon, 15 Nov 2021 12:36:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A75F1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636976246;
	bh=Lhny+3mPB2WTivHDBs6zvB2MPhP8F2BbpuZmUCNU4Ew=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QduEYle/W33rdb5nSC6v5tFClMoeMUgiGLW87uGY6Njyl93QMnoE3A3kvQ+j3xAPi
	 9Y5u11bBFFEIg38EHr0hywSBDvmzSglTTMM8kHpXbQZpFpt9VShkA18tUskj8Lr18e
	 zx3WkuTD6SRDEpKiVh3WBxkCYr2/ebyUoSS6Diks=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B509EF800FA;
	Mon, 15 Nov 2021 12:36:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 716AFF8027D; Mon, 15 Nov 2021 12:36:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id C47D9F800FA
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 12:36:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C47D9F800FA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1636976161880198956-webhooks-bot@alsa-project.org>
References: <1636976161880198956-webhooks-bot@alsa-project.org>
Subject: hw: add "min_rate" and "max_rate" as alternatives to single "rate"
 parameter
Message-Id: <20211115113607.716AFF8027D@alsa1.perex.cz>
Date: Mon, 15 Nov 2021 12:36:07 +0100 (CET)
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

alsa-project/alsa-lib pull request #191 was opened from bku-sue:

Our typical use case is to limit the rate to between 44100 and 48000, as with these boundaries the resampling becomes easier, than if only allowing 48000.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/191
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/191.patch
Repository URL: https://github.com/alsa-project/alsa-lib
