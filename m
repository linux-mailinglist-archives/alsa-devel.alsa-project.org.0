Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 127664503B5
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Nov 2021 12:42:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 874C61680;
	Mon, 15 Nov 2021 12:42:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 874C61680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636976573;
	bh=UYSaL+ZEldfPk5tT/f1PVOlIMti1TDbqxcctaUa2ynA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qx1PrZHkJu3grqsAKqxNSbNEs7Tq+vPBwtBHDixSyxzGqnqXvpi3Fgn7Q3x1vFLdM
	 X/v9MTwk79VYhUEbvCOcKybg5iQ95vpYdpdAehgcUqABpvy/naEMkA10e3n6e1CQoT
	 Jsh3sT5OC5kxw4afZ3z+0qN4Du6gsEd3t3FwEqUk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BE5AF80134;
	Mon, 15 Nov 2021 12:41:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4D8FF8027D; Mon, 15 Nov 2021 12:41:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 8FF70F80134
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 12:41:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FF70F80134
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1636976487997591019-webhooks-bot@alsa-project.org>
References: <1636976487997591019-webhooks-bot@alsa-project.org>
Subject: hw: add option to specify dynamic DAPM routing to apply when the
 plugin is opened
Message-Id: <20211115114134.D4D8FF8027D@alsa1.perex.cz>
Date: Mon, 15 Nov 2021 12:41:34 +0100 (CET)
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

alsa-project/alsa-lib pull request #192 was opened from bku-sue:

The kernel's sound soc subsystem has a DAPM functionality, which makes complex audio routing easy, and most of it is done inside the kernel. However, in the case of dynamic routing (when there is a multiplexer in the signal path), the multiplexer is exposed as an enum MIXER control which must be set from userspace. As the selection of these controls directly influences what audio path is captured/played, the sensible thing to do is to create multiple HW plugins in the ALSA conf, each referring to the same HW device number, but with different routing parameters.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/192
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/192.patch
Repository URL: https://github.com/alsa-project/alsa-lib
