Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFF741FE3B
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Oct 2021 23:17:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3DC11692;
	Sat,  2 Oct 2021 23:16:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3DC11692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633209439;
	bh=PvDsp/Clgyv93KRtcheWaiM69IfOHJfePsFVeEdx7AY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bpT77R2/uM8OWIIN1XLXiHqiKRH2Fc2HZZktslKABTQoCNi6ABOJGCmc3Sin1IrP1
	 uW8qAEgJuf6MgyPntadJHzExhgvI8UVEq3H9f24ysGmh9lnrWt4dWzT2a4inOCaagd
	 hjSiZyYv+fGXC+mvrz8K2iYbLrH+ZDrpwpS85SpE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 402B3F804E5;
	Sat,  2 Oct 2021 23:15:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32232F804E2; Sat,  2 Oct 2021 23:15:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EDC9F804D2
 for <alsa-devel@alsa-project.org>; Sat,  2 Oct 2021 23:15:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EDC9F804D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="c/RaDppU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633209324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R0HnbzWj0GETEpOsre2eA7tFqFo8kw57gjTy6BNLrWk=;
 b=c/RaDppUPgdVcCaCnvjd+0HIzPq/IZO/5322b69lkXp+jgkxbZFsL22YwfLuzxpXwRyu+V
 nfJZfUhEXDxxAatIAtRDgQrdaqkrIIa09lz6uQau+kXF77R3iUfdolOUifDVPiUa5AgxzQ
 VHFxGdPtk5qIhQmHaC3i9QWFFUPpmCw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-qCOYuLlVPDqwcVkTZ-hdNg-1; Sat, 02 Oct 2021 17:15:23 -0400
X-MC-Unique: qCOYuLlVPDqwcVkTZ-hdNg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47CC4362F9;
 Sat,  2 Oct 2021 21:15:21 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9C1E5C1CF;
 Sat,  2 Oct 2021 21:15:19 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH 4/4] ASoC: Intel: cht_bsw_nau8824: Set card.components string
Date: Sat,  2 Oct 2021 23:14:59 +0200
Message-Id: <20211002211459.110124-4-hdegoede@redhat.com>
In-Reply-To: <20211002211459.110124-1-hdegoede@redhat.com>
References: <20211002211459.110124-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
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

Set the card.components string using the new nau8824_components() helper
which returns a components string based on the DMI quirks inside the
nau8824 codec driver.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/cht_bsw_nau8824.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/intel/boards/cht_bsw_nau8824.c b/sound/soc/intel/boards/cht_bsw_nau8824.c
index da5a5cbc8759..7e6b68186db1 100644
--- a/sound/soc/intel/boards/cht_bsw_nau8824.c
+++ b/sound/soc/intel/boards/cht_bsw_nau8824.c
@@ -278,6 +278,8 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 		snd_soc_card_cht.driver_name = DRIVER_NAME;
 	}
 
+	snd_soc_card_cht.components = nau8824_components();
+
 	/* set pm ops */
 	if (sof_parent)
 		pdev->dev.driver->pm = &snd_soc_pm_ops;
-- 
2.31.1

