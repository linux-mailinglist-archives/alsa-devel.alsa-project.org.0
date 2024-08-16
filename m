Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DB3954E4F
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Aug 2024 17:58:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 051BD2C1D;
	Fri, 16 Aug 2024 17:58:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 051BD2C1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723823903;
	bh=t+EqLwjorMrygoysJLVlVpV6+2GHXFKVPamtG5fTN/c=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=mt6KcEl1j/BnD43L4eRB8Zt3GCg4QINS29GHPTdNIQe86TWPPJ4CbUDjBASM0rLIC
	 /g6wmtHJkPREUo1SGLJldYVw3xtQiTeLK6cYkXECYr193G4kOvYbRE/jo9LQRutj6k
	 4xnh8soVE3nKJOUTAEfNRKEhmQSDn31FbK3dDwmg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6CB6F80517; Fri, 16 Aug 2024 17:57:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A40A0F805AF;
	Fri, 16 Aug 2024 17:57:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C27CF80423; Fri, 16 Aug 2024 17:57:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DE8DF8016E
	for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2024 17:57:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DE8DF8016E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1723823861260833979-webhooks-bot@alsa-project.org>
References: <1723823861260833979-webhooks-bot@alsa-project.org>
Subject: Use PyBytes and not Unicode strings for IEC958 values
Message-Id: <20240816155745.6C27CF80423@alsa1.perex.cz>
Date: Fri, 16 Aug 2024 17:57:45 +0200 (CEST)
Message-ID-Hash: GTAPKHQU4NSBF3RYVASQEBE2WWSLOWG4
X-Message-ID-Hash: GTAPKHQU4NSBF3RYVASQEBE2WWSLOWG4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GTAPKHQU4NSBF3RYVASQEBE2WWSLOWG4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-python pull request #14 was edited from tormodvolden:

Suggested fix for #13.

- the first commit is not strictly related but also needed to avoid hctltest1.py crashing with my audio devices, where some have info.count = 0. Let me know if more information is needed. I don't know if this is expected or if a warning should be issued.

- I went for PyBytes instead of PyByteArray
 
- for setting values, if the provided PyBytes value is shorter than the value, it will be zero-padded.
  - if it is too long, it will be silently truncated
 
- following the existing code style, no empty lines were inserted, but this could help readability

- the third commit is not for fixing the crash, but for fixing set_tuple() to actually do anything for IEC958

- I haven't changed the reference counting, which seems wrong to me in the original code as well. This would be a different issue.

Request URL   : https://github.com/alsa-project/alsa-python/pull/14
Patch URL     : https://github.com/alsa-project/alsa-python/pull/14.patch
Repository URL: https://github.com/alsa-project/alsa-python
