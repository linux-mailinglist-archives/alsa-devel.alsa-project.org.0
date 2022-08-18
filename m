Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFD8597B87
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Aug 2022 04:35:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BAB8827;
	Thu, 18 Aug 2022 04:34:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BAB8827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660790137;
	bh=odFMf5nyiVl5LsANxl0eB+Lg/niO2QSQLRuHrKNOH3w=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lwhgTJ7dJbRkVX3XwL8iLkyjSq67PRCqXkfoIfqCKlOuI91plSC0bVgm6+yjefQtY
	 isym1gqbgBdwV1H1UospuZyOZIPio0M+JHr9ITlQd3G29v7bxrFnwvlbYvUv3Hywrr
	 /klr8ByLBqOwIFAg6soebATUQXXzwrEuJwWKF1PE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6E93F80495;
	Thu, 18 Aug 2022 04:34:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A879F80430; Thu, 18 Aug 2022 04:34:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 0AAAAF800B5
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 04:34:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AAAAF800B5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1660790070519912958-webhooks-bot@alsa-project.org>
References: <1660790070519912958-webhooks-bot@alsa-project.org>
Subject: HDA ATI HDMI not supported
Message-Id: <20220818023437.3A879F80430@alsa1.perex.cz>
Date: Thu, 18 Aug 2022 04:34:37 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #194 was edited from yangxiaohua2009:

I am using the latest ucm2 file and alsalib 

alsainfo [http://alsa-project.org/db/?f=92c58f3a6b72fee05b678386858dbc816d25dbf3](http:)

The `alsaucm reload` command returns error saying:

`ALSA lib parser.c:244:(error_node) UCM is not supported for this HDA model (HDA ATI HDMI at 0xfeb60000 irq 28)`

the HDMI works but the I2S and HDMI all use fallback ucm config.

despite the fact that I already added the acpes8336.conf in conf.d and acpes8336 folder.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/194
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
