Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DFA48614F
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jan 2022 09:13:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9ABA917C3;
	Thu,  6 Jan 2022 09:12:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9ABA917C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641456814;
	bh=gAg+/MsLsCtqwG6Uq5Pm/dMsOChriRnv1ekSLaO1/vI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S0evwQBYUHB9y1Wx35tTSMI9N31PdrQDHFOIj1Uh76uFPZjZ7tzWsJMx+WFxj/wHE
	 31wtPVc01VsRPv13zMrC88NfIw4uzNeuDJ5G1ZhP18DZLLiylZ90EVJ/fMXzj8WzqS
	 WGqDe3jEb+/Ajp0HlaA62cS7S1RjK7ogk949V+OU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B821F80158;
	Thu,  6 Jan 2022 09:12:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28FC4F80155; Thu,  6 Jan 2022 09:12:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id D12F7F800AE
 for <alsa-devel@alsa-project.org>; Thu,  6 Jan 2022 09:12:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D12F7F800AE
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1641456742193588018-webhooks-bot@alsa-project.org>
References: <1641456742193588018-webhooks-bot@alsa-project.org>
Subject: hda-analyzer porting to GTK3
Message-Id: <20220106081227.28FC4F80155@alsa1.perex.cz>
Date: Thu,  6 Jan 2022 09:12:27 +0100 (CET)
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

alsa-project/alsa-utils issue #134 was opened from kosiu:

I know that hda-analyzer is not a part of alsa-utils.
I'm trying to port it into GTK3 at first but I encounter
problems with scrolling of the graph.
Source is here:
https://github.com/kosiu/alsa/tree/gtk3

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/134
Repository URL: https://github.com/alsa-project/alsa-utils
