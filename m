Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 621AA2189FF
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 16:20:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE0C71676;
	Wed,  8 Jul 2020 16:19:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE0C71676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594218022;
	bh=AS3FRmDoGIuizm1FOEH3cXOCDM4JEmHrbQJ0IUjOdxE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Iic0sdU44Jk1Ns8v3enwYCcrYfFFGwTjQpx5TZc3Pu+vZi7jDa5mgCsw5nC1anmnH
	 5q0LnDI6hdQH44wMX6k1M2c3JxAIvChbzlFkFCBg3h563AJUlNRh/6KMAwxB3Hjq8I
	 VeByRQZkDTHBnIIlGaPO1wNSXKWHcEKnQ2LxAjs8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E69F8F8015C;
	Wed,  8 Jul 2020 16:18:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3431F80150; Wed,  8 Jul 2020 16:18:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id CF914F80115
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 16:18:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF914F80115
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1594217911145972967-webhooks-bot@alsa-project.org>
References: <1594217911145972967-webhooks-bot@alsa-project.org>
Subject: French translation update
Message-Id: <20200708141838.F3431F80150@alsa1.perex.cz>
Date: Wed,  8 Jul 2020 16:18:38 +0200 (CEST)
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

alsa-project/alsa-utils pull request #42 was edited from trebmuh:

- fixes spaces
- improvements
- min/MAJ
- update some strings
- new strings translations
- typo fixes

Request URL   : https://github.com/alsa-project/alsa-utils/pull/42
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/42.patch
Repository URL: https://github.com/alsa-project/alsa-utils
