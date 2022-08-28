Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AE35A3DA5
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Aug 2022 15:16:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7F48E11;
	Sun, 28 Aug 2022 15:16:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7F48E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661692614;
	bh=ErfVKxjjGCCT5CWWGfUjamx2xO/gi+tMNK5FeJWxLpA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tCC+/NUMh5MFI2LpKoV6s+fpQfJfNjox1V6aQilniBM/gARdS7o0BjR9hylGx1LGC
	 A3GvsPr+2KAb1IobIn7mfmgBPoZEclcTKAxvq85u/lr6YXGhYzx4/9OTzj+YOoZPjl
	 esxSKWYrwHz7TsKufl8ciP9u9egJ49iGsVL22Bfk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2571FF80423;
	Sun, 28 Aug 2022 15:15:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE34BF8028D; Sun, 28 Aug 2022 15:15:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 9CEE5F8012B
 for <alsa-devel@alsa-project.org>; Sun, 28 Aug 2022 15:15:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CEE5F8012B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1661692548706208944-webhooks-bot@alsa-project.org>
References: <1661692548706208944-webhooks-bot@alsa-project.org>
Subject: ucm2: HDA - add support for Internal Mic
Message-Id: <20220828131553.EE34BF8028D@alsa1.perex.cz>
Date: Sun, 28 Aug 2022 15:15:53 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #207 was opened from kasper93:

Simple patch to support also "Internal Mic".

Everything seems to be working fine after this change, except that I don't have "Internal Mic Jack", I'm lying there a little to set it as such. Everything switches nicely when connecting/disconnecting headphones mic. But there are two input devices to select and selection doesn't have effect. I believe when headphone mic is connected the internal one should be hidden, but there is no Jack and I don't know how to handle it properly. (It is marked as conflicting device with the other one though) Except this minor annoyance it is fine.  

For reference: [alsa-info.txt](https://github.com/alsa-project/alsa-ucm-conf/files/9439697/alsa-info.txt)

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/207
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/207.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
