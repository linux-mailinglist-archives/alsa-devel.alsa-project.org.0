Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FBD177375
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Mar 2020 11:05:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52B841686;
	Tue,  3 Mar 2020 11:04:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52B841686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583229949;
	bh=GBd/4YVwO/XErBHob5bCJ30+9+oIiCMcyd4q2L+fy3g=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HGRI7w22N7OssvAHxwb9xAR30SOqaj0UfRIHzXm3v3iE8dPEFBIJt/gnjJf4TOxCb
	 mJZya2CHH0f6260uREzt6Wlc6MXyI5ZNelAYzM9bWw91WyUHps+N+XQuGcOPrQElIm
	 QhgtxVeioPNGhl5klUD0zPXsg+B2YrP2zgewJRXI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 675B1F80266;
	Tue,  3 Mar 2020 11:04:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14576F8025F; Tue,  3 Mar 2020 11:04:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 43791F80131
 for <alsa-devel@alsa-project.org>; Tue,  3 Mar 2020 11:04:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43791F80131
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1583229841425496101-webhooks-bot@alsa-project.org>
References: <1583229841425496101-webhooks-bot@alsa-project.org>
Subject: Change PCM device number of Asus Xonar U5
Message-Id: <20200303100405.14576F8025F@alsa1.perex.cz>
Date: Tue,  3 Mar 2020 11:04:05 +0100 (CET)
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

alsa-project/alsa-lib pull request #32 was opened from be-marc:

Asus Xonar U5 does not use the first PCM device for digital data like the U7.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/32
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/32.patch
Repository URL: https://github.com/alsa-project/alsa-lib
