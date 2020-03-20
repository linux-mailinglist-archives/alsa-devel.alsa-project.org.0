Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC97318D8B6
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Mar 2020 20:50:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CBA33E;
	Fri, 20 Mar 2020 20:49:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CBA33E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584733818;
	bh=s35Evdptbiy4KigF3VeLTreHuXRj+sCFaiyWNUn1Eh0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jbcGiOZzDLfVYFCltDQVNApqwr+rU3rek2ksQllFJAGS9EiFjOiwq/zmz3mNfThSA
	 MuQoNeOk7IEsNPeoAPxbj6e4uqXK9Ge8riy3vKH7VuO10GtSPMCaQIGGkH6F4m1yRh
	 M63Rp2pavSK2zANVFjFTYRHno0BNEQJs+e2EIsfg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7286AF80126;
	Fri, 20 Mar 2020 20:48:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F368F8015B; Fri, 20 Mar 2020 20:48:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 3BDFAF800DD
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 20:48:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BDFAF800DD
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1584733708997910976-webhooks-bot@alsa-project.org>
References: <1584733708997910976-webhooks-bot@alsa-project.org>
Subject: sof-broadwell-rt286: use symlinks to reuse existing UCM
Message-Id: <20200320194835.0F368F8015B@alsa1.perex.cz>
Date: Fri, 20 Mar 2020 20:48:35 +0100 (CET)
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

alsa-project/alsa-ucm-conf pull request #18 was opened from plbossart:

There are no firmware-specific settings to it's fine to reuse the
legacy file as is.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/18
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/18.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
