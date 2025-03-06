Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B998BA55003
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Mar 2025 17:03:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4384B60481;
	Thu,  6 Mar 2025 17:03:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4384B60481
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741276990;
	bh=VjbdNO+vXyGvxNhP322ORGp7/iRKT0s/0KpNrqGSB7o=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=OIWHalTHY65VQ8AhAsCWFnslR9nWG+DqdxrXXhp8vVImDkcMZeTDlezWjQlzp1UXf
	 qiviAx/hjk727802KkhZZQDOCC4ejDq4LIOQ/RI4VCSI6cgRkSWilbgFkg5kzlO52Z
	 ab9cAeGpF948t8IlTX83xJ054DeZg3PGFGLDAEMQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78178F805BE; Thu,  6 Mar 2025 17:02:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64060F805BD;
	Thu,  6 Mar 2025 17:02:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7934F804B0; Thu,  6 Mar 2025 17:02:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 33034F80152
	for <alsa-devel@alsa-project.org>; Thu,  6 Mar 2025 17:02:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33034F80152
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1741276948959667206-webhooks-bot@alsa-project.org>
References: <1741276948959667206-webhooks-bot@alsa-project.org>
Subject: HDSPconf missing setting...
Message-Id: <20250306160230.D7934F804B0@alsa1.perex.cz>
Date: Thu,  6 Mar 2025 17:02:30 +0100 (CET)
Message-ID-Hash: EAQMFYYR4A4RG2V3PMBF76H7OH6S2WZY
X-Message-ID-Hash: EAQMFYYR4A4RG2V3PMBF76H7OH6S2WZY
X-MailFrom: github@alsa-project.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EAQMFYYR4A4RG2V3PMBF76H7OH6S2WZY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-tools issue #26 was edited from juanpc2018:

$ alsamixer v1.2.2
![Image](https://github.com/user-attachments/assets/6b2860d4-73a0-4526-9a97-13a7c5d6785a)
![Image](https://github.com/user-attachments/assets/ec8253d0-627a-4dda-a45e-1a2080d20563)

HDSPconf 1.4 from alsa-tools-gui
![Image](https://github.com/user-attachments/assets/d2d1dba5-8da6-43ae-a594-cfd89bdd7e1f)
![Image](https://github.com/user-attachments/assets/17d070d3-067e-4d1b-adf9-131f843a634c)

i dont know why iis called DDS Sample Offset

but it should be a slider similar to HDSPmixer
![Image](https://github.com/user-attachments/assets/3ac4ca5c-df61-4cb3-8e8d-2af8fc44019c)

DDS "Sample Offsett"  is similar to a PLL with a more aggressive rejection of the external clock signal.
IF external clock coming from s/pdif is better vs. RME DDS 200pico second jitter clock,  worsens the clock.
like a blend control:
0% preference for internal DDS clock = 100% preference for external clock,
100% preference for internal DDS clock = 0% preference for external clock.
at:
[100% DDS](https://www.youtube.com/watch?v=zJLw2SF_L-g&t=27s) DDS is the Truck, still follows ext.clock, as a recommendation, Not like an [Orchestra Director](https://www.youtube.com/watch?v=HqCIYWZ5b7k&t=0s)
0% DDS, ext.clock becomes like a Whip, internal like a Horse / Slave / [Circus Lion](https://www.youtube.com/watch?v=zJLw2SF_L-g&t=105s) DDS is the Lion.
Clock [Jitter](https://www.youtube.com/watch?v=zJLw2SF_L-g&t=152s)

Issue URL     : https://github.com/alsa-project/alsa-tools/issues/26
Repository URL: https://github.com/alsa-project/alsa-tools
