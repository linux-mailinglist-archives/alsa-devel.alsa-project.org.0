Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7BAB0CD3B
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Jul 2025 00:19:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6DE7601AE;
	Tue, 22 Jul 2025 00:19:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6DE7601AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1753136388;
	bh=4JrRrRRbt+6xRxE/Jy/BhPXZ5IDE84q6zDOiy0wUqEY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=jMaD7P13yy1X1vt3bCScEKy3gzzOYWzcSpYMkF9Pyn74jNVxDSMVMDe+hYIP5K0Cm
	 Y1HAojr86p5zQjCWtiMgn7Obb/db58s+T3EgiysuCy6QWUEZCmPPrRU3N5Kra/rvj/
	 HsFa1mmlsMDq+VpFJFS/04jVC4AE71UPzOJeoiYU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BA98F805C2; Tue, 22 Jul 2025 00:19:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1F70F805C3;
	Tue, 22 Jul 2025 00:19:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4EAF4F804FF; Tue, 22 Jul 2025 00:19:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id A5E1DF800E4
	for <alsa-devel@alsa-project.org>; Tue, 22 Jul 2025 00:19:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5E1DF800E4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <18546436f8cb9f00-webhooks-bot@alsa-project.org>
In-Reply-To: <18546436f7559900-webhooks-bot@alsa-project.org>
References: <18546436f7559900-webhooks-bot@alsa-project.org>
Subject: Cannot write control 'numid=11,iface=HWDEP,name='DDS''
Date: Tue, 22 Jul 2025 00:19:05 +0200 (CEST)
Message-ID-Hash: RD65NKFG7CRCZYRKHEO6ZA4SQCUUKCCV
X-Message-ID-Hash: RD65NKFG7CRCZYRKHEO6ZA4SQCUUKCCV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RD65NKFG7CRCZYRKHEO6ZA4SQCUUKCCV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #305 was opened from rubin55:

When running `alsactl restore` on an RME HDSPe AIO Pro (using the `snd-hdspe` kernel module), I get the following error:

```
# alsactl restore -U
Found hardware: "HDSPe" "RME HDSPe" "" "0x0000" "0x0000"
Hardware is initialized using a generic method
alsactl: set_control:1494: Cannot write control 'numid=11,iface=HWDEP,name='DDS'' : Invalid argument
```

This seems to prevent systemd's `alsa-restore` oneshot from working, although I don't really understand why; running `alsactl store/restore -U` from command line shows the same error, but *does* store/restore volume levels. The same via systemd, logs the errors in `systemd status alsa-restore` but volume levels are never restored.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/305
Repository URL: https://github.com/alsa-project/alsa-utils
