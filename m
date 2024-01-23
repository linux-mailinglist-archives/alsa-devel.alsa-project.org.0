Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D6883957F
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jan 2024 17:57:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9C5584C;
	Tue, 23 Jan 2024 17:56:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9C5584C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706029029;
	bh=NpWVul+0kJHPkFkDMQv/ztRnm6Ag7wfkANj8KnoCCSk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Yw0SR9m7QAmjmnhQRuiPd5L3mVnH/SYEz0Txsq6ad2bsZmvBJ3Ux39LYSwNJ7tLXk
	 JZr4RUIIm/11GnnohcOE3R2HZW8dGuVFSXNkEOvI1QgMfMclLSykUKO4xwL8DrPaq2
	 5H3gUOMnE9hKLtKFQlr3qyyqZW7NDLIy/auIqhFY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5A49F8057C; Tue, 23 Jan 2024 17:56:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6D9AF80580;
	Tue, 23 Jan 2024 17:56:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DB75F802BE; Tue, 23 Jan 2024 17:56:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9BFC2F800C1
	for <alsa-devel@alsa-project.org>; Tue, 23 Jan 2024 17:56:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BFC2F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LGTP6V3f
Received: by mail.gandi.net (Postfix) with ESMTPA id 1BC9F1C000B;
	Tue, 23 Jan 2024 16:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706028980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=y6zKOydFE4YNS4qWuRmXdt0aeAzHKR+ZP0mVpRlo5LQ=;
	b=LGTP6V3fmTY22gfMaEsa+k1HpmooZzFOlniOvPPRxw3CfReSZ6dtn0D3jn0MGbW/VRusmW
	cTxZLkolgUyq2mhVAPzoqPvI0pCuYXZqywGt3DB4+V9L/P1R312nRpPrgxOa+0BtMrN3ue
	R9gqHlYRVm2243FMF+jIjs8HIU7eT0DExDLyfrfDpR6pICuJ1o4sIcoXrXntN94Z7bXg1s
	unpHHqpA+7iDKe532C2a5OaRKyT2dxPyfeguysRHmfGl95URWiQd27rWu37HJ+6J+0LUgj
	yDbdFSC8oFhzvAplmF/0XXwqyyoDwREF3fyIwXVNDclKVtv7iyAhCUNn2dAEGw==
From: Herve Codina <herve.codina@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 0/1] Add support for the framer codec
Date: Tue, 23 Jan 2024 17:56:12 +0100
Message-ID: <20240123165615.250303-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: KM53F27WCMP6UDKUJYJYUZ5WFFPCUT2D
X-Message-ID-Hash: KM53F27WCMP6UDKUJYJYUZ5WFFPCUT2D
X-MailFrom: herve.codina@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KM53F27WCMP6UDKUJYJYUZ5WFFPCUT2D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

This patch introduces the framer codec support.

The patch was previously sent as part of a full feature series and
was previously reviewed in that context:
"Add support for QMC HDLC, framer infrastructure and PEF2256 framer" [1]

In order to ease the merge, the full feature series has been split and
needed parts were merged in v6.8-rc1:
 - "Prepare the PowerQUICC QMC and TSA for the HDLC QMC driver" [2]
 - "Add support for framer infrastructure and PEF2256 framer" [3]

The part related to QMC HDLC was sent upstream recently and is under
review [4].

This patch is the last one of the full feature series that was not
merged nor re-sent recently.

Best regards,
Hervé

[1]: https://lore.kernel.org/linux-kernel/20231115144007.478111-1-herve.codina@bootlin.com/
[2]: https://lore.kernel.org/linux-kernel/20231205152116.122512-1-herve.codina@bootlin.com/
[3]: https://lore.kernel.org/linux-kernel/20231128132534.258459-1-herve.codina@bootlin.com/
[4]: https://lore.kernel.org/linux-kernel/20240123164912.249540-1-herve.codina@bootlin.com/

Patch extracted:
  - Patch 1 : full feature series patch 26

Herve Codina (1):
  ASoC: codecs: Add support for the framer codec

 sound/soc/codecs/Kconfig        |  15 ++
 sound/soc/codecs/Makefile       |   2 +
 sound/soc/codecs/framer-codec.c | 413 ++++++++++++++++++++++++++++++++
 3 files changed, 430 insertions(+)
 create mode 100644 sound/soc/codecs/framer-codec.c

-- 
2.43.0

