Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D7F8AC7D4
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Apr 2024 10:53:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82DF793A;
	Mon, 22 Apr 2024 10:53:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82DF793A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713775992;
	bh=UiNigEV2cBniNIz0bhcCBnSYvnHHEdsY5NtZAnRhzeM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=aS+MhnHRNARbYmiyC+0h1zSL2BETH7qdvmCsm1SKSgyizX2LQ02Ajh43Snw2Aqibc
	 ZMND1STsH7CvB/7+KNLTtPfmDFhINVbGGmG/evAjxNn8COpXRCpBAMjNjX7+Oz1GTL
	 5wzAlmAfnS1C6v4m38HpG+osFj/9WIw22H6dz1wg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73E4EF80587; Mon, 22 Apr 2024 10:52:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07121F8059F;
	Mon, 22 Apr 2024 10:52:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BA97F8024E; Mon, 22 Apr 2024 10:52:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id A499AF8003A
	for <alsa-devel@alsa-project.org>; Mon, 22 Apr 2024 10:52:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A499AF8003A
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1713775950068747044-webhooks-bot@alsa-project.org>
References: <1713775950068747044-webhooks-bot@alsa-project.org>
Subject: sof-hda-dsp/sof-soundwire: Create "hdmi:" mapping PCMs to allow
 passthrough if supported
Message-Id: <20240422085234.3BA97F8024E@alsa1.perex.cz>
Date: Mon, 22 Apr 2024 10:52:34 +0200 (CEST)
Message-ID-Hash: C35RRXNKP3D427YEFVCC5CVW3CGTK3LY
X-Message-ID-Hash: C35RRXNKP3D427YEFVCC5CVW3CGTK3LY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C35RRXNKP3D427YEFVCC5CVW3CGTK3LY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #411 was opened from ujfalusi:

Hi,

SOF with IPC4 can use 'ChainDMA' on selected PCMs (HDMI/DP currently) which allows them to be used for bytestream passthrough since the data is passed through unmodified.
The kernel will list the PCMs with ChainDMA to the card's components list:
https://github.com/thesofproject/linux/pull/4921
For example for sof-dsp-hda cards `iec61937-pcm:5,4,3` will be added.

For user space to use HDMI passthrough, the `hdmi:` PCM device should be present correctly mapping to the machine, for example for sof-dsp-hda:
```
aplay -L | grep hdmi

hdmi:CARD=sofhdadsp,DEV=0
hdmi:CARD=sofhdadsp,DEV=1
hdmi:CARD=sofhdadsp,DEV=2
```
This PR does this by
1. Checking the `iec61937-pcm` indexes against the expected HDMI devices (sof-dsp-hda: 3-5, sof-soundwire: 5-7)
2. If there is a match (passthrough can be supported) then we will create three conf files:

The generated files are:
[1] /var/lib/alsa/conf.d/42-sof-hdmi.conf
[2] /var/lib/alsa/card[card_number].conf.d/30-sof-hdmi-common.conf
[3] /var/lib/alsa/card[card_number].conf.d/31-sof-hdmi.conf

[1] includes the pcm/iec958.conf and pcm/hdmi.conf to global space of
    alsaconf to be used by the card macros
[2] Card specific macros for hdmi PCM definition, mapping
[3] Card specific definitions of the three HDMI port

Note for [1]: I needed to use `shell "echo '...` since the `cfg-save` would expand the includes into the saved config file and that just does not result a working alsa configuration.

@perexg, I'm sure all this can be done in a cleaner way... We cannot do this unconditionally as if the HDMI is not using ChainDMA (and SOF is not IPC4) then the passthrough is not possible since the firmware might touch the data.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/411
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/411.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
