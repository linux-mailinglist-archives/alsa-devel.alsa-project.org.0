Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 870381F7657
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 11:59:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A5A71678;
	Fri, 12 Jun 2020 11:58:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A5A71678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591955949;
	bh=hxL9zdUDdjnNqYLxGiZYR6dAGjlf+SIXtKiiYvYTCj8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l3craNs1n4r2HNqkEaFs70GC8Oh0Unyr0mx4ZgqbtFR37ZNchgXYtwC2wgUmS8O1+
	 ayG6CytldicHCCqm7MaVlcgFsN2U6WCfxKTBmC67ID9H5no827dvdcpLlFgGyVvaeA
	 y17q87HFM0ZejrGqusm0W4spJLOOH04/qdHXYmoU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ACE2F802DD;
	Fri, 12 Jun 2020 11:55:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8218F802A7; Fri, 12 Jun 2020 11:55:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA4FFF80252
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 11:55:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA4FFF80252
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=pogo.org.uk header.i=@pogo.org.uk
 header.b="d8Jrbyn7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
 ; s=a;
 h=References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:
 Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=umMjr4iuPgNnpPg25FIfyErstIE8LhmuiI6MjVBr+b8=; b=d8Jrbyn7FaUZ6nGOZ3RxEANOn8
 V5LWhz2WeaN7q8sdnPuy0Mu0jDNxqLG+zZfwM32B0DWsx89EhT58XL7L19PiEkUsXfzXhapNPVa7L
 pbhQHRtmmYRh+W2AEtOFofFqsKKJXjp1t1XSiQOMbW4+uj3kuOzLP/4B/fHSeTbXMBTozZlWsR61S
 W9fSotEaK6JmXRVIgxbS9Swlw8QQ4kg1//R2GUYYya9/3k+1Iqn75wRqpD5tzFL6TY0PrxzJvLCRT
 eH5Iob1Cu5o/GMpR9oO4wZVK/vC11X7KxBmCayUQIC+KwOFL2E+WZCdEFLxu/5eQqyqk/WXhdr2Aw
 ENBQ87YA==;
Received: from cpc1-hari17-2-0-cust102.20-2.cable.virginm.net ([86.18.4.103]
 helo=stax.localdomain) by jazz.pogo.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93.0.4 (FreeBSD))
 (envelope-from <mark@xwax.org>)
 id 1jjgPK-000ATW-I2; Fri, 12 Jun 2020 10:55:30 +0100
Received: from mark by stax.localdomain with local (Exim 4.84)
 (envelope-from <mark@stax.localdomain>)
 id 1jjgPK-00012q-7F; Fri, 12 Jun 2020 10:55:30 +0100
From: Mark Hills <mark@xwax.org>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 3/9] conf: Read a host-specific asoundrc
Date: Fri, 12 Jun 2020 10:55:24 +0100
Message-Id: <20200612095530.3970-3-mark@xwax.org>
X-Mailer: git-send-email 2.17.5
In-Reply-To: <2006121020220.23374@stax.localdomain>
References: <2006121020220.23374@stax.localdomain>
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

On systems with a network mounted home directory this is thoroughly
useful to allow for a core set of asoundrc settings, but with different
settings on different hosts.

It's not possibly to implement this in our own asoundrc or local
customisation, as it's too late. The installation file must be modified.

This is similar to ~/.Xdefaults-* on some systems.
---
 src/conf/alsa.conf | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/src/conf/alsa.conf b/src/conf/alsa.conf
index 08370108..39195f49 100644
--- a/src/conf/alsa.conf
+++ b/src/conf/alsa.conf
@@ -24,6 +24,17 @@
 					"/alsa/asoundrc"
 				]
 			}
+			{
+				@func concat
+				strings [
+					"~/.asoundrc-"
+					{
+						@func getenv
+						vars [ HOSTNAME ]
+						default "localhost"
+					}
+				]
+			}
 		]
 		errors false
 	}
-- 
2.17.5

