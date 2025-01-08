Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE890A0629A
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jan 2025 17:49:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7998960356;
	Wed,  8 Jan 2025 17:49:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7998960356
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1736354959;
	bh=fivMI50P1tdhIbYtf/ZrSioPmPfHD1c7wBihrAXCTAw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=dMbnlWAI7GqWOmY2BvSl6q7rn2d+q3SbpkjWILy/INw7bsF5CkIFWQmMIG4uXvoxN
	 CLRR174d2dU+CfQAVeJz+AstoOufHR2kiJ/ZVyhBXyDV72Z2bpWZm3c9UTeDujbfA+
	 hJgzyy77VaZDw8XLQXzEUMkeXREXHaXnrSebpDBE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACB9BF805B6; Wed,  8 Jan 2025 17:48:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88AD1F805B6;
	Wed,  8 Jan 2025 17:48:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FCDEF80246; Wed,  8 Jan 2025 17:48:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DB83F800F3
	for <alsa-devel@alsa-project.org>; Wed,  8 Jan 2025 17:48:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DB83F800F3
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1736354918072014809-webhooks-bot@alsa-project.org>
References: <1736354918072014809-webhooks-bot@alsa-project.org>
Subject: Topology: NHLT: Intel: Fix mono DMIC configure for MTL platform
Message-Id: <20250108164840.3FCDEF80246@alsa1.perex.cz>
Date: Wed,  8 Jan 2025 17:48:40 +0100 (CET)
Message-ID-Hash: YFV7SAPNLDUWH7F2VWTQCPSHXQGXDXND
X-Message-ID-Hash: YFV7SAPNLDUWH7F2VWTQCPSHXQGXDXND
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YFV7SAPNLDUWH7F2VWTQCPSHXQGXDXND/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #286 was opened from singalsu:

This change fixes the blob generator for mono microphone configuration. As difference to previous platforms the FIFO packer mono/stereo mode set up in OUTCONTROLx IPM_SOURCE_MODE bit-field.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/286
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/286.patch
Repository URL: https://github.com/alsa-project/alsa-utils
