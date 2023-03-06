Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C06D6AC55F
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 16:34:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E751111C;
	Mon,  6 Mar 2023 16:33:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E751111C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678116889;
	bh=JGgYx/uI5aY9ZoGSaizxDs76bAvvcZ+rsvaHP2l/hnY=;
	h=From:Subject:Date:To:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aOxa8+ANKOS1XMo34PWKwx22kPDa04qkK39lHpP+vbQfnIO1bVBzIyo+72qgRk9aQ
	 pbCs3x8X1yy25GMd7oa+RKhHOgtcbKSMqi18wd6GgGL7tjhN4H//ThjxF7FF8KRzBt
	 khE4EyLJrkRFD6q+poQ05RJQzAXEkDLhVRDJXtXM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C9D0F800DF;
	Mon,  6 Mar 2023 16:33:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08A3EF80482; Mon,  6 Mar 2023 16:33:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9C84EF800C9
	for <alsa-devel@alsa-project.org>; Mon,  6 Mar 2023 16:33:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C84EF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LwYuWAnp
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1B63461006;
	Mon,  6 Mar 2023 15:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B04AC433EF;
	Mon,  6 Mar 2023 15:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678116816;
	bh=JGgYx/uI5aY9ZoGSaizxDs76bAvvcZ+rsvaHP2l/hnY=;
	h=From:Subject:Date:To:Cc:From;
	b=LwYuWAnpqQgRgelz7boHiqr3Sces2Cd41NLDNo1Och4MKs8LZOjb5bJPKeXjppJUH
	 4E2Ndruc0fxC/CysWs5vRHEtM2LzqYbtSEzD2Z+6XDjI854M5QKEu4oxwQd9+wyHsI
	 CcbzO8EMRbb25s1MFxuZhR7O9Ii47TE94L2KkXls64WfmU/KZCVIzM3aePDqaKzhJS
	 GmweDb4JI2d4dwMexWLB035B+h5SztguGsWyXda92PdgnWIE0X/6q1m/IYfOZ9/FX8
	 qCL/y8ZEqv4pmwu2ponKCn2i3lIqwlLxUXwwhBCTKx/ZMpcHoRcXiiiVomPg2gdLtN
	 PsGQqtlDu8U4g==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] kselftest/alsa: Log card and control information
 during startup
Date: Mon, 06 Mar 2023 15:33:27 +0000
Message-Id: <20230223-alsa-log-ctl-name-v1-0-ac0f10cc4db2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMcHBmQC/x2NQQqDMBAAvyJ77kLcHAL9SulhEze6EKNkpRTEv
 zf2OAPDnGDSVAyewwlNPmq61Q7jY4C0cJ0FdeoM5Mg7Io9cjLFsM6ajYOVVMEcXsndToDFA7yK
 bYGxc03KXx7rfdm+S9fs/vd7X9QOQ+aiueQAAAA==
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shuah Khan <shuah@kernel.org>
X-Mailer: b4 0.13-dev-bd1bf
X-Developer-Signature: v=1; a=openpgp-sha256; l=706; i=broonie@kernel.org;
 h=from:subject:message-id; bh=JGgYx/uI5aY9ZoGSaizxDs76bAvvcZ+rsvaHP2l/hnY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkBgfMGM9Zy2R7dyT5RvU9J/0EKw3gazoO6qRFaOOG
 V79NVtiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZAYHzAAKCRAk1otyXVSH0FqBB/
 9m/MqSkHSNGCQbNj6OnpHOoWQzC+I3KKuUQQKkAw/SfEqz5y2paOZxo1Eju/Bnj2jB6DcipbFoWMWZ
 +2246qEGBTxtOSY59v7LqdrheVOl8GJcKgDpD+tStISYVtCFFhDdqqnfSLXNDlvAXVM5r5cVinkbz0
 k4z8LmJlOE4ACjsIqvCqwyaiLkE9wa8Uwql1cHOLKlSk3MNkXEZDUrG7f19+9DMBMcitnyNhoOE1Kw
 jY5S5XRysl71ZFydgtEWsJyqAA0ymvUpCRN6HVyh+7yXadQpR0GxlR/dLLYqLd88nv+O1wTSqRin4D
 JI4db7Y3aZl6buRkuT75FHCQjrtEru
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: HI3KDER3KMRFYJDQYXNQBSAQIMV2FNTV
X-Message-ID-Hash: HI3KDER3KMRFYJDQYXNQBSAQIMV2FNTV
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HI3KDER3KMRFYJDQYXNQBSAQIMV2FNTV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

These patches help make the logs a bit more friendly to work with by
adding human readable names for cards and controls alongside the numbers
assigned to them even when things are working well.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (2):
      kselftest/alsa - mixer: Always log control names
      kselftest/alsa: Log card names during startup

 tools/testing/selftests/alsa/mixer-test.c | 13 +++++++++++++
 tools/testing/selftests/alsa/pcm-test.c   | 10 ++++++++++
 2 files changed, 23 insertions(+)
---
base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
change-id: 20230223-alsa-log-ctl-name-fb07f30d7217

Best regards,
-- 
Mark Brown <broonie@kernel.org>

