Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8235BACC3C
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Sep 2019 12:50:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1524B166B;
	Sun,  8 Sep 2019 12:49:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1524B166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567939836;
	bh=AlIg72tKNZcJkxallVUsTCozsq0fuWwOAF0VtcmErKI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qplfkU24WV9IfaQLmiaNfaLP3IEHS70uZdFXyDoimgn0QB4WmHjMqhWEbY5SBhHL5
	 JyIEZTa806w5KbwRm5lOhg1XzaFqbFicWKDTygIL3Vo3W2FlhtQUddjT3KZe80sShB
	 F+pQEk52Uyeq/unHGB2lp1m5oG2kd/MizDIf2VrU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E4F1F80715;
	Sun,  8 Sep 2019 12:40:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A848F8065B; Sun,  8 Sep 2019 12:40:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 MISSING_DATE, SPF_HELO_PASS, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1D70F805FE
 for <alsa-devel@alsa-project.org>; Sun,  8 Sep 2019 12:39:36 +0200 (CEST)
Received: from server.perex-int.cz (unknown [172.16.0.20])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 58A5EA0040;
 Sun,  8 Sep 2019 12:39:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 58A5EA0040
Received: from alsa-devel.perex.cz (unknown [192.168.102.181])
 by server.perex-int.cz (Perex's E-mail Delivery System) with ESMTP id
 D3D4E140073; Sun,  8 Sep 2019 12:39:33 +0200 (CEST)
MIME-Version: 1.0
From: Jaroslav Kysela <jkysela@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>
Message-Id: <15679391594432724-alsa-devel@perex.cz>
Date: Sun,  8 Sep 2019 12:40:03 +0200 (CEST)
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] Licence change for your alsa-lib UCM commits (Hans de
	Goede: 30 total)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

As discussed, we would like to move the UCM configuration files from the
alsa-lib repository to new alsa-ucm-conf repository with the licence change
from LGPL-2.1 to BSD-3-Clause.

I would like to check, if you agree with this licence change. Please, answer
to this e-mail and write your agreement / disagreement (keep CC to
the alsa-devel mailing list for the archiving purposes).

Thank you for your time and co-operation.

Reference:  https://mailman.alsa-project.org/pipermail/alsa-devel/2019-July/153257.html

List of your commit(s):

  60ed28999a272e1a3d737a9eeee0719b98efd447
    conf/ucm: Add chtrt5645-mono-speaker-analog-mic configuration
  76bc53e69a12163a86e6746fd3011de6b1652043
    conf/ucm: chtrt5645: Fix recording from internal analog microphone
  c22a7f423ddef2a1376bc84f2aafc0a167192ab6
    conf/ucm: chtrt5645: At config for the Asus T100HA
  5a2df9449d0b17e3579bde60ba48244ba24ea604
    conf/ucm: chtrt5645: At config for the Lenovo Ideapad Miix 320
  0f6f2a854f27b5dc10b73b3c84d272a3ebcbd8bc
    conf/ucm: bytcr-rt5640: Add generic bytcr-rt5640 UCM profile
  a5343f6fb66d7572793af330d1f710a17830bc9e
    conf/ucm: bytcr-rt5640: Add long-name UCM profiles
  642b360add63a2e31c782b1820f180e36f8cf2bb
    conf/ucm: bytcr-rt5640: Add default DisableSequence
  f3b26e3b8d60642d95466ce6554d18a0d9e3952a
    conf/ucm: chtnau8824: Add UCM profile for chtnau8824 boards
  e6754783f73ba31a4457335e15b38493607f3b3b
    conf/ucm: chtnau8824: Add Cube iWork8 Air and Pipo W2S specific profiles
  42ab655cbe3d65b046bb224e8ffc7605583197fc
    conf/ucm: bytcr-rt5645: Use the generic bytcr/PlatformEnableSeq.conf
  bdd3d24ae92dd080eb2f6856bf04b443afc3709f
    conf/ucm: bytcr-rt5651: Do not use both DAC1 and HPVOL inputs for HP
  3d284a78ee19c9aa1cdaf60e3e5a6ad0b15d74b2
    conf/ucm: bytcr-rt5651: Configure all volumes at 0dB
  1a08334d83eec663bca3572da61c323ae8ee1375
    conf/ucm: bytcr-rt5651: Start with all outputs and inputs disabled
  0471cc87377d8836bd14566f885b5d01888b6b32
    conf/ucm: bytcr-rt5651: Change Speaker/Headphone en/disable sequences to fix switching
  1bcb531923929807eb16625d8a62deb128c88d04
    conf/ucm: bytcr-rt5651: Use generic SSP enable + disable sequence, support SSP0
  04c6ac2502a15d60e5d29ae89e9263cd5a518220
    conf/ucm: bytcr-rt5651: Fix ADC and Mic capture volumes
  faab50afa9cfc74153b894e1b1fe71ce8bfd4673
    conf/ucm: bytcr-rt5651: Add support for mic input on various pins
  5c8be23b891c30f8706d228121ba3d8a5999d607
    conf/ucm: bytcr-rt5651: Split into 1 .conf file per input / output
  5b39b6b16e231bd320c3c0abd6ebd5bf645a36fd
    conf/ucm: bytcr-rt5651: Add mono speaker output profile
  bd770a44b21685b9b10a94209d1261cabc757b01
    conf/ucm: bytcr-rt5651: Add long-name UCM profiles
  be91b595f814077cbfa8a9de526db6ecfbb2f57b
    conf/ucm: bytcr-rt5651: Add bytcr-rt5651-mono-spk-in2-mic-hp-swapped config
  040cfea1778a06e2e0e0a73a3e580b5a2c19ecb4
    conf/ucm: bytcr-rt5640: Improve human readable input/output names
  d827856fca4541617f5c699223f17435f8789671
    conf/ucm: bytcr-rt5651: Enable Stereo? ADC MIXL ADC? switches when enabling inputs
  606350a726191f8b40c52fa0520f8642945c79fd
    conf/ucm: bytcr-rt5651: Add support for a headset-mic on IN2
  8f4e5d0da2613584d0469ed417a614ed54acaa2a
    conf/ucm: bytcr-rt5651: Add digital mic support
  ce674664d2e0fd02bcbd605bfbbf4a356489175a
    conf/ucm: bytcr-rt5651: Add bytcr-rt5651-stereo-spk-dmic-mic config
  15ccbf303d2724c3633c1056cc526367a6c5ea3f
    conf/ucm: bytcr-rt5651: Document mono speaker wiring
  506cca6eaa01ceb2377a17f202bb2ca9d626de35
    conf/ucm: Add UCM profile for bytcht-es8316 boards
  f664a7aec9a249503e8523c6d830f60e3eb77cf6
    conf/ucm: bytcht-es8316: Add long-name UCM profiles
  4d9374e61d23a5fc219ec172fe9613017f9ae79c
    ucm: bytcr/PlatformEnableSeq.conf update some comments

---
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
