Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C4C750CD3
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 17:41:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 958976C1;
	Wed, 12 Jul 2023 17:41:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 958976C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689176511;
	bh=wIDy4Ldxd4+i9OmlzEvt7V0TFFLprPKh/f/oN7VNRpA=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XcmRdmZmJ+XLgnZ4Alpem1K3gm6UmDHzUZOTkdleXG2Fr/GKH0M5+xgp+NcAcDk5M
	 9KR8iS8APP9nXfpUIxJvew+nbRRjD+ZVahNmjRGcpof4XvgESjDYmMKkaRSf/Gzeh9
	 gjnwjoG2tNUB4v3JrM/m9psdGuLXeJNYwi0DbN9A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFAB5F8027B; Wed, 12 Jul 2023 17:41:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B7A5F80249;
	Wed, 12 Jul 2023 17:41:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2319F8027B; Wed, 12 Jul 2023 17:40:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C315F80093
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 17:40:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C315F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Zmi6T9Pu
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 51A3D61844;
	Wed, 12 Jul 2023 15:40:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43149C433AB;
	Wed, 12 Jul 2023 15:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689176443;
	bh=wIDy4Ldxd4+i9OmlzEvt7V0TFFLprPKh/f/oN7VNRpA=;
	h=From:Subject:Date:To:Cc:From;
	b=Zmi6T9PuOAkXcMaj4y/q7ZMYB0TPRDi3yeMJVZkIZgdSBCd7XDP5ZaRahyyX36/+r
	 HzjOJpcHIS6MktVILdDt1Z55yKPD81cgTTP+Wfej/mCkoEweV5iJ1lb4L8RatbNTpw
	 UbTpMz6BzEtly1/sax2glsyT660UC4ZLjpXwNapyZOs7gxtY0c0A253QNPseWufCUJ
	 DhSvrbZ5TmjD6nfc9cE9dgoQrSsvpWJ4ZMOf+fp97VRlsss75TkCLKulzFTGJa06cT
	 7vipq557FslwVZlcLbSTVRSvj6EL4nx64r/qvksBzC6rCOUvrFw4G2jMNgkCWf061h
	 9kbObCQlubwZQ==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] ASoC: Improve coverage in default KUnit runs
Date: Wed, 12 Jul 2023 16:40:33 +0100
Message-Id: <20230712-asoc-topology-kunit-enable-v1-0-b9f2da9dca23@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHHJrmQC/x3MQQqDQAwF0KtI1g1Eiyi9Sulian5tUCYyY0uLe
 HcHl2/zNspIhky3aqOEr2XzWFBfKhreIY5g02JqpLlKJzWH7AOvvvjs45+nT7SVEcNzBrfoVVt
 RgXZUgiXhZb8zvz/2/QDV6jRMbAAAAA==
To: Liam Girdwood <lgirdwood@gmail.com>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=790; i=broonie@kernel.org;
 h=from:subject:message-id; bh=wIDy4Ldxd4+i9OmlzEvt7V0TFFLprPKh/f/oN7VNRpA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkrsl1QS1pmVldcxYi+H70yyCvbUuiQCynvzCI8
 WRRcADsZ7iJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK7JdQAKCRAk1otyXVSH
 0DYeB/4+v15wF2X9u3d7Re1k35aXLJXk1/VwrntcT3z+BcRpxWaKL5wlKgis7csg/CARvByVGiL
 x26Fh+UhDFcjxzaibYBZD0WTxNzJFPBsfVif3T5MaIzKUduMwVrF69M1DtVHCBXEO8hW1sHknJ2
 KQqNce7oyPjjsjo5VXFWQzbNZM+jkHJt2OEIKTZ7IEPqgtAoS994IilDSt59rnC5tU7jm0lQpre
 OTYerq9VhEViQXvDga0zVxrL+3S50Zp4P1boYWfg8nHKe+B5GqAenKBiboIpwWwRy3i5Qqgc/w/
 zQGRe8TJcTrpFpq+fDd4Yzvicp3E1qLBbCuo8cSiBCNPqa6d
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: LBO7ZEK7WYZS7LRG6BCXEVZOSAGUEWKK
X-Message-ID-Hash: LBO7ZEK7WYZS7LRG6BCXEVZOSAGUEWKK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LBO7ZEK7WYZS7LRG6BCXEVZOSAGUEWKK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We have some KUnit tests for ASoC but they're not being run as much as
they should be since ASoC isn't enabled in the configs used by default
with KUnit and in the case of the topolofy tests there is no way to
enable them without enabling drivers that use them.  Let's improve that.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (2):
      kunit: Enable ASoC in all_tests.config
      ASoC: topology: Add explicit build option

 sound/soc/Kconfig                            | 11 +++++++++++
 tools/testing/kunit/configs/all_tests.config |  5 +++++
 2 files changed, 16 insertions(+)
---
base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
change-id: 20230701-asoc-topology-kunit-enable-5e8dd50d0ed7

Best regards,
-- 
Mark Brown <broonie@kernel.org>

