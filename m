Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 028B88123EC
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Dec 2023 01:32:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 872FEDED;
	Thu, 14 Dec 2023 01:31:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 872FEDED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702513924;
	bh=an7IXE67A6VfIWHLYw9NobTapZ7fOHiUWBaeODXMtf0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=p73+aH+YsNI0Y31f+M8iUjE5Mbcfx65htSaF+gEUqxm5Rby7v0Q7szDetUm0SHZif
	 N3jer9LnzzYDqZLSittei/sLtvo89F49fronK4XZD+WoRfKFM+jVyD0Thx3wSrUXfF
	 /rApsZf7+GR5yKK8OvxxYRl00o70WXwJNgEuxHug=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21845F8057D; Thu, 14 Dec 2023 01:31:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3677F80570;
	Thu, 14 Dec 2023 01:31:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA9FAF8001F; Thu, 14 Dec 2023 01:27:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 3B28FF8001F
	for <alsa-devel@alsa-project.org>; Thu, 14 Dec 2023 01:26:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B28FF8001F
Received: from fedori.lan (51b690cd.dsl.pool.telekom.hu
 [::ffff:81.182.144.205])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000071EA5.00000000657A4BC8.001285B7;
 Thu, 14 Dec 2023 01:26:48 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
  Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
  Gergo Koteles <soyer@irl.hu>, stable@vger.kernel.org
Subject: [PATCH] ASoC: tas2781: add support for FW version 0x0503
Date: Thu, 14 Dec 2023 01:25:39 +0100
Message-ID: 
 <98d4ee4e01e834af72a1a0bea6736facf43582e0.1702513517.git.soyer@irl.hu>
X-Mailer: git-send-email 2.43.0
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: JCILQVPJ36AYXETSDDT45V2PW3QIJKRG
X-Message-ID-Hash: JCILQVPJ36AYXETSDDT45V2PW3QIJKRG
X-MailFrom: soyer@irl.hu
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JCILQVPJ36AYXETSDDT45V2PW3QIJKRG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Layout of FW version 0x0503 is compatible with 0x0502.
Already supported by TI's tas2781-linux-driver tree.
https://git.ti.com/cgit/tas2781-linux-drivers/tas2781-linux-driver/

Fixes: 915f5eadebd2 ("ASoC: tas2781: firmware lib")
CC: stable@vger.kernel.org
Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 sound/soc/codecs/tas2781-fmwlib.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index eb55abae0d7b..20dc2df034e9 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -2012,6 +2012,7 @@ static int tasdevice_dspfw_ready(const struct firmware *fmw,
 	case 0x301:
 	case 0x302:
 	case 0x502:
+	case 0x503:
 		tas_priv->fw_parse_variable_header =
 			fw_parse_variable_header_kernel;
 		tas_priv->fw_parse_program_data =

base-commit: ffc253263a1375a65fa6c9f62a893e9767fbebfa
-- 
2.43.0

