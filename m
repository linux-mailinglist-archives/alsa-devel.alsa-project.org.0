Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2221F7646
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 11:55:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC32E1681;
	Fri, 12 Jun 2020 11:55:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC32E1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591955750;
	bh=zB8l6f6Ok1/khvPoMFyNdnzoqiLHebWqQX3OwL4KafQ=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GGZYDZ7X5IOpph8fNy7UDeohZQBB9uotv/cCaCS49OUMe1O2UndWkAB5777lXh30w
	 ROMwpPCs4wygjW6gmIPAlgYgm+IPTfiwzdJwC4zZvMqDWbxqZ9jqnpPODcWJi31+iR
	 4XQSS6xqV+WKTQke9161C2+GJ1AMjHMksW3nPN4g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1086CF800C7;
	Fri, 12 Jun 2020 11:54:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8078DF8021C; Fri, 12 Jun 2020 11:54:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D4A8F800C7
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 11:54:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D4A8F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=pogo.org.uk header.i=@pogo.org.uk
 header.b="eWvwDkkG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
 ; s=a;
 h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender:
 Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E58ow2nZwiPaRjO+0d/w6qe4Ily5LL0d2B+2dX+/pi4=; b=eWvwDkkGAOEgsBTWVNUfr54Xr6
 954MmVzk3hvFYpEgMgFkDCbtnRneu/gT2eP/9g/MwA5s43nOoLiGsDxjphoHVu0JzS9UkZV3bTCi5
 qBiZFFi83TRei3WUd2eAoHXeiEBBC9LoOiMyQEJI7AxMpFkUQfe2s4aWVzch8wiRazVimJCTF/Hvg
 DPskRtnWTT2d/4HfJXwXkcrsy9Pfs6HKZhGh27yhMxZ4p85QlQNp6IdCkKL46CF5fWTbqZFV83i9D
 XweP5yWISevEaEtCJPLGo+Hzs4zYvq6APStRKxjBEEc3vT0NbyBdyh7NMySzzdimZ9yGDZRoubRhN
 S/h3aeWg==;
Received: from cpc1-hari17-2-0-cust102.20-2.cable.virginm.net ([86.18.4.103]
 helo=stax.localdomain) by jazz.pogo.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93.0.4 (FreeBSD))
 (envelope-from <mark@xwax.org>)
 id 1jjgNv-000ARz-8T; Fri, 12 Jun 2020 10:54:03 +0100
Received: from mark (helo=localhost)
 by stax.localdomain with local-esmtp (Exim 4.84)
 (envelope-from <mark@xwax.org>)
 id 1jjgNu-0000AN-I9; Fri, 12 Jun 2020 10:54:02 +0100
Date: Fri, 12 Jun 2020 10:54:02 +0100 (BST)
From: Mark Hills <mark@xwax.org>
To: alsa-devel@alsa-project.org
Subject: alsa-lib: Bug fixes to namehint, dsnoop and minor changes
Message-ID: <2006121020220.23374@stax.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

I've been running these patches in some form for a while. Now tidied up 
for RFC.

It's quite possible I misinterpreted something; the behaviours seem to be 
quite long-standing, hence a first pass for comments.

This has taken me to the _avail() functions, which do not seem to be 
prepared for signed output, yet callers interpret as signed and ultimately 
end up in external API. Their handling of wraparound conditions etc. may 
not be as expected. I've already started to look at these.

-- 
Mark
