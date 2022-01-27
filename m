Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EB249ED72
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jan 2022 22:34:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBF6B1697;
	Thu, 27 Jan 2022 22:33:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBF6B1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643319289;
	bh=XvqeDWGw8pFWEL3q8W/sXrwtetaFNvWKolLTn/7GAyE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Do5MdM8JiZbXDTvZBAZ+yf9NPfa0acJS1r9Tw0i2l2Y/emsiZodV4omx9bqLlkmhx
	 wLYM/y+TZ9AUNETCFXqUxFV/qmQ015OJPd0x8smGYjz5qNxTQxyujTmT3uadLjOpBP
	 yEJ4qSxSTC9lK3pzE8Uj0Bu6FPqzebZWBkL1u5IA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1CC8F800C9;
	Thu, 27 Jan 2022 22:33:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4236F80254; Thu, 27 Jan 2022 22:33:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 036F7F80118
 for <alsa-devel@alsa-project.org>; Thu, 27 Jan 2022 22:33:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 036F7F80118
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1643319214631380081-webhooks-bot@alsa-project.org>
References: <1643319214631380081-webhooks-bot@alsa-project.org>
Subject: Fix pre-processor defs parsing with recursive includes
Message-Id: <20220127213338.D4236F80254@alsa1.perex.cz>
Date: Thu, 27 Jan 2022 22:33:38 +0100 (CET)
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

alsa-project/alsa-utils pull request #140 was opened from ranj063:

Since the Define {} config has been removed form the input_cfg, use the
tplg_pp->define_cfg_merged for search for variable definitions. Also,
fix the parsing logic to first merge all variables from the conf files
recursively and then override them with the command line definitions.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/140
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/140.patch
Repository URL: https://github.com/alsa-project/alsa-utils
