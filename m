Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F85F46F6B2
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Dec 2021 23:19:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 923561F74;
	Thu,  9 Dec 2021 23:18:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 923561F74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639088366;
	bh=U5/thFJ5JrmK/WfsULrfs21YkiMDTxAdHdbmgZzE1PQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pYQ1ID7fmL2u5W+6/lfkcur46n2KFwCq9bcyXec6aEiVJVZkbox1o6J4SHC+rsmDV
	 ts+1gYYd+PhydqElKuRmjqBN1Ma6mJdaxRuI+aL04HDt5s/Ky75Zs4HWCXTSXAz25T
	 rIqRPfVU7RqAgGMcwvFFnsWrAfxbjPi5lMIQjSis=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6DBEF800AB;
	Thu,  9 Dec 2021 23:18:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A36B2F8028D; Thu,  9 Dec 2021 23:18:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B99DBF8028D
 for <alsa-devel@alsa-project.org>; Thu,  9 Dec 2021 23:18:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B99DBF8028D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1639088286584611893-webhooks-bot@alsa-project.org>
References: <1639088286584611893-webhooks-bot@alsa-project.org>
Subject: sof-hda-dsp: fix path to Hdmi.conf
Message-Id: <20211209221812.A36B2F8028D@alsa1.perex.cz>
Date: Thu,  9 Dec 2021 23:18:12 +0100 (CET)
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

alsa-project/alsa-ucm-conf pull request #127 was opened from sustmi:

Fixes https://github.com/alsa-project/alsa-ucm-conf/issues/126 .

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/127
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/127.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
