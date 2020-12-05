Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3421F2CFBA1
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Dec 2020 15:59:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C52E518A5;
	Sat,  5 Dec 2020 15:58:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C52E518A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607180361;
	bh=gHmD1yvCiyKKEPPsdh0lGfPx+WJohMg/y9jG3T7udJ0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AyqNC1bpAa2bUN4bKApqys/NC8WAab/KE848X3MTsHtfs3oxy+DIg/rlcrhUC7AaP
	 JTmnylh8COWDuMW1dD4tPNjZYPGOkSQos2JfBCM8D93Z3U/yLqxMmoPsXBKjvIW0YG
	 FTilh6PL0qTbxpNNj9Zyo3dHpJx85jyHsnjjY7oQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAFA1F80254;
	Sat,  5 Dec 2020 15:57:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 299C9F8016D; Sat,  5 Dec 2020 15:57:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 3EDCDF800E8
 for <alsa-devel@alsa-project.org>; Sat,  5 Dec 2020 15:57:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EDCDF800E8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1607180258182641029-webhooks-bot@alsa-project.org>
References: <1607180258182641029-webhooks-bot@alsa-project.org>
Subject: thinkpad t14s amd: unable to control built-in mic and headphones mic
 independently
Message-Id: <20201205145745.299C9F8016D@alsa1.perex.cz>
Date: Sat,  5 Dec 2020 15:57:45 +0100 (CET)
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

alsa-project/alsa-ucm-conf issue #64 was opened from tanuk:

I did some investigation on a [pulseaudio bug report](https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/issues/1067), and found that the UCM configuration for the internal mic and headset mic both use "Capture" as the CaptureMixerElem. This means that muting one device mutes also the other (and I guess volume control is shared too). In amixer output I don't see a separate control for the headset mic, but for the internal mic volume I guess "Digital" can be used (there's no switch, though).

So it seems that these changes are needed:
 - don't set CaptureMixerElem, CaptureSwitch or CaptureVolume for the headset mic
 - set the internal mic CaptureMixerElem and CaptureVolume to Digital
 - you may want to also set CaptureMasterElem for both both mics to Capture

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/64
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
