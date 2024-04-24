Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A48058B06EB
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Apr 2024 12:06:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A18B6E68;
	Wed, 24 Apr 2024 12:06:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A18B6E68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713953213;
	bh=awSVwD04MQGPoIfLjY6MLztUosndOjE9LFw1Y+spunQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=soQSjoe1THRcOWQp6kvRskv/HcPMngdEnDAFuQm2yTUg/zumWbB9qkcrryiAkQsCo
	 ZDBoXCiV67lntf9SlMMJs6Y7I12reV3z6y9rDYieNPVXcwFd6vgUXxP97dBxPFRAhG
	 2bFq0eNw9El0rX0yPH3a/luLbj1SbzFUyHMbmwls=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC0C3F80588; Wed, 24 Apr 2024 12:06:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1ED45F800B5;
	Wed, 24 Apr 2024 12:06:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADB9CF80423; Wed, 24 Apr 2024 12:06:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D223F8003C
	for <alsa-devel@alsa-project.org>; Wed, 24 Apr 2024 12:06:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D223F8003C
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1713953171087199926-webhooks-bot@alsa-project.org>
References: <1713953171087199926-webhooks-bot@alsa-project.org>
Subject: UCM Path condition type does not support variables as file path
Message-Id: <20240424100616.ADB9CF80423@alsa1.perex.cz>
Date: Wed, 24 Apr 2024 12:06:16 +0200 (CEST)
Message-ID-Hash: C3OBBLNXXWPVJXGHLGWSJW4H6TGURY3G
X-Message-ID-Hash: C3OBBLNXXWPVJXGHLGWSJW4H6TGURY3G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C3OBBLNXXWPVJXGHLGWSJW4H6TGURY3G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #395 was opened from singalsu:

To control audio processing in SOF I want to do do this:

```
Define.SpeakerIirBlob "${ConfTopDir}/sof/ipc4/eq_iir/highpass_100hz_0db_48khz.blob"
Define.SpeakerFirBlob "${ConfTopDir}/sof/ipc4/eq_fir/pass.blob"
Define.SpeakerDrcBlob "${ConfTopDir}/sof/ipc4/drc/spk_default.blob"
Define.HeadphoneIirBlob "${ConfTopDir}/sof/ipc4/eq_iir/pass.blob"
Define.HeadphoneFirBlob "${ConfTopDir}/sof/ipc4/eq_fir/pass.blob"
Define.ProductConfigSOF "/sof/product_configs/${CardLongName}.conf"
Define.FullPathToIt "${ConfTopDir}${var:ProductConfigSOF}"

If.HasProductConfig {
        Condition {
                Type Path
                Mode read
                Path "${var:FullPathToIt}"
        }
        True {
                Include.product-config.File "${var:ProductConfigSOF}"
        }
}
```

However if I replace line as "Path "/usr/share/alsa/ucm2/sof/product_configs/ACME-2000--foobar.conf" (product name obfuscated for confidentiality) the True condition is achieved. It looks like Path is not evaluating variables.

This feature was added in commit 2f57b404b1c1c376316ca0c6bb5e789e2066298f where the usage is explained.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/395
Repository URL: https://github.com/alsa-project/alsa-lib
