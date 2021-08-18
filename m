Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD243F07F5
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Aug 2021 17:19:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BD03168F;
	Wed, 18 Aug 2021 17:18:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BD03168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629299959;
	bh=hsfJ0ac13TEY4MTKREFEYmNWAzMWz44gYf8stSnKUO0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=k+puX9mXnWGya0TNXI4Xxar2vtAnQWrKQ6cCYmaQ3ANRu3a6vKwm9qYmW6hU9iryZ
	 GsZmXY4BhNpreP4mqTvu2S2DQnV9gxEx0GTQSDJutzv6BuOlzL/GkAjmOWKy7ytaem
	 saKxtOyEBb8qtPfzTG26UQ/KA9rjTdc7HBt3hxDs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84DECF80259;
	Wed, 18 Aug 2021 17:18:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B6DDF80249; Wed, 18 Aug 2021 17:17:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93105F80169
 for <alsa-devel@alsa-project.org>; Wed, 18 Aug 2021 17:17:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93105F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="hf4+LckN"
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id B0AE13F361; 
 Wed, 18 Aug 2021 15:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629299866;
 bh=z5jVFxsMugjMYW/N4BEa1uHFJbg9/7T7WDVguO5VseE=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=hf4+LckNw4pkWkuwMlwbVkmrw9okQEDxKdkcCSMAUMHNySVa0i9QPu/En3qJSZJeU
 t4x9CtV6yubBhn1kFq/mRQfK6GOUMNmhDMO2fqqQznJY8/6lzi1aBQLByu44/Z2wvL
 ANfox6rDlHHMKnaVrXgSyWkagjTYyfQwiDgYn+Fj18bLYDG1mi8N9Iq49Zr3a7wC8l
 ieDDfsYsU1JlKDn+UgEryq+2MxlIBOV/7jUFqJokvreB2WX0HK+ovS+nSTCwlZc5VN
 u6tPsLrb9BOrni6AFUdKYYdQ17RQqbv6lhowtZgfydvFxbv8Do9muwQATqUbd31ii5
 3ANfJY9nwOIyQ==
From: Colin King <colin.king@canonical.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ASoC: uniphier: make arrays mul and div static const,
 makes object smaller
Date: Wed, 18 Aug 2021 16:17:46 +0100
Message-Id: <20210818151746.38520-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

From: Colin Ian King <colin.king@canonical.com>

Don't populate the arrays mul and div on the stack but instead make them
static const. Makes the object code smaller by 4 bytes.

Before:
   text    data     bss     dec     hex filename
  16226    4984      64   21274    531a ./sound/soc/uniphier/aio-cpu.o

After:
   text    data     bss     dec     hex filename
  16062    5144      64   21270    5316 ./sound/soc/uniphier/aio-cpu.o

(gcc version 10.2.0)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/uniphier/aio-cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/uniphier/aio-cpu.c b/sound/soc/uniphier/aio-cpu.c
index cf9814130067..4e8d5f7532ba 100644
--- a/sound/soc/uniphier/aio-cpu.c
+++ b/sound/soc/uniphier/aio-cpu.c
@@ -128,8 +128,8 @@ static const struct uniphier_aio_spec *find_spec(struct uniphier_aio *aio,
 static int find_divider(struct uniphier_aio *aio, int pll_id, unsigned int freq)
 {
 	struct uniphier_aio_pll *pll;
-	int mul[] = { 1, 1, 1, 2, };
-	int div[] = { 2, 3, 1, 3, };
+	static const int mul[] = { 1, 1, 1, 2, };
+	static const int div[] = { 2, 3, 1, 3, };
 	int i;
 
 	if (!is_valid_pll(aio->chip, pll_id))
-- 
2.32.0

