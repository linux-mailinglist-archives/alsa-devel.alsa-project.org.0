Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8618930DC55
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Feb 2021 15:12:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 200991769;
	Wed,  3 Feb 2021 15:11:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 200991769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612361563;
	bh=E4VtiaMclcj0coYikYckTn6Wzo7oB4JvWuQFSMosVYQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hgou3SdoSpW2Ju+aQXQCkhwVKtVSls56p9cFRTPgXfcyNKV0KsswrTkol8H/JStuu
	 2XbzKrcBtjUTFJl4qXxWp0IXws2hZuIApcdMnv6/P6ji4ckjG78LeH6cLp42lf03JW
	 57N8WMEkBdBZrslTjbaUcFeeV5xuHsMopEAbbXgA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90CB2F8016E;
	Wed,  3 Feb 2021 15:11:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28ACAF8015A; Wed,  3 Feb 2021 15:11:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 258A8F8013C
 for <alsa-devel@alsa-project.org>; Wed,  3 Feb 2021 15:10:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 258A8F8013C
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1612361458373204947-webhooks-bot@alsa-project.org>
References: <1612361458373204947-webhooks-bot@alsa-project.org>
Subject: Extend use case search paths to use kernel driver name
Message-Id: <20210203141107.28ACAF8015A@alsa1.perex.cz>
Date: Wed,  3 Feb 2021 15:11:07 +0100 (CET)
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

alsa-project/alsa-ucm-conf pull request #78 was opened from lumag:

This is a companion (or replacement) for #76 . This adds lookup for the use case search path using the in-kernel driver name. This allows easy lookup both for the setups which have the sound card/platform driver built as a module or builtin into the kernel.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/78
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/78.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
