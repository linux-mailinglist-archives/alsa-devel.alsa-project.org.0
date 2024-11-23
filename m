Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E81429D67CF
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Nov 2024 07:16:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C21115FB;
	Sat, 23 Nov 2024 07:15:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C21115FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732342566;
	bh=ESDzv5/UHxBjBa2diSrueMWyljiTRmo+CnhAYPaTv5A=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ShxuwgFYcUiX/z4Q06GxzWu7SuhkZthhgvziMia2e1Tb2EN+UJO8EZiwPdIEZ0Kv6
	 S1tFqmSstH3lbUXj90k42ZpUJZUBCMSe+aseMyu7gHSaAxNHbgeMEU60w20tOKOvjz
	 CiMkCMa/JIP0fjkmTSgYVW/+kyjBSYl19l/ss9Do=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2527EF805BF; Sat, 23 Nov 2024 07:15:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27091F805B4;
	Sat, 23 Nov 2024 07:15:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64127F80533; Sat, 23 Nov 2024 07:15:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id AD371F80166
	for <alsa-devel@alsa-project.org>; Sat, 23 Nov 2024 07:15:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD371F80166
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1732342517061112881-webhooks-bot@alsa-project.org>
References: <1732342517061112881-webhooks-bot@alsa-project.org>
Subject: TLVs with (size % 4) != 0 make amixer and alsactl crash
Message-Id: <20241123061519.64127F80533@alsa1.perex.cz>
Date: Sat, 23 Nov 2024 07:15:19 +0100 (CET)
Message-ID-Hash: 6LTOVNITLVZSY56EW2B5UOTBU2H6I6IE
X-Message-ID-Hash: 6LTOVNITLVZSY56EW2B5UOTBU2H6I6IE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6LTOVNITLVZSY56EW2B5UOTBU2H6I6IE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #282 was opened from geoffreybennett:

While trying to figure out how TLVs work, I found that if the length field is not a multiple of 4 then amixer and alsactl keep reading past the end of the buffer until they segfault, because size is unsigned. One example here:
```
diff --git a/amixer/amixer.c b/amixer/amixer.c
index 8b8000b..03cc9cb 100644
--- a/amixer/amixer.c
+++ b/amixer/amixer.c
@@ -587,7 +587,7 @@ static void decode_tlv(unsigned int spaces, unsigned int *tlv, unsigned int tlv_
 #endif
        default:
                printf("unk-%u-", type);
-               while (size > 0) {
+               while (size >= sizeof(unsigned int)) {
                        printf("0x%08x,", tlv[idx++]);
                        size -= sizeof(unsigned int);
                }
```

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/282
Repository URL: https://github.com/alsa-project/alsa-utils
