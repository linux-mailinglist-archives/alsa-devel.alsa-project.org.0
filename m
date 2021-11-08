Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E61447BB2
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Nov 2021 09:22:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC120167D;
	Mon,  8 Nov 2021 09:21:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC120167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636359766;
	bh=wR+2JWM8PPmOu4gc1LARW6Dngm2Nn2OFqhE2RSYopO8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vUWeBvM4nEZ1l3ZuEjRJUEnJk5nbJi1RTWPK8SlMTYmSTr4Nm312e62UJCuqClugc
	 b0QjXNWHUdl/kylz3IoSHlFcMoeuowy7f1jY7vdOAkz5wtHWOTsxMHVk5ue2DHWGkc
	 EJzjtBTfaoJbIPlNLJr0gRMpNQTb59SixO4NS2hs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB8C9F80107;
	Mon,  8 Nov 2021 09:21:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FE51F80107; Mon,  8 Nov 2021 09:21:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id BAEB4F80107
 for <alsa-devel@alsa-project.org>; Mon,  8 Nov 2021 09:21:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAEB4F80107
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1636359679557734966-webhooks-bot@alsa-project.org>
References: <1636359679557734966-webhooks-bot@alsa-project.org>
Subject: ucm2: Add support for RT5650 on MediaTek SoCs
Message-Id: <20211108082127.1FE51F80107@alsa1.perex.cz>
Date: Mon,  8 Nov 2021 09:21:27 +0100 (CET)
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

alsa-project/alsa-ucm-conf pull request #117 was opened from kholk:

At least one MT8173 machine uses a RT5650 codec and that's Google Elm:
add a UCM2 configuration for this codec.

This was tested on Acer Chromebook R13 (MT8173 Elm).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/117
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/117.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
