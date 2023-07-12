Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 120317510B4
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 20:45:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39ADB206;
	Wed, 12 Jul 2023 20:44:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39ADB206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689187543;
	bh=jxQpbIo1I0nzXMQgOQgWbVJfHnoHgb1BRxk2JAihtkk=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=O/9kKhjjl7wOYjBVYgt1wzx21izCS28ofZHbQNFzQAnYEP6S1bfgFzajNqED4OgGG
	 rxylKx8AefJLRhcM7se/URypZCNwIfgmRVp5hPQaUW/JM8zwAfGvM8tk91FKxVUAcc
	 8dQIQoX3DWIIWeBvqKvvfAxLNEiaJo4ZCUX26oC0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 204AAF80236; Wed, 12 Jul 2023 20:44:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87C85F80236;
	Wed, 12 Jul 2023 20:44:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81334F8024E; Wed, 12 Jul 2023 20:44:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7016EF80153
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 20:44:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7016EF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lL8piW6M
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C5F6E618A2;
	Wed, 12 Jul 2023 18:44:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38801C433C8;
	Wed, 12 Jul 2023 18:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689187481;
	bh=jxQpbIo1I0nzXMQgOQgWbVJfHnoHgb1BRxk2JAihtkk=;
	h=From:Subject:Date:To:Cc:From;
	b=lL8piW6MVMHSuNa4OSxkclXXHrpBffMhNoWbKwZp0WSpgx1ocUebC8hH242NTCBCB
	 7j71WD75fNTuCmcoozYg7yFD0Ebdk8yMie+D0FDUg1pCbGiNDgMMARsVVfSCLEel0J
	 Gbex64VReg/Wkm4k1MPXbuBZc/0KXqIYChkpuU/55IS/Pl/IVqK5FCeemeVaPVBEx2
	 apXqaGjY4YylVqNSirNHpFHHpG4byoatw0es0hhfhsJyxWSY/IyinjLZXkTLcOqS+0
	 xeRctQ4POjNYfWbV03eyPVeUTyVs2Pl1pJyC5FCUZin/UL4KajAWTjjw+PWCzDUjZj
	 y/pyFCXGq7tYg==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/5] ASoC: st: Use maple tree register cache
Date: Wed, 12 Jul 2023 19:44:26 +0100
Message-Id: <20230712-asoc-st-maple-v1-0-46eab2c0ce23@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIr0rmQC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDcwND3cTi/GTd4hLd3MSCnFTdtGTDRIs0A0NTQ1MTJaCegqLUtMwKsHn
 RsbW1AOIWeyVfAAAA
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=969; i=broonie@kernel.org;
 h=from:subject:message-id; bh=jxQpbIo1I0nzXMQgOQgWbVJfHnoHgb1BRxk2JAihtkk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkrvSSfTAV8gNfYLyhRs3lrvDQGQYkR9i1qoctD
 5ilfb/hNx2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK70kgAKCRAk1otyXVSH
 0IpaB/41quctECVIstcf2F9vnawyMxkXnlOYZy9J/ZcelX0mg/M/PFnTmoqFcIOdBo1WwnNxdPL
 INd6XbJqe4Jth6xgpABtn1GfEkNBjrZfHuk+v2UXULb1GHcDHub+TkIsvMP9jWLjkwzarF1Frta
 yfhzSFWnhijxdfvk2qFToBFd2Sm9qwQFju2izZC5av/E5VW27w+YlaWetG8zRfkBM+ICZzr4h8G
 rakSqTzMtQh6iZPoXTt9nOfK4GhtVHVBrtA79ThlWVcR2MgdEbu5yBYxggmPJrCTfuqKHHqoAkM
 VxANP5Eh7BJACTtbY9FX6oZ5dcphX/Yu6aW2ru2cxqNljPZQ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: 54UFKJGOABIKRMOU6TBFQSS6FT5VDUKR
X-Message-ID-Hash: 54UFKJGOABIKRMOU6TBFQSS6FT5VDUKR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/54UFKJGOABIKRMOU6TBFQSS6FT5VDUKR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The maple tree register cache has now got to the point where is is
roughly feature compatible with the rbtree cache, let's convert the ST
drivers to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (5):
      ASoC: sta32x: Update to use maple tree register cache
      ASoC: sta350: Update to use maple tree register cache
      ASoC: sta529: Update to use maple tree register cache
      ASoC: stac9766: Update to use maple tree register cache
      ASoC: sti-sas: Update to use maple tree register cache

 sound/soc/codecs/sta32x.c   | 2 +-
 sound/soc/codecs/sta350.c   | 2 +-
 sound/soc/codecs/sta529.c   | 2 +-
 sound/soc/codecs/stac9766.c | 2 +-
 sound/soc/codecs/sti-sas.c  | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)
---
base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
change-id: 20230701-asoc-st-maple-fc1a8f015154

Best regards,
-- 
Mark Brown <broonie@kernel.org>

