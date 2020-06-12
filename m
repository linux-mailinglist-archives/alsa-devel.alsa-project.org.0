Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A15BE1F765F
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 12:00:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DAF0168C;
	Fri, 12 Jun 2020 11:59:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DAF0168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591956044;
	bh=tNh5NOqwQdq7ZhyGRvndfVkhBrttNgacdGxWlYKDOuk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tNffY+W8fRtbRf3FmSCTmhvQG8NadrxrcZaV0grQK0obVesX7lV7uUHdyqZjvHBS3
	 5+X4fku70ZGybYkUu0vrTOaWSExqoDHzBxs5eg8Jw01RbiQLunjDym4dkPDBiwBtGW
	 Z1dJu7DzQGU49XKnn/3EsRuXHc7dV/tNXffzbL+c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF6D9F800C7;
	Fri, 12 Jun 2020 11:55:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35CD3F802A7; Fri, 12 Jun 2020 11:55:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA954F802A1
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 11:55:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA954F802A1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=pogo.org.uk header.i=@pogo.org.uk
 header.b="DqoS/riu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
 ; s=a;
 h=References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:
 Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cVHNdcB+uxc9rllU/XXpJA3VxgVtG0iEcZzsYEEAYR0=; b=DqoS/riuWYOXtm0bUAV+pVYGkc
 RzjoOIqHm6L5ywu5DfM4SlGl6MuPX4XjJKvTC/LT7qU7jWzeLf1jFlgkj/eo8/MX4vOYuQvWapp3x
 w0Hd1Uu/fVu8/r3a5vQ3xwBUxrSxhhckSjYIi6sitVn/ACsVerFD2z5CciUjla14fEprP+7WhsEhB
 JelRoNxuoVjOL+OyxSDY8pT0+Ues8FHQyA2IVqX7KWlNsJC/XE27IsC+MkY3xn8C/1rSy+cvTehW1
 3JePRu9uWitO7P1ueKl65SvAGnHJHMxpOoxYQyelz/7n9oUeYjZLdPMh7yk10vhDAL/rIBOtSCJP6
 XHsTvWKQ==;
Received: from cpc1-hari17-2-0-cust102.20-2.cable.virginm.net ([86.18.4.103]
 helo=stax.localdomain) by jazz.pogo.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93.0.4 (FreeBSD))
 (envelope-from <mark@xwax.org>)
 id 1jjgPK-000ATb-Kr; Fri, 12 Jun 2020 10:55:30 +0100
Received: from mark by stax.localdomain with local (Exim 4.84)
 (envelope-from <mark@stax.localdomain>)
 id 1jjgPK-00013F-8r; Fri, 12 Jun 2020 10:55:30 +0100
From: Mark Hills <mark@xwax.org>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 8/9] dsnoop: Make use of the (previously unused) function
Date: Fri, 12 Jun 2020 10:55:29 +0100
Message-Id: <20200612095530.3970-8-mark@xwax.org>
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

Match the equivalent funciton for playback. This is on the assumption
that values should be capped at zero, which is what _rewindable()
implements.
---
 src/pcm/pcm_dsnoop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/pcm/pcm_dsnoop.c b/src/pcm/pcm_dsnoop.c
index 3588eb91..7904314c 100644
--- a/src/pcm/pcm_dsnoop.c
+++ b/src/pcm/pcm_dsnoop.c
@@ -352,7 +352,7 @@ static int snd_pcm_dsnoop_pause(snd_pcm_t *pcm ATTRIBUTE_UNUSED, int enable ATTR
 
 static snd_pcm_sframes_t snd_pcm_dsnoop_rewindable(snd_pcm_t *pcm)
 {
-	return snd_pcm_mmap_capture_hw_avail(pcm);
+	return snd_pcm_mmap_capture_hw_rewindable(pcm);
 }
 
 static snd_pcm_sframes_t snd_pcm_dsnoop_rewind(snd_pcm_t *pcm, snd_pcm_uframes_t frames)
-- 
2.17.5

