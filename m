Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A09835D635
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jul 2019 20:36:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CE881693;
	Tue,  2 Jul 2019 20:35:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CE881693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562092601;
	bh=hd+BJ76iX1LDf8Yyom8qfLyvdmmWt+FE8CGqadHtGOY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q/YTnKMoPV1ToYgXzeg+FFxGV5u3AmLW3DzLfrKOZ1Ja6CNd7aci8w3369daBhgUl
	 o0Ay+AFJHI5CZquJLlTn8Ar87/2EJoB8/AxXdStQYyb6yfSdRQPtuUm4oXcLyYa9Cp
	 237su93ovrBmU4WwQdaolhB2b7x1VrYSf2YPT3ss=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2CF8F8011C;
	Tue,  2 Jul 2019 20:32:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0074EF8076A; Mon,  1 Jul 2019 15:43:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.steuer-voss.de (mail.steuer-voss.de [85.183.69.95])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78239F8076A
 for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2019 15:43:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78239F8076A
X-Virus-Scanned: Debian amavisd-new at mail.steuer-voss.de
Received: from pc-niv.weinmann.com (localhost [127.0.0.1])
 by mail.steuer-voss.de (Postfix) with ESMTP id 309B24D08B;
 Mon,  1 Jul 2019 15:43:07 +0200 (CEST)
From: Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Andreas Dannenberg <dannenberg@ti.com>, "Andrew F. Davis" <afd@ti.com>,
 Kate Stewart <kstewart@linuxfoundation.org>
Date: Mon,  1 Jul 2019 15:42:50 +0200
Message-Id: <cover.1561988282.git.nikolaus.voss@loewensteinmedical.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190628143037.GH5379@sirena.org.uk>
References: <20190628143037.GH5379@sirena.org.uk>
X-Mailman-Approved-At: Tue, 02 Jul 2019 20:32:20 +0200
Cc: linux-acpi@vger.kernel.org, alsa-devel@alsa-project.org, nv@vosn.de,
 linux-kernel@vger.kernel.org,
 Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>
Subject: [alsa-devel] [PATCH v2 0/2] ASoC: tas5720.c: add ACPI enumeration
	support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Patch 1 aggregates variant specific stuff in a struct which is
directly referenced in the id tables (no functional change).

Patch 2 actually adds ACPI IDs for the two DAC variants and uses the
device match API to get the variant in a firmware agnostic manner.

v2:
- split patch into series as suggested by Mark Brown and Andrew F. Davis.
- don't integrate variant data into variant struct but reference it
  (suggested by Andrew F. Davis).

Nikolaus Voss (2):
  ASoC: tas5720.c: cleanup variant management
  ASoC: tas5720.c: add ACPI enumeration support

 sound/soc/codecs/tas5720.c | 111 +++++++++++++++----------------------
 1 file changed, 46 insertions(+), 65 deletions(-)

-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
