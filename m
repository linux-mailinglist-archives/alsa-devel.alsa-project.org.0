Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F09B2D8C8C
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Dec 2020 10:53:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D90FB1750;
	Sun, 13 Dec 2020 10:52:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D90FB1750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607853198;
	bh=YsLOslLLPsT5SKNX3WKC/8a/Me8uJbu+lRr/pVmPYBc=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q/ZE4Bp5vW7Sj27x6v0/8Lxu9+tAYlGl1cNWgy8offqj22680WAJzwNhTtLGdrIl/
	 lIMfNK2Mw0c13thGwadTUdyR1Mn98oqPL8iAVY3Z8dIJgXDxRAu0Lyx/ncT9sZ9Oxx
	 k/ib1VRrL1bgy6rFSslGZ2QrRSlz5cmIMz8IEIPg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42CD3F8027B;
	Sun, 13 Dec 2020 10:51:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E55DF80278; Sun, 13 Dec 2020 10:51:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_65,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59FEAF80129
 for <alsa-devel@alsa-project.org>; Sun, 13 Dec 2020 10:51:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59FEAF80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NfT0V5OA"
Received: by mail-ed1-x532.google.com with SMTP id c7so14001157edv.6
 for <alsa-devel@alsa-project.org>; Sun, 13 Dec 2020 01:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=MeEJ0EdPtKpsqKQPBz1QU4y6TvcOvuldzzVNGbdTV78=;
 b=NfT0V5OAqLR//9jB6w6tAokMRxlR9G59BucIDrFLdG012LtdXLL9qNZVGLIv1xpz/Y
 RmZdQH9ASNNwkYxvzdC0p1l8phmN/EIINE8/iey7fAKcDVPIiu6fQBvUXV3W1rxYOWQ0
 8xS6yCCAQxvHfvUfj1j2oI1xenHR93ERwXevblP3NGUlW8eKnnlcJV+zK5S1Wso0GZNH
 LbvRMRmIMZN75XBaFzGRcp0FSWU2o64rbbSK8Xrdh9+DtyVyChZTBuclfhxS8xxxz5uX
 a12goFZF3JPanE75zDtpBKpqk7zyHbev2GSw09nFJwZoFIaYbK7uFNsMeZ7+gr83mugc
 6yhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=MeEJ0EdPtKpsqKQPBz1QU4y6TvcOvuldzzVNGbdTV78=;
 b=Kuz4++H2DBaUl6NYStA1kUadWfKCYBkysuNsGH/6VeB+aOYWWeIp6SuN8CgQi1nnO3
 1esuqzBuf46fInslCDsRMyaVMjIp6CWjtXz0hs47TSicHpuZtHgD9dZxAzaZJLgHklK7
 0s6jkGE9/LIHl/mCgmlUMZHL6yHGlBtS6Kk11F5GNoOlCnWU7RwRFceVH/1ZRI8JQ4bb
 aZYbTvFam0RSZVoSO+5tBvhav0BO403IJ4jZOKAm32Ah3M73EgjPKhzd4IfFCEgXbRV0
 FfKihKQPZkLG6GohQmUd5otTO2nMRw+aR4UpwT0jJZ+YHDVJX/9EenentVqzBmtYUYkU
 mbyA==
X-Gm-Message-State: AOAM531Rn0yWWTU9txAh/U0TBISbb3LniuBO8cvcXtpDZj02+rkA6LyB
 /HcxaIgQ2ECGSPzIMIhOddWFHl7ySHk=
X-Google-Smtp-Source: ABdhPJxTh11vNM1efZZ7dw9wmhAzY6BkCxp029iT7IZ+27XjzKeYxIBMwftEpqP7TuHVj1o2gMFnXw==
X-Received: by 2002:a50:d553:: with SMTP id f19mr19498171edj.323.1607853091877; 
 Sun, 13 Dec 2020 01:51:31 -0800 (PST)
Received: from ?IPv6:2a02:908:1982:45e0:523f:96f4:62fb:8f1?
 ([2a02:908:1982:45e0:523f:96f4:62fb:8f1])
 by smtp.googlemail.com with ESMTPSA id b7sm11148409ejz.4.2020.12.13.01.51.30
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Dec 2020 01:51:31 -0800 (PST)
X-Mozilla-News-Host: news://news.gmane.io:119
To: ALSA Development Mailing List <alsa-devel@alsa-project.org>
From: Julian Sikorski <belegdol@gmail.com>
Subject: Yamaha YIT-W12TX not working
Message-ID: <47549112-b2c6-1957-9055-888a4191c6ab@gmail.com>
Date: Sun, 13 Dec 2020 10:51:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Hi list,

