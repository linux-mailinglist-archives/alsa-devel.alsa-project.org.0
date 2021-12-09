Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CECB446E5F4
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Dec 2021 10:51:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22567235F;
	Thu,  9 Dec 2021 10:50:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22567235F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639043484;
	bh=WqbLTCmZrlcIu/snn67E8B65KsbAKNAXrkvb05neBYs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XymnTgoDap0I3LOBlzlpbBMm6lSKXS1wxk2vHvqyxdZdshT5VS+vEZ7YTcbKfBhzx
	 NdBg30a6QejA5SDROEUqUrqmG3kkP/7DLiWg+wg74vjpqMLJkFaFMfwtBoq8uKTbfs
	 f/PbrxxKmBJ7Oipzr4ptQ2xyY6qBRA2NEWCPrAjk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F02F6F804AE;
	Thu,  9 Dec 2021 10:50:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4D1DF800FC; Thu,  9 Dec 2021 10:50:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 9C3F5F802A9
 for <alsa-devel@alsa-project.org>; Thu,  9 Dec 2021 10:50:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C3F5F802A9
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1639043400228790998-webhooks-bot@alsa-project.org>
References: <1639043400228790998-webhooks-bot@alsa-project.org>
Subject: PinePhone Pro support
Message-Id: <20211209095009.C4D1DF800FC@alsa1.perex.cz>
Date: Thu,  9 Dec 2021 10:50:09 +0100 (CET)
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

alsa-project/alsa-ucm-conf issue #125 was opened from tomfitzhenry:

It'd be great to have PinePhone Pro support in alsa-ucm-conf. https://gitlab.com/pine64-org/pine64-alsa-ucm/-/issues/4 is another project that tracks this.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/125
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
