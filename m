Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4035778BF
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jul 2022 01:15:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A1CF172C;
	Mon, 18 Jul 2022 01:14:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A1CF172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658099736;
	bh=CnYbxzmbkhKOpYg03Te6FPR6BGOW/+LAlgHMmIba0Yw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tfwjv1KkSyx2rp2IWWSLi2ma/yi/CWZuccY6s+dZcMfjVVL/psZycAFxxifTL9emr
	 1+UI/9h4Mrpn5KIyrD6GcRlQE691j+pvVZkrkpqEk+Ukzd9rTzdax5XCtfWj2BT1vj
	 gDPgY5C79EmalSgScYWtzGgYDdAZXSHdU62JThRo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7297F800CB;
	Mon, 18 Jul 2022 01:14:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 778BBF8015B; Mon, 18 Jul 2022 01:14:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id F3F12F800FB
 for <alsa-devel@alsa-project.org>; Mon, 18 Jul 2022 01:14:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3F12F800FB
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1658099671338943958-webhooks-bot@alsa-project.org>
References: <1658099671338943958-webhooks-bot@alsa-project.org>
Subject: ucm2 profile for MOTU M2
Message-Id: <20220717231434.778BBF8015B@alsa1.perex.cz>
Date: Mon, 18 Jul 2022 01:14:34 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #191 was opened from tw1618:

With Release v1.2.7.2 my Audio Interface Motu M2 stopped working as discussed in #190. It looks like that the Motu M4 config #158 is loaded as they use the same (?) ID

Those changes work for me.

[alsa-info.txt](https://github.com/alsa-project/alsa-ucm-conf/files/9128719/alsa-info.txt)

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/191
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/191.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
