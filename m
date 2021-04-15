Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A72DB360B7F
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Apr 2021 16:11:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 269AC1673;
	Thu, 15 Apr 2021 16:10:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 269AC1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618495860;
	bh=q5PfhF5TBvuXkuTtDOs+d50GpbELkxkDVj2Jqdz4ISg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eg+S43ObAzFPHyRhUKPRc3vKgtG1qCQGkmpQGVYpFmU1wWhJiLAvpLdw4HNj2hed4
	 edZL6MAjskzyMKdAsJW7/Hz46u/rAEkZHKJYk51c9vTEGb4jsnTRdmV66p/eKbBoWC
	 PIxvv4JX5h3nfFz1jHZnjdEuy2neMnTH020Ymrk8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EF47F80128;
	Thu, 15 Apr 2021 16:09:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF0EEF80128; Thu, 15 Apr 2021 16:09:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 19563F80128
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 16:09:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19563F80128
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1618495764236035109-webhooks-bot@alsa-project.org>
References: <1618495764236035109-webhooks-bot@alsa-project.org>
Subject: SOF SoundWire: Improve dmic detection
Message-Id: <20210415140927.BF0EEF80128@alsa1.perex.cz>
Date: Thu, 15 Apr 2021 16:09:27 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #75 was edited from plbossart:

DMIC support seems incomplete for HDaudio (not handling all possibilities for cfg-dmics) and missing completely for SoundWire.

This is an untested draft just to get UCM3 feedback from @perexg and tests from @aigilea on an HP Spectre x360 device.

Edit: adding @kv2019i @RanderWang @bardliao and @libinyang for reviews.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/75
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/75.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
