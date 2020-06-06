Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2714E1F0476
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Jun 2020 05:43:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F9E6839;
	Sat,  6 Jun 2020 05:42:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F9E6839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591414994;
	bh=e0eizUWvWnALFQ1LjemFFM8NN7FgcL5NW9yx8yZ+zFE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fkYWcTSXObbRpd6mDWcqeRkqltBmJyZd9ybY9ebZ3Dghyeq+Ae9HzVywASGSpkWQS
	 WFJE9WbDYu3Nvm4aJ0kC+KZVsbLAjtQAWZBsb9TI8t1C1VAtkarrWxlpaiBmy90Wrq
	 jLMxCZgxae5AYk4NH+KKnEOvL3A7LGkPGu4Lbqy0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EA73F80254;
	Sat,  6 Jun 2020 05:41:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44936F8023F; Sat,  6 Jun 2020 05:41:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 86CC4F80139
 for <alsa-devel@alsa-project.org>; Sat,  6 Jun 2020 05:41:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86CC4F80139
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1591414881690301895-webhooks-bot@alsa-project.org>
References: <1591414881690301895-webhooks-bot@alsa-project.org>
Subject: alsa-gobject: hwdep/timer/rawmidi: fulfill documentation for
 ALSAHwdep/ALSATimer/ALSARawmidi
Message-Id: <20200606034127.44936F8023F@alsa1.perex.cz>
Date: Sat,  6 Jun 2020 05:41:27 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #23 was opened from takaswie:

This patchset fulfills documentation for ALSAHwdep/ALSATimer/ALSARawmidi, except for ALSASeq, including some documentation improvements for ALSACtl.

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/23
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/23.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
