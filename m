Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B580174D96
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Mar 2020 15:02:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0041A16E2;
	Sun,  1 Mar 2020 15:01:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0041A16E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583071349;
	bh=5moYO7AABPehty5TzdHsEKxWxhZGW+iSIX6GPlOiXWk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aP+E5A7q2ATTdxQTwyS66ZyTCJg5EFP6W7AhVVYqKXYMIjys40yWnfuoRggr7s1AZ
	 yKURm3QDtETvVkZLahg9n07tcJs5cEvPYIusvrWp5XpppILDH6ixBIdrRH9tSQ4WbW
	 vS3xGbkmDWbW552RpCzOBYeEVYedYqqwZfzBxShc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EA1AF8013E;
	Sun,  1 Mar 2020 15:00:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52302F80271; Sun,  1 Mar 2020 15:00:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 9B3AAF8025F
 for <alsa-devel@alsa-project.org>; Sun,  1 Mar 2020 15:00:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B3AAF8025F
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1583071211391659975-webhooks-bot@alsa-project.org>
References: <1583071211391659975-webhooks-bot@alsa-project.org>
Subject: Assertion 'jack' failed at modules/alsa/alsa-ucm.c:2158
Message-Id: <20200301140014.52302F80271@alsa1.perex.cz>
Date: Sun,  1 Mar 2020 15:00:14 +0100 (CET)
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

alsa-project/alsa-ucm-conf issue #14 was edited from JeremyFiggins:

Hi, I have the following hardware:

> ~> cat /proc/asound/cards
>  0 [NVidia         ]: HDA-Intel - HDA NVidia
>                       HDA NVidia at 0xf7080000 irq 90
>  1 [Generic        ]: HDA-Intel - HD-Audio Generic
>                       HDAudio-Gigabyte-ALC1220DualCodecs

and I'm running:

> ~> cat /etc/os-release 
> NAME="openSUSE Tumbleweed"
> VERSION="20200228"
> ID="opensuse-tumbleweed"
> ID_LIKE="opensuse suse"
> VERSION_ID="20200228"
> PRETTY_NAME="openSUSE Tumbleweed"
> ANSI_COLOR="0;32"
> CPE_NAME="cpe:/o:opensuse:tumbleweed:20200228"
> BUG_REPORT_URL="https://bugs.opensuse.org"
> HOME_URL="https://www.opensuse.org/"
> LOGO="distributor-logo"

Audio was working until a recent update. Now, I have no audio and when starting PulseAudio, I get:

> ~> pulseaudio 
> W: [pulseaudio] pid.c: Stale PID file, overwriting.
> W: [pulseaudio] alsa-ucm.c: UCM file does not specify 'PlaybackChannels' or 'CaptureChannels'for device Mic1, assuming stereo duplex.
> W: [pulseaudio] alsa-ucm.c: UCM file does not specify 'PlaybackChannels' or 'CaptureChannels'for device Mic2, assuming stereo duplex.
> W: [pulseaudio] alsa-ucm.c: UCM file does not specify 'PlaybackChannels' or 'CaptureChannels'for device Line2, assuming stereo duplex.
> W: [pulseaudio] alsa-ucm.c: UCM file does not specify 'PlaybackChannels' or 'CaptureChannels'for device Headphones, assuming stereo duplex.
> W: [pulseaudio] alsa-ucm.c: UCM file does not specify 'PlaybackChannels' or 'CaptureChannels'for device Line1, assuming stereo duplex.
> W: [pulseaudio] alsa-ucm.c: UCM file does not specify 'PlaybackChannels' or 'CaptureChannels'for device Speaker, assuming stereo duplex.
> E: [pulseaudio] alsa-ucm.c: Assertion 'jack' failed at modules/alsa/alsa-ucm.c:2158, function device_add_hw_mute_jack(). Aborting.
> Aborted (core dumped)

I tracked it down to /usr/share/alsa/ucm2/HDA-Intel/HiFi-dual.conf. If I revert the two commits here (https://github.com/alsa-project/alsa-ucm-conf/commits/master/ucm2/HDA-Intel/HiFi-dual.conf) and then use the version of HiFi-dual.conf before it was moved, then PulseAudio starts normally and I have sound.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/14
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
