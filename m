Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FF5B1EB25
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Aug 2025 17:10:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A68856024E;
	Fri,  8 Aug 2025 17:09:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A68856024E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754665804;
	bh=NWPcIaM4q8lJAtoqaF78hksSBrQG4cnnIdGtsNwPFIo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=i48zuDu50N5O0Zl4CST7kOOSFwwJO5SC/DD9yXqLrB0042QWbl7Sk66MF7XGuJWv2
	 UOKYVGAlhJsm/Dh9zFTL4/CZeybDq861zI00IvrHtT1SRVSkt+VwVuYlaJyKLlrFAp
	 OT1spC2sbndzhsdVb9abTv0B2t1uF80Y5id1rs+g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD1E0F805C6; Fri,  8 Aug 2025 17:09:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FB02F805C6;
	Fri,  8 Aug 2025 17:09:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED3C1F8024C; Fri,  8 Aug 2025 17:09:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D49CF800F8
	for <alsa-devel@alsa-project.org>; Fri,  8 Aug 2025 17:09:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D49CF800F8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1859d336f3613500-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/597@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/597@alsa-project.org>
Subject: Qualcomm: Add MONACO-EVK HiFi config
Date: Fri,  8 Aug 2025 17:09:24 +0200 (CEST)
Message-ID-Hash: W5HUSVHDEIVNUXZT2WI47GKTMYWTMERJ
X-Message-ID-Hash: W5HUSVHDEIVNUXZT2WI47GKTMYWTMERJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W5HUSVHDEIVNUXZT2WI47GKTMYWTMERJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #597 was edited from mohsRafi:

Add UCM2 configs for the Qualcomm QCS9075-IQ8-EVK Board to handle:
	- I2S Speaker Amplifier
	- I2S Mic

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/597
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/597.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
