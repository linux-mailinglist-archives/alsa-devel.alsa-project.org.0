Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0BEB7C62
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2019 16:25:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA27D166D;
	Thu, 19 Sep 2019 16:24:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA27D166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568903120;
	bh=r+8wJNQ50sddKiNpq61FUEzTHks2X7dY4G5T8s9Ox78=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=G+N9yr5//Tk2CSTfxGuobdL4yU/Ebpolb5Rl1Cyk/XLxHQrnJMNy0AJ1cIu4NIMqU
	 RiStgZe2Pu6IiC5b5/yNaKp1AqyXbilDRjwRADPyt+eC9LbreSLLVWyPPtCK9hgBf7
	 LDSe1e5t1J+sZD5fD3qAmTs3KUjAILnv8Kyg0q+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8053F80307;
	Thu, 19 Sep 2019 16:23:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10A8FF80361; Thu, 19 Sep 2019 16:23:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mailout3.hostsharing.net (mailout3.hostsharing.net
 [176.9.242.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D009FF80146
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 16:23:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D009FF80146
Received: from h06.hostsharing.net (h06.hostsharing.net [83.223.95.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
 by mailout3.hostsharing.net (Postfix) with ESMTPS id BD045101E6822;
 Thu, 19 Sep 2019 16:23:30 +0200 (CEST)
Received: from mail.home.lxtec.de (unknown [149.172.88.252])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by h06.hostsharing.net (Postfix) with ESMTPSA id 6AF8C6001C5D;
 Thu, 19 Sep 2019 16:23:30 +0200 (CEST)
Received: from localhost ([127.0.0.1])
 by mail.home.lxtec.de with esmtp (Exim 4.92.2 5 (LXTEC))
 id 1iAxLF-0003bi-Ps; Thu, 19 Sep 2019 16:23:29 +0200
X-Virus-Scanned: at mail.home.lxtec.de
Received: from mail.home.lxtec.de ([127.0.0.1])
 by localhost (mail.home.lxtec.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ywp9lCZSM0Kz; Thu, 19 Sep 2019 16:23:29 +0200 (CEST)
Received: from riesebie by mail.home.lxtec.de with local (Exim 4.92.2 5
 (LXTEC)) id 1iAxLF-0003bC-KU; Thu, 19 Sep 2019 16:23:29 +0200
Date: Thu, 19 Sep 2019 16:23:29 +0200
From: Elimar Riesebieter <riesebie@lxtec.de>
To: alsa-devel@alsa-project.org
Message-ID: <20190919142329.35bsdnh5skuj7jl3@toy.home.lxtec.de>
Mail-Followup-To: alsa-devel@alsa-project.org,
 Mark Pearson <mpearson@lenovo.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="een2nhil4phop5qt"
Content-Disposition: inline
Organization: LXTEC
Cc: Mark Pearson <mpearson@lenovo.com>
Subject: [alsa-devel] alsa-lib: Add ucm support for whiskeylake
	sof-skl_hda_card audio
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


--een2nhil4phop5qt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi ALSA devs,

please notice the attached suggestion from Lenovo to support sound
for whiskeylake sof-skl_hda_card audio.

Thanks
Elimar
--=20
  You cannot propel yourself forward by
  patting yourself on the back.

--een2nhil4phop5qt
Content-Type: message/rfc822
Content-Disposition: inline

Return-path: <bounces+20190919-riesebie=lxtec.de@tracker.debian.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2-lxtec_rules1 (2018-09-13) on
	toy.home.lxtec.de
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_LOW
	autolearn=unavailable autolearn_force=no version=3.4.2-lxtec_rules1
Envelope-to: riesebie@mail.home.lxtec.de
Delivery-date: Thu, 19 Sep 2019 15:55:04 +0200
Received: from localhost ([127.0.0.1])
	by mail.home.lxtec.de with esmtp (Exim 4.92.2 5 (LXTEC))
	id 1iAwtj-0001qF-W7
	for <riesebie@mail.home.lxtec.de>; Thu, 19 Sep 2019 15:55:04 +0200
X-Virus-Scanned: at mail.home.lxtec.de
Received: from mail.home.lxtec.de ([127.0.0.1])
	by localhost (mail.home.lxtec.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 99Uo0YonJ3_y for <riesebie@mail.home.lxtec.de>;
	Thu, 19 Sep 2019 15:55:03 +0200 (CEST)
Received: from getmail by mail.home.lxtec.de with local (Exim 4.92.2 5 (LXTEC))
	id 1iAwtj-0001pv-Qz
	for <riesebie@mail.home.lxtec.de>; Thu, 19 Sep 2019 15:55:03 +0200
Delivered-To: unknown
Received: from pop.lxtec.de ([2a01:37:1000::53df:4f63:0]:995) by
  toy.home.lxtec.de with POP3-SSL; 19 Sep 2019 13:55:03 -0000
X-Original-To: riesebie@lxtec.de
Delivered-To: o1300-riesebie@h06.hostsharing.net
Received: from mailin1.hostsharing.net (mailin1.hostsharing.net [83.223.95.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.hostsharing.net", Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
	by h06.hostsharing.net (Postfix) with ESMTPS id E644F2C6837
	for <riesebie@lxtec.de>; Thu, 19 Sep 2019 15:51:08 +0200 (CEST)
Received: from mailly.debian.org (mailly.debian.org [IPv6:2001:41b8:202:deb:6564:a62:52c3:4b72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mailin1.hostsharing.net (Postfix) with ESMTPS id C192516D018
	for <riesebie@lxtec.de>; Thu, 19 Sep 2019 15:51:08 +0200 (CEST)
Received: from ticharich.debian.org ([2001:41c8:1000:21::21:23])
	from C=NA,ST=NA,L=Ankh Morpork,O=Debian SMTP,OU=Debian SMTP CA,CN=ticharich.debian.org,EMAIL=hostmaster@ticharich.debian.org (verified)
	by mailly.debian.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <bounces+20190919-riesebie=lxtec.de@tracker.debian.org>)
	id 1iAwpv-0007Jl-TR
	for riesebie@lxtec.de; Thu, 19 Sep 2019 13:51:07 +0000
Received: from localhost ([::1] helo=ticharich.debian.org)
	by ticharich.debian.org with esmtp (Exim 4.92)
	(envelope-from <bounces+20190919-riesebie=lxtec.de@tracker.debian.org>)
	id 1iAwpv-0005WV-Ig
	for riesebie@lxtec.de; Thu, 19 Sep 2019 13:51:07 +0000
Received: from mailly.debian.org ([2001:41b8:202:deb:6564:a62:52c3:4b72])
	from C=NA,ST=NA,L=Ankh Morpork,O=Debian SMTP,OU=Debian SMTP CA,CN=mailly.debian.org,EMAIL=hostmaster@mailly.debian.org (verified)
	by ticharich.debian.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <debbugs@buxtehude.debian.org>)
	id 1iAwpv-0005WO-CV
	for dispatch+alsa-utils@tracker.debian.org; Thu, 19 Sep 2019 13:51:07 +0000
Received: from quantz.debian.org ([2001:41c8:1000:21::21:28])
	from C=NA,ST=NA,L=Ankh Morpork,O=Debian SMTP,OU=Debian SMTP CA,CN=quantz.debian.org,EMAIL=hostmaster@quantz.debian.org (verified)
	by mailly.debian.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <debbugs@buxtehude.debian.org>)
	id 1iAwpv-0007Jd-13
	for dispatch+alsa-utils@tracker.debian.org; Thu, 19 Sep 2019 13:51:07 +0000
Received: from qa by quantz.debian.org with local (Exim 4.89)
	(envelope-from <debbugs@buxtehude.debian.org>)
	id 1iAwpu-0001LT-N9
	for dispatch+alsa-utils@tracker.debian.org; Thu, 19 Sep 2019 13:51:06 +0000
Received: from buxtehude.debian.org ([2607:f8f0:614:1::1274:39])
	from C=NA,ST=NA,L=Ankh Morpork,O=Debian SMTP,OU=Debian SMTP CA,CN=buxtehude.debian.org,EMAIL=hostmaster@buxtehude.debian.org (verified)
	by quantz.debian.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <debbugs@buxtehude.debian.org>)
	id 1iAwpu-0001Kg-F5
	for alsa-utils@packages.qa.debian.org; Thu, 19 Sep 2019 13:51:06 +0000
Received: from debbugs by buxtehude.debian.org with local (Exim 4.92)
	(envelope-from <debbugs@buxtehude.debian.org>)
	id 1iAwpr-00021c-Oi; Thu, 19 Sep 2019 13:51:03 +0000
X-Loop: owner@bugs.debian.org
Subject: Bug#940730: alsa-utils: Add ucm support for whiskeylake sof-skl_hda_card audio
Reply-To: Mark Pearson <mpearson@lenovo.com>, 940730@bugs.debian.org
Resent-From: Mark Pearson <mpearson@lenovo.com>
Resent-To: debian-bugs-dist@lists.debian.org
Resent-CC: mpearson@lenovo.com, Debian ALSA Maintainers <pkg-alsa-devel@lists.alioth.debian.org>
X-Loop: owner@bugs.debian.org
Resent-Date: Thu, 19 Sep 2019 13:51:01 +0000
Resent-Message-ID: <handler.940730.B.15689010167365@bugs.debian.org>
X-Debian-PR-Message: report 940730
X-Debian-PR-Package: alsa-utils
X-Debian-PR-Keywords: patch
X-Debian-PR-Source: alsa-utils
Received: via spool by submit@bugs.debian.org id=B.15689010167365
          (code B); Thu, 19 Sep 2019 13:51:01 +0000
Received: (at submit) by bugs.debian.org; 19 Sep 2019 13:50:16 +0000
Received: from nrgwon0103w-lp130-02-70-48-230-170.dsl.bell.ca ([70.48.230.170] helo=[127.0.1.1])
	by buxtehude.debian.org with esmtp (Exim 4.92)
	(envelope-from <mpearson@lenovo.com>)
	id 1iAwp5-0001uV-AT
	for submit@bugs.debian.org; Thu, 19 Sep 2019 13:50:16 +0000
Content-Type: multipart/mixed; boundary="===============7914326887900556129=="
MIME-Version: 1.0
From: Mark Pearson <mpearson@lenovo.com>
To: Debian Bug Tracking System <submit@bugs.debian.org>
Message-ID: <156890101471.4425.9268919318144753382.reportbug@debian>
X-Mailer: reportbug 7.5.3~deb10u1
Date: Thu, 19 Sep 2019 09:50:14 -0400
Delivered-To: submit@bugs.debian.org
Delivered-To: alsa-utils@packages.qa.debian.org
Delivered-To: dispatch+alsa-utils@tracker.debian.org
X-Loop: dispatch@tracker.debian.org
X-Distro-Tracker-Keyword: bts
X-Distro-Tracker-Package: alsa-utils
List-Id: <alsa-utils.tracker.debian.org>
X-Debian: tracker.debian.org
X-Debian-Package: alsa-utils
X-PTS-Package: alsa-utils
X-PTS-Keyword: bts
Precedence: list
List-Unsubscribe: <mailto:control@tracker.debian.org?body=unsubscribe%20alsa-utils>

This is a multi-part MIME message sent by reportbug.


--===============7914326887900556129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Package: alsa-utils
Version: 1.1.8-2
Severity: important
Tags: patch

Dear Maintainer,

   * What led up to the situation?
The Lenovo X1 Carbon Gen 7 is using the whiskeylake processor and the audio is
not working on it.
A large part of this is the kernel SOF driver - for which a separate bug is
submitted - but we also need some new files under /usr/share/alsa/ucm/sof-
skl_hda_card to support the new audio devices.

   * What exactly did you do (or not do) that was effective (or ineffective)?
Add the attached HiFi and sof-skl_hda_card.conf files to the
/usr/share/alsa/ucm/sof-skl_hda_card directory

   * What was the outcome of this action?
Devices are correctly detected and configured.

   * What outcome did you expect instead?
NA

Let me know if any questions or concerns. Thanks for all the help!
Mark



-- System Information:
Debian Release: 10.1
  APT prefers stable-updates
  APT policy: (500, 'stable-updates'), (500, 'stable')
Architecture: amd64 (x86_64)

Kernel: Linux 5.2.9 (SMP w/8 CPU cores)
Kernel taint flags: TAINT_UNSIGNED_MODULE
Locale: LANG=en_CA.UTF-8, LC_CTYPE=en_CA.UTF-8 (charmap=UTF-8), LANGUAGE=en_CA.UTF-8 (charmap=UTF-8)
Shell: /bin/sh linked to /usr/bin/dash
Init: systemd (via /run/systemd/system)
LSM: AppArmor: enabled

Versions of packages alsa-utils depends on:
ii  kmod              26-1
ii  libasound2        1.1.8-1
ii  libc6             2.28-10
ii  libfftw3-single3  3.3.8-2
ii  libncursesw6      6.1+20181013-2+deb10u1
ii  libsamplerate0    0.1.9-2
ii  libtinfo6         6.1+20181013-2+deb10u1
ii  lsb-base          10.2019051400
ii  whiptail          0.52.20-8

alsa-utils recommends no packages.

alsa-utils suggests no packages.

-- no debconf information

--===============7914326887900556129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="sof-skl_hda_card.conf"

SectionUseCase."HiFi" {
	File "HiFi"
	Comment "Play HiFi quality Music"
}


--===============7914326887900556129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="HiFi"

# Use case Configuration for skl-hda-card

SectionVerb {

	EnableSequence [
		cdev "hw:sofsklhdacard"
		cset "name='Master Playback Switch' on"
		cset "name='Capture Switch' on"
		
	]

	DisableSequence [
		cdev "hw:sofsklhdacard"
	]

        Value {
        }
}

SectionDevice."Headphone" {
	Comment "Headphone"

	#ConflictingDevice [
        #        "Speaker"
        #]
	
	EnableSequence [
		cdev "hw:sofsklhdacard"
		cset "name='Headphone Playback Volume' 80"
		#cset "name='Headphone Mic Boost Volume' 1"
		cset "name='Headphone Playback Switch' on"
	]

	DisableSequence [
		cdev "hw:sofsklhdacard"
		cset "name='Headphone Playback Switch' off"
	]

	Value {
		PlaybackPCM "hw:sofsklhdacard,0"
		PlaybackChannels "2"
		#JackHWMute "Speaker"
		JackName "sof-skl_hda_card Headphone"
		JackType "gpio"
		JackSwitch "12"
		JackControl "Headphone Jack"
	}
}

SectionDevice."Speaker" {
        Comment "Speaker"

        #ConflictingDevice [
        #        "Headphone"
        #]

        EnableSequence [
                cdev "hw:sofsklhdacard"
                cset "name='Speaker Playback Switch' on"
                cset "name='Speaker Playback Volume' 80"
        ]

        DisableSequence [
                cset "name='Speaker Playback Switch' off"
        ]

        Value {
		PlaybackPCM "hw:sofsklhdacard,0"
		JackHWMute "Headphone"
                PlaybackChannels "2"
        }
}

SectionDevice."Bass Speaker" {
        Comment "Bass Speaker"

#       ConflictingDevice [
#                "Headphone"
#        ]

        EnableSequence [
                cdev "hw:sofsklhdacard"
                cset "name='Bass Speaker Playback Switch' on"
		cset "name='Speaker Playback Switch' on"
		cset "name='Speaker Playback Volume' 80"
        ]

        DisableSequence [
                cset "name='Speaker Playback Switch' off"
                cset "name='Bass Speaker Playback Switch' off"
        ]
        Value {
                PlaybackPCM "hw:sofsklhdacard,0"
                JackHWMute "Headphone"
                PlaybackChannels "2"
        }
}

SectionDevice."Headset" {
	Comment "Headset Mic"

        ConflictingDevice [
                "DMIC Stereo"
        ]

        EnableSequence [
                cdev "hw:sofsklhdacard"
#		cset "name='Headphone Mic Boost Volume' 1"
#		cset "name='Capture Switch' on"
        ]

        DisableSequence [
                cdev "hw:sofsklhdacard"
#		cset "name='Capture Switch' off"
        ]

        Value {
                CapturePCM "hw:0,0"
                CaptureChannels "2"
		JackControl "Mic Jack"
#		JackHWMute "DMIC Stereo"
        }
}

SectionDevice."Dmic" {
        Comment "DMIC Stereo"

        ConflictingDevice [
                "Headset Mic"
        ]

        EnableSequence [
                cdev "hw:sofsklhdacard"
#		cset "name='Capture Switch' on"
                cset "name='PGA10.0 10 Master Capture Volume' 75"
        ]

        DisableSequence [
                cdev "hw:sofsklhdacard"
#		cset "name='Capture Switch' off"
        ]

        Value {
                CapturePCM "hw:0,6"
                CaptureChannels "2"
#		JackHWMute "Headset Mic"
        }
}

SectionDevice."HDMI1" {
        Comment "HDMI1/DP1 Output"

#        ConflictingDevice [
                # "Headset"
#        ]

        EnableSequence [
                cdev "hw:sofsklhdacard"
                cset "name='hif5-0 Jack Switch' on"
                cset "name='Pin5-Port0 Mux' 1"
        ]

        DisableSequence [
                cdev "hw:sofsklhdacard"
                cset "name='Pin5-Port0 Mux' 0"
                cset "name='hif5-0 Jack Switch' off"
        ]

        Value {
                PlaybackPCM "hw:0,3"
                PlaybackChannels "2"
                JackControl "HDMI/DP, pcm=11 Jack"
                # JackHWMute "Headset"
        }
}

SectionDevice."HDMI2" {
        Comment "HDMI2/DP2 Output"

#        ConflictingDevice [
                # "Headset"
#        ]

        EnableSequence [
                cdev "hw:sofsklhdacard"
                cset "name='hif6-0 Jack Switch' on"
                cset "name='Pin6-Port0 Mux' 2"
        ]

        DisableSequence [
                cdev "hw:sofsklhdacard"
                cset "name='Pin6-Port0 Mux' 0"
                cset "name='hif6-0 Jack Switch' off"
        ]

        Value {
                PlaybackPCM "hw:0,4"
                PlaybackChannels "2"
                JackControl "HDMI/DP, pcm=12 Jack"
                # JackHWMute "Headset"
        }
}

SectionDevice."HDMI3" {
        Comment "HDMI3/DP3 Output"

#        ConflictingDevice [
                # "Headset"
#        ]

        EnableSequence [
                cdev "hw:sofsklhdacard"
                cset "name='hif7-0 Jack Switch' on"
                cset "name='Pin7-Port0 Mux' 3"
        ]

        DisableSequence [
                cdev "hw:sofsklhdacard"
                cset "name='Pin7-Port0 Mux' 0"
                cset "name='hif7-0 Jack Switch' off"
        ]

        Value {
                PlaybackPCM "hw:0,5"
                PlaybackChannels "2"
                JackControl "HDMI/DP, pcm=13 Jack"
                # JackHWMute "Headset"
        }
}


--===============7914326887900556129==--


--een2nhil4phop5qt
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--een2nhil4phop5qt--
