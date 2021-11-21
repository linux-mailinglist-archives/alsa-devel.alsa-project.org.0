Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE56458353
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Nov 2021 13:29:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8479B167C;
	Sun, 21 Nov 2021 13:28:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8479B167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637497751;
	bh=H+Q3USsqaGRBRJOCAxZYNJjoJO5ZqSW3nJkzeo5D7Qo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WB0N9VA8zbfWMc3LL9tyoTaHBF/6kd3mi/sJfnWyeMP9hmqrahmAbx3Gfi5ciNyoB
	 1GxQ/oMgW8pvmklPmKr/DFFYO+qgFAp5JWmuyzV/XboKVgQNoLbETgzmRzpKcV/zd1
	 lQNrKZksD2MoPE0P/z/zQ87QtLphxva7jsQJZKHg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38F74F804AB;
	Sun, 21 Nov 2021 13:27:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 048A6F8049E; Sun, 21 Nov 2021 13:27:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 1F583F800E7
 for <alsa-devel@alsa-project.org>; Sun, 21 Nov 2021 13:27:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F583F800E7
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1637497656204121113-webhooks-bot@alsa-project.org>
References: <1637497656204121113-webhooks-bot@alsa-project.org>
Subject: project
Message-Id: <20211121122747.048A6F8049E@alsa1.perex.cz>
Date: Sun, 21 Nov 2021 13:27:46 +0100 (CET)
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

alsa-project/alsa-lib issue #193 was opened from yangyunfei16:

Dear alsa developers:
Hello. I am a graduate student in the Institute of information engineering, Chinese Academy of Sciences. We are doing a project to investigate the use of this library by some programmers who use alsa for programming, so we want to ask if there are any websites or forums on which more programmers who use this library communicate and discuss, We want them to do a questionnaire later. Thank you very much for your help!

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/193
Repository URL: https://github.com/alsa-project/alsa-lib
