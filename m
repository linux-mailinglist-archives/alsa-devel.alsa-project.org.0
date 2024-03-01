Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3D386DCF7
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Mar 2024 09:23:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B9FF86F;
	Fri,  1 Mar 2024 09:23:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B9FF86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709281421;
	bh=wwpzhuSnCC/WSFYdMVqpW2qKGFzTWgmMbv9qD9KH3tQ=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rp9h69WwJOPyjHT224YAs3BD6HbVWXKwEuWt/bjOxAcbLvzK7NSjjeZ2ISkvs8IY9
	 wg9VOnAKpMb8KadLsI6ZmbLiqq5CunTjKc+CQitJYASlxQUUHqCHkbVv1WjN99QszL
	 ecXAMlGH2moRNg6QZrlCPzggLzxfSB5E9g2OHaQY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25945F80088; Fri,  1 Mar 2024 09:23:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94932F80579;
	Fri,  1 Mar 2024 09:23:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 498B5F801C0; Fri,  1 Mar 2024 09:21:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A72B1F800F0
	for <alsa-devel@alsa-project.org>; Fri,  1 Mar 2024 09:21:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A72B1F800F0
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 4218LRTs82017854,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 4218LRTs82017854
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 1 Mar 2024 16:21:27 +0800
Received: from RTEXMBS05.realtek.com.tw (172.21.6.98) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.32; Fri, 1 Mar 2024 16:21:27 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 1 Mar 2024 16:21:27 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::48bb:4f38:369c:d153]) by
 RTEXMBS01.realtek.com.tw ([fe80::48bb:4f38:369c:d153%9]) with mapi id
 15.01.2507.035; Fri, 1 Mar 2024 16:21:26 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: Enable Headset Mic for Acer NB platform
Thread-Topic: Enable Headset Mic for Acer NB platform
Thread-Index: AdprsUeS3EovqCnhSRm+LniFgnhYIA==
Date: Fri, 1 Mar 2024 08:21:26 +0000
Message-ID: <521cc46507f54cd0ae460fb2e0cf90f8@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.22.102.106]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: 27DAMVFNEW4V6Q64PD62CBT7LJNX5PAU
X-Message-ID-Hash: 27DAMVFNEW4V6Q64PD62CBT7LJNX5PAU
X-MailFrom: kailang@realtek.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/27DAMVFNEW4V6Q64PD62CBT7LJNX5PAU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi,

This patch will enable headset Mic for Acer NB platform.
Many Thanks.

BR,
Kailang
