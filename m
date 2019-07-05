Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 248E15FF8B
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jul 2019 04:43:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF2261699;
	Fri,  5 Jul 2019 04:42:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF2261699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562294616;
	bh=L+Zg4cMdiO5KKzfj227F/5+YwFjxnydDN6vDy/kyrMQ=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qMFUKrqsEa9ArS3A3oiGXtuEend6wyFh9vB5feK56qGasRhJT6xfBGQ8S8xkzJJjt
	 OQiPk/rhCzEgNn78y0p8CU+OsopTtVTI8OP3Hy8M/I835YOISqSrZdaGN1EFkOg9Q9
	 4Xbyg22VsxRYi/Fb6HwwiG4S5yawmuUSy170v9tw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E540DF80133;
	Fri,  5 Jul 2019 04:41:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F11CCF8011F; Fri,  5 Jul 2019 04:41:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 155B3F800E6
 for <alsa-devel@alsa-project.org>; Fri,  5 Jul 2019 04:41:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 155B3F800E6
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x652fP8U003667,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCAS12.realtek.com.tw[172.21.6.16])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x652fP8U003667
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 5 Jul 2019 10:41:25 +0800
Received: from RTITMBSVM07.realtek.com.tw ([fe80::a512:a803:bf1e:b23]) by
 RTITCAS12.realtek.com.tw ([::1]) with mapi id 14.03.0439.000; Fri, 5 Jul 2019
 10:41:25 +0800
From: Kailang <kailang@realtek.com>
To: "He, Bo" <bo.he@intel.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Thread-Topic: audio lost from speaker after reboot from windows on the
 device ALC295
Thread-Index: AdUyX8fMiuN0r83nQWCeaW0Sd+ObdQAepbxA
Date: Fri, 5 Jul 2019 02:41:24 +0000
Message-ID: <6FAB7C47BCF00940BB0999A99BE3547A1D768822@RTITMBSVM07.realtek.com.tw>
References: <CD6925E8781EFD4D8E11882D20FC406D52AB58B6@SHSMSX104.ccr.corp.intel.com>
In-Reply-To: <CD6925E8781EFD4D8E11882D20FC406D52AB58B6@SHSMSX104.ccr.corp.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.211]
MIME-Version: 1.0
Cc: "chiu@endlessm.com" <chiu@endlessm.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "drake@endlessm.com" <drake@endlessm.com>,
 "hui.wang@canonical.com" <hui.wang@canonical.com>,
 "jian-hong@endlessm.com" <jian-hong@endlessm.com>
Subject: Re: [alsa-devel] audio lost from speaker after reboot from windows
	on the device ALC295
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

Hi Bo He,

Could you help to dump info for us?
Please use attach file to get results.

./alsa-info.sh --no-upload

You will find dump file in folder /tmp/alsa-info.txt-????????.

Please run one time in normal state and one time in fail state.
Please send two result files to me.

BR,
Kailang

> -----Original Message-----
> From: He, Bo <bo.he@intel.com>
> Sent: Thursday, July 4, 2019 8:02 PM
> To: Kailang <kailang@realtek.com>; alsa-devel@alsa-project.org;
> linux-kernel@vger.kernel.org
> Cc: perex@perex.cz; tiwai@suse.com; jian-hong@endlessm.com;
> drake@endlessm.com; chiu@endlessm.com; hui.wang@canonical.com
> Subject: audio lost from speaker after reboot from windows on the device
> ALC295
> 
> Hi, patch_realtek.c maintainer:
> 	I see one issue that reboot from windows and boot to ubuntu, the audio
> lost from speaker, I suspect there are some bugs in patch_realtek.c drivers,
> the device is ALC295 and the device id is 0x10ec0295.
> 
> I have done the below experiments:
> 1. reboot from windows to windows, the audio is persist .
> 2. reboot from windows to ubuntu, the audio lost from speaker, but can hear if
> I hotplug one earphone.
> 3. if the issue reproduce after reboot from windows, reboot the ubuntu can't
> restore the audio, I suspect it's warm reset.
> 4. if I write the port 0xcf9 with 0xe to do cold reset, the audio can restore.
> 5. if I do suspend/resume, the audio can restore, I suspect do cold boot and
> suspend will trigger the platform reset to reset the ALC295.
> 6. if I do double function reset (write the verb 0x7ff in alc_init), the audio is
> still can't restore.
> snd_hda_codec_write(codec, 0x01, 0, AC_VERB_SET_CODEC_RESET, 0); /*
> Function reset */ snd_hda_codec_write(codec, 0x01, 0,
> AC_VERB_SET_CODEC_RESET, 0); /* double Function reset */ 7. the issue is
> first found on kernel 4.19.50, I still see the issue with the latest kernel 5.2-rc2,
> is it possible windows change some default registers, but ALC295 don't
> initialize the register?
> 
> ------Please consider the environment before printing this e-mail.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
