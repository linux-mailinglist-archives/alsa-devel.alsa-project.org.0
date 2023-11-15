Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 260E07ED5E6
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Nov 2023 22:18:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23D7A84D;
	Wed, 15 Nov 2023 22:17:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23D7A84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700083105;
	bh=xiNb7WhTo9RhvtZLzP5lGqqNJItn9dU2oapi/X/K8iI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=MKVxiWq+ufmIV44psbhPWeAtqTlaMXtqhJDuOWUsiMtbrZ1ZO+zcf3SsmcJzrc7fi
	 gC8cGS1mMDl8Bk2+KpMjfTowPprpUGyuu3qdUjBwacdO2GC7N8ua5a+oRF8ILpZDSj
	 5SFvYthOPkul3M/OIcrq4WB7jS9sW8DThUZ1aFOk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E4E4F80549; Wed, 15 Nov 2023 22:17:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C534F80166;
	Wed, 15 Nov 2023 22:17:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43F78F801D5; Wed, 15 Nov 2023 22:17:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B5EAF80093
	for <alsa-devel@alsa-project.org>; Wed, 15 Nov 2023 22:17:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B5EAF80093
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1700083044504610777-webhooks-bot@alsa-project.org>
References: <1700083044504610777-webhooks-bot@alsa-project.org>
Subject: pcm: fix stack allocation inside a loop
Message-Id: <20231115211729.43F78F801D5@alsa1.perex.cz>
Date: Wed, 15 Nov 2023 22:17:29 +0100 (CET)
Message-ID-Hash: J2ZB5XPDMZJ6PFYAQ4IZ7RM7PDVXKEHW
X-Message-ID-Hash: J2ZB5XPDMZJ6PFYAQ4IZ7RM7PDVXKEHW
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J2ZB5XPDMZJ6PFYAQ4IZ7RM7PDVXKEHW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib pull request #363 was opened from szsam:

Using alloca in a loop can lead to a stack overflow. Fix by using malloc and free.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/363
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/363.patch
Repository URL: https://github.com/alsa-project/alsa-lib
