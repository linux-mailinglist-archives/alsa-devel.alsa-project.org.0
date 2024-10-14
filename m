Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D610699CF7F
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2024 16:55:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DDBDB65;
	Mon, 14 Oct 2024 16:55:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DDBDB65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728917724;
	bh=CkkB0GQO+jDq4jzQtUvKdpUY4Yhf0uSQggbHcvvOQy0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=L6V8sX3HcrrT45fv1fXv6FUdyCVBOTA/wo6vq9KEhaFC8dWGUe7qHH2ZM8PEiHMz9
	 F6QgtwIzSS2yeqHTTC2qAoO/FuE78UqSUYV+IjYCdF/cvR8GdF5WUGf+V2RU57BADb
	 YbYacSPGkZ9jW8OEGHEDz4l6fNVB1qoJkDsHoDkM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B03EF8059F; Mon, 14 Oct 2024 16:54:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 156F7F805B0;
	Mon, 14 Oct 2024 16:54:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E0D6F80448; Mon, 14 Oct 2024 16:54:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 81C4CF80104
	for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2024 16:54:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81C4CF80104
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1728917684794101715-webhooks-bot@alsa-project.org>
References: <1728917684794101715-webhooks-bot@alsa-project.org>
Subject: Debian 12 : no audio
Message-Id: <20241014145447.3E0D6F80448@alsa1.perex.cz>
Date: Mon, 14 Oct 2024 16:54:47 +0200 (CEST)
Message-ID-Hash: CPSYJFTLSZPD4GEJCOUGJ2C2ZLWB2X4N
X-Message-ID-Hash: CPSYJFTLSZPD4GEJCOUGJ2C2ZLWB2X4N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CPSYJFTLSZPD4GEJCOUGJ2C2ZLWB2X4N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #449 was opened from ezawadzki:

After fresh debian 12 installation : 
- Speakers audio : ok
- Headphones : no audio

After installed `alsa-ucm-conf` and followed :
```
systemctl stop alsa-state
rm /var/lib/alsa/asound.state
systemctl start alsa-state
```

Now :
- Speakers audio : no audio (speakers not recognized)
- Headphones : no audio


```
cat /etc/os-release
PRETTY_NAME="Debian GNU/Linux 12 (bookworm)"
```

```
uname -a
Linux debian 6.10.11+bpo-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.10.11-1~bpo12+1 (2024-10-03) x86_64 GNU/Linux
```

```
alsamixer
Card and Chipset : PipeWire
```

Any help ?

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/449
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
