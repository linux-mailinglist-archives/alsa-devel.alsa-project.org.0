Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B04A68A02
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Mar 2025 11:52:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADD01602E4;
	Wed, 19 Mar 2025 11:51:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADD01602E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742381519;
	bh=A8UkRyo2AM5lq0JxCVHSv29Xl7iy5lW9JGS9UnRg2zU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=FEjohOWaLulT86oZqNS8eOgfEZBtHMP6pm6h7Zr/qfT3FU0JaCBqqQu38gReeklVN
	 aMd90ca2e5WMTLGOB5gQ721iWBf61F0N3C0t0J7qr+EguW3uCrKhaSfAHm8Tz3QHPN
	 KTwfjs1KF5XJbMPqnURoFTOJ38QuwjgPbniSLWKM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6F5DF805AC; Wed, 19 Mar 2025 11:51:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A1AAF805BA;
	Wed, 19 Mar 2025 11:51:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77F7AF805A0; Wed, 19 Mar 2025 11:51:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id B6DF3F8001D
	for <alsa-devel@alsa-project.org>; Wed, 19 Mar 2025 11:51:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6DF3F8001D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <182e2eb951814900-webhooks-bot@alsa-project.org>
In-Reply-To: <182e2eb951789c00-webhooks-bot@alsa-project.org>
References: <182e2eb951789c00-webhooks-bot@alsa-project.org>
Subject: Version Bump
Date: Wed, 19 Mar 2025 11:51:21 +0100 (CET)
Message-ID-Hash: DZKGVTMA6WYHV7RMQJ2BRZ3SSFSIJQEX
X-Message-ID-Hash: DZKGVTMA6WYHV7RMQJ2BRZ3SSFSIJQEX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DZKGVTMA6WYHV7RMQJ2BRZ3SSFSIJQEX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #529 was opened from Stormfox2:

Would it be possible to get a version bump to 1.2.13 soon? 
There has been quite a lot of features now that would get submitted with the new release.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/529
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
