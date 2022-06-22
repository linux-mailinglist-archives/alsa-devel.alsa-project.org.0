Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D84C2555119
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 18:16:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6141280E;
	Wed, 22 Jun 2022 18:15:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6141280E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655914596;
	bh=wWj2Q/wjnrSsXp1Bj4Lg6SMCMz98N7tkgy5iKdAE4Ak=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vng2clhxCtp3zNQFA8H9mAbUYa+p3mTvC1tBpYSZX7y9apn4Rsvrs1FvDMRlDhTXW
	 yfCID8k3t/fPMXF7XMCDAXj/R80cmyRxaaOzBG0lMMlPyXKSBOQEUUstvmu7bBYOuw
	 pw2Bww66eir74YBPM9s47QPe10/32LNu68nyjs7g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CE85F80424;
	Wed, 22 Jun 2022 18:15:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF1E5F800CB; Wed, 22 Jun 2022 18:15:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=MISSING_DATE,MISSING_MID,
 PRX_BODY_65,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id CC392F800CB
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 18:15:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC392F800CB
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1655914536216571093-webhooks-bot@alsa-project.org>
References: <1655914536216571093-webhooks-bot@alsa-project.org>
Subject: Add support for the Traktor Kontrol Z1
Message-Id: <20220622161544.CF1E5F800CB@alsa1.perex.cz>
Date: Wed, 22 Jun 2022 18:15:44 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #176 was opened from g2p:

This is a small DJ mixer with a main output and a monitor output.
The outputs appear as a single subdevice, we use the SplitPCM macros to present separate outputs.
    
https://www.native-instruments.com/en/products/traktor/dj-controllers/traktor-kontrol-z1/specifications/

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/176
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/176.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
