Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A3C3224E4
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 05:28:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E03D11C;
	Tue, 23 Feb 2021 05:27:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E03D11C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614054488;
	bh=1EoENt0yFo+uzHEpBdkCwiyz1bNn1B/3S+TJlTSZYOE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D6ic1ROt9rRXhWlrtr9b34tHRHq5Mbozvz+1xy5g0sPNotLGspYbxUrap9VBF7OuJ
	 za6bjPTvhG6SBA7LNl+BbY1WCIignP9UFQ5rZiZuYryIALKU+Xnhjs3lx0hWqrM+Lh
	 KWz7gE9pv5kIrpZ0x3/Js3FzoCzQcPyjK8560C5I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D7FAF800B4;
	Tue, 23 Feb 2021 05:26:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CC31F8016A; Tue, 23 Feb 2021 05:26:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 554CAF800B4
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 05:26:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 554CAF800B4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1614054387144099951-webhooks-bot@alsa-project.org>
References: <1614054387144099951-webhooks-bot@alsa-project.org>
Subject: yoga 9i bottom speakers do not work
Message-Id: <20210223042635.1CC31F8016A@alsa1.perex.cz>
Date: Tue, 23 Feb 2021 05:26:35 +0100 (CET)
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

alsa-project/alsa-lib issue #120 was edited from zany130:

this might be the same issue as the c940 and legion 7i not sure, but the soundbar works but the bottom speakers don't

https://linux-hardware.org/?probe=1f0bdc3a66

I was trying to get the ALSA Information Script running and the script uploaded but it wasn't connecting so here is the file
[alsa-info.txt](https://github.com/alsa-project/alsa-lib/files/6026794/alsa-info.txt)

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/120
Repository URL: https://github.com/alsa-project/alsa-lib
