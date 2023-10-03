Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F4D7B6DAE
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Oct 2023 17:59:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E386E0D;
	Tue,  3 Oct 2023 17:58:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E386E0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696348773;
	bh=x4+F/ayjzolbI5Z0chsY8fDErsz5v4RnO2hda7AbeCk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ACmtPrykDQIb/8HZyhHH4oEFbeoXvZ/+opcOHeXCBkeu1rg4NzFiCdvnTg8iyhkQR
	 bK7ESp2txaH9mGKACaW9sugNSvRTKGXdwPMwZLoO59Q3KgpEPm9iCdJx8O84R51Md7
	 DsxyG1xXOlTsZKgim1aXmOVlPs9AaR2CjtbOCiXI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F11E0F801EB; Tue,  3 Oct 2023 17:58:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 309B6F8055C;
	Tue,  3 Oct 2023 17:58:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27E26F80570; Tue,  3 Oct 2023 17:58:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8947F80310
	for <alsa-devel@alsa-project.org>; Tue,  3 Oct 2023 17:58:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8947F80310
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IBYUGpgV
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id D9910B81B67;
	Tue,  3 Oct 2023 15:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0063C433C9;
	Tue,  3 Oct 2023 15:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696348710;
	bh=x4+F/ayjzolbI5Z0chsY8fDErsz5v4RnO2hda7AbeCk=;
	h=From:To:Cc:Subject:Date:From;
	b=IBYUGpgVFFgQoig5s2QW9LJjtYjJMW/WRBBlkYxbnXnMZ72pTEve2G2zYTs8NlzQC
	 DMROuAtz1IOdXT2P7PH5FdCV2TyV7+4d+EQjSzOHLqYHZTd2v0m+wPGemgTuUu76+V
	 DzsFOHEzOqMe9GBFpU+3L2CHK+MoMjTj72OQPe3km4ANp0YzfFJ++XYMhXZ8wWlyiM
	 F3Oq2/pvgfp6fu79JHz3ushUpTm2PB7R06dNmYLJ0BqJJnrOzgNc5xV1XIWgYr7+B3
	 pXaj4vaMuVdbf4wYl6hR62AurNdj0Cy3OqHOzg6idqQCl6mCJSnW5UvTMnvyXrwNW2
	 UGGkHRPlmsqdA==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan+linaro@kernel.org>)
	id 1qnhnF-00074l-2r;
	Tue, 03 Oct 2023 17:58:41 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 0/7] ASoC: codecs: wcd938x: fix probe and bind error handling
Date: Tue,  3 Oct 2023 17:55:51 +0200
Message-ID: <20231003155558.27079-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MEQ2JI4VGOL43KWL5SRAPHN467AIHEJO
X-Message-ID-Hash: MEQ2JI4VGOL43KWL5SRAPHN467AIHEJO
X-MailFrom: johan+linaro@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MEQ2JI4VGOL43KWL5SRAPHN467AIHEJO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The wcd938x codec driver happily ignores error handling, something which
has bitten us in the past when we hit a probe deferral:

	https://lore.kernel.org/lkml/20230705123018.30903-1-johan+linaro@kernel.org/

Fix up the remaining probe and component bind paths that left resources
allocated and registered after errors to avoid similar future issues.

Johan


Johan Hovold (7):
  ASoC: codecs: wcd938x: drop bogus bind error handling
  ASoC: codecs: wcd938x: fix unbind tear down order
  ASoC: codecs: wcd938x: fix resource leaks on bind errors
  ASoC: codecs: wcd938x: fix regulator leaks on probe errors
  ASoC: codecs: wcd938x: fix runtime PM imbalance on remove
  ASoC: codecs: wcd938x-sdw: fix use after free on driver unbind
  ASoC: codecs: wcd938x-sdw: fix runtime PM imbalance on probe errors

 sound/soc/codecs/wcd938x-sdw.c | 27 +++++++++++-
 sound/soc/codecs/wcd938x.c     | 76 +++++++++++++++++++++++++---------
 2 files changed, 83 insertions(+), 20 deletions(-)

-- 
2.41.0

