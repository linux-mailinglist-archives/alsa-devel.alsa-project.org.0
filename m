Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F6B7570FE
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 02:32:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1BD5E7A;
	Tue, 18 Jul 2023 02:32:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1BD5E7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689640371;
	bh=TnBFqbbzgjL9q9pFRoc5uu6BkdcO9YJ7JVR18QHszz8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h8feRNohHPBRIqh02FxlN2cvIPUQgNPtX8s68Y62S4Yoh0dM83s4uUHajAetCQsFv
	 9fCcfrAsNtiANBEeUZT2vipJPHd8qQuJb/rTM++Tr2TcPkK9jVMorWuaXydD+jNkCT
	 G7+hnjdSmETIg7Y6SJs54sJMtcgpv4aviUKTXP/Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AD4BF805AF; Tue, 18 Jul 2023 02:30:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6D55F8059F;
	Tue, 18 Jul 2023 02:30:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35080F8056F; Tue, 18 Jul 2023 02:30:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C7E3F8047D
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 02:30:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C7E3F8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QFCqQ5kp
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 489C2611E4;
	Tue, 18 Jul 2023 00:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 227CEC433CB;
	Tue, 18 Jul 2023 00:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689640205;
	bh=TnBFqbbzgjL9q9pFRoc5uu6BkdcO9YJ7JVR18QHszz8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QFCqQ5kpDBAZut64is23SI4XYkwbREKPk7YnHtzhOX/44gm1e3W0iCQuWoN0WeXGO
	 v6N/UtRzdGa8z5j176iLY6EvGSgc2kcColzkxtehcH7krcxnBrb/Lr1nsQlcNiySFE
	 ySAuUTl4CR/UFybm39QMKnF0Obr72c//Q19eZudm3E7AjPSnpaEEjwpcUQxyOOAk7S
	 rRpHTtpsYljDBneVm9z+lFExD7ty7C6ZIVSHgUOsR/SkshyYqaHU/kfCI4R1Hgq4Iv
	 6Zt4fhVCgiJ7X+qhcTByDEXmqTPCo/5o1fGBU2T+nEMR9PIrn27zw6pwuM/LYPQH4B
	 zrbyRqmGxlF6A==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 18 Jul 2023 01:28:45 +0100
Subject: [PATCH v2 4/5] kunit: Enable ASoC in all_tests.config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230718-asoc-topology-kunit-enable-v2-4-0ee11e662b92@kernel.org>
References: <20230718-asoc-topology-kunit-enable-v2-0-0ee11e662b92@kernel.org>
In-Reply-To: 
 <20230718-asoc-topology-kunit-enable-v2-0-0ee11e662b92@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=682; i=broonie@kernel.org;
 h=from:subject:message-id; bh=TnBFqbbzgjL9q9pFRoc5uu6BkdcO9YJ7JVR18QHszz8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBktdz7HozPq6/0jZyA+LN1Ps89o2TkTwzkcl5KI
 J3xvqpfRNmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZLXc+wAKCRAk1otyXVSH
 0OFvB/9NgrBslexf8gRgZFmniJLbG2h+DpvBHPNQPNoMULIICq6HOmESVC9hKdYwmPPxJ92sKoN
 K3XTy52yPYwRCOLzALT3ySa0Z1SaKNagy+iV+u3y5XU/gIMRLdABWdb8ePxl7nA54dlUWTlQO/7
 Fr7rypotbMCcxtoBmOzWt2yvBM88Ec5e3mSnUfAFebD7kksS1+rWBt1V7Lf7gqPJJRfFknaX3CT
 3duA4rIUoutsJveB9t+ciZaWXD6LZ4CsswIoWkzxE10yh+KgB8rispipeEsf6HvRVX/WokiXCL+
 Of9HYRLBc6vlT/zez7DgpLV56nl//xTUSX4DB/NR7tWGDtgj
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: M34BZOAVH45DZ2EUPH2ZMER4DWXWGNGL
X-Message-ID-Hash: M34BZOAVH45DZ2EUPH2ZMER4DWXWGNGL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M34BZOAVH45DZ2EUPH2ZMER4DWXWGNGL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There are KUnit tests for some of the ASoC utility functions which are
not enabled in the KUnit all_tests.config, do so.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/kunit/configs/all_tests.config | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/kunit/configs/all_tests.config b/tools/testing/kunit/configs/all_tests.config
index 0393940c706a..13d15bc693fb 100644
--- a/tools/testing/kunit/configs/all_tests.config
+++ b/tools/testing/kunit/configs/all_tests.config
@@ -35,3 +35,7 @@ CONFIG_DAMON_DBGFS=y
 
 CONFIG_SECURITY=y
 CONFIG_SECURITY_APPARMOR=y
+
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_SOC=y

-- 
2.39.2

