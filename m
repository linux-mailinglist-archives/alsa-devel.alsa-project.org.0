Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBE1807CA4
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 01:01:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8716857;
	Thu,  7 Dec 2023 01:00:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8716857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701907259;
	bh=vAEwS5J7W5Qc792xJS005Ann3rweHSchKUa+dfRtLNA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TmB0Qlc1lDPbC7ytgcRcFWR5OxySVr8btGUXirEKWNJ49AZtO4Lmb1IIXSvL8t0wd
	 F67msRN/QehOjLc6ZzVvrP/yfe/6s1ooqHr+vV7F3hlndmTmEzyGOmlqn6g2vYyK1X
	 DZidZJThy8fbLCH433KXDGdxIaoNQnrNvYKx1boM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A01FEF80579; Thu,  7 Dec 2023 01:00:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55256F8057C;
	Thu,  7 Dec 2023 01:00:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56AA1F8055B; Thu,  7 Dec 2023 01:00:14 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id E01A4F800D2
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 01:00:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E01A4F800D2
Received: from fedori.lan (51b690cd.dsl.pool.telekom.hu
 [::ffff:81.182.144.205])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000716E3.0000000065710B02.00118FFF;
 Thu, 07 Dec 2023 01:00:02 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
  Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
  Gergo Koteles <soyer@irl.hu>
Subject: [PATCH 01/16] ASoC: tas2781: add support for fw version 0x0503
Date: Thu,  7 Dec 2023 00:59:42 +0100
Message-ID: 
 <868fc7939c142a65e1a5d9d42063e6a17aaf420e.1701906455.git.soyer@irl.hu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1701906455.git.soyer@irl.hu>
References: <cover.1701906455.git.soyer@irl.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: FVZSF357JPJSEZ4VHCRBDCF3DYKLUGKY
X-Message-ID-Hash: FVZSF357JPJSEZ4VHCRBDCF3DYKLUGKY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FVZSF357JPJSEZ4VHCRBDCF3DYKLUGKY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It is compatible with the fw version 0x0502.
Already supported by TI's tas2781-linux-driver tree.
https://git.ti.com/cgit/tas2781-linux-drivers/tas2781-linux-driver

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
-- 
2.43.0

