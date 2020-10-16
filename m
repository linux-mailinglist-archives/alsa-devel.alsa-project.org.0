Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF142290AF2
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Oct 2020 19:46:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D0F617DC;
	Fri, 16 Oct 2020 19:45:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D0F617DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602870365;
	bh=CyUOXawtAJ/YtX3lSH33JcvAa+eCNOiuYGK0b1leo7c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MsvNL1J1FeOkDYZugFduCAaLd23Bo+/N2elsMbS/KWD7xE66tEP/grcK43iH9h6lm
	 AFV0qUJTSCvE3K/aiEmSVhGS70EGYYz5tX5V2GgfZGyTMabI+FIE49rWHY++8tlxlB
	 UYEBp/xvcd8BxFMLu0R9wlN5Z47+MEW4cGVI2Adg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98DB7F8021D;
	Fri, 16 Oct 2020 19:44:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 029B6F80217; Fri, 16 Oct 2020 19:44:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7AC00F8012A
 for <alsa-devel@alsa-project.org>; Fri, 16 Oct 2020 19:44:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AC00F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="quJJfzfn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=ulZhfOaT326t3jGYse1j4xMTDwyENBzxSWrUOICpdO0=; b=quJJfzfnf2yaTN/ghqHd4IS8j1
 Qr0FYhlAtq0SkYxc82uQo+8qU+XouBmOdnQvkP9GvhrFYQM5liTSxedt1OLPwG5cTb2VvU/4rVZAV
 siLHLWjQnxzlCyWjblJDdOiO3i62CImUeobXVuHg89702qFRSV8lj6qgI6fyV4Z5kHtn2/iEJ4Rdi
 x1MadF5GDGpsBQCWV2JUj6/9CoeVYSVafwO7Xj1KDQp/l20cVWhEyMvV8bHCNn5qK1dYWONPZJR2J
 frmH6ahoMYQNNIuHdrTQ8bk6k2EJrl85ZciACqeg2S39UMEGvw95CWJtZzQx2F0k7+3duyg5SQ5ww
 TJVhEZzA==;
Received: from [2601:1c0:6280:3f0::507c] (helo=smtpauth.infradead.org)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTTlx-0002zY-JA; Fri, 16 Oct 2020 17:44:10 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] sound: sparc: dbri: fix repeated word 'the'
Date: Fri, 16 Oct 2020 10:44:05 -0700
Message-Id: <20201016174405.17745-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Joe Perches <joe@perches.com>, alsa-devel@alsa-project.org,
 Randy Dunlap <rdunlap@infradead.org>, Takashi Iwai <tiwai@suse.com>
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

Change the duplicated word "the" to "Then the".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Cc: Joe Perches <joe@perches.com>
---
v2: use "Then the" instead of just "The". (Joe Perches)

 sound/sparc/dbri.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20201016.orig/sound/sparc/dbri.c
+++ linux-next-20201016/sound/sparc/dbri.c
@@ -620,7 +620,7 @@ A circular command buffer is used here.
 while another can be executed. The scheme works by adding two WAIT commands
 after each sent batch of commands. When the next batch is prepared it is
 added after the WAIT commands then the WAITs are replaced with single JUMP
-command to the new batch. The the DBRI is forced to reread the last WAIT
+command to the new batch. Then the DBRI is forced to reread the last WAIT
 command (replaced by the JUMP by then). If the DBRI is still executing
 previous commands the request to reread the WAIT command is ignored.
 
