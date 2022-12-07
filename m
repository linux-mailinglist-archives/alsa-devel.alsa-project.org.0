Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 215B7645BFD
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Dec 2022 15:06:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBAD618AB;
	Wed,  7 Dec 2022 15:05:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBAD618AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670421972;
	bh=vQdlm4JjxIy4o2bYv7V+Ob4SM3ru3nonGJq9vcTPA30=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jMJ4CJAGs5XY7L3oTF/GWTVPQs0q4rsZVTx3syg7CoRpaZlQDzjjRIr73y1kyUgdO
	 7VrJl0lrHYGuELbGDMYUcV+XtoWB8I8WEInxhLEgaUVQD40co6el/4diBayhJKlzv4
	 Efsn0uB6s2jV2HpkBv7rglRBCzTo50j8Q2aJafQs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4ED79F80301;
	Wed,  7 Dec 2022 15:05:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99BBFF802BE; Wed,  7 Dec 2022 15:05:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 887AEF800EE
 for <alsa-devel@alsa-project.org>; Wed,  7 Dec 2022 15:05:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 887AEF800EE
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1670421906207937956-webhooks-bot@alsa-project.org>
References: <1670421906207937956-webhooks-bot@alsa-project.org>
Subject: topology: plugins: nhlt: fix ssp debug
Message-Id: <20221207140513.99BBFF802BE@alsa1.perex.cz>
Date: Wed,  7 Dec 2022 15:05:13 +0100 (CET)
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

alsa-project/alsa-utils pull request #180 was opened from juimonen:

Nhlt ssp plugin debug feature was broken due to recent change in ssp indexing, thus fix it.

Signed-off-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>

Request URL   : https://github.com/alsa-project/alsa-utils/pull/180
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/180.patch
Repository URL: https://github.com/alsa-project/alsa-utils
