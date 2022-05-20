Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0FC52F167
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 19:17:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 320091756;
	Fri, 20 May 2022 19:16:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 320091756
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653067035;
	bh=Iwah93i5d51ANWS7oTw5dzrlreHIjwnqhBLApjM1n/k=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JvGLbAYatXVpS+4MocjA+2+ckXGfjSxhERxEeAI0v1o516IUydWcPs0QzjhMZMEsn
	 XGVv5y14qzhdYBcxehadb35/7ziU+g78F5ROTRb5EMBq73zHIbcriIeHs4mcuuEl/L
	 UGjk7jPubuOcM5prtRff+WqHFCbSIQnvkdK4XDds=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74A0DF8051C;
	Fri, 20 May 2022 19:15:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4548CF804C1; Fri, 20 May 2022 19:15:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 8B210F80153
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 19:15:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B210F80153
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1653066931263967991-webhooks-bot@alsa-project.org>
References: <1653066931263967991-webhooks-bot@alsa-project.org>
Subject: Complete support for "Pro" USB multichannel cards
Message-Id: <20220520171534.4548CF804C1@alsa1.perex.cz>
Date: Fri, 20 May 2022 19:15:34 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #154 was edited from perexg:

- [x] channel split using alsa-lib
- [x] channel split inside app
- [x] channel split hide the specific configs (alsa-lib, app side support)
- [x] mixer control remap using alsa-lib
- [x] simplify the mixer control remap

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/154
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
