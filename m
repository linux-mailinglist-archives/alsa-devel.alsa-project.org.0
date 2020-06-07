Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A14F21F0D36
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Jun 2020 18:53:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2177D1658;
	Sun,  7 Jun 2020 18:52:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2177D1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591548782;
	bh=l6VTBOMSLE5MU3qbi4584UTx8UcsuEqK/UArZ1SJtQw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m3Mj8M61/4LnDH17uvNLn1fUX6XYEfx7JYTpuoTfmwh93fbgQhR3EKswTZLvyIE2F
	 cByjfz73njrJc8IMjpRQT2MiGGVo3wdy74E2OWZLb6H6zlSv4WlYAwYxkCskvP9g4Q
	 Sel9avRWkQguhvZV2Ji0pEPwUfRDKA2Uw1I+kr+c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 489FAF80122;
	Sun,  7 Jun 2020 18:51:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF6E9F80140; Sun,  7 Jun 2020 18:51:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 2DC87F80122
 for <alsa-devel@alsa-project.org>; Sun,  7 Jun 2020 18:51:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DC87F80122
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1591548675031008959-webhooks-bot@alsa-project.org>
References: <1591548675031008959-webhooks-bot@alsa-project.org>
Subject: config for Renoir APU
Message-Id: <20200607165118.EF6E9F80140@alsa1.perex.cz>
Date: Sun,  7 Jun 2020 18:51:18 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #31 was edited from perexg:

This is just a test config (not for merge).

BEWARE: This configuration is not intended for the broad use at the moment. It will broke other HDA Intel hardware.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/31
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/31.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
