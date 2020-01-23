Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 691AE14686C
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jan 2020 13:51:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10A991689;
	Thu, 23 Jan 2020 13:50:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10A991689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579783897;
	bh=LIXmt2h3wN6YoZmyffcxeLmCR5HFFvgThyZdbs1ffsY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aOZokF748HOYFc0E5GWPgzPIqGFoJT3UJ6GjzGu2zJqA3zSZnmwinAN1aLXgf1L+Y
	 IX1GbeiGEqSb/S+d1xqLSV1GmnyChx8mIfrjVwd/Z6f1XL5SMYMlfrg1tElefSKXv6
	 R9CPR5mWvo4QtKvvtckPVQlwSDg0rTTAagDL1f98=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A8A9F801D9;
	Thu, 23 Jan 2020 13:49:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA344F801D9; Thu, 23 Jan 2020 13:49:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SUBJ_ALL_CAPS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from server.feix.family (server.feix.family [80.240.19.227])
 by alsa1.perex.cz (Postfix) with ESMTP id 10DC9F800BA
 for <alsa-devel@alsa-project.org>; Thu, 23 Jan 2020 13:49:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10DC9F800BA
From: Michal Feix <michal@feix.family>
To: alsa-devel@alsa-project.org
Message-ID: <ebe959a0-5272-e7bd-6001-1ce598f7f6be@feix.family>
Date: Thu, 23 Jan 2020 13:49:46 +0100
MIME-Version: 1.0
Content-Language: cs
Subject: [alsa-devel] ASUS T100TAM UCM
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello,

there is no sound working via speakers or headphones jack on Asus T100TAM. Sound works correctly via HDMI or Bluetooth headphones. The chip on this Baytrail machine is correctly recognized as bytcr_rt5640. From dmesg:

bytcr_rt5640 bytcr_rt5640: quirk DMIC1_MAP enabled
bytcr_rt5640 bytcr_rt5640: quirk realtek,jack-detect-source 3
bytcr_rt5640 bytcr_rt5640: quirk realtek,over-current-threshold-microamp 2000
bytcr_rt5640 bytcr_rt5640: quirk realtek,over-current-scale-factor 1
bytcr_rt5640 bytcr_rt5640: quirk MCLK_EN enabled
bytcr_rt5640 bytcr_rt5640: snd-soc-dummy-dai <-> media-cpu-dai mapping ok
bytcr_rt5640 bytcr_rt5640: snd-soc-dummy-dai <-> deepbuffer-cpu-dai mapping ok
bytcr_rt5640 bytcr_rt5640: rt5640-aif1 <-> ssp2-port mapping ok
input: bytcr-rt5640 Headset as /devices/platform/80860F28:00/bytcr_rt5640/sound/card0/input17

After bootup, kernel log is filled with: "Baytrail Audio Port: ASoC: no backend DAIs enabled for Baytrail Audio Port" messages. I do understand this is due to the missing UCM profile for the machine.

I've successfully uploaded the output of alsa-info.sh.

I'm on Arch linux, with latest alsa-ucm-conf 1.2.1.2 which seems not to be sufficient to make sound working on this thing. Is there anything I can provide to help smart Alsa people to help with this?

Thank you,

--
Michal
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
