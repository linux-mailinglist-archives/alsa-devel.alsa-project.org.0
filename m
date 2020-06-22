Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E922037B8
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 15:18:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9605116B9;
	Mon, 22 Jun 2020 15:17:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9605116B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592831891;
	bh=IDR7gxUCOvISnhdQcpd8cEMUtddSE7iNrTcfIY4h0Qo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h6ymH6ydFkzpq+oW7UQPVJMRgEqudhLh7fWe48CXkKz8SviKQ5O77ysRHqsq9EgGn
	 WIkKLCYXpvlob2F+QXhJ0DpCfHrOVstKAW+j9NpYDEJ5qa98slJEoIxwEOaX1lKnUK
	 jvOPrwoobxsXsU4VPrDGpcRCGIA0mW+LxtaXh6AA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B689F802A9;
	Mon, 22 Jun 2020 15:15:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F4B7F802A7; Mon, 22 Jun 2020 15:15:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C782F80157
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 15:15:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C782F80157
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=pogo.org.uk header.i=@pogo.org.uk
 header.b="gUwWQ+wo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
 ; s=a;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:
 Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J4SmVEdjlodgHeWKQbht59vRLnVPgyAYhS1qVuU+Wn8=; b=gUwWQ+wojYvf24ZctwC832vNrM
 xyGXbuYYIpitUSXBNJrlxI4Fbzwb4ckVeFi/zfdbCFCMeW96Y6RW3K0Mnp++DvyKdb2XFmwECy+SA
 eXnn0lFIzOhfabAtTd28fUhqDj//CYK62E98Poj1cuSLEDWw8GNdPXaPLVXgnyYSdr65nImAPVTF4
 4yGkBLixAY+mEyPR63H+MnJC3BvQ+444LGCY4jeyhkxxXPMWSl7JJ731GYqrGqHLxB3VRdHspRGIn
 B8FD3YZUvVmO7kqf6u96w3cEYNpGjHmrtupE176WLl6GD531ut8mdiYz1K1+L9/QVcdylUeyIf3w8
 aGYHh2ow==;
Received: from cpc1-hari17-2-0-cust102.20-2.cable.virginm.net ([86.18.4.103]
 helo=stax.localdomain) by jazz.pogo.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94 (FreeBSD))
 (envelope-from <mark@xwax.org>)
 id 1jnMI7-000BwK-Ga; Mon, 22 Jun 2020 14:15:15 +0100
Received: from mark by stax.localdomain with local (Exim 4.84)
 (envelope-from <mark@stax.localdomain>)
 id 1jnMI7-00065y-44; Mon, 22 Jun 2020 14:15:15 +0100
From: Mark Hills <mark@xwax.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 3/9] conf: Read a host-specific asoundrc
Date: Mon, 22 Jun 2020 14:15:09 +0100
Message-Id: <20200622131515.23385-3-mark@xwax.org>
X-Mailer: git-send-email 2.17.5
In-Reply-To: <2006221356390.20421@stax.localdomain>
References: <2006221356390.20421@stax.localdomain>
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

On systems with a network mounted home directory this is thoroughly
useful to allow for a core set of asoundrc settings, but with different
settings on different hosts.

It's not possibly to implement this in our own asoundrc or local
customisation, as it's too late. The installation file must be modified.

This is similar to ~/.Xdefaults-* on some systems.

Signed-off-by: Mark Hills <mark@xwax.org>
---
 src/conf/alsa.conf | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/src/conf/alsa.conf b/src/conf/alsa.conf
index 18427ec6..4dae0e9c 100644
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

