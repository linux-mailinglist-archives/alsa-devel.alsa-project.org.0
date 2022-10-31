Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27523613BE2
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 18:07:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 705BF1685;
	Mon, 31 Oct 2022 18:06:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 705BF1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667236069;
	bh=US/HYKumOFAtAMMcUMv5hpuKFTeXDrOmo2C/5S9vV6Y=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SkjH7U0ge/VoXpcsWGQfsKouajqYJKbapCYHTZf9mnjWtbi/7qU8dRMjIWDFFhofc
	 rsJwDhSdrbPVoOGN6B83X+fL14FJv+KOb0gEDyeBlsSO4v0qaOPGdslxSMTeo/+g49
	 8jliR04ZCfyd+oiU/aAIpvuk2eNcKKs56RDzJSMU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4ACCF800CC;
	Mon, 31 Oct 2022 18:06:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 824F3F80163; Mon, 31 Oct 2022 18:06:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 46C34F800E1
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 18:06:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46C34F800E1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1667236009458420992-webhooks-bot@alsa-project.org>
References: <1667236009458420992-webhooks-bot@alsa-project.org>
Subject: feat: add support for ASUS ROG Strix Z790-E Gaming Wifi
Message-Id: <20221031170652.824F3F80163@alsa1.perex.cz>
Date: Mon, 31 Oct 2022 18:06:52 +0100 (CET)
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

alsa-project/alsa-ucm-conf pull request #235 was opened from DASPRiD:

I've verified this profile on my motherboard, and both back- and front jacks seem to work fine, including SPDIF.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/235
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/235.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
