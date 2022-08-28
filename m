Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3598D5A3DB7
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Aug 2022 15:27:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA30B950;
	Sun, 28 Aug 2022 15:27:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA30B950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661693270;
	bh=LzxGfK0ZoX+Ro/CMAuaxwZbnGAOUPEvCQPCxPz/1OU8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W+41MccRfhtecbqixHwGs3qu/WrN05Aka993c/wWSkrpLqFa53Jqtllakol3I5Fvi
	 TWsLlvXw62PSrU8zbtuA8tb9FcpweJf1sQSdICXXgL4GLILoR4xv/I+ml7V2xkEhSA
	 EsaJjyrm4baV8CqD73Ten4GxBciDC01zB81PkQBo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EB86F80423;
	Sun, 28 Aug 2022 15:26:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04F57F8028D; Sun, 28 Aug 2022 15:26:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 8464AF8012A
 for <alsa-devel@alsa-project.org>; Sun, 28 Aug 2022 15:26:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8464AF8012A
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1661693206975050926-webhooks-bot@alsa-project.org>
References: <1661693206975050926-webhooks-bot@alsa-project.org>
Subject: ucm2: HDA - add support for Internal Mic
Message-Id: <20220828132651.04F57F8028D@alsa1.perex.cz>
Date: Sun, 28 Aug 2022 15:26:50 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #207 was edited from kasper93:

Simple patch to support also "Internal Mic".

Everything seems to be working fine after this change, except that I don't have "Internal Mic Jack", I'm lying there a little to set it as such. Everything switches nicely when connecting/disconnecting headphones mic. But there are two input devices to select and selection doesn't have effect. When headphone mic is connected the internal one should be hidden (it is handled somehow when using HDA driver), but there is no Jack and I don't know how to handle it properly. (It is marked as conflicting device with the other one though) Except this minor annoyance it is fine.  

For reference: [alsa-info.txt](https://github.com/alsa-project/alsa-ucm-conf/files/9439697/alsa-info.txt)

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/207
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/207.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
