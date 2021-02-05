Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A80E73102E1
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Feb 2021 03:39:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42551167C;
	Fri,  5 Feb 2021 03:38:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42551167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612492756;
	bh=GEKm3pRSoA8iz/yHf0Xz01W/0REZrObA2FS3i4wT+Ac=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gW/EHx39e1Qm9p8qY130/dnMTXG1rAkIuDAp+dpfSt9erFzCU6ralArHxoT51TUXH
	 SQVUKvuMKskeaMzepJFNWbpuwBe1pQXifVkbU2/tQ6RHrxoyhne3N0vxM+kf0TlE7o
	 W3+NcK8ko8i9+4DEPAVTNEXTtA2KwlLL1KEXrv/o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73074F8016E;
	Fri,  5 Feb 2021 03:37:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B224F8015A; Fri,  5 Feb 2021 03:37:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 30182F800C0
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 03:37:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30182F800C0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1612492652230542898-webhooks-bot@alsa-project.org>
References: <1612492652230542898-webhooks-bot@alsa-project.org>
Subject: ucm2: sof-hda-dsp: DMICS may not be present
Message-Id: <20210205023741.4B224F8015A@alsa1.perex.cz>
Date: Fri,  5 Feb 2021 03:37:41 +0100 (CET)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-ucm-conf issue #80 was opened from plbossart:

UCM files assume that when SOF is used, the number of DMICs is between 1 and 4.

That's an invalid assumption in the following two cases:
a) the user plays with kernel parameters to select SOF on a platform without DMIC
options snd_intel_dspcfg dsp_driver=3
b) the user plays with kernel parameters to work-around invalid dmic information, e.g. for UpExtreme the NHLT information reports 4 microphones but none are attached to the connector by default
options snd_sof_intel_hda_common dmic_num=0

In those two cases, the only solution is to comment out the entire 'Mic1' section in ucm2/sof-hda-dsp/HiFi.conf. It'd be nicer to detect this case with the component information

The machine driver currently only provides the cfg-dmics component string when the real or overridden number of dmics is > 0.
The component string is as follows

````
amixer -Dhw:0 info
Card hw:0 'sofhdadsp'/'AAEON-UP_WHL01-V1.0'
  Mixer name	: 'Realtek ALC892'
  Components	: 'HDA:8086280b,80860101,00100000 HDA:10ec0892,160d0892,00100302'
  Controls      : 40
  Simple ctrls  : 15
````
Reported by @worldgeek and confirmed on my platform.

@perexg @kv2019i @libinyang FYI

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/80
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
