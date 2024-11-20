Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAACC9D3C91
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2024 14:31:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3382314EB;
	Wed, 20 Nov 2024 14:31:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3382314EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732109508;
	bh=B2SU5Hdd0AcR+ofdgNmA3FkKyF7TAndl+/WqRudhkvM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=N9g9iQA+zh2nikupaF/vDW8T15P5c9KFeWZhS3sQQ0wtb2zKeyHoTh0Qpq+KmVQU6
	 7CjZGqW8/JYx7L15hlXPAUkzlDuxM+ZaYtb0E96SCxCcDHUgX3Vm/o0jEwnB+tB8Jk
	 PnhiZKZKZUIxmjw8P5p2mwDKE1DWTQJfs9aNfPOU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB29DF80568; Wed, 20 Nov 2024 14:31:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EA34F80517;
	Wed, 20 Nov 2024 14:31:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38D32F8026D; Wed, 20 Nov 2024 14:31:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E0A8F80124
	for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2024 14:31:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E0A8F80124
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1732109477818476439-webhooks-bot@alsa-project.org>
References: <1732109477818476439-webhooks-bot@alsa-project.org>
Subject: sof-soundwire: cs42l43: Correct CapturePCM and routing
Message-Id: <20241120133120.38D32F8026D@alsa1.perex.cz>
Date: Wed, 20 Nov 2024 14:31:20 +0100 (CET)
Message-ID-Hash: VO3OFQ763VAZP25V3TFHJM4M4TP6BOHH
X-Message-ID-Hash: VO3OFQ763VAZP25V3TFHJM4M4TP6BOHH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VO3OFQ763VAZP25V3TFHJM4M4TP6BOHH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #466 was opened from charleskeepax:

For headset microphone capture the correct PCM device to use is "hw:${CardId},1", "hw:${CardId},4" is for built in microphone capture.

Adjust the routing as well since :0,1 is connected to data port 2 on the codec.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/466
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/466.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
