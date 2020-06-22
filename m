Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FE5203799
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 15:13:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4154B16BF;
	Mon, 22 Jun 2020 15:12:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4154B16BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592831604;
	bh=ZI0+YARnY3YHYO1O/+Jk0efVW+pkQ6gAID0F7cYqUy0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xjrj86ZR6kdR/KR3CKswCvhvrdrRAXkWdQoufUPqN/rZ6v737IztWTtdg5TUIfsB5
	 c9JXJ8leZhjzykeJF8jqKMp8ycrIM71vteij6WyPYeVrYknbDVQXmORmN+48h0W511
	 ecuAA5PMT+KBH/ne/lCdIA2/HL48U1ZVycpMDaQ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C67AF8015A;
	Mon, 22 Jun 2020 15:11:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9F16F8015B; Mon, 22 Jun 2020 15:11:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10DBBF8010E
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 15:11:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10DBBF8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=pogo.org.uk header.i=@pogo.org.uk
 header.b="z2rzXE1Q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
 ; s=a;
 h=Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject:
 cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t5UDdeO9M039Rfb1msqFWX60Qp46FvCxd/qAAjXQyZ0=; b=z2rzXE1QM2fPLxdx8ZcIVPHjbQ
 ByMxcGNPPOLIpVh/URcCvXXxhIxpuN4KuOyCav7Tw4oxbqmYF2V6FG7WhIVL0uvgxdG7D8B33D1ul
 Q8CaPjVnB4+3WdSGrTHIFLxG5jaC5mItfkYLTeBhtsPL7nGpW5GdY6nT3tq/WRwsr8UBLihDt0gxP
 AmE/2DbaiPxox+QVjw89thjN4ETNa9x99hBzlXu0OKsVPRw9YTznYO+5U1GWhOuch+y9KMT6qBH8N
 rtuEJlF5qUZDUE8Xt7neLtPrBLIEf+BnbEyJpAKcvTNpQ9jLg9jXgQrztM7pxWyfn/5eEwGKh3w+B
 fD+mysJA==;
Received: from cpc1-hari17-2-0-cust102.20-2.cable.virginm.net ([86.18.4.103]
 helo=stax.localdomain) by jazz.pogo.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94 (FreeBSD))
 (envelope-from <mark@xwax.org>)
 id 1jnMEY-000Bvv-Fm; Mon, 22 Jun 2020 14:11:34 +0100
Received: from mark (helo=localhost)
 by stax.localdomain with local-esmtp (Exim 4.84)
 (envelope-from <mark@xwax.org>)
 id 1jnMEY-0003Wm-8C; Mon, 22 Jun 2020 14:11:34 +0100
Date: Mon, 22 Jun 2020 14:11:34 +0100 (BST)
From: Mark Hills <mark@xwax.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: alsa-lib: Bug fixes to namehint, dsnoop and minor changes
In-Reply-To: <2006121020220.23374@stax.localdomain>
Message-ID: <2006221356390.20421@stax.localdomain>
References: <2006121020220.23374@stax.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org
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

On Fri, 12 Jun 2020, Mark Hills wrote:

> I've been running these patches in some form for a while. Now tidied up 
> for RFC.
> 
> It's quite possible I misinterpreted something; the behaviours seem to 
> be quite long-standing, hence a first pass for comments.
[...]

Jaroslav, I sent these patches over for RFC. No feedback came, so I'll 
follow this email with them as PATCH with sign-off.

The only changes are a tiny rewording to commit messages.

Please let me know of anything that prevents their inclusion and I'll work 
on it.

-- 
Mark
