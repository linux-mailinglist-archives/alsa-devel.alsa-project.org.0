Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDD76D75BE
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 09:46:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B282E89;
	Wed,  5 Apr 2023 09:45:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B282E89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680680774;
	bh=e60gjponf8wDATP0u5aT4qjTpzNg2xFfilxVy6u3Dwo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=JmGn+6foZHkEK2se66Nl0Aww7HbZUu0M3PN/hvuux4DE85xKjqzD1eoVuijFFX8ZT
	 GChPIR13LWcOoiWiBkA/lN2bN61F1ryvOix4ztuOP69kfjAkuImed8aKVKoDsu1Zjq
	 84xaf+SyZ0GJvIR1Clox4meqqUPMxOAu9CmCyFMI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E03FFF80249;
	Wed,  5 Apr 2023 09:45:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A467F8024C; Wed,  5 Apr 2023 09:45:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id DAA8DF80054
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 09:45:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAA8DF80054
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1680680718592668533-webhooks-bot@alsa-project.org>
References: <1680680718592668533-webhooks-bot@alsa-project.org>
Subject: http://www.alsa-project.org/alsa-info.sh doesnt exist
Message-Id: <20230405074520.9A467F8024C@alsa1.perex.cz>
Date: Wed,  5 Apr 2023 09:45:20 +0200 (CEST)
Message-ID-Hash: 3CBXTX5PRVIGB4Q6ERVWY2P5MCOAZH67
X-Message-ID-Hash: 3CBXTX5PRVIGB4Q6ERVWY2P5MCOAZH67
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3CBXTX5PRVIGB4Q6ERVWY2P5MCOAZH67/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #199 was edited from petke:

http://www.alsa-project.org/alsa-info.sh doesnt exist. http status code 404

Looks like alsa-info.sh tries to auto update itself, but as that url doesnt exist. It overwrites itself with empty file.


Edir: If i disabled the auto updating by editing script to 

```
REMOTE_VERSION=$SCRIPT_VERSION
```

Then i can run it.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/199
Repository URL: https://github.com/alsa-project/alsa-utils
