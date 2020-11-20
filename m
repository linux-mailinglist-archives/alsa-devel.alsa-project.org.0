Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 724142BB2BC
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 19:36:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E6AF1753;
	Fri, 20 Nov 2020 19:35:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E6AF1753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605897378;
	bh=j3HUa+fnGHNDQulbJXTCYVUqAPDa46eOQU6quqLLw58=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i736DZj/ZFrDnLhhcU4pNx6V0kXH/zLHmFB37vn1Em4OY1VmeqwJhXAs6UiFtOJYZ
	 s/IkieqAE4svqadHCWyazBgdPliHrejCJvTAkFIleNZs+Q4kIl72j3a+cGZ0JHPRwP
	 gHov/0g1tXuOU7l7yOPiG22bPFMxKs4S/dUfURic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD0AEF804BC;
	Fri, 20 Nov 2020 19:34:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B2B0F804B4; Fri, 20 Nov 2020 19:34:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A84B1F80258
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 19:34:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A84B1F80258
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="g+GSDdce"
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 63A212408E;
 Fri, 20 Nov 2020 18:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605897247;
 bh=j3HUa+fnGHNDQulbJXTCYVUqAPDa46eOQU6quqLLw58=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g+GSDdceKqdEuI5kBb/K2Ns/xhwihJJnV0cWEIUHhkKXKFjz/WUVZ0EVPhhyg/XbN
 X7LV6AM/4spe9voqSRn8CZYvbrkJoeon0V8AoRpLSJ52qLOP4hztg8Jye8a/Y7iKSM
 y0M2KhugiVgURcLekTfbwBlAFrmpICeVpoTWXB3c=
Date: Fri, 20 Nov 2020 12:34:12 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 068/141] ALSA: sb: Fix fall-through warnings for Clang
Message-ID: <0f6d5b94f1890be2b8f88d6f930fc75779e26345.1605896059.git.gustavoars@kernel.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1605896059.git.gustavoars@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
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

In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
by explicitly adding a break statement instead of letting the code fall
through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 sound/isa/sb/sb8_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/isa/sb/sb8_main.c b/sound/isa/sb/sb8_main.c
index 86d0d2fdf48a..8d01692c4f2a 100644
--- a/sound/isa/sb/sb8_main.c
+++ b/sound/isa/sb/sb8_main.c
@@ -506,6 +506,7 @@ static int snd_sb8_open(struct snd_pcm_substream *substream)
 		} else {
 			runtime->hw.rate_max = 15000;
 		}
+		break;
 	default:
 		break;
 	}
-- 
2.27.0