Yamaha YIT-W12TX is a USB dongle which allows to transmit audio from PC 
to the YSP-4300 sound bar [1][2]. While it is quite old and no longer 
sold, I recently tried to make it work under linux. Unfortunately, it 
did not work:

[ 3676.366404] usb 2-1.1: new full-speed USB device number 5 using ehci-pci
[ 3676.445995] usb 2-1.1: config 1 has an invalid interface number: 4 
but max is 3
[ 3676.446001] usb 2-1.1: config 1 has no interface number 2
[ 3676.446664] usb 2-1.1: New USB device found, idVendor=0499, 
idProduct=3108, bcdDevice= 1.00
[ 3676.446666] usb 2-1.1: New USB device strings: Mfr=2, Product=1, 
SerialNumber=0
[ 3676.446679] usb 2-1.1: Product: YIT-W12TX
[ 3676.446683] usb 2-1.1: Manufacturer: YAMAHA Corp.
[ 3676.449508] hid-generic 0003:0499:3108.0001: hiddev96,hidraw0: USB 
HID v0.01 Device [YAMAHA Corp. YIT-W12TX] on usb-0000:00:1d.0-1.1/input3
[ 3676.450846] input: YAMAHA Corp. YIT-W12TX as 
/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.1/2-1.1:1.4/0003:0499:3108.0002/input/input34
[ 3676.503844] hid-generic 0003:0499:3108.0002: input,hidraw1: USB HID 
v1.00 Device [YAMAHA Corp. YIT-W12TX] on usb-0000:00:1d.0-1.1/input4
[ 3676.671641] usb 2-1.1: 1:1: cannot get freq at ep 0x1
[ 3676.675786] usb 2-1.1: 5:0: cannot get min/max values for control 2 
(id 5)
[ 3676.676476] usbcore: registered new interface driver snd-usb-audio
[ 3676.731911] usb 2-1.1: 5:0: cannot get min/max values for control 2 
(id 5)
[ 3676.735658] usb 2-1.1: 5:0: cannot get min/max values for control 2 
(id 5)
[ 3676.739399] usb 2-1.1: 5:0: cannot get min/max values for control 2 
(id 5)
[ 3676.743131] usb 2-1.1: 5:0: cannot get min/max values for control 2 
(id 5)
[ 3676.746920] usb 2-1.1: 5:0: cannot get min/max values for control 2 
(id 5)
[ 3676.750648] usb 2-1.1: 5:0: cannot get min/max values for control 2 
(id 5)
[ 3676.754445] usb 2-1.1: 5:0: cannot get min/max values for control 2 
(id 5)
[ 3676.758524] usb 2-1.1: 5:0: cannot get min/max values for control 2 
(id 5)
[ 3676.762274] usb 2-1.1: 5:0: cannot get min/max values for control 2 
(id 5)
[ 3676.789671] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.790049] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.790414] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.790773] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.791169] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.792134] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.792547] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.792899] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.793254] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.793634] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.794900] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.795255] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.795634] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.796008] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.796384] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.797543] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.797879] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.798254] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.798634] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.799007] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.813819] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.814281] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.814686] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.815281] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.815929] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.817807] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.818155] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.818592] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.819165] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.819801] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.822163] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.822802] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.823284] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.824161] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.824907] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.827683] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.828159] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.828675] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.829415] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.830157] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.841801] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.842155] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.842551] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.843158] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.843785] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.844909] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.845283] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.845673] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.846156] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.846800] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.848287] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.848799] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.849280] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.850031] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.850799] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.852677] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.853154] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.853674] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.854429] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.855155] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.858916] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.859277] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.859672] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.860280] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.860909] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.862033] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.862418] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.862797] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.863279] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.863923] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.865471] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.866033] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.866590] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.867410] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.868157] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.870162] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.870674] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.871155] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.871908] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.872676] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
[ 3676.900672] usb 2-1.1: USB disconnect, device number 5
[ 3676.900688] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1

This is with kernel-5.9.13-200.fc33.x86_64 and 
alsa-lib-1.2.4-5.fc33.x86_64 on Fedora 33. Under Windows 10 the dongle 
works without any special drivers from Yamaha, everything appears to be 
downloaded by Windows automatically, so I was hoping the device could be 
made to work under Linux relatively easily.

Best regards,
Julian

[1] 
https://europe.yamaha.com/en/products/audio_visual/accessories/yit-w12/downloads.html#product-tabs
[2] 
https://europe.yamaha.com/en/products/audio_visual/sound_bar/ysp-4300/downloads.html#product-tabs
