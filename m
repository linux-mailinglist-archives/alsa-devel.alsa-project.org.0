Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABFD93B9A4
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2024 01:48:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3DE4EDB;
	Thu, 25 Jul 2024 01:48:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3DE4EDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721864890;
	bh=7SsogZY0KySQZylZl9knfIcTE+r17VSz5DHb7t2O9IY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=G6O4orHkIAhlWFAAvWSKhatmPCMzAv1v/QbSDGNdRRBNxu5L299EAecV9ixOD4tnA
	 EpcoQOURUNb2VEP6x1SgFmYCT7MQtRFEHRVIk6q8Ta2zOTmZ43zzc9l0z0aIy5kGYK
	 Y9cCLiAvp0MqQ7QKH+/JKqT556X2o7NGp3uAYSOM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8E53F805B2; Thu, 25 Jul 2024 01:47:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AE45F80580;
	Thu, 25 Jul 2024 01:47:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EF6BF8026D; Thu, 25 Jul 2024 01:47:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id EB194F8007E
	for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2024 01:47:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB194F8007E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1721864849988893032-webhooks-bot@alsa-project.org>
References: <1721864849988893032-webhooks-bot@alsa-project.org>
Subject: [kernel][usb audio class 1] surround channels mapped to wrong alsa
 channel ids
Message-Id: <20240724234733.9EF6BF8026D@alsa1.perex.cz>
Date: Thu, 25 Jul 2024 01:47:33 +0200 (CEST)
Message-ID-Hash: 4ZHJPK2TETGKLH3VVNXXCIIAVEBBGTWH
X-Message-ID-Hash: 4ZHJPK2TETGKLH3VVNXXCIIAVEBBGTWH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4ZHJPK2TETGKLH3VVNXXCIIAVEBBGTWH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #403 was opened from sylware:

In $linux_src/sound/usb/stream.c, function "convert_chmap", in the "uac1_maps"  array, the "left surround" should be SNDRV_CHMAP_RL instead of SNDRV_CHMAP_SL, and the "right surround" should be  SNDRV_CHMAP_RR instead of SNDDRV_CHMAP_SR.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/403
Repository URL: https://github.com/alsa-project/alsa-lib
