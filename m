Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E927DA54F3B
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Mar 2025 16:34:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DB7460448;
	Thu,  6 Mar 2025 16:34:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DB7460448
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741275256;
	bh=OZKEJAF+cMjiu4fKSzkSUUZ+k0Q4k31RgsKO9pgE3eE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ADg9J9VaHxWoeodBQWSklo86UB3GdhHKlpn55K7F409bxuzOVzfkdxQYCid6ZizFV
	 ZL0RnmPXkMXobwgjwfLKXbzfVp8YplD/etXGFnA5IJnXUIhzDANioYT080wKS23z3G
	 xh/vT77fBJbGxdSn6C7eU7c6+AKfNF7jsI6E7tXE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D81EF805B6; Thu,  6 Mar 2025 16:33:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B620F805B6;
	Thu,  6 Mar 2025 16:33:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 712F4F80154; Thu,  6 Mar 2025 16:33:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id B9BC2F80152
	for <alsa-devel@alsa-project.org>; Thu,  6 Mar 2025 16:33:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9BC2F80152
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1741275212721260071-webhooks-bot@alsa-project.org>
References: <1741275212721260071-webhooks-bot@alsa-project.org>
Subject: HDSPconf missing setting...
Message-Id: <20250306153334.712F4F80154@alsa1.perex.cz>
Date: Thu,  6 Mar 2025 16:33:34 +0100 (CET)
Message-ID-Hash: KHD74FPXDIPPI2E2TAP4TEYLGJG2I2BM
X-Message-ID-Hash: KHD74FPXDIPPI2E2TAP4TEYLGJG2I2BM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KHD74FPXDIPPI2E2TAP4TEYLGJG2I2BM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-tools issue #26 was edited from juanpc2018:

$ alsamixer 1.2.2.
![Image](https://github.com/user-attachments/assets/6b2860d4-73a0-4526-9a97-13a7c5d6785a)
![Image](https://github.com/user-attachments/assets/ec8253d0-627a-4dda-a45e-1a2080d20563)

HDSPconf 1.4 from alsa-tools-gui
![Image](https://github.com/user-attachments/assets/d2d1dba5-8da6-43ae-a594-cfd89bdd7e1f)
![Image](https://github.com/user-attachments/assets/17d070d3-067e-4d1b-adf9-131f843a634c)

i dont know why iis called DDS Sample Offset

but it should be a slider similar to HDSPmixer
![Image](https://github.com/user-attachments/assets/3ac4ca5c-df61-4cb3-8e8d-2af8fc44019c)

DDS "Sample Offsett",  is similar to a PLL with a more aggressive rejection of the external clock signal.
IF the external clock coming from s/pdif is better, vs. RME DDS 200pico second jitter clock,  it worsens the clock.
acts like a blend control:
0% preference for internal DDS clock = 100% preference for external clock,
100% preference for internal DDS clock = 0% preference for external clock.

Issue URL     : https://github.com/alsa-project/alsa-tools/issues/26
Repository URL: https://github.com/alsa-project/alsa-tools
