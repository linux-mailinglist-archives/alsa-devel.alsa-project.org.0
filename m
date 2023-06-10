Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A69372AB18
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 13:17:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6D801CE;
	Sat, 10 Jun 2023 13:17:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6D801CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686395872;
	bh=1IwtoYgJzoOVIoSjwX2gtaJ+jJn9htXygRFwTfC4ghs=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=kk3YM34oiAsO+OhWsYdVlV6q5h9OH1KbAldsZtC3EAM+uM4osUV0ItSvJ/q2YJal5
	 En4o8vgtzED56dHM9rYVY4AZuMSWAFqJ0l9U5SXo346ZigKQkQnyEDV8JConmaA/KX
	 pTKcSK+z7h08iMBQXUEiak2oS+TxOm7mQM3LwKvw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C15FF80290; Sat, 10 Jun 2023 13:17:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3FEAF8016C;
	Sat, 10 Jun 2023 13:17:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CCAFCF80290; Sat, 10 Jun 2023 13:16:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56270F800C8
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 13:16:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56270F800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=da38xkvB
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D380D60A09;
	Sat, 10 Jun 2023 11:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85206C433D2;
	Sat, 10 Jun 2023 11:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686395806;
	bh=1IwtoYgJzoOVIoSjwX2gtaJ+jJn9htXygRFwTfC4ghs=;
	h=From:Subject:Date:To:Cc:From;
	b=da38xkvBM4yh/SOdjAAt6kM5QjyWbpS8rcuh+DBM6p+duftgFjLxeL132YmKosNnB
	 w71RqDuISmFpCiy9brhgI4kSmjPAGbs2BKeUleaeS736X/S0MSd5l6BaOmnPVsIUwK
	 U59dLIvLlgac4k2qpJJxv9Aq7KRz4dUT0D0YfV2BSuZ779XZzWkko4xEwvzhDb8m4J
	 DUSJREZYBmFS57xOT7X9HmHhWxGKClUf1Fdk3kAzhnUK3woVfxpSPon5157VEvK5+y
	 o5NV/mM1DT01kuXas4f9d151VUlgmLtvYE+nmdpl/x2yvDSAxw8brzqTjUCSQP1/gP
	 qKIIZ+cLYzXZA==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] ASoC: Use maple tree register cache for Everest Semi
 CODECs
Date: Sat, 10 Jun 2023 12:16:36 +0100
Message-Id: <20230609-asoc-es-maple-v1-0-45ada77f5643@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJRbhGQC/x2N0QqDMAxFf0XybKBaKLhfGXtIazbDtlYSUEH8d
 6uP51wOdwdjFTZ4NDsoL2JScoWubSBNlD+MMlaG3vXeBTcgWUnIhn+af4w+hiEE33GdoDaRjDE
 q5TRd1Vr0e+lZ+S3bffN8HccJ+NB0o3YAAAA=
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=688; i=broonie@kernel.org;
 h=from:subject:message-id; bh=1IwtoYgJzoOVIoSjwX2gtaJ+jJn9htXygRFwTfC4ghs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhFua/otiGWzniaO/D4O7514Edl8yLNMVryzIHynL
 C7Wh3/WJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZIRbmgAKCRAk1otyXVSH0F5mB/
 41aKEXrWENbyIcT/+0FiC2zm+/+zuvmG5ottoPxwiGGE9OW1H56kXgLsBxAw9xqXyGvF+5uvIYVudD
 QWe1TP4PvzfFF+4XE9wm4w1i15NJhKlHuc5hVPMOzSaBx8n+cjW5zeiDDqhg/FTllomUGGb/Cy48Gg
 F3URbbQLhWJkiT9FbS1Wh4LrhzPiftPEpVTr7NAHVvACgjb7iCGTpzMjpt0gQl/7Pv1e0KeExRfTFL
 jcjxnKmOquqG15gyGWEkAws/DFT+8sOat+dbQbRwQp5RkTHZ7zI+TxJIzzqfribDtKmWcCIxSAaxjK
 IKz5f3OHtMMhEqJmioajNHAhoIOyU3
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: EXDYT5LGFIYEILA5L7SLD5FD2CIJ75QL
X-Message-ID-Hash: EXDYT5LGFIYEILA5L7SLD5FD2CIJ75QL
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EXDYT5LGFIYEILA5L7SLD5FD2CIJ75QL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Several of the Everest Semi CODECs only support single register read and
write operations and therefore do not benefit from using the rbtree
cache over the maple tree cache, convert them to the more modern maple
tree cache.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (2):
      ASoC: es8316: Use maple tree register cache
      ASoC: es8328: Use maple tree register cache

 sound/soc/codecs/es8316.c | 2 +-
 sound/soc/codecs/es8328.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 9561de3a55bed6bdd44a12820ba81ec416e705a7
change-id: 20230609-asoc-es-maple-3b696631e609

Best regards,
-- 
Mark Brown <broonie@kernel.org>

