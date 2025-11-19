Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94193C6EFE9
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Nov 2025 14:46:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30DD060208;
	Wed, 19 Nov 2025 14:46:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30DD060208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1763559997;
	bh=Blhe/QCpw+xhyyL0B3x8hxrbhKWyDaCGR4L/HydXNxc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ZXAbA/xtLJp1C8bVKyAYJy0JgSKvUxVwFxdg1bI43Uk5Rgc2pX73psYcDZgdJ110G
	 J9gg2+qI+zKsHejpf0OYlDkegfYzfkk1YkIdckqXE4p0YuW9qHjcPkFqWgK2yMVkRg
	 XkXUit+dxIRMRh6yxydgDDcK41QIraCi6UPCTu9U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8AAECF805CB; Wed, 19 Nov 2025 14:46:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E1E5F805BB;
	Wed, 19 Nov 2025 14:46:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7824F80171; Wed, 19 Nov 2025 14:45:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E477F8001E
	for <alsa-devel@alsa-project.org>; Wed, 19 Nov 2025 14:45:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E477F8001E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <18796c6f959b4300-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/644@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/644@alsa-project.org>
Subject: ucm2: sof-soundwire: Update cs42l45 JackControls
Date: Wed, 19 Nov 2025 14:45:57 +0100 (CET)
Message-ID-Hash: 4OVWZHQI2IK6AHXUUCY26NJZWDBBUG7S
X-Message-ID-Hash: 4OVWZHQI2IK6AHXUUCY26NJZWDBBUG7S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4OVWZHQI2IK6AHXUUCY26NJZWDBBUG7S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #644 was opened from mstrozek:

Update JackControls to follow machine driver changes [1]

[1] https://github.com/thesofproject/linux/pull/5590

Keeping this PR as a draft until the SOF PR is finalized and merged

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/644
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/644.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
