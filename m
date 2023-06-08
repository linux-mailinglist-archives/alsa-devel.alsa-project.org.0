Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BEC729D5E
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 16:53:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D879204;
	Fri,  9 Jun 2023 16:52:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D879204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686322400;
	bh=8EK/bezEW0Lfz6eJbMYMvE+P2WAOQLIaqRC6wJcRjmM=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FtTBOklRsiyimnL81K96U9w8I8mC2ILcr/GEJSFPG+/WEzZumrIhNaWQT+b6wQYJb
	 CLrqeIqd8YPlDWbuvpmALgoTuU6A3RNcf9JrQsPEBou1Y2f7ZiY0yjvAOkcL6FZ7Qa
	 UopijPPGgL4Zyg2BFiF2J4RK5yB9P7hV9rQdw6E8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51F82F80656; Fri,  9 Jun 2023 16:47:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 439BBF80649;
	Fri,  9 Jun 2023 16:47:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C12C6F80290; Thu,  8 Jun 2023 15:58:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0918DF80155
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 15:58:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0918DF80155
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 378BD24E20F;
	Thu,  8 Jun 2023 21:57:52 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 8 Jun
 2023 21:57:52 +0800
Received: from SD-Server.starfivetech.com (183.27.98.122) by
 EXMBX168.cuchost.com (172.16.6.78) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Thu, 8 Jun 2023 21:57:51 +0800
From: Walker Chen <walker.chen@starfivetech.com>
To: Mark Brown <broonie@kernel.org>, Claudiu Beznea
	<Claudiu.Beznea@microchip.com>, Dan Carpenter <dan.carpenter@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, "Jaroslav
 Kysela" <perex@perex.cz>, Walker Chen <walker.chen@starfivetech.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] Fix error check and cleanup for JH7110 TDM
Date: Thu, 8 Jun 2023 21:57:48 +0800
Message-ID: <20230608135750.11041-1-walker.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [183.27.98.122]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-MailFrom: walker.chen@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: KUPHADL3MMWGBMVE3AHRIWSU5Y36LSNG
X-Message-ID-Hash: KUPHADL3MMWGBMVE3AHRIWSU5Y36LSNG
X-Mailman-Approved-At: Fri, 09 Jun 2023 14:47:26 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KUPHADL3MMWGBMVE3AHRIWSU5Y36LSNG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some minor issues were found during addtional testing and static
analysis. The first patch fix the error check for the return value of
devm_reset_control_array_get_exclusive(). The second patch drop some
unused macros.

Fixes: fd4762b6b5cf ("ASoC: starfive: Add JH7110 TDM driver")

Changes since v1:
- Fix an error check in jh7110_tdm_clk_reset_get().
- Return to use *_BIT to indicate the shift and remove some unused macros.

---
v1: https://lore.kernel.org/all/20230607081439.1517-1-walker.chen@starfivetech.com/

Walker Chen (2):
  ASoC: starfive: Fix an error check in jh7110_tdm_clk_reset_get()
  ASoC: starfive: Remove some unused macros

 sound/soc/starfive/jh7110_tdm.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

-- 
2.17.1

