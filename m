Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 567A22DAA28
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Dec 2020 10:37:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3B0117CE;
	Tue, 15 Dec 2020 10:36:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3B0117CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608025035;
	bh=X1lAuwdu/k+Fg5OURdEhAdRVG9yW6qHylXydz6deaEI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CE4CCoh/ZcPepxzCPDHstAormb5F1oQPnm5mGTFSJqVMB2stMp//kCISepVJmikCu
	 IMf5iuZxZBPl1UHxFtGcYkAAFsB0vNqtLRALqHcy4xv1SF5AxLJP6OQ0evfHYmfYlX
	 ox8TVQMDB6IeUphbI2YZHZ1v+SBKqcIrp3id0/kM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 575BBF8027B;
	Tue, 15 Dec 2020 10:35:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0C70F80278; Tue, 15 Dec 2020 10:35:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 27D3FF80129
 for <alsa-devel@alsa-project.org>; Tue, 15 Dec 2020 10:35:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27D3FF80129
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1608024928759639978-webhooks-bot@alsa-project.org>
References: <1608024928759639978-webhooks-bot@alsa-project.org>
Subject: Enable ECS EF20EA's internal MIC and HDMI audio
Message-Id: <20201215093536.E0C70F80278@alsa1.perex.cz>
Date: Tue, 15 Dec 2020 10:35:36 +0100 (CET)
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

alsa-project/alsa-ucm-conf pull request #68 was edited from starnight:

* Add a card long name "Standard-EF20EA-1.0" match chtrt5645 enabling the internal DMIC.
* Create HdmiLpeAudio folder and copy & modify HDMI.conf from HDA-Intel for the devices using HdmiLpeAudio as the HDMI audio driver.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/68
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/68.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
