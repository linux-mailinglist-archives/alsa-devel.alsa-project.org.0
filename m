Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1290C7E9B78
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 12:53:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FA43829;
	Mon, 13 Nov 2023 12:52:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FA43829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699876418;
	bh=flFHCHrjeMGH364fzvA3+5ijnFeGZeUEGP5HYPtPK6s=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gfEaT/F/LsWiGygEX2LBo8oWc7eeL3JxwmNXsrWcHtyBIQDEert3tzq1EJEDs9Ng9
	 NAln6ZfgxMMZrEIcIXQvmZuNH2HCYFp6eGIEW2GwvW3+GyljruFmSwJ5l/8b9H6JRv
	 Wsfq272KFf97JWc9w0g5qtzLGxfgxiUy3smNon7c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89F49F80589; Mon, 13 Nov 2023 12:51:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7A64F805A9;
	Mon, 13 Nov 2023 12:51:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 450C5F801D5; Sun, 12 Nov 2023 17:55:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.malych.org (gateway.malych.org [185.150.1.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F260F80152
	for <alsa-devel@alsa-project.org>; Sun, 12 Nov 2023 17:55:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F260F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=malych.org header.i=@malych.org header.a=rsa-sha256
 header.s=dkim header.b=c9Duai2M
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C641FAA8CB4;
	Sun, 12 Nov 2023 17:54:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=malych.org; s=dkim;
	t=1699808097; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=eAC0I710PoxZTn/0/FlbsP7dzbrDcfhVJ7sO0L74N+k=;
	b=c9Duai2M6qcLDSGPMzZ/Bf1UAzUk4vXkd2iF/GWzkYtp7NnrThRvqnnuux8PCzvMbdus3h
	i8YmCEQvAP8EqxvmyNWxSICuC48PiA6ozBcceyIRLdYOCY3ze9qWCQSsOimbAFdH6AOzYP
	vS33q3jy09MyZQ4HLnrMneiYNqkxiqEJuXTYHDbunVaJARDLB6dcjYq1Mrc6tl1xTo9H2v
	8EzzJcQfdI+kNsODv/YivN5Sgi45WgKztyUC62zKRgqvlX6+yI2iYkG43LAx2bRAB/WSfH
	dm1V8kCN2+TGF9/5Mt9C9kERW7Qy8WOSDfI/W0MekL5Z9WGCSNQvMmW+uj90aA==
From: Matus Malych <matus@malych.org>
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Matus Malych <matus@malych.org>
Subject: [PATCH] ASoC: amd: yc: Add HP 255 G10 into quirk table
Date: Sun, 12 Nov 2023 17:54:04 +0100
Message-Id: <20231112165403.3221-1-matus@malych.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-MailFrom: matus@malych.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: L6RCVXZGDED7MGX4XASIVYULT772MJ2H
X-Message-ID-Hash: L6RCVXZGDED7MGX4XASIVYULT772MJ2H
X-Mailman-Approved-At: Mon, 13 Nov 2023 11:51:20 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L6RCVXZGDED7MGX4XASIVYULT772MJ2H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

HP 255 G10's internal microphone array can be made
to work by adding it to the quirk table.

Signed-off-by: Matus Malych <matus@malych.org>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 15a864dcd7bd..e2a510443bf1 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -367,6 +367,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "8A3E"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "8B2F"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.34.1

