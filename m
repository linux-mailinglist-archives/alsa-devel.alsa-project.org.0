Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C1F3F51F6
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Aug 2021 22:18:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 607231614;
	Mon, 23 Aug 2021 22:17:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 607231614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629749929;
	bh=Oo1ylI+YGfnE8UptFzCfTBgAkknWcHjZeGRQeYhWlFs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iFqP4PO+bTHrcCSEXo2E27iATMxxuyt0cFJuyLjRYM/4pcnJNjdH6zyNWf+itEzpW
	 jgsz9j4S+AW6iHp75IVp4nmJIzENxebfRl6KQMdagJnHu+jKsbeliXKo2kkMnf6/Mv
	 JEzJkAj/mTLC92il9oirvls/a3l+1Ber6xazghzM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08F6FF800B6;
	Mon, 23 Aug 2021 22:17:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B41FF8020C; Mon, 23 Aug 2021 22:17:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id D3E6EF800E7
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 22:17:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3E6EF800E7
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1629749872162578106-webhooks-bot@alsa-project.org>
References: <1629749872162578106-webhooks-bot@alsa-project.org>
Subject: Out of bounds
Message-Id: <20210823201756.1B41FF8020C@alsa1.perex.cz>
Date: Mon, 23 Aug 2021 22:17:56 +0200 (CEST)
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

alsa-project/alsa-utils pull request #107 was opened from folkertvanheusden:

Drevent out-of-bounds writing in arecord during recording with high volume and vu-meter enabled.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/107
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/107.patch
Repository URL: https://github.com/alsa-project/alsa-utils
