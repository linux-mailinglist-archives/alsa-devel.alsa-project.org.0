Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 588371599E0
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 20:38:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D62341616;
	Tue, 11 Feb 2020 20:37:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D62341616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581449913;
	bh=KI5mGiCcqd2xg8tF0vuIyjehm5dWQ0ynU10Uu5z5Jbc=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=d+UinD0h1l2A6RNNmIog75n7N2PyQTMPpjD4DQHvxGQq3r6BZpCK3Q1bHD0jn0123
	 x408egmJLloFhzPPQxTkF+qIJ7T9Qux+O/Oj8QGnVccShzYAbV6dy31gnTzDle/vz3
	 LE/smqxbPn1K5WZr+5oqtag4Kv/GQRYtPKktfRqM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8BEBF800F0;
	Tue, 11 Feb 2020 20:36:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B476AF80145; Tue, 11 Feb 2020 20:36:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from gateway20.websitewelcome.com (gateway20.websitewelcome.com
 [192.185.52.45])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 554A9F800F0
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 20:36:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 554A9F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com
 header.b="LEUl6BRs"
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
 by gateway20.websitewelcome.com (Postfix) with ESMTP id 763CF400DFBC2
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 12:23:04 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id 1bKnjGwYtXVkQ1bKnjfHmg; Tue, 11 Feb 2020 13:36:38 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
 Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UM0S/XX22/eXnz8emf2UzrArwB+5xzNNImR9J+pKjzA=; b=LEUl6BRslj1G7JB0krKO9LhFO+
 TtVynXO3yhi2pAvhqYjAn3QzO2D2W1urUOIBbth6z9A3oi+IbdJZLsC9GTxjLDdneqfCBiOkdgpk9
 WnaAF9hp2Y7AwOgpwk9nsp7HOEJKl6j1TOuLwj/w6GKN5iqfgxrl60+SUG5d92yp5Y92rZWxxguIT
 mPuoBbRqyQTHUj5lXPVcTWudocAzlkJeIzKHzY8mYikjoVtDxGqY6fikZSrEIr7n2TPhhIpe2pkBB
 HTIOpnm1ieqm9HR2H7ge31UCcJ+modFhD5GDvUEoazAabs2X3girzdicFvbPmr6fvhwdEcT7lMeCk
 zKyVGjfw==;
Received: from [200.68.140.36] (port=5745 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1j1bKm-001Hcy-7Z; Tue, 11 Feb 2020 13:36:36 -0600
Date: Tue, 11 Feb 2020 13:39:10 -0600
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Message-ID: <20200211193910.GA4596@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 200.68.140.36
X-Source-L: No
X-Exim-ID: 1j1bKm-001Hcy-7Z
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [200.68.140.36]:5745
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 10
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [alsa-devel] [PATCH] ALSA: core: Replace zero-length array with
 flexible-array member
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertenly introduced[3] to the codebase from now on.

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 sound/core/oss/rate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/oss/rate.c b/sound/core/oss/rate.c
index 2fa9299a440d..e9f20fefb117 100644
--- a/sound/core/oss/rate.c
+++ b/sound/core/oss/rate.c
@@ -47,7 +47,7 @@ struct rate_priv {
 	unsigned int pos;
 	rate_f func;
 	snd_pcm_sframes_t old_src_frames, old_dst_frames;
-	struct rate_channel channels[0];
+	struct rate_channel channels[];
 };
 
 static void rate_init(struct snd_pcm_plugin *plugin)
-- 
2.25.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
