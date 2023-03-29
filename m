Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4C96CF5B0
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 23:53:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16BA71E9;
	Wed, 29 Mar 2023 23:52:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16BA71E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680126801;
	bh=0/w2nTHfudeBdNQW+rFGrDVYni/MRhAdMUenjEvtJC4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=HS05UrudpeNDIVZeBOE6VaHXPSPmsbV6QGqAxu4W8xSV5w7uJh8qz6VIyT0I+hGmI
	 pLeCK2pwhe2vxCstBfCXV/5wpm4yxIafiozJg5oALE8uy8MrKp8lDBdmeQHVExiO6d
	 nMIG8SxEe6j+RU37bNL9DZpF5QwxMZEvIN8dzCIk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5308F8032D;
	Wed, 29 Mar 2023 23:45:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FBE4F80423; Wed, 29 Mar 2023 23:45:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 286A0F8024E
	for <alsa-devel@alsa-project.org>; Wed, 29 Mar 2023 23:45:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 286A0F8024E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1680126326643504143-webhooks-bot@alsa-project.org>
References: <1680126326643504143-webhooks-bot@alsa-project.org>
Subject: Does this compile any code?
Message-Id: <20230329214530.8FBE4F80423@alsa1.perex.cz>
Date: Wed, 29 Mar 2023 23:45:30 +0200 (CEST)
Message-ID-Hash: 7GQGVHIUZPBF2NZJTO4YPUGA63UXLNPJ
X-Message-ID-Hash: 7GQGVHIUZPBF2NZJTO4YPUGA63UXLNPJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7GQGVHIUZPBF2NZJTO4YPUGA63UXLNPJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #309 was opened from stefan11111:

If I build the same kernel twice, I get this output when building it the second time:
```
# make
  CALL    scripts/checksyscalls.sh
  DESCEND objtool
Kernel: arch/x86/boot/bzImage is ready  (#17)
```
If I build the kernel again, only changing SND_X86, I get this output:
```
# make
  SYNC    include/config/auto.conf
  CALL    scripts/checksyscalls.sh
  DESCEND objtool
Kernel: arch/x86/boot/bzImage is ready  (#17)

```
It doesn't look like that option compiles any code.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/309
Repository URL: https://github.com/alsa-project/alsa-lib
